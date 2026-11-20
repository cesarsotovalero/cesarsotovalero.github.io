#!/usr/bin/env python3
"""Trim Font Awesome in a built site to the icons its pages use.

Font Awesome's all.min.css (about 56 KB) defines some 1,600 icons, and its fonts (about 75 KB each)
draw all of them, while the site uses a few dozen. After the Jekyll build, this script:

1. collects every `fa-<name>` class used in the site's HTML and JavaScript;
2. rewrites css/fontawesome/css/all.min.css with only the rules of those icons (all other rules,
   such as sizes, spacing and @font-face, stay as they are);
3. subsets the woff2 fonts in css/fontawesome/webfonts/ to the glyphs of those icons.

It works on the built output (default: _site), so icons added in new pages or posts are picked up
by the next deploy. If anything goes wrong, the original files are left untouched.

Usage: python3 scripts/trim_fontawesome.py [site_dir]
"""
import re
import sys
from pathlib import Path

from fontTools import subset

ICON_SELECTOR = re.compile(r"^\.fa-([a-z0-9-]+):{1,2}before$")
CONTENT = re.compile(r'content:\s*"\\([0-9a-f]{4,5})"')
CLASS_TOKEN = re.compile(r"\bfa-[a-z0-9-]+")


def top_level_rules(css: str):
    """Split minified CSS into top-level rules, keeping nested blocks (@keyframes, @media) whole."""
    rules, depth, start = [], 0, 0
    for i, ch in enumerate(css):
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                rules.append(css[start:i + 1])
                start = i + 1
    tail = css[start:].strip()
    if tail:
        rules.append(tail)
    return rules


def used_icons(site: Path) -> set:
    names = set()
    for path in list(site.rglob("*.html")) + list(site.rglob("*.js")):
        if "pagefind" in path.parts:
            continue
        text = path.read_text(encoding="utf-8", errors="ignore")
        names.update(token[3:] for token in CLASS_TOKEN.findall(text))
    return names


def trim(site: Path) -> None:
    css_path = site / "css" / "fontawesome" / "css" / "all.min.css"
    fonts_dir = site / "css" / "fontawesome" / "webfonts"
    css = css_path.read_text(encoding="utf-8")
    used = used_icons(site)

    kept_rules, codepoints, icons_kept, icons_total = [], set(), 0, 0
    for rule in top_level_rules(css):
        head, _, body = rule.partition("{")
        selectors = [s.strip() for s in head.split(",")]
        if head.lstrip().startswith(("@", "/*")) or not all(ICON_SELECTOR.match(s) for s in selectors):
            kept_rules.append(rule)
            continue
        icons_total += len(selectors)
        keep = [s for s in selectors if ICON_SELECTOR.match(s).group(1) in used]
        if not keep:
            continue
        icons_kept += len(keep)
        kept_rules.append(",".join(keep) + "{" + body)
        codepoints.update(int(cp, 16) for cp in CONTENT.findall(body))

    new_css = "".join(kept_rules)

    # Subset every font first, then write everything, so a failure leaves the originals in place.
    subset_fonts = {}
    for font_path in sorted(fonts_dir.glob("*.woff2")):
        options = subset.Options()
        options.flavor = "woff2"
        options.notdef_outline = True
        options.name_IDs = ["*"]
        options.layout_features = ["*"]
        font = subset.load_font(str(font_path), options)
        subsetter = subset.Subsetter(options)
        subsetter.populate(unicodes=sorted(codepoints))
        subsetter.subset(font)
        out = font_path.with_suffix(".subset.woff2")
        subset.save_font(font, str(out), options)
        subset_fonts[font_path] = out

    before = css_path.stat().st_size + sum(p.stat().st_size for p in subset_fonts)
    css_path.write_text(new_css, encoding="utf-8")
    for original, smaller in subset_fonts.items():
        smaller.replace(original)
    after = css_path.stat().st_size + sum(p.stat().st_size for p in subset_fonts)
    print(f"Font Awesome: kept {icons_kept} of {icons_total} icons; "
          f"CSS and fonts {before // 1024} KB -> {after // 1024} KB.")


def main() -> int:
    site = Path(sys.argv[1] if len(sys.argv) > 1 else "_site")
    try:
        trim(site)
    except Exception as error:  # never break the deploy over an optimization
        print(f"::warning::Font Awesome was not trimmed: {error}")
    return 0


if __name__ == "__main__":
    sys.exit(main())

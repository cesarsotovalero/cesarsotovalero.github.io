#!/usr/bin/env python3
"""Generate small WebP thumbnails of blog post cover images.

Post covers (the `image:` front matter field) are used as small thumbnails on the
blog index, the homepage, and in related posts, but the originals are often
1-2 MB. This script writes a 480 px wide WebP copy of each cover under
img/thumbs/ (git-ignored). The `thumbnail` Liquid filter in
_plugins/thumbnail_filter.rb uses the copy when it exists and falls back to the
original otherwise, so the site still builds without running this script.

Usage: python3 scripts/make_thumbnails.py
"""
import re
import sys
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "img" / "thumbs"
MAX_WIDTH = 480
SOURCE_SUFFIXES = {".jpg", ".jpeg", ".png", ".webp"}


def cover_paths():
    """Yield local image paths (relative to the repo root) used as post covers."""
    for post in sorted((ROOT / "_posts").rglob("*.md")):
        text = post.read_text(encoding="utf-8", errors="ignore")
        if not text.startswith("---"):
            continue
        front_matter = text.split("---", 2)[1]
        match = re.search(r"^image:\s*['\"]?([^'\"\n]+)", front_matter, re.M)
        if not match:
            continue
        path = match.group(1).strip()
        if path.startswith(("http://", "https://")):
            continue
        path = re.sub(r"^(\.\./|/)+", "", path)
        if path.startswith("img/") and Path(path).suffix.lower() in SOURCE_SUFFIXES:
            yield path


def thumbnail_path(source: str) -> Path:
    # img/posts/2026/a.jpg -> img/thumbs/posts/2026/a.webp
    return OUT / Path(source).relative_to("img").with_suffix(".webp")


def main() -> int:
    made = skipped = missing = 0
    for source in sorted(set(cover_paths())):
        src = ROOT / source
        if not src.exists():
            missing += 1
            print(f"missing: {source}", file=sys.stderr)
            continue
        dst = thumbnail_path(source)
        if dst.exists() and dst.stat().st_mtime >= src.stat().st_mtime:
            skipped += 1
            continue
        dst.parent.mkdir(parents=True, exist_ok=True)
        with Image.open(src) as im:
            im = im.convert("RGBA" if im.mode in ("RGBA", "LA", "P") else "RGB")
            if im.width > MAX_WIDTH:
                im = im.resize((MAX_WIDTH, round(im.height * MAX_WIDTH / im.width)), Image.LANCZOS)
            im.save(dst, "WEBP", quality=80, method=6)
        made += 1
    print(f"Thumbnails: {made} created, {skipped} up to date, {missing} missing sources.")
    return 0


if __name__ == "__main__":
    sys.exit(main())

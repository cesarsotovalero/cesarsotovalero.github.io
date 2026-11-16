#!/usr/bin/env python3
"""Render the default social preview card (Open Graph / X) for pages without an image.

Output: img/social/default-card.jpg (1200x630). Text comes from _data/profile.yml,
so re-run this script after a change of role:

    python3 scripts/make_social_card.py
"""
from pathlib import Path

import yaml
from PIL import Image, ImageDraw, ImageFont, ImageOps

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "img" / "social" / "default-card.jpg"
PHOTO = ROOT / "img" / "pages" / "cesar" / "cesar-profile-2024-200x200px.jpg"
FONTS = ROOT / "fonts" / "used-fonts" / "Concourse"

W, H = 1200, 630
NAVY = (4, 39, 66)          # #042742, the site's brand color
WHITE = (255, 255, 255)
MUTED = (184, 198, 214)
ACCENT = (143, 150, 206)    # #8F96CE, the site's link underline color


def font(name: str, size: int) -> ImageFont.FreeTypeFont:
    return ImageFont.truetype(str(FONTS / name), size)


def main() -> None:
    profile = yaml.safe_load((ROOT / "_data" / "profile.yml").read_text(encoding="utf-8"))
    role = f"{profile['job_title']} at {profile['employer']['name']}"

    card = Image.new("RGB", (W, H), NAVY)
    draw = ImageDraw.Draw(card)

    # Portrait in a circle on the right, in grayscale like the site's avatar.
    size = 360
    photo = ImageOps.grayscale(Image.open(PHOTO)).convert("RGB")
    photo = ImageOps.fit(photo, (size, size), Image.LANCZOS)
    mask = Image.new("L", (size * 4, size * 4), 0)
    ImageDraw.Draw(mask).ellipse((0, 0, size * 4, size * 4), fill=255)
    mask = mask.resize((size, size), Image.LANCZOS)
    px, py = W - size - 90, (H - size) // 2
    draw.ellipse((px - 6, py - 6, px + size + 6, py + size + 6), fill=ACCENT)
    card.paste(photo, (px, py), mask)

    # Text on the left.
    x = 90
    draw.text((x, 150), "César Soto Valero", font=font("Concourse T4 Bold.ttf", 72), fill=WHITE)
    draw.rectangle((x, 250, x + 96, 255), fill=ACCENT)
    draw.text((x, 285), role, font=font("Concourse T4 Regular.ttf", 38), fill=WHITE)
    draw.text((x, 340), "Applied AI for finance", font=font("Concourse T4 Regular.ttf", 38), fill=WHITE)
    draw.text((x, 395), "PhD in Computer Science, KTH", font=font("Concourse T4 Regular.ttf", 30), fill=MUTED)
    draw.text((x, 500), "cesarsotovalero.net", font=font("Concourse T4 Regular.ttf", 28), fill=MUTED)

    OUT.parent.mkdir(parents=True, exist_ok=True)
    card.save(OUT, "JPEG", quality=88, optimize=True, progressive=True)
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()

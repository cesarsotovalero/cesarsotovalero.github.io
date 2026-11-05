#!/usr/bin/env python3
import json
import sys
from pathlib import Path


SITE = Path("_site")


def assert_contains(path: Path, snippets: list[str]) -> None:
    content = path.read_text(encoding="utf-8", errors="ignore")
    missing = [snippet for snippet in snippets if snippet not in content]
    if missing:
        raise AssertionError(f"{path} missing snippets: {missing}")


def main() -> int:
    required_paths = [
        SITE / "index.html",
        SITE / "about-me.html",
        SITE / "blog.html",
        SITE / "search.html",
        SITE / "robots.txt",
        SITE / "sitemap.xml",
        SITE / "feed.json",
        SITE / "llms.txt",
        SITE / "llms-full.txt",
        SITE / ".well-known" / "llms.txt",
        SITE / ".well-known" / "llms-full.txt",
    ]

    missing_paths = [str(path) for path in required_paths if not path.exists()]
    if missing_paths:
        raise AssertionError(f"Missing expected generated files: {missing_paths}")

    assert_contains(
        SITE / "index.html",
        [
            '<meta name="description"',
            'rel="canonical"',
            'application/ld+json',
            'application/feed+json',
            'title="llms.txt"',
        ],
    )

    assert_contains(
        SITE / "about-me.html",
        ['<meta name="description"', 'rel="canonical"', 'application/ld+json'],
    )

    assert_contains(
        SITE / "search.html",
        ['<meta name="description"', 'rel="canonical"', 'application/ld+json'],
    )

    assert_contains(
        SITE / "robots.txt",
        ["Sitemap: https://www.cesarsotovalero.net/sitemap.xml", "Allow: /llms.txt"],
    )

    feed = json.loads((SITE / "feed.json").read_text(encoding="utf-8"))
    for key in ("version", "title", "items"):
        if key not in feed:
            raise AssertionError(f"feed.json missing key: {key}")

    assert_contains(SITE / "llms.txt", ["# César Soto Valero", "Full content for LLMs"])
    assert_contains(SITE / ".well-known" / "llms.txt", ["# César Soto Valero"])
    assert_contains(SITE / "llms-full.txt", ["# César Soto Valero — full content"])
    assert_contains(SITE / ".well-known" / "llms-full.txt", ["# César Soto Valero — full content"])

    print("Smoke validation passed.")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:  # noqa: BLE001
        print(f"Smoke validation failed: {exc}", file=sys.stderr)
        raise SystemExit(1)

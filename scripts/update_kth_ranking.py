# scripts/update_kth_ranking.py

import re
import sys
from pathlib import Path

import requests
import yaml
from bs4 import BeautifulSoup

URL = "https://www.topuniversities.com/universities/kth-royal-institute-technology"
OUT_PATH = Path("_data/university_ranking.yml")

HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
        "(KHTML, like Gecko) Chrome/124.0 Safari/537.36"
    ),
    "Accept-Language": "en-US,en;q=0.9",
}


def fetch_html(url: str) -> bytes:
    try:
        r = requests.get(url, headers=HEADERS, timeout=20)
        r.raise_for_status()
        return r.content
    except requests.RequestException as e:
        print(f"HTTP error fetching {url}: {e}", file=sys.stderr)
        sys.exit(1)


def parse_rank(html: bytes) -> str:
    soup = BeautifulSoup(html, "html.parser")

    # Strategy 1: look for a label near "QS World University Rankings"
    section = soup.find(string=re.compile(r"QS World University Rankings", re.I))
    if section:
        # Walk up to a container and search for something that looks like "#123" or "Rank 73"
        container = section.find_parent()
        if container:
            text = container.get_text(" ", strip=True)
            m = re.search(r"#\s*(\d+)", text)
            if m:
                return m.group(1)

    # Strategy 2: look for common “rank” classes or text patterns
    m = re.search(rb"#\s*(\d{1,4})\b", html)
    if m:
        return m.group(1).decode("utf-8")

    raise ValueError("Unable to find ranking in the page structure.")


def write_yaml(path: Path, rank: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    data = {
        "kth": {
            "name": "KTH Royal Institute of Technology",
            "rank": str(rank),
            "source": "QS World University Rankings",
            "source_url": URL,
        }
    }
    with path.open("w", encoding="utf-8") as f:
        yaml.dump(data, f, sort_keys=False, allow_unicode=True)


def main():
    html = fetch_html(URL)
    try:
        rank = parse_rank(html)
    except Exception as e:
        print(f"Parse error: {e}", file=sys.stderr)
        sys.exit(1)

    write_yaml(OUT_PATH, rank)
    print(f"Ranking data updated successfully: rank={rank}")


if __name__ == "__main__":
    main()
    main()

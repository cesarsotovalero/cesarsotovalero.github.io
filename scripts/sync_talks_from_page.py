"""
Parse _pages/talks.md and generate _data/talks.yml automatically.

This script reads the talks Markdown page (the single source of truth)
and extracts structured data for each talk entry, producing a YAML file
consumed by the Jekyll index page's "Latest Talks" section.
"""

import os
import re

import yaml

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.dirname(SCRIPT_DIR)
TALKS_MD = os.path.join(ROOT_DIR, "_pages", "talks.md")
TALKS_YML = os.path.join(ROOT_DIR, "_data", "talks.yml")

# Months for date parsing
MONTHS = {
    "january": 1,
    "february": 2,
    "march": 3,
    "april": 4,
    "may": 5,
    "june": 6,
    "july": 7,
    "august": 8,
    "september": 9,
    "october": 10,
    "november": 11,
    "december": 12,
}

# Ordinal suffixes stripped during date parsing
ORDINAL_RE = re.compile(r"(\d+)(?:st|nd|rd|th)")


def extract_youtube_id(line):
    """Extract YouTube video ID from a Video link in the line."""
    # Match [Video](https://youtu.be/ID...) or [Video](https://youtube.com/watch?v=ID...)
    m = re.search(r"\[Video\]\(https?://youtu\.be/([A-Za-z0-9_-]+)", line)
    if m:
        return m.group(1)
    m = re.search(
        r"\[Video\]\(https?://(?:www\.)?youtube\.com/watch\?v=([A-Za-z0-9_-]+)", line
    )
    if m:
        return m.group(1)
    return ""


def extract_title(line):
    """Extract the talk title from bold markers **Title**."""
    m = re.search(r"\*\*(.+?)\*\*", line)
    return m.group(1) if m else ""


def extract_event_and_url(line):
    """Extract event name and URL from the talk line.

    Looks for markdown links that are NOT Video, Slides, Post, Poster,
    Talk Announcement, or person links (co-presenters).
    Falls back to italic _Event Name_ if no link event found.
    """
    # Remove the title portion to avoid false matches
    titleless = re.sub(r"\*\*(.+?)\*\*\.?\s*", "", line, count=1)
    # Strip italic underscores from link text (e.g., [_Event_](url) → [Event](url))
    titleless = re.sub(r"\[_([^\]]+)_\]", r"[\1]", titleless)
    # Collect all markdown links: [text](url)
    links = re.findall(r"\[([^\]]*)\]\(([^)]+)\)", titleless)

    # Filter out non-event links
    skip_labels = {"video", "slides", "post", "poster", "talk announcement"}
    for text, url in links:
        # Strip emoji prefixes like :globe_with_meridians:
        clean_text = re.sub(r":[a-z_]+:\s*", "", text).strip()
        if clean_text.lower() in skip_labels:
            continue
        # Skip person links (usually contain full names with spaces, linking to personal sites)
        # Heuristic: event links usually don't link to monperrus.net, snht.se, cparta.se etc.
        # Better heuristic: look for "at" or "at the" before the link
        # We'll take the first non-skip link that appears after "at" or "at the"
        # Find position of this link in the text
        link_pattern = re.escape(f"[{text}]({url})")
        link_match = re.search(link_pattern, titleless)
        if link_match:
            before = titleless[: link_match.start()].rstrip()
            # Check if preceded by "at" / "at the" / "during"
            if re.search(r"\b(?:at(?:\s+the)?|during)\s*$", before, re.IGNORECASE):
                return clean_text, url

    # Second pass: if no "at [Event]" found, look for italic _Event Name_
    m = re.search(r"(?:at|at the|during)\s+_([^_]+)_", titleless, re.IGNORECASE)
    if m:
        return m.group(1), ""

    # Third pass: take any "at [Event]" link even if the heuristic above missed
    for text, url in links:
        clean_text = re.sub(r":[a-z_]+:\s*", "", text).strip()
        if clean_text.lower() not in skip_labels:
            return clean_text, url

    # Fourth pass: plain text event after "at" (e.g., "Presented at SEB, Stockholm")
    m = re.search(r"(?:at|at the|during)\s+([A-Z][^,\.\[\]]+)", titleless)
    if m:
        return m.group(1).strip(), ""

    return "", ""


def extract_date(line, year):
    """Extract a date from the talk line text, using the year header as context.

    Handles patterns like:
    - "24th March 2026" or "19th May 2026"
    - "December 2025" or "January 2026"
    - "February 2021"
    - Falls back to year-01-01 if no month found
    """
    text = line.lower()

    # Pattern: day month year (e.g., "24th March 2026", "6th May 2026")
    for month_name, month_num in MONTHS.items():
        # "19th May 2026" or "24th March 2026"
        m = re.search(r"(\d{1,2})(?:st|nd|rd|th)\s+" + month_name + r"\s+(\d{4})", text)
        if m:
            return f"{m.group(2)}-{month_num:02d}-{int(m.group(1)):02d}"

        # "May 2019" or "December 2025"
        m = re.search(month_name + r"\s+(\d{4})", text)
        if m:
            return f"{m.group(1)}-{month_num:02d}-01"

        # "month year" without explicit year → use header year
        # e.g., just "October 2024" or "February 2024"
        # Already covered above

    # Fallback: use the year header
    return f"{year}-01-01"


def parse_talks(md_path):
    """Parse talks.md and return a list of talk dicts."""
    with open(md_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Strip YAML front matter
    content = re.sub(r"^---.*?---\s*", "", content, flags=re.DOTALL)

    talks = []
    current_year = None

    for line in content.splitlines():
        # Detect year headers: ## 2026, ## 2025, etc.
        year_match = re.match(r"^##\s+(\d{4})\s*$", line.strip())
        if year_match:
            current_year = int(year_match.group(1))
            continue

        # Skip non-talk lines
        if not line.strip().startswith("- **"):
            continue

        if current_year is None:
            continue

        title = extract_title(line)
        if not title:
            print(f"WARNING: Could not extract title from line: {line[:80]}")
            continue

        youtube_id = extract_youtube_id(line)
        event, event_url = extract_event_and_url(line)
        date = extract_date(line, current_year)

        talk = {"title": title}
        if event:
            talk["event"] = event
        talk["date"] = date
        if event_url:
            talk["url"] = event_url
        if youtube_id:
            talk["youtube_id"] = youtube_id
        else:
            talk["youtube_id"] = None

        talks.append(talk)

    return talks


def write_talks_yaml(talks, yml_path):
    """Write the talks list to a YAML file."""
    os.makedirs(os.path.dirname(yml_path), exist_ok=True)

    header = "# AUTO-GENERATED from _pages/talks.md — do not edit manually.\n"
    header += "# Run: python3 scripts/sync_talks_from_page.py\n\n"

    # Custom representer to output None as empty string for youtube_id
    class TalkDumper(yaml.SafeDumper):
        pass

    def represent_none(dumper, _):
        return dumper.represent_scalar("tag:yaml.org,2002:null", "")

    TalkDumper.add_representer(type(None), represent_none)

    yaml_str = yaml.dump(
        talks,
        Dumper=TalkDumper,
        default_flow_style=False,
        allow_unicode=True,
        sort_keys=False,
    )

    with open(yml_path, "w", encoding="utf-8") as f:
        f.write(header)
        f.write(yaml_str)

    print(f"Generated {yml_path} with {len(talks)} talks.")


def main():
    if not os.path.exists(TALKS_MD):
        print(f"ERROR: {TALKS_MD} not found.")
        exit(1)

    talks = parse_talks(TALKS_MD)
    write_talks_yaml(talks, TALKS_YML)

    # Summary
    with_video = sum(1 for t in talks if t.get("youtube_id"))
    print(f"  {with_video} talks have YouTube videos.")
    print(f"  {len(talks) - with_video} talks without videos (excluded from index).")


if __name__ == "__main__":
    main()

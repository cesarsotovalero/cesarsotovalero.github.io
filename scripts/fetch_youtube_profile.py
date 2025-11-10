#!/usr/bin/env python3
"""
Fetch YouTube channel public metadata and write as JSON to _data/youtube-profile.json.
Reads YOUTUBE_API_KEY and YOUTUBE_CHANNEL_ID from env and calls YouTube Data API.
"""

import json
import os
import sys

import requests


def fetch_channel_profile(api_key, channel_id):
    url = (
        "https://www.googleapis.com/youtube/v3/channels"
        "?part=snippet,statistics&id={}&key={}"
    ).format(channel_id, api_key)
    resp = requests.get(url)
    resp.raise_for_status()
    data = resp.json()
    return data


def write_profile(data, out_path):
    # Ensure directory exists
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"Wrote YouTube profile metadata to {out_path}")


def main():
    api_key = os.getenv("YOUTUBE_API_KEY")
    channel_id = os.getenv("YOUTUBE_CHANNEL_ID")
    if not api_key or not channel_id:
        print(
            "Error: YOUTUBE_API_KEY and YOUTUBE_CHANNEL_ID must be set", file=sys.stderr
        )
        sys.exit(1)
    try:
        data = fetch_channel_profile(api_key, channel_id)
    except Exception as e:
        print(f"Error fetching channel profile: {e}", file=sys.stderr)
        sys.exit(1)
    # Determine output path relative to repo
    out_file = os.path.join(
        os.path.dirname(__file__), "..", "_data", "youtube-profile.json"
    )
    out_file = os.path.normpath(out_file)
    write_profile(data, out_file)


if __name__ == "__main__":
    main()

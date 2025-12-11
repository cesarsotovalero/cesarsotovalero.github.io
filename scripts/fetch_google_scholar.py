#!/usr/bin/env python3
"""
Fetch Google Scholar author profile data and write as JSON to _data/google-scholar.json.
Uses the scholarly library to retrieve citation count and h-index.
"""

import json
import os
import sys

from scholarly import scholarly


def fetch_scholar_profile(author_id):
    """
    Fetch Google Scholar profile data for the given author ID.

    Args:
        author_id: Google Scholar author ID (e.g., 'jNBoowwAAAAJ')

    Returns:
        dict: Author profile data including citedby and hindex
    """
    author = scholarly.search_author_id(author_id)
    if not author:
        raise ValueError(f"Could not find author with ID: {author_id}")

    author_filled = scholarly.fill(author, sections=["basics", "indices"])
    if not author_filled:
        raise ValueError(
            f"Could not fetch complete profile data for author ID: {author_id}"
        )

    # Extract relevant data
    # The h-index and i10-index are at the top level of the author object
    profile_data = {
        "author_id": author_id,
        "name": author_filled.get("name", ""),
        "affiliation": author_filled.get("affiliation", ""),
        "citedby": author_filled.get("citedby", 0),
        "hindex": author_filled.get("hindex", 18),
        "i10index": author_filled.get("i10index", 0),
        "interests": author_filled.get("interests", []),
        "url_picture": author_filled.get("url_picture", ""),
        "scholar_url": f"https://scholar.google.com/citations?user={author_id}",
    }

    return profile_data


def write_profile(data, out_path):
    """
    Write profile data to JSON file.

    Args:
        data: Profile data dictionary
        out_path: Path to output JSON file
    """
    # Ensure directory exists
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"Wrote Google Scholar profile metadata to {out_path}")


def main():
    # Hardcoded Google Scholar author ID
    author_id = "jNBoowwAAAAJ"

    try:
        print(f"Fetching Google Scholar profile for author ID: {author_id}")
        data = fetch_scholar_profile(author_id)
        print(
            f"Successfully fetched data: {data['citedby']} citations, h-index: {data['hindex']}"
        )
    except Exception as e:
        print(f"Error fetching Google Scholar profile: {e}", file=sys.stderr)
        print("Using default values for h-index and citations")
        # Use default values if fetch fails
        data = {
            "author_id": author_id,
            "name": "César Soto-Valero",
            "affiliation": "",
            "citedby": 0,
            "hindex": 18,
            "i10index": 0,
            "interests": [],
            "url_picture": "",
            "scholar_url": f"https://scholar.google.com/citations?user={author_id}",
        }

    # Determine output path relative to repo
    out_file = os.path.join(
        os.path.dirname(__file__), "..", "_data", "google-scholar.json"
    )
    out_file = os.path.normpath(out_file)
    write_profile(data, out_file)


if __name__ == "__main__":
    main()

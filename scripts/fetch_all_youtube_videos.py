import os
import json
import requests

# Retrieve credentials from environment variables.
API_KEY = os.environ.get("YOUTUBE_API_KEY")
CHANNEL_ID = os.environ.get("YOUTUBE_CHANNEL_ID")

if not API_KEY or not CHANNEL_ID:
    print("Missing YOUTUBE_API_KEY or YOUTUBE_CHANNEL_ID.")
    exit(1)

print("API key and Channel ID retrieved successfully.")

# Base URLs for YouTube API endpoints.
SEARCH_URL = "https://www.googleapis.com/youtube/v3/search"
VIDEOS_URL = "https://www.googleapis.com/youtube/v3/videos"

video_ids = []
next_page_token = None

print("Starting to fetch video IDs from the channel...")

# Fetch all video IDs from the channel using pagination.
while True:
    print("Fetching a page of video IDs...")
    params = {
        "key": API_KEY,
        "channelId": CHANNEL_ID,
        "part": "id",
        "order": "date",
        "maxResults": 50,
        "type": "video"
    }
    if next_page_token:
        params["pageToken"] = next_page_token

    response = requests.get(SEARCH_URL, params=params)
    if response.status_code != 200:
        print("Error fetching search results:", response.text)
        break

    data = response.json()
    for item in data.get("items", []):
        video_id = item["id"].get("videoId")
        if video_id:
            video_ids.append(video_id)
    print(f"Fetched {len(data.get('items', []))} video IDs. Total so far: {len(video_ids)}")

    next_page_token = data.get("nextPageToken")
    if not next_page_token:
        print("No more pages to fetch.")
        break

print(f"Finished fetching video IDs. Total video IDs fetched: {len(video_ids)}")

# Retrieve detailed metadata in batches (50 videos per request).
videos = []
print("Starting to fetch detailed metadata for videos...")
for i in range(0, len(video_ids), 50):
    batch_ids = video_ids[i:i+50]
    print(f"Fetching metadata for batch {i // 50 + 1} (videos {i + 1} to {i + len(batch_ids)})...")
    params = {
        "key": API_KEY,
        "id": ",".join(batch_ids),
        "part": "snippet,contentDetails,statistics"
    }
    response = requests.get(VIDEOS_URL, params=params)
    if response.status_code != 200:
        print("Error fetching video details:", response.text)
        continue
    data = response.json()
    videos.extend(data.get("items", []))
    print(f"Fetched metadata for {len(data.get('items', []))} videos. Total so far: {len(videos)}")

print(f"Finished fetching metadata for all videos. Total videos fetched: {len(videos)}")

# Ensure the _data directory exists and overwrite the JSON file if it already exists.
output_file = "_data/youtube-videos.json"
print(f"Ensuring the directory for the output file exists: {os.path.dirname(output_file)}")
os.makedirs(os.path.dirname(output_file), exist_ok=True)

# Remove the file if it already exists to ensure it's overwritten.
if os.path.exists(output_file):
    print(f"Output file {output_file} already exists. Removing it...")
    os.remove(output_file)

# Save the video metadata to the JSON file.
print(f"Saving video metadata to {output_file}...")
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(videos, f, indent=2, ensure_ascii=False)

print(f"Fetched {len(videos)} videos and saved metadata to {output_file}")

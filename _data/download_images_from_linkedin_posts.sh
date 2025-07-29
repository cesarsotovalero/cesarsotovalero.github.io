#!/bin/bash
set -e

# Input JSON file with LinkedIn posts.
JSON_FILE="/Users/cesarsv/WebstormProjects/cesarsotovalero.github.io/_data/linkedin-posts-backup.json"
# Base directory for downloaded images.
DEST_BASE="/Users/cesarsv/WebstormProjects/cesarsotovalero.github.io/_data/images-from-linkedin-posts"

# Check for jq dependency.
if ! command -v jq >/dev/null 2>&1; then
    echo "Error: jq is required. Please install it (e.g., brew install jq) and try again."
    exit 1
fi

# Check if the JSON file exists.
if [ ! -f "$JSON_FILE" ]; then
    echo "Error: $JSON_FILE not found."
    exit 1
fi

echo "Processing posts from $JSON_FILE..."

# Assuming the JSON structure has a top-level "data" array.
jq -c '.data[]' "$JSON_FILE" | while read -r post; do
    # Try common timestamp keys.
    post_ts=$(echo "$post" | jq -r '.postedDateTimestamp // .postDateTimestamp')
    if [ "$post_ts" = "null" ] || [ -z "$post_ts" ]; then
        echo "Skipping a post with no timestamp value."
        continue
    fi

    # Create destination directory for this post.
    dest_dir="${DEST_BASE}/${post_ts}"
    mkdir -p "$dest_dir"

    # Attempt to retrieve images: check media.images, images, or image field
    images=$(echo "$post" | jq -c '
      if .media and (.media.images | type == "array") then
        .media.images
      elif .images then
        .images
      elif .image then
        [ .image ]
      else
        []
      end')
    # Skip posts with no images.
    length=$(echo "$images" | jq 'length')
    if [ "$length" -eq 0 ]; then
        echo "No images found for post $post_ts."
        continue
    fi

    echo "Processing $length image(s) for post $post_ts..."

    echo "$images" | jq -c '.[]' | while read -r image; do
        url=$(echo "$image" | jq -r '.url')
        width=$(echo "$image" | jq -r '.width')
        height=$(echo "$image" | jq -r '.height')

        if [ -z "$url" ] || [ "$url" = "null" ]; then
            echo "  Skipping an image with no URL."
            continue
        fi

        if [ -z "$width" ] || [ "$width" = "null" ] || [ -z "$height" ] || [ "$height" = "null" ]; then
            echo "  Skipping image from URL $url because width/height is missing."
            continue
        fi

        # Use width and height as filename, always .jpg
        filename="${width}x${height}.jpg"
        dest_path="${dest_dir}/${filename}"

        # If already downloaded, skip.
        if [ -f "$dest_path" ]; then
            echo "  File $dest_path already exists; skipping."
        else
            echo "  Downloading $url -> $dest_path"
            curl -s -L -o "$dest_path" "$url"
            if [ $? -ne 0 ]; then
                echo "    Error downloading $url"
            fi
        fi
    done
done

echo "All downloads complete."

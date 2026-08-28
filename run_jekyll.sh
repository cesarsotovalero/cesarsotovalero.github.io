#!/usr/bin/env bash
# Run the Jekyll site locally on macOS.
# Prerequisites: brew install rbenv imagemagick
set -euo pipefail

cd "$(dirname "$0")"

# Ruby setup via rbenv
export RBENV_VERSION="3.4.4"
eval "$(rbenv init -)"

# Pre-build scripts
python3 scripts/tag_generator.py
python3 scripts/sync_talks_from_page.py

# Kill any existing process on port 4000
lsof -ti:4000 | xargs kill -9 2>/dev/null || true

# Install and serve
bundle install --quiet
JEKYLL_ENV=production RUBYOPT='-W0' bundle exec jekyll serve --watch --incremental --future

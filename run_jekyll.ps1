# Run the Jekyll site locally on Windows.
# Prerequisites: Ruby 4.x with MSYS2, ImageMagick Q16 with dev headers
$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

# Ensure ImageMagick DLLs and patched headers are on PATH for rmagick
$imInstall = "C:\Program Files\ImageMagick-7.1.2-Q16"
$imPatch = "$env:USERPROFILE\.imagemagick"
if (Test-Path $imPatch) {
    $env:PATH = "$imPatch;$imInstall;" + $env:PATH
} elseif (Test-Path $imInstall) {
    $env:PATH = "$imInstall;" + $env:PATH
}

# Pre-build scripts (non-fatal)
$env:PYTHONUTF8 = "1"
$ErrorActionPreference = "Continue"
python -m pip install pyyaml --quiet 2>$null
python scripts/tag_generator.py 2>$null
python scripts/sync_talks_from_page.py 2>$null
$ErrorActionPreference = "Stop"

# Kill any existing process on port 4000
Get-NetTCPConnection -LocalPort 4000 -ErrorAction SilentlyContinue |
    ForEach-Object { Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue }

# Install and serve
bundle install --quiet
$env:JEKYLL_ENV = "production"
$env:RUBYOPT = "-W0"
bundle exec jekyll serve --watch --incremental --future

# cesarsotovalero.net

[![Build](https://github.com/cesarsotovalero/cesarsotovalero.github.io/actions/workflows/deploy-website.yml/badge.svg)](https://github.com/cesarsotovalero/cesarsotovalero.github.io/actions/workflows/deploy-website.yml)

This is the source code of [cesarsotovalero.net](https://www.cesarsotovalero.net), my personal website and blog.
The site is built with [Jekyll](https://jekyllrb.com) and deployed to GitHub Pages by [`.github/workflows/deploy-website.yml`](.github/workflows/deploy-website.yml) on every push to `master`. Pull requests are built and checked but not deployed.

## Local development

Requirements: Ruby (version in [`.ruby-version`](.ruby-version)), Bundler, Python 3, and ImageMagick (for `rmagick`, used by `jekyll-responsive-image`).

```bash
# macOS: brew install rbenv imagemagick   |   Ubuntu: sudo apt-get install libmagickwand-dev
pip install pyyaml pillow
./run_jekyll.sh          # macOS/Linux; run_jekyll.ps1 on Windows
```

`run_jekyll.sh` generates the data files the site needs (`_data/talks.yml`, tag pages, post thumbnails), installs the gems, and serves the site at <http://localhost:4000>.
Build with a UTF-8 locale (`LANG=en_US.UTF-8` or `C.UTF-8`): some file names contain non-ASCII characters, and Jekyll and html-proofer fail on them otherwise.

Where things live:

| Path | Contents |
|---|---|
| `_posts/` | Blog posts (Markdown) |
| `_pages/` | Standalone pages (About, Talks, Publications, ...) |
| `_data/` | Site data: profile, navigation, talks, YouTube and LinkedIn exports |
| `_layouts/`, `_includes/` | Templates |
| `_plugins/` | Custom Jekyll plugins |
| `css/`, `js/`, `img/`, `files/` | Static assets |
| `scripts/` | Helper scripts used by the build and the scheduled workflows |

## License

The repo contains HTML templates, Jekyll templates, blog posts and images, so it's been released under a dual license.

Everything here is available under a [Creative Commons Attribution NonCommercial ShareAlike license (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).
This means you're free to copy it, modify it and share it, subject to the following restrictions:

- **Attribution**: You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- **NonCommercial**: You may not use the material for commercial purposes.
- **ShareAlike**: If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

Code samples included in blog posts are also released under the [MIT License](https://choosealicense.com/licenses/mit/).

If you find some code on here, you're free to use it for whatever you like.
However, if you want to use any of the articles, images, diagrams or anything else that's not source code, you've got to credit me, you've got to share your changes, and you're not allowed to sell it or use it for anything commercial.

In other words, what is written for computers is dual CC-BY-NC-SA 4.0 / MIT licensed, and what is written for humans is CC-BY-NC-SA 4.0 only.

Enjoy 😄

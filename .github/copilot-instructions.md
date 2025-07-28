# Copilot Instructions for cesarsotovalero.github.io

## Overview

This repository contains the source code for [cesarsotovalero.net](https://www.cesarsotovalero.net), a personal website and blog built using Jekyll. The project includes:

- Jekyll templates and layouts for rendering pages.
- Blog posts and static assets (images, fonts, etc.).
- Custom plugins for extended functionality.

## Key Directories

- `_posts/`: Contains blog posts written in Markdown.
- `_layouts/`: Defines HTML layouts for different types of pages (e.g., `post.html`, `page.html`).
- `_includes/`: Reusable HTML snippets (e.g., navigation, footer).
- `_plugins/`: Custom Ruby plugins for Jekyll (e.g., `tagging.rb`, `youtube.rb`).
- `_data/`: YAML/JSON files for structured data (e.g., `authors.yml`, `portfolio.yml`).
- `assets/`: Static files like CSS, JavaScript, and images.
- `_site/`: Generated output of the Jekyll build (do not edit manually).

## Developer Workflows

### Local Development

1. Install dependencies:
   ```bash
   bundle install
   ```
2. Run the Jekyll server:
   ```bash
   bundle exec jekyll serve
   ```
   The site will be available at `http://localhost:4000`.

### Build for Production

1. Build the static site:
   ```bash
   bundle exec jekyll build
   ```
   The output will be in the `_site/` directory.

### Testing

- No explicit testing framework is configured. Validate changes by running the site locally and checking for errors in the browser or terminal.

## Project-Specific Conventions

- **Licensing**: Code samples in blog posts are MIT-licensed. Other content (e.g., articles, images) is licensed under CC BY-NC-SA 4.0.
- **Markdown Front Matter**: Each Markdown file requires YAML front matter with fields like `layout`, `title`, `date`, and `tags`.
- **Custom Plugins**: Plugins in `_plugins/` extend Jekyll's functionality. For example:
  - `tagging.rb`: Handles tag generation.
  - `youtube.rb`: Embeds YouTube videos.

## Integration Points

- **GitHub Actions**: The repository uses a workflow (`workflow.yml`) to deploy the site to GitHub Pages.
- **External Fonts**: Fonts like Iosevka are included in `fonts/`.
- **Icons**: Academicons are used for academic-related icons (`img/icons/academicons-1.9.4/`).

## Tips for AI Agents

- **Avoid `_site/`**: Do not edit files in `_site/` as they are auto-generated.
- **Follow Front Matter**: Ensure all Markdown files have valid front matter.
- **Reuse Includes**: Use `_includes/` for shared HTML components to maintain consistency.
- **Respect Licensing**: Ensure new content adheres to the repository's licensing terms.

## External Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Creative Commons License](https://creativecommons.org/licenses/by-nc-sa/4.0/)
- [MIT License](https://choosealicense.com/licenses/mit/)

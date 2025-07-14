---
layout: post
title: My Python Dev Environment for Production Grade Projects
subtitle: A guide to setting up a producti/on/ve Python dev environment
tags: tools
description: |
  In this post, I share the tools, libraries, configs, and other integrations I use for building production-grade Python applications.
keywords:
  - python
  - development
  - vscode
  - productivity
  - tools
image: ../img/posts/2025/2025-04-03/justitiabrunnen_cover.jpg
share-img: ../img/posts/2025/2025-04-03/justitiabrunnen_cover.jpg
show-avatar: false
toc: true
mathjax: true
date: 2025/07/27
author: cesarsotovalero
published: false
---

I switched to writting production-ready Python code 6 months ago (I did use it before, but only for small scripts, I didn't treat it seriously).
Before that, I was a mostly a Java/JavaScript/R developer.
Why did I switch?
Because of AI, obviously.
I wanted to build AI applications (RAG, Agents, image generation, etc.).
Wether you and me like it or not, Python is the language of choice for that.
In the last 6 months, I've realized the huge gap in building a Python dev environment that is production-ready, versus the usual Jupyter notebook or small script approach.
Moreover, I realized that the Python ecosystem has matured a lot in the last few years, compared to the time I used it before.
To the point that I'm now feeling a particular joy for the language.
In this post, I share the tools, libraries, configs, and other integrations that bring me joy and that I now use for building production-grade Python applications.

# Project Structure

I prefer to use a monorepo (with backend and frontend) structure for my projects.[^1]

Why?

- Because of my bad memory: I don't like code parts scattered across multiple repositories (it's not search friendly).
- Because multi-repo is unnecessary: I believe that if a project grows to the point that it needs to be split into multiple repositories, then it's a sign of over-engineering.
- Because I'm lazy: I like to keep things as simple as possible, compile, test, containerize and deploy from a single location.

Here's the typical project structure that I use (I'll go through each part later in this post):

```markdown
myproject/
│
├── .vscode/
│   ├── launch.json
│   └── settings.json
│
├── .vscode/
│   ├── launch.json
│   └── settings.json
│
├── my-project-api/
│   ├── .dockerignore
│   ├── .python-version
│   ├── Dockerfile
│   ├── langgraph.json
│   ├── Makefile
│   ├── pyproject.toml
│   ├── README.md
│   ├── uv.lock
│   ├── .ruff_cache/
│   │   └── .gitignore
│   ├── .vscode/
│   ├── data/
│   ├── notebooks/
│   ├── src/
│   └── tools/
│
├── my-project-ui/
│   ├── .babelrc
│   ├── .gitignore
│   ├── Dockerfile
│   ├── index.html
│   ├── LICENSE
│   ├── log.js
│   ├── package.json
│   ├── README.md
│   ├── public/
│   ├── src/
│   └── webpack/
│
├── .gitignore
├── .pre-commit-config.yaml
├── CONTRIBUTING.md
├── docker-compose.yml
├── INSTALL_AND_USAGE.md
├── LICENSE
├── Makefile
├── README.md

```

We don't do any processing steps in the game UI, as we adopted a frontend-backend architecture.
We make an HTTP request to the API server that contains our question.
Like this, we keep the browser application light while delegating the heavy lifting and business logic to the server.

I use VSCode.

<https://docs.astral.sh/uv/guides/projects/#creating-a-new-project>

<https://cookiecutter-data-science.drivendata.org/>

# UV

# Ruff

<https://pep8.org/>

<https://github.com/astral-sh/ruff>

```makefile
format:
  # I enable a lot of linters including isort, flake8, autoflake, pylint equivalent and others
  uv run ruff check --config pyproject.toml --fix .

lint:
  # Config file is specified for brevity
  uv run ruff check --config pyproject.toml .
```

# ty

<https://docs.astral.sh/ty/installation/>
uv add --dev ty

# Pre-commit Hooks

<https://pre-commit.com/>

<https://github.com/astral-sh/ruff-pre-commit>

# MkDocs

I use [MkDocs](https://www.mkdocs.org/) for documentation, which is a static

# Gitleaks

<https://github.com/gitleaks/gitleaks>

# FastAPI

I use [FastAPI](https://fastapi.tiangolo.com/) for building APIs.

# Pydantic

I use [Pydantic](https://pydantic-docs.helpmanual.io/) for data validation and settings management.

<https://blog.glyph.im/2025/04/stop-writing-init-methods.html>

# Dependabot

```yml
# Sample dependabot config
version: 2
updates:
- package-ecosystem: "pip"
  directory: "/<path-to-directory-containing-requirements-or-pyproject.toml>"
  schedule:
    interval: "daily"
  open-pull-requests-limit: 1
```

# Docker

Use docker for deployments.
Even if you are using GPU-enabled VMs, use Docker and expose the GPU to the container with the following parameter.

```bash
# Example Docker command to run a container with GPU support
docker run --gpus all ...
```

Further, use multi-stage builds where you use poetry/uv to build the package and then copy the built package to a smaller base image on top of python:3.XX-slim.

```dockerfile
# Sample Dockerfile
FROM python:3.XX-slim AS builder
WORKDIR /app
COPY pyproject.toml poetry.lock ./
RUN pip install poetry && poetry install --no-dev
COPY . .
RUN poetry build
```

# References

- <https://decodingml.substack.com/p/engineer-python-projects-like-a-pro>
- <<https://ashishb.net/programming/python-in-production-2>

- [Visual Studio Code](https://code.visualstudio.com/)
- [Python.org](https://www.python.org/)
- [Pipenv Documentation](https://pipenv.pypa.io/en/latest/)
- [Prettier Documentation](https://prettier.io/docs/en/index.html)
- [Flake8 Documentation](https://flake8.pycqa.org/en/latest/)

# Footnotes

[^1]: Don't get me wrong, I understand that there are cases where a multi-repo structure is necessary, like when you have multiple teams working on different parts of the project, or when you need to share code across different projects.

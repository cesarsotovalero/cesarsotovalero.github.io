---
layout: post
title: My Python Dev Environment for Production Grade Projects
subtitle: A guide to setting up a producti/on/ve Python dev environment
tags: tools
description: |
  This post outlines the tools and configurations I use for Python development, focusing on productivity and efficiency.
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

# Project Structure

We don't do any processing steps in the game UI, as we adopted a frontend-backend architecture.
We make an HTTP request to the API server that contains our question.
Like this, we keep the browser application light while delegating the heavy lifting and business logic to the server.

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

# Pre-commit Hooks

<https://pre-commit.com/>

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

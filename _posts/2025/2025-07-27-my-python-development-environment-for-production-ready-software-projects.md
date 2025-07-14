---
layout: post
title: My Python Development Environment for Production-Ready Software Projects
subtitle: A guide to setting up a production-ready Python dev environment
tags: tools
description: |
  In this post, I share the tools, libraries, configs, and other integrations I use for building production-grade Python applications.
keywords:
  - python
  - development
  - vscode
  - productivity
  - tools
image: ../img/posts/2025/2025-07-27/wall-stones_cover.JPG
share-img: ../img/posts/2025/2025-07-27/wall-stones_cover.JPG
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

I would like to have a tool that generates the project structure for me, but I haven't found one that I like yet.
So I use a custom template that I created, which is inspired by the [Cookiecutter Data Science](https://cookiecutter-data-science.drivendata.org/).

Here's the typical project structure that I use up to level 2 in the directory hierarchy, I'll go through each part later in this post:

```markdown
project/
│
├── .github/                # GitHub Actions workflows for CI/CD pipelines
│   ├── workflows/          # Directory containing YAML files for automated workflows
│   └── dependabot.yml      # Configuration for Dependabot to manage dependencies
│
├── .vscode/                # VSCode configuration for the project
│   ├── launch.json         # Debugging configurations for VSCode
│   └── settings.json       # Project-specific settings for VSCode
│
├── project-api/         # Backend API for handling business logic and heavy processing
│   ├── data/               # Directory for storing datasets or other static files
│   ├── notebooks/          # Jupyter notebooks for experimentation and prototyping
│   ├── src/                # Source code for the backend application
│   ├── tools/              # Utility scripts and tools for development or deployment
│   │
│   ├── .dockerignore       # Specifies files to exclude from Docker builds
│   ├── .python-version     # Python version specification for pyenv
│   ├── Dockerfile          # Docker configuration for containerizing the backend
│   ├── Makefile            # Automation tasks for building, testing, and deploying
│   ├── pyproject.toml      # Python project configuration file
│   ├── README.md           # Documentation for the backend API
│   └── uv.lock             # Lock file for dependencies managed by UV
│
├── project-ui/             # Frontend UI for the project (Next.js, React, etc.)
│
├── .gitignore              # Global Git ignore file for the repository
├── .pre-commit-config.yaml # Configuration for pre-commit hooks
├── CONTRIBUTING.md         # Guidelines for contributing to the project
├── docker-compose.yml      # Docker Compose configuration for multi-container setups
├── INSTALL_AND_USAGE.md    # Instructions for installation and usage
├── LICENSE                 # License information for the project
├── Makefile                # Automation tasks for building, testing, and deploying
└── README.md               # Main documentation for the project
```

First, `project` is the root directory and it should be a short name, ideally less than 10 characters long, no snake_case (separation with hyphens is OK to me).
Note that the project is self-contained.
Meaning that it includes documentation, build/deployment infrastructure, and other necessary files to run it standalone.

It's important not to do any heavy data processing steps in the `project-ui`, as we adopted a frontend-backend architecture.
Instead, I choose to make HTTP requests to the `project-api` server that contains the Python code.
Like this, we keep the browser application light while delegating the heavy lifting and business logic to the server.

<https://docs.astral.sh/uv/guides/projects/#creating-a-new-project>

# Python Specifics

## uv

I use [uv](https://github.com/astral-sh/uv) as my Python package manager and build tool (it's all I need to install and manage dependencies).

Here are the core commands and how I set it up:

```bash
# Install uv globally if not already installed
curl -sSfL https://astral.sh/install.sh | sh
# Initialize a new project (adds .gitignore, .python-version, pyproject.toml, etc.)
uv init project-api
# Add some dependencies into the project and update pyproject.toml
uv add --dev pytest ruff pre-commit mkdocs gitleaks fastapi pydantic
# Updates the lock file with the latest versions of the dependencies (creates a virtual environment if not already created)
uv sync
# Activate the virtual environment
uv venv activate
# Run the project
uv run main.py
```

Note that most important file is `pyproject.toml`, which [contains](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) the project metadata and dependencies.[^2]

## Ruff

[Ruff](https://github.com/astral-sh/ruff) is a fast Python linter and code formatter, designed to help you write clean and maintainable code.
It combines `isort`, `flake8`, `autoflake`, into a single tool that can be run with a single command and follows the [PEP 8](https://pep8.org/) style guide out-of-the-box.

<https://docs.astral.sh/ty/installation/>
uv add --dev ty

## ty

[Ty](https://github.com/astral-sh/ty) is a type checker for Python, designed to work seamlessly with your existing codebase.
It helps you catch type errors early in the development process, improving code quality and reducing the likelihood of runtime errors.

## Pydantic

[Pydantic](https://pydantic-docs.helpmanual.io/) is a data validation and settings management library for Python.
It allows manage configuration settings like API keys, database connection details, or model parameters (hardcoding these values is a very bad practice).

[Pydantic Settings](https://docs.pydantic.dev/latest/concepts/pydantic_settings/) allows to define application configurations using Pydantic models.
It can automatically load settings from environment variables or special `.env` files, validate their types, and make them easily accessible in your code.

Here's an example of how to use Pydantic Settings:

```python
from pydantic import BaseSettings

class Settings(BaseSettings):
    api_key: str
    db_url: str

    class Config:
        env_file = ".env"

settings = Settings()
```

Now, when you run this code, Pydantic will automatically load the values of `api_key` and `db_url` from the `.env` file or environment variables.
And this values will be accessible and validated according to the types defined in the `Settings` model.

## MkDocs

I use [MkDocs](https://www.mkdocs.org/) for documentation, which is a static

## FastAPI

I use [FastAPI](https://fastapi.tiangolo.com/) for building APIs.

# Version Control

## GitHub Actions

I use GitHub Actions for Continous Integration for both API and UI pipelines.
My typical workflow for `project-api` looks like this:

```yaml
name: CI-API

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Build Docker image
        run: docker build -t project-api:ci ./project-api
      - name: Run tests
        run: docker run --rm project-api:ci pytest
```

## Dependabot

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

## Pre-commit Hooks

<https://pre-commit.com/>

<https://github.com/astral-sh/ruff-pre-commit>

## Gitleaks

<https://github.com/gitleaks/gitleaks>

# Infrastructure Management

## Make

[Make](https://www.gnu.org/software/make/) is a classic utility for automating tasks.
I use it to create simple shortcuts for common development commands.
Instead of remembering and typing out long commands to run tests, build a Docker image, or start the application, you can define these tasks in the `Makefile`.
Then, you just run simple commands like `make test` or `make infrastructure-up`.

As you might have noticed, there are two Makefiles:

1. `project/project-api/Makefile`: This Makefile is used for linting, testing, and running the API.
2. `project/Makefile`: This Makefile is used for building and running the infrastructure (via Dockerfile).

Let me show you the extremely simple Makefile I use for the `project-api`:

```makefile
# project/project-api/Makefile
DIR := .

test:
 uv run pytest

format-fix:
 uv run ruff format $(DIR)
 uv run ruff check --select I --fix

lint-fix:
 uv run ruff check --fix
```

Now if I want to run the tests, I just run `make test`, and it will execute `uv run pytest` in the current directory.

For the global project, I can use the following Makefile:

```makefile
# project/Makefile
infrastructure-build:
 docker compose build

infrastructure-up:
 docker compose up --build -d

infrastructure-stop:
 docker compose stop
```

I know that these examples are very simple, but you just imagine how you can add more complex tasks as needed.
Make is a powerful tool that can help you automate almost anything in your development workflow.

## Docker

Docker is a tool that allows you to package your application and its dependencies into a container, including everything needed to run, such as libraries, system tools, code, and runtime.
Even if you are using GPU-enabled VMs, use Docker and expose the GPU to the container with the following parameter.

When working locally, we use Docker Compose to connect all the Docker images to the same network. Like Docker with dependencies, Docker Compose helps you encapsulate your whole application network and separate it from the rest of your local applications.

To fully understand this, let’s take a look at a `docker-compose.yml` file:

```yaml
version: '3.8'
services:
  project-api:
    build:
      context: ./project-api
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    volumes:
      - ./project-api:/app
    environment:
      - ENV_VAR=value
    networks:
      - project-network
  project-ui:
    build:
      context: ./project-ui
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    networks:
      - project-network
networks:
  project-network:
    driver: bridge
```

```bash
# Example Docker command to run a container with GPU support
docker run --gpus all ...
```

Note that in the `docker-compose.yml` file, we define two services: `project-api` and `project-ui`.
Each service has its own build context (`Dockerfile`), ports, volumes, and environment variables.

Here is a sample Dockerfile for the `project-api` service:

```dockerfile
FROM python:3.11-slim
# Install system dependencies
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
# Set the PATH to include uv
WORKDIR /app
COPY uv.lock pyproject.toml README.md ./
RUN uv sync --frozen --no-cache
# Bring in the actual application code
COPY src/app app/
COPY tools tools/
# Define a command to run the application
CMD ["/app/.venv/bin/fastapi", "run", "project/infrastructure/api.py", "--port", "8000", "--host", "0.0.0.0"]
```

# External Resources

- <https://decodingml.substack.com/p/engineer-python-projects-like-a-pro>
- <<https://ashishb.net/programming/python-in-production-2>

- [Visual Studio Code](https://code.visualstudio.com/)
- [Python.org](https://www.python.org/)
- [Pipenv Documentation](https://pipenv.pypa.io/en/latest/)
- [Prettier Documentation](https://prettier.io/docs/en/index.html)
- [Flake8 Documentation](https://flake8.pycqa.org/en/latest/)

# Footnotes

[^1]: Don't get me wrong, I understand that there are cases where a multi-repo structure is necessary, like when you have multiple teams working on different parts of the project, or when you need to share code across different projects.

[^2]: The `pyproject.toml` file is similar to `package.json` in Node.js or `pom.xml` in Java.

---
layout: post
title: I'm Fully Switching to Python
subtitle: Here's my production-ready Python dev environment
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

I switched to writting production-ready Python code 6 months ago.
Why?
Because of AI, obviously.
It's clear (to me) that big ~~money~~ opportunities are all over AI these days.
Aand guess what's the de facto programming language for AI?
Yep, it's that one.

I've used Python it before, but only for small scripts.
For example, [this script](https://github.com/cesarsotovalero/cesarsotovalero.github.io/blob/1fb2efe0577719a72fdf7d5bdf2a8d4d51ee58c5/scripts/fetch_all_youtube_videos.py) over here scrapes metadata fromm all the YouTube videos on my channel to create [this](https://github.com/cesarsotovalero/cesarsotovalero.github.io/blob/1fb2efe0577719a72fdf7d5bdf2a8d4d51ee58c5/_data/youtube-videos.json) JSON file that I latter use to nicely display [on a static page](https://www.cesarsotovalero.net/youtube) of this website.
As you can [see here](https://github.com/cesarsotovalero/cesarsotovalero.github.io/blob/1fb2efe0577719a72fdf7d5bdf2a8d4d51ee58c5/.github/workflows/update-youtube-videos.yml), this little script runs in solo mode every Monday via GitHub actions.
Doing this kind of thing in Python just way more convenient that, say, using Batch.
Not only because the syntaxis more human friendly, but also because the interpreter is natively integrated in all Unix distros.
Isn't that cool!

So yeah, Python is powerful.
But I didn't treat it seriously just util recently.[^3]
When I wanted to build AI applications (RAG, Agents, GenAI tools, etc.) for the *real world*.
Then I realized that wether you like it or not, Python is the language of choice for that.

So I decided to give it a serious try, and to my grate surprice I've found that Python, and all things around it, have really improved a lot in the last decades.

Just three examples:

1. Python has created a very complete ecosystem of libraries and tools for processing and analysyng data.[^4]
2. Python has got faster with optimized stactic compilers like [Cython](https://cython.org/).
3. Python has made a good job in hiding its legacy ugliness (think `__init__`, `__new__`, etc.) to edulcorate developers ~~with good taste~~.

Thanks to this and many other things, I'm now feeling a particular joy for the language.

However, along this time, I've found that there is still a big gap between using Python for *production-ready apps*, versus the usual workflow for Jupyter notebook or script workflows.
In this post, I share the tools, libraries, configs, and other integrations that bring me joy and that I now use for building production-grade Python applications.
This post is highly biases to the tools that I personally use today, and if you think I'm missing some some gem please let me/us know (preferibly in the comment session below).

# Project Structure

I prefer to use a monorepo (with backend and frontend) structure for my Python projects.[^1]

Why?

- First and foremost, because of my bad memory: I don't like code parts scattered across multiple repositories (it's not search friendly).
- Because multi-repo is unnecessary: I believe that if a project grows to the point that it needs to be split into multiple repositories, then it's a sign of over-engineering.
- Because I'm lazy: I like to keep things as simple as possible, compile, test, containerize and deploy from a single location.[^5]

I would like to have a tool that generates the project structure for me, but I haven't found one that fits me yet.
In the past, I used [CCDS](https://cookiecutter-data-science.drivendata.org/), a project initialization tool tool mostly for Data Science projects, it's very good but its not targeting developers as its core users.

Here's the typical structure of a project with a frontend-backend architecture (I'll go through each subpart later in this post):

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
├── docs/                   # Website and docs (a static SPA with MkDocs)
│
├── project-api/            # Backend API for handling business logic and heavy processing
│   ├── data/               # Directory for storing datasets or other static files
│   ├── notebooks/          # Jupyter notebooks for quick (and dirty) experimentation and prototyping
│   ├── tools/              # Utility scripts and tools for development or deployment
│   ├── src/                # Source code for the backend application
│   │   ├── app/            # Main application code
│   │   └── tests/          # Utility scripts and helper functions
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
├── LICENSE                 # License information for the project (I always choose MIT)
├── Makefile                # Automation tasks for building, testing, and deploying
└── README.md               # Main documentation for the project (main features, installation, and usage)
```

First, `project` is the root directory.
I like short names for projects, ideally less than 10 characters long, no snake_case (separation with hyphens is OK to me).
Note that the project should be self-contained, meaning that it includes documentation, build/deployment infrastructure, and other necessary files to run it standalone.

It's important not to do any heavy data processing steps in the `project-ui`, as I opted to separate the frontend stuff from the backend.
Instead, I choose to make HTTP requests to the `project-api` server that contains the Python code.
Like this, we keep the browser application light while delegating the heavy lifting and business logic to the server.

There is a `__init__.py` file in `project-api/src/app` to indicate that `app` is a Python module (it can be imported from other modules).

# Python Toolbox

## uv

I use [uv](https://github.com/astral-sh/uv) as my Python package manager and build tool (it's all I need to install and manage dependencies).

Here are the core commands to set it up:

```bash
# Install uv globally if not already installed
curl -sSfL https://astral.sh/install.sh | sh
# Initialize a new project (adds .gitignore, .python-version, pyproject.toml, etc.)
uv init project-api
# Add some dependencies into the project and update pyproject.toml
uv add --dev pytest ruff pre-commit mkdocs gitleaks fastapi pydantic
# Update the lock file with the latest versions of the dependencies (creates a .venv if not already created)
uv sync
# Activate the .venv
uv venv activate
```

Note that the most important file for uv is `pyproject.toml`.
This file [contains](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) metadata and the dependencies dependencies that are required to build and run the project.[^2]

## ruff

I really like [ruff](https://github.com/astral-sh/ruff).
It's a super fast Python linter and code formatter, designed to help lazy developers like me to clean and maintainable our codebases.
Ruff combines `isort`, `flake8`, `autoflake`, and similars into a single tool that can be run with a single command:

```bash
ruff check path/to/code/   # Lint all files in `/path/to/code` (and any subdirectories).
ruff format path/to/code/  # Format all files in `/path/to/code` (and any subdirectories).
```

Note that ruff supports the [PEP 8](https://pep8.org/) style guide out-of-the-box.

## ty

[ty](https://github.com/astral-sh/ty) is a type checker for Python.
It's supposed to be the upgraded version of [typing](https://docs.python.org/3/library/typing.html) (a popular Python library to make the language statically typed)
I think typing really helps me to catch type errors early in the development process, I actually don't care about having to writ more code, and rather pefer improving code quality and reducing the likelihood of runtime errors.

**NOTE:** At the time of writing, ty is still in early in development by Astral (the same company behind uv and ruff), but I'm usinging it and couldn't find any noticeable flaw just yet.

## pytest

[Pytest](https://docs.pytest.org/en/stable/) is THE testing framework for Python.
Writing simple and scalable test cases with it is just super easy.
It supports fixtures, parameterized tests, and has a rich ecosystem of plugins.
Just create a file `test_<unit or module name>.py` in `project-api/src/app/tests/`, and run `uv run pytest` to execute the tests.
That's it!

## Pydantic

[Pydantic](https://pydantic-docs.helpmanual.io/) is a data validation and settings management library for Python.
It allows managing all kinds of configuration settings, such as API keys, database connection details, or model parameters (hardcoding these values is a very bad practice, btw).

In particular [Pydantic Settings](https://docs.pydantic.dev/latest/concepts/pydantic_settings/) allows to define application configurations using Pydantic models.
It can automatically load settings from environment variables or special `.env` files, validate their types, and make them easily accessible in your code.

Here's an illustrative example:

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
And these values will be accessible and validated according to the types defined in the `Settings` model.
Just great!

## MkDocs

I use [MkDocs](https://www.mkdocs.org/) for documentation and static generation of the website for the project.[^6]
I like to copy the aesthetic that I like from other similar projects and make a simple set of modifications (like changing fonts and colors).

## FastAPI

I use [FastAPI](https://fastapi.tiangolo.com/) for building APIs.

## Dataclasses

[Dataclasses](https://docs.python.org/3/library/dataclasses.html) are a way to define classes in Python that are primarily used to store data.
They provide a simple syntax for creating classes that automatically generate special methods like `__init__()`, `__repr__()`, and `__eq__()`.
This greatly reduces boilerplate code when creating classes meant primarily for storing data.

Here's an example of how to use dataclasses:

```python
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int

# This automatically generates an __init__ method, so you can do
p = Point(1, 2)
print(p)  # Output: Point(x=1, y=2)
```

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

[^3]: If you know me, you know that I used to be a mostly a Java/JavaScript/R kind of guy.

[^4]: For example, today [Jupyter](https://jupyter.org/) is bundled in almost every single cloud providers as the de facto tool for interactive data science and scientific computing.

[^5]: I believe in avoiding premature decomposition, if a codebase is less than, say, half million LoC, putting a network layer (as API calls) over it only makes maitenance a pain for ~~non-Amazon~~ rational developers.

[^6]: By the way, I think every single project on GitHub should have its own website (it's just extremely easy via [GitHub pages](https://pages.github.com/)), so no excuses.

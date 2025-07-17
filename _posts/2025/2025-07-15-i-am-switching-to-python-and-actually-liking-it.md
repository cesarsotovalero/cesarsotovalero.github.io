---
layout: post
title: I'm Switching to Python and Actually Liking It
subtitle: Here are my tools for building production-ready apps
tags: tools
description: |
  I've started writing more Python code lately (because of... AI, you know). In this post, I share the tools, libraries, configs, and other integrations I use for building production-grade Python applications following a frontend-backend architecture.
keywords:
  - python
  - development
  - vscode
  - productivity
  - tools
image: ../img/posts/2025/2025-07-15/wall-stones_cover.JPG
share-img: ../img/posts/2025/2025-07-15/wall-stones_cover.JPG
show-avatar: false
toc: true
mathjax: true
date: 2025/07/15
author: cesarsotovalero
published: true
---

I started to code more in [Python](https://www.python.org/) around 6 months ago.
Why?
Because of AI, obviously.
It's clear (to me) that big ~~money~~ opportunities are all over AI these days.
And guess what’s the _de facto_ programming language for AI?
Yep, that sneaky one.

I had used Python before, but only for small scripts.
For example, [this script](https://github.com/cesarsotovalero/cesarsotovalero.github.io/blob/1fb2efe0577719a72fdf7d5bdf2a8d4d51ee58c5/scripts/fetch_all_youtube_videos.py) scrapes metadata from all videos on [my YouTube channel](https://www.youtube.com/channel/UCR4rI98w6-MqYoCS6jR9LGg).
The metadata is dumped as [a JSON file](https://github.com/cesarsotovalero/cesarsotovalero.github.io/blob/1fb2efe0577719a72fdf7d5bdf2a8d4d51ee58c5/_data/youtube-videos.json) that I use to nicely display statistics of the videos [on this static page](https://www.cesarsotovalero.net/youtube).
As you can [see here](https://github.com/cesarsotovalero/cesarsotovalero.github.io/blob/1fb2efe0577719a72fdf7d5bdf2a8d4d51ee58c5/.github/workflows/update-youtube-videos.yml), this little script runs in solo mode every Monday via GitHub Actions.
Doing this kind of thing in Python is just way more convenient than, say, using Batch.
Not only because the syntax is more human-friendly, but also because the Python interpreter is natively integrated in all Unix distros.
Isn’t that cool?

So yeah, Python is powerful, and it couples very well with the now ubiquitous [VSCode](https://code.visualstudio.com/) editor.
But I didn’t treat it seriously until recently,[^3] it was just after I wanted to build AI applications (RAG, Agents, GenAI tools, etc.) for the "real world" that I realized that whether you like it or not, Python is the language of choice for those matters.

So I decided to give it a serious try, and to my great surprise, I’ve found that Python, and everything around it, has really improved a lot over the last decades.

Here're just three examples:

1. Python has created a very complete ecosystem of libraries and tools for processing and analyzing data.[^4]
2. Python has gotten faster with optimized static compilers like [Cython](https://cython.org/).
3. Python has done a good job of hiding its legacy ugliness (such as `__init__`, `__new__`, and similar aberrations), sweetening its syntax to accommodate developers ~~with good taste~~.

Thanks to this and many other things, I'm now feeling a particular joy for the language.

However, during this time, I’ve found that there’s still a big gap between using Python for "production-ready"[^7] apps vs. the usual Jupyter notebook or script-based workflow.

So in this post, I share the tools, libraries, configs, and other integrations that bring me joy, and that I now use for building my Python applications.

⚠️ This post is highly biased toward the tools I personally use today, and if you think I'm missing some gem, please let me/us know (preferably in the comment section below).

**NOTE:** Somehow this article got [600+ comments](https://news.ycombinator.com/item?id=44579717) on Hacker News (just another proof that you never really know).

# Project Structure

I prefer to use a [monorepo](https://en.wikipedia.org/wiki/Monorepo) structure (backend and frontend) for my Python projects.[^1]

Why?

1. Because of my bad memory: I don't like code parts scattered across multiple repositories (it's definitely not search-friendly).
2. Because having multiple repos is mostly unnecessary: I'm just one guy, and I believe that if a project grows to the point that it needs to be split into multiple repositories, then it's a sign of over-engineering.
3. Because I'm lazy: I like to keep things as simple as possible, compile, test, containerize, and deploy from a single location.[^5]

I would like to have a tool that generates the project structure for me, but I haven't found one that fits me yet.
In the past, I used [CCDS](https://cookiecutter-data-science.drivendata.org/), a project initialization tool mostly for Data Science projects.
It's very good, but it's not targeting full-stack developers as its core users.

Here's the typical structure of a project with a frontend-backend architecture (I'll go through each subpart later in this post):

{% highlight bash %}
project/
│
├── .github/ # GitHub Actions workflows for CI/CD pipelines
│   ├── workflows/ # Directory containing YAML files for automated workflows
│   └── dependabot.yml # Configuration for Dependabot to manage dependencies
│
├── .vscode/ # VSCode configuration for the project
│   ├── launch.json # Debugging configurations for VSCode
│   └── settings.json # Project-specific settings for VSCode
│
├── docs/ # Website and docs (a static SPA with MkDocs)
│
├── project-api/ # Backend API for handling business logic and heavy processing
│   ├── data/ # Directory for storing datasets or other static files
│   ├── notebooks/ # Jupyter notebooks for quick (and dirty) experimentation and prototyping
│   ├── tools/ # Utility scripts and tools for development or deployment
│   ├── src/ # Source code for the backend application
│   │   ├── app/ # Main application code
│   │   └── tests/ # Unit tests for the backend
│   │
│   ├── .dockerignore # Specifies files to exclude from Docker builds
│   ├── .python-version # Python version specification for pyenv
│   ├── Dockerfile # Docker configuration for containerizing the backend
│   ├── Makefile # Automation tasks for building, testing, and deploying
│   ├── pyproject.toml # Python project configuration file
│   ├── README.md # Documentation for the backend API
│   └── uv.lock # Lock file for dependencies managed by UV
│
├── project-ui/ # Frontend UI for the project (Next.js, React, etc.)
│
├── .gitignore # Global Git ignore file for the repository
├── .pre-commit-config.yaml # Configuration for pre-commit hooks
├── CONTRIBUTING.md # Guidelines for contributing to the project
├── docker-compose.yml # Docker Compose configuration for multi-container setups
├── LICENSE # License information for the project (I always choose MIT)
├── Makefile # Automation tasks for building, testing, and deploying
└── README.md # Main documentation for the project (main features, installation, and usage)
{% endhighlight %}

My `project` is the root directory and the name of my GitHub repo.
I like short names for projects, ideally less than 10 characters long. No `snake_case`; separation with hyphens is OK to me.
Note that the project should be self-contained, meaning it includes documentation, build/deployment infrastructure, and any other necessary files to run it standalone.

It's important not to do any heavy data processing steps in the `project-ui`, as I opted to separate frontend logic from backend responsibilities.
Instead, I choose to make HTTP requests to the `project-api` server that contains the Python code.
This way, we keep the browser application light while delegating the heavy lifting and business logic to the server.

There’s an `__init__.py` file in `project-api/src/app` to indicate that `app` is a Python module (it can be imported from other modules).

# Python Toolbox

## uv

I use [uv](https://github.com/astral-sh/uv) as my Python package manager and build tool. It’s all I need to install and manage dependencies.

Here are the core commands to set it up:

{% highlight bash linenos %}
# Install uv globally if not already installed
curl -sSfL <https://astral.sh/install.sh> | sh

# Initialize a new project (adds .gitignore, .python-version, pyproject.toml, etc.)
uv init project-api

# Add some dependencies into the project and update pyproject.toml
uv add --dev pytest ruff pre-commit mkdocs gitleaks fastapi pydantic

# Update the lock file with the latest versions of the dependencies (creates a .venv if not already created)
uv sync

# Activate the .venv
uv venv activate
{% endhighlight %}

Note that the most important file for `uv` is `pyproject.toml`.[^2]
This file [contains](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) metadata and the list of dependencies required to build and run the project.

## ruff

I really like [ruff](https://github.com/astral-sh/ruff).
It’s a super-fast Python linter and code formatter, designed to help lazy developers like me keep our codebases clean and maintainable.
Ruff combines `isort`, `flake8`, `autoflake`, and similar tools into a single command-line interface:

{% highlight bash linenos %}
# Lint all files in `/path/to/code` (and any subdirectories).
ruff check path/to/code/

# Format all files in `/path/to/code` (and any subdirectories).
ruff format path/to/code/
{% endhighlight %}

Ruff supports the [PEP 8](https://pep8.org/) style guide out of the box.

## ty

[ty](https://github.com/astral-sh/ty) is a type checker for Python.
It is a great combo for [typing](https://docs.python.org/3/library/typing.html), the popular Python module for adding static typing.
I think typing really helps me catch type errors early in the development process. I actually don’t care about having to write more code, in fact, I prefer it if it improves code quality and reduces the likelihood of runtime errors.

**NOTE:** At the time of writing, `ty` is still in early development by Astral (the same company behind `uv` and `ruff`), but I’ve been using it and haven’t found any noticeable flaws so far.

## pytest

[pytest](https://docs.pytest.org/en/stable/) is _THE_ testing library for Python.
Writing simple and scalable test cases with it is just super easy.
It supports fixtures, parameterized tests, and has a rich ecosystem of plugins.
Just create a file named `test_<unit_or_module>.py` in `project-api/src/app/tests/`, and run:

{% highlight bash %}
uv run pytest
{% endhighlight %}

That’s it!

## Pydantic

[Pydantic](https://pydantic-docs.helpmanual.io/) is a data validation and settings management library for Python.
It helps manage all kinds of configuration settings, such as API keys, database connection details, or model parameters (hardcoding these values is a very bad practice, btw).

In particular, [Pydantic Settings](https://docs.pydantic.dev/latest/concepts/pydantic_settings/) allows you to define application configurations using Pydantic models.
It can automatically load settings from environment variables or special `.env` files, validate their types, and make them easily accessible in your code.

Here’s an illustrative example:

{% highlight python linenos %}
from pydantic import BaseSettings

class Settings(BaseSettings):
    api_key: str
    db_url: str

    class Config:
        env_file = ".env"

settings = Settings()
{% endhighlight %}

Now, when you run this code, Pydantic will automatically load the values of `api_key` and `db_url` from the `.env` file or environment variables.
These values will be accessible and validated according to the types defined in the `Settings` model.
Just great!

## MkDocs

I use [MkDocs](https://www.mkdocs.org/) for documentation and static generation of the website for the project.[^6]
I’m not a designer, so I prefer to just copy an aesthetically pleasing design from another similar open-source project and make some simple modifications to the CSS (like changing fonts and colors).

## FastAPI

I use [FastAPI](https://fastapi.tiangolo.com/) for building APIs.
It has been a game changer for me; it allows for easy creation of RESTful APIs with automatic validation, serialization, and documentation.
FastAPI is built on top of Starlette and Pydantic, which means it provides excellent performance and type safety.
It’s fast, easy to use, and integrates seamlessly with Pydantic for data validation.

## Dataclasses

[Dataclasses](https://docs.python.org/3/library/dataclasses.html) is not a library but a Python feature that provides a way to define classes that are primarily used to store data.
They offer a simple syntax for creating classes that automatically generate special methods like `__init__()`, `__repr__()`, and `__eq__()`.

This greatly reduces boilerplate when creating data containers.

Here’s an example:

{% highlight python linenos %}
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int

p = Point(1, 2)
print(p)  # Output: Point(x=1, y=2)
{% endhighlight %}

So goodbye boilerplate and cryptic code!

# Version Control

## GitHub Actions

I'm a fanboy of [GitHub Actions](https://github.com/features/actions), especially for CI across different OSs.
I recommend using it for both API and UI pipelines.

A typical workflow for `project-api` looks like this:

{% highlight yaml linenos %}
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
{% endhighlight %}

Note that this workflow uses Docker to run the tests in an isolated environment.[^8]
You can change the OS by setting the `runs-on` parameter to `windows-latest` or `macos-latest`.

## Dependabot

Handling dependencies is a pain, but [Dependabot](https://dependabot.com/) makes it easier.
It automatically checks for outdated dependencies and creates pull requests to update them.

Here’s a sample configuration for Dependabot in the `.github/dependabot.yml` file:

{% highlight yaml linenos %}
version: 2
updates:

- package-ecosystem: "uv"
    directory: "/"
    schedule:
      interval: "weekly"
{% endhighlight %}

## Gitleaks

If there’s something that could hurt our reputation, it’s committing sensitive information, like API keys or passwords, directly to a repository.
Fortunately, [Gitleaks](https://github.com/gitleaks/gitleaks) helps prevent this from happening.
There’s just no reason not to use it.

## Pre-commit Hooks

I use [pre-commit](https://pre-commit.com/) to run checks and format code before committing.
It helps ensure that the code is always in a good state and follows the project’s coding standards.
For example, I use it to run [ruff-pre-commit](https://github.com/astral-sh/ruff-pre-commit) and `gitleaks` before committing my code.

Here’s a sample `.pre-commit-config.yaml` file that I use:

{% highlight yaml linenos %}
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.12.3  # Ruff version.
    hooks:
      - id: ruff-check # Run the linter.
        args: [ --fix ]
      - id: ruff-format  # Run the formatter.
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.27.2
    hooks:
      - id: gitleaks
{% endhighlight %}

# Infrastructure Management

## Make

[Make](https://www.gnu.org/software/make/) is a Swiss Army knife, a classic utility for automating tasks.
I use it to create simple shortcuts for common development commands.
Instead of remembering and typing out long CLI incantations to run tests, build Docker images, or start services, I define these tasks in a `Makefile`.
Then I just run commands like `make test` or `make infrastructure-up`.

As you might have noticed, there is a `Makefile` in both the `project-api` and the global `project` directories:

1. `project/project-api/Makefile`: For linting, testing, and running the API.
2. `project/Makefile`: For building and running the infrastructure (via `docker-compose`).

Here’s an extremely simple example of the `project-api` Makefile:

{% highlight plaintext linenos %}
DIR := . # project/project-api/Makefile

test:
 uv run pytest

format-fix:
 uv run ruff format $(DIR)
 uv run ruff check --select I --fix

lint-fix:
 uv run ruff check --fix
{% endhighlight %}

Now, if I want to run the tests, I just run `make test`, and it executes `uv run pytest` in the current directory.

For the global project, I use the following `Makefile`:

{% highlight plaintext linenos %}
infrastructure-build:
 docker compose build

infrastructure-up:
 docker compose up --build -d

infrastructure-stop:
 docker compose stop
{% endhighlight %}

`make` is a powerful tool that can help you automate almost anything in your development workflow.
Although the examples above are very simple, just imagine how you can add more complex tasks as needed.

## Docker

[Docker](https://www.docker.com/) is a tool that allows you to package your application and its dependencies into a container,including everything needed to run: dependencies, system tools, code, and runtime OS.
When working locally, I use [Docker Compose](https://docs.docker.com/compose/) to connect all Docker images into the same network.
Like Docker for dependencies, Docker Compose allows encapsulating the whole application stack and separating it from the rest of your local environment.

To fully grasp this concept, let’s take a look at a simple `docker-compose.yml` file:

{% highlight yaml linenos %}
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
{% endhighlight %}

In this file, we define two services: `project-api` and `project-ui`.
Each service has its own build context (`Dockerfile`), ports, volumes, and environment variables.

Here’s a sample `Dockerfile` for the `project-api` service:

{% highlight dockerfile linenos %}
FROM python:3.11-slim

# Install system dependencies

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY uv.lock pyproject.toml README.md ./
RUN uv sync --frozen --no-cache

# Bring in the actual application code

COPY src/app app/
COPY tools tools/

# Define a command to run the application

CMD ["/app/.venv/bin/fastapi", "run", "project/infrastructure/api.py", "--port", "8000", "--host", "0.0.0.0"]
{% endhighlight %}

As you can see, the Dockerfile starts from a Python base image, installs dependencies, copies the project files, and defines the command to run the FastAPI application.

This way, you can run the entire application stack with a single command:

{% highlight bash %}
docker compose up --build -d
{% endhighlight %}

# Footnotes

[^1]: Don’t get me wrong, I understand there are cases where a multi-repo structure is necessary, like when multiple teams work on different parts of the project or when dependencies needs to be shared across projects.

[^2]: A `pyproject.toml` file is similar to `package.json` in Node.js or `pom.xml` in Java.

[^3]: If you know me, you know I used to be mostly a Java/JavaScript/R kind of guy.

[^4]: For example, today [Jupyter](https://jupyter.org/) is bundled by almost every major cloud provider as the de facto tool for interactive data science and scientific computing.

[^5]: I believe that aviding premature decomposition is a good idea. If a codebase is less than, say, 1/2 million LoC, then setting a network layer (like API calls) over it only would make maintenance a pain for ~~non-Amazon~~ rational developers.

[^6]: By the way, I think every single project on GitHub should have its own website (it's extremely easy via [GitHub Pages](https://pages.github.com/)), so no excuses, sorry.

[^7]: “Production-ready,” for me, means I can deploy the app to the cloud as-is, without needing to make a lot of infrastructure changes.

[^8]: Using Docker for CI ensures parity with production environments, but it might add some cold-start overhead. You know... compromises, life is full of them.

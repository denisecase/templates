# Templates

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
[![Docs (MkDocs)](https://github.com/denisecase/templates/actions/workflows/deploy-mkdocs.yml/badge.svg?branch=main)](https://denisecase.github.io/templates/)
![Build Status](https://github.com/denisecase/templates/actions/workflows/ci-hygiene-mkdocs.yml/badge.svg?branch=main)
[![Check Links](https://github.com/denisecase/templates/actions/workflows/links.yml/badge.svg)](https://github.com/denisecase/templates/actions/workflows/links.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg)](https://github.com/denisecase/templates/security/dependabot)

> Current versions of software engineering project files

## Requirements

Nothing is required to use the template files. Just copy and paste as needed.
Each file should generally be self-documenting.

## Developer

Pre-commit is optional; CI will report exact commands if it fails.

Steps to run pre-commit locally. Install `uv`.
In GitHub Repository Settings, click `Pages` on the left, then
set `Build and Deploy` / `Source` to **GitHub Actions**.

Initialize once:

```shell
uv self update
uv python pin 3.12
uv sync --extra dev --extra docs --upgrade
uvx pre-commit install
uvx pre-commit run --all-files
```

Build and serve docs:

```shell
uv run mkdocs build --strict
uv run mkdocs serve
```

> To stop a running Python program, press `Ctrl + C` in the terminal

Save progress:

```shell
git add -A
# If pre-commit makes changes, re-run `git add -A` before committing.
git commit -m "update"
git push -u origin main
```

## Resources

See `.github\workflows` for available GitHub actions.

See `.devcontainer` for alternatives to local development.

# Templates

[![Docs](https://img.shields.io/badge/Docs-GitHub%20Pages-blue.svg)](https://denisecase.github.io/templates/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
[![CI (Python Zensical)](https://github.com/denisecase/templates/actions/workflows/ci-python-zensical.yml/badge.svg?branch=main)](https://github.com/denisecase/templates/actions/workflows/ci-python-zensical.yml)
[![Deploy Docs](https://github.com/denisecase/templates/actions/workflows/deploy-zensical.yml/badge.svg?branch=main)](https://github.com/denisecase/templates/actions/workflows/deploy-zensical.yml)
[![Check Links](https://github.com/denisecase/templates/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/denisecase/templates/actions/workflows/links.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg)](https://github.com/denisecase/templates/security)

> Canonical baseline files for my repositories.

This repository stores reusable project files, configuration files, workflow files,
and documentation scaffolding for professional course, tooling, and software
engineering repositories.

The template layers are additive. Later layers override earlier
layers when a repository profile needs a more specific version of the same file.

## Layers

Common additive layers include:

```text
ALL
ALL-PY
ALL-PY-SRC
ALL-PY-SRC-PYPI
```

## Requirements

Nothing is required to use the template files manually.
Copy and adapt files as needed.

For managed updates, the `dc-up` command can fetch files from this repository
and apply the appropriate layered baseline to a target repository.

```shell
# see what files the command would update (optional, force latest)
uvx dc-up
uvx dc-up@latest

# actually add and overwrite the files listed (CAUTION: DESTRUCTIVE)
uvx dc-up --write
```

## Developer Command Reference

<details>
<summary>Show command reference</summary>

### In a machine terminal

Open a machine terminal where you want the project:

```shell
git clone https://github.com/denisecase/templates

cd templates
code .
```

### In a VS Code terminal

```shell
uv self update
uv python pin 3.14
uv lock --upgrade
uv sync --extra dev --extra docs --upgrade

uv run pre-commit install
uv run pre-commit autoupdate

git add -A
uv run pre-commit run --all-files
# repeat if changes were made
uv run pre-commit run --all-files

npx markdownlint-cli2 --fix

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

</details>

## Annotations

[.annotations/annotations.md](./.annotations/annotations.md)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)

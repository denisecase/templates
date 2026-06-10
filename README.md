# Templates

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
[![CI Hygiene](https://github.com/denisecase/templates/actions/workflows/ci-hygiene.yml/badge.svg?branch=main)](https://github.com/denisecase/templates/actions/workflows/ci-hygiene.yml)
[![Check Links](https://github.com/denisecase/templates/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/denisecase/templates/actions/workflows/links.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg)](https://github.com/denisecase/templates/security/)

> Canonical baseline files for Denise Case repositories.

This repository stores reusable project files, configuration files, workflow files,
and documentation scaffolding for professional course, tooling, and software
engineering repositories.

The template layers are intentionally additive. Later layers override earlier
layers when a repository profile needs a more specific version of the same file.

## Layers

Common layers include:

```text
ALL
ALL-PY
ALL-PY-SRC
ALL-PY-SRC-PYPI
ALL-PY-NB
ALL-PY-KAFKA
ALL-TS
ALL-TS-VSCODE
```

Typical compositions:

```text
General Python source repos:
  ALL -> ALL-PY -> ALL-PY-SRC

Notebook repos:
  ALL -> ALL-PY -> ALL-PY-NB

Kafka repos:
  ALL -> ALL-PY -> ALL-PY-KAFKA

Published Python packages:
  ALL -> ALL-PY -> ALL-PY-SRC -> ALL-PY-SRC-PYPI

Templates repo tooling:
  ALL -> ALL-PY
```

## Requirements

Nothing is required to use the template files manually.
Copy and adapt files as needed.

For managed updates, the `dc-up` command can fetch files from this repository
and apply the appropriate layered baseline to a target repository.

## Developer Command Reference

<details>
<summary>Show command reference</summary>

### In a machine terminal

Open a machine terminal where you want the project:

```shell
git clone https://github.com/denisecase/dc-up

cd dc-up
code .
```

### In a VS Code terminal

```shell
uv self update
uv python pin 3.14
uv lock --upgrade
uv sync --extra dev --extra docs --upgrade

uvx pre-commit install
uvx pre-commit autoupdate

git add -A
uvx pre-commit run --all-files
# repeat if changes were made
uvx pre-commit run --all-files

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

</details>

## Annotations

[.annotations/annotations.md](./.annotations/annotations.md)

## Authority Manifest

[.accountability/surfaces.toml](./.accountability/surfaces.toml)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)

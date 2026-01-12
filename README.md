# Templates

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
[![Docs (MkDocs)](https://github.com/denisecase/templates/actions/workflows/deploy-mkdocs.yml/badge.svg?branch=main)](https://denisecase.github.io/templates/)
![Build Status](https://github.com/denisecase/templates/actions/workflows/ci-hygiene-mkdocs.yml/badge.svg?branch=main)
[![Check Links](https://github.com/denisecase/templates/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/denisecase/templates/actions/workflows/links.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg)](https://github.com/denisecase/templates/security/)

> Current versions of software engineering project files

## Requirements

Nothing is required to use the template files.
Just copy and paste as needed.
Each file should generally be self-documenting.

## To Host an MkDocs Site (Like This)

While viewing your GitHub repository in the browser, click the Settings (gear) icon.

1. Click the **Pages** tab.

   - Set **Build and deployment** / **Source** to **GitHub Actions**

2. (Optional, but required if you keep the Dependabot badge)
   - Click the **Security & analysis** tab
   - Enable **Dependabot alerts**

## Developer (Updating The Documentation)

Pre-commit is optional; GitHub Actions will report issues if it fails.

Steps to run pre-commit locally (optional).
First, install `uv`.
Then, initialize once:

```shell
uv self update
uv python pin 3.14
uv sync --extra dev --extra docs --upgrade

uvx pre-commit install
git add -A
uvx pre-commit run --all-files
```

Build and serve docs (hit **CTRL+c** in the VS Code terminal to quit serving):

```shell
uv run mkdocs build --strict
uv run mkdocs serve
```

Save progress frequently (some tools may make changes; you may need to **re-run git `add` and `commit`** to ensure everything gets committed before pushing):

```shell
git add -A
git commit -m "update"
git push -u origin main
```

## Resources

See `.github\workflows` for available GitHub actions.

See `.devcontainer` for alternatives to local development.

## Annotations

[ANNOTATIONS.md](./ANNOTATIONS.md)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)

## SE Manifest

[SE_MANIFEST.md](./SE_MANIFEST.toml)

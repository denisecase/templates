# Templates

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
[![Check Links](https://github.com/denisecase/templates/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/denisecase/templates/actions/workflows/links.yml)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg)](https://github.com/denisecase/templates/security)

<img src="docs/images/pup.png" alt="pup logo" width="110">

> Canonical baseline files for professional Python repositories.

This repository stores reusable project files, configuration files, workflow files,
and documentation scaffolding for professional course, tooling, and software
engineering repositories.

The template layers are additive.
Later layers override earlier layers when a repository profile
needs a more specific version of the same file.

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

For managed updates, the `pup-up` command can fetch files from this repository
and apply the appropriate layered baseline to a target repository.

```shell
# dry run: show what would change
uvx pup-up

# same, but force the latest pup-up version
uvx pup-up@latest

# actually add and overwrite the files listed (CAUTION: DESTRUCTIVE)
uvx pup-up --write
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

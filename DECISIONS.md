# Decisions

This file records repository baseline choices.

## Baseline Model

Repository baselines are additive:

```text
ALL -> ALL-PY -> ALL-PY-SRC -> optional specializations
```

Each layer may add files, checks, workflows, or documentation. Later layers may
also override earlier files when the same filename has a different contract.

| Tier                | Applies to                                      | Adds                                                                                |
| ------------------- | ----------------------------------------------- | ----------------------------------------------------------------------------------- |
| `ALL`               | Every repository, any language                  | Hygiene, file-format validation, Markdown/YAML/link checks, shared governance files |
| `ALL-PY`            | Any repository with Python tooling or scripts   | Ruff and Python pre-commit configuration                                            |
| `ALL-PY-SRC`        | Python repositories with a `src/` package       | Pyright and package/docs CI                                                         |
| `ALL-PY-SRC-PYPI`   | Publishable Python packages                     | PyPI release workflows                                                              |
| `ALL-COURSE`        | Course repositories                             | Course-specific ignores and student-safe defaults                                   |
| `ALL-COURSE-PY-SRC` | Course repositories with Python source packages | Student-facing docs, API docs, and course docs config                               |
| `ALL-TS`            | TypeScript repositories                         | TypeScript-specific pre-commit configuration                                        |

## Enforcement Model

Not every baseline check is enforced the same way in every repository.

Research, package, and infrastructure repositories may use stricter commit-time
automation.
Course repositories may keep some checks available as explicit
commands instead of making them student pre-commit gates.

This keeps the baseline shared while allowing enforcement
to differ by repository purpose.

## Node Tooling Policy

Node is in the shared baseline because `markdownlint-cli2` runs through
`npx`.

This is acceptable for course repositories because it works well,
the workflow has been understandable in practice without significant issues.

## Markdown Linting Policy

Markdown linting uses `markdownlint-cli2`.

The shared config is: `.markdownlint-cli2.yaml`

Run with: `npx markdownlint-cli2 --fix`

Markdown linting belongs in `ALL` because Markdown appears in
research, package, course, and documentation repositories.

In non-course repositories,
Markdown linting may be enforced through `pre-commit`.

In course repositories, Markdown linting may remain an
ad hoc command rather than a pre-commit gate.

`MD013` remains enabled for authored prose at 100 characters, with exceptions for
headings, tables, and code blocks.
This keeps source Markdown readable without
forcing awkward wrapping where wrapping causes damage.

## Repository Checks

These checks are part of the repository baseline. The enforcement point may
differ by layer.

| Check                     | ALL | ALL-PY | ALL-PY-SRC | Args / Config                     | Enforcement                                            |
| ------------------------- | :-: | :----: | :--------: | --------------------------------- | ------------------------------------------------------ |
| `trailing-whitespace`     |  x  |   x    |     x      | `--markdown-linebreak-ext=md`     | Pre-commit                                             |
| `end-of-file-fixer`       |  x  |   x    |     x      |                                   | Pre-commit                                             |
| `mixed-line-ending`       |  x  |   x    |     x      | `--fix=lf`                        | Pre-commit                                             |
| `check-json`              |  x  |   x    |     x      | exclude `^\.vscode/.*\.json$`     | Pre-commit                                             |
| `check-toml`              |  x  |   x    |     x      |                                   | Pre-commit                                             |
| `check-yaml`              |  x  |   x    |     x      | files `\.(yml\|yaml)$`            | Pre-commit                                             |
| `check-added-large-files` |  x  |   x    |     x      | `--maxkb=2000`                    | Pre-commit                                             |
| `check-merge-conflict`    |  x  |   x    |     x      |                                   | Pre-commit                                             |
| `check-case-conflict`     |  x  |   x    |     x      |                                   | Pre-commit                                             |
| `markdownlint-cli2`       |  x  |   x    |     x      | `.markdownlint-cli2.yaml`         | Pre-commit in non-course repos; ad hoc in course repos |
| `ruff-check`              |     |   x    |     x      | `--fix`, `--exit-non-zero-on-fix` | Pre-commit                                             |
| `ruff-format`             |     |   x    |     x      |                                   | Pre-commit                                             |
| `pyright`                 |     |        |     x      |                                   | Pre-commit or CI, depending on repo layer              |

## Ruff Policy

Use Ruff as the student-safe Python floor.
Keep default rule families:

```text
E, F, W
```

Reason:
`F` catches real bugs;
`E` and `W` support basic correctness and consistency.

Avoid more opinionated rule families such as:

```text
B, SIM, ANN
```

Reason: those are useful for stricter package or research work,
but may be too burdensome for a shared student baseline.

Use:

```shell
ruff check --fix --exit-non-zero-on-fix
ruff format
```

Reason: safe fixes are applied, but the command still reports that files changed.

## Versioning Policy

These repositories are not production deployment targets.

Use normal `pre-commit` pinned `rev:` values because that is how `pre-commit`
works, but do not treat them as permanent pins.

Update with:

```shell
pre-commit autoupdate
```

Reason: exact long-term pinning creates maintenance burden and security lag.

## Run Policy

`pre-commit` carries the shared commit-time checks for repositories that use the
full pre-commit gate.

Run all configured pre-commit hooks with:

```shell
uvx pre-commit run --all-files
```

Run Markdown linting directly with:

```shell
npx markdownlint-cli2 --fix
```

Course repositories may document Markdown linting as a manual command rather than
installing it as a pre-commit hook.

## Template Layer Application

| Layer               | Files                                                                                                                                                                                                                 | Purpose                                                                                                                                 |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `ALL`               | `.editorconfig`, `.gitattributes`, `.gitignore`, `.markdownlint-cli2.yaml`, `.github/.yamllint.yml`, `dependabot.yml`, `.github/lychee.toml`, `workflows/links.yml`, `AI_USE.md`, `CLAUDE.md`, `LICENSE`, `shape.ps1` | Shared repository hygiene, governance, linting, links, and shape inspection. Applies regardless of language.                            |
| `ALL-TS`            | `.pre-commit-config.yaml`                                                                                                                                                                                             | TypeScript-specific hooks. Kept out of `ALL` to avoid imposing a JS/TS toolchain.                                                       |
| `ALL-PY`            | `.pre-commit-config.yaml`                                                                                                                                                                                             | Python-specific hooks. Same filename as `ALL-TS`, different language contract.                                                          |
| `ALL-PY-SRC`        | `workflows/ci-python-zensical.yml`, `workflows/deploy-zensical.yml`, `zensical.toml.template`                                                                                                                         | Package/docs CI for repositories with a `src/` package and docs site.                                                                   |
| `ALL-PY-SRC-PYPI`   | `workflows/pre-release.yml`, `workflows/release-pypi.yml`                                                                                                                                                             | Release workflows for publishable PyPI packages only.                                                                                   |
| `ALL-COURSE`        | `.gitignore`                                                                                                                                                                                                          | Course-specific ignore rules for student scratch files, personalized notebooks, and generated outputs. Overrides the base `.gitignore`. |
| `ALL-COURSE-PY-SRC` | `AGENTS.md`, `docs/index.md`, `docs/project-instructions.md`, `docs/your-files.md`, `docs/api.md.template`, `zensical.toml.template`                                                                                  | Student-facing documentation and course-specific docs configuration. Overrides package-oriented docs config where needed.               |

## Override Policy

Later layers may override earlier files only when the same filename has a
different contract.

Valid examples:

```text
ALL/.gitignore -> ALL-COURSE/.gitignore
ALL-PY-SRC/zensical.toml.template -> ALL-COURSE-PY-SRC/zensical.toml.template
```

Reason: course repositories and package repositories have different generated
files, docs navigation, and student-facing surfaces.

Do not duplicate files downstream when the shared `ALL` version is correct.

## Course Repository Policy

Course repositories should stay student-safe.

They may use the same shared config files as research and package repositories,
but should avoid unnecessary commit-time friction.

In course repositories:

- keep Markdown linting available through `npx markdownlint-cli2 --fix`;
- avoid making Markdown line wrapping a surprise student blocker;
- keep Ruff to the safe floor;
- avoid strict optional rule families unless the course explicitly teaches them;
- keep generated outputs and personalized student files ignored.

The goal is not to remove standards. The goal is to put standards at the right
enforcement point.

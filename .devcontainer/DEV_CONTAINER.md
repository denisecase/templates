# Optional: Development Container (GitHub Codespaces)

This repository includes an **optional development container** configuration.
It provides a ready-to-run cloud-based development environment
using GitHub Codespaces or VS Code Dev Containers.

**Local development is still recommended.**
This option exists as a fallback when:

- there are difficulties installing locally
- working on a restricted machine
- using a temporary, browser-based environment

## What a Dev Container Is (and Is Not)

A dev container:

- runs a real Linux environment in the cloud
- includes Python 3.12
- installs project dependencies using the **same commands** used locally
- enables running code, tests, and tools in a terminal

A dev container is **not**:

- required
- a different workflow
- a complete replacement for local setup

Workflow in a dev container should mirror local workflow.

## This Dev Container

- Uses a standard Python 3.12 image
- Runs the same dependency install command used locally:

```bash
  uv sync --extra dev --extra docs --upgrade
```

- Does not add additional services, databases, or ports
- Keeps the environment intentionally simple and predictable

There is no special Codespaces-only build system.

## Editor Settings and Extensions

VS Code settings and extensions inside the dev container are intentionally
aligned with the repository root configuration at `.vscode/extensions.json`.

When updating the root `.vscode/` folder, update this file to stay in sync.

This avoids:

- conflicting editor behavior
- different tooling expectations between local and container users

## How to Use (Optional)

This option is disabled by default to keep the project local-first.

If you choose to try this option:

1. Rename the file from `.devcontainer/devcontainer_OPTION.json` to `.devcontainer/devcontainer.json`.
2. Reopen VS Code to accept recommendations.

Then:

1. Push the repository to your GitHub account
2. Open the repository on GitHub
3. Click Code / Codespaces / Create codespace
4. Wait for the environment to build
5. Use the same commands shown in the repo README.md

## Notes on Cost and Availability

- GitHub may provide free Codespaces usage for verified students
- Usage limits may apply
- This course does not require Codespaces

Local setup (with tools installed on a local machine) is recommended.

## Summary

- Dev containers are optional
- Local development is preferred
- The workflow is intentionally identical
- The configuration provides options if/when needed

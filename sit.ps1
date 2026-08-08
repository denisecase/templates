#Requires -Version 7.0

<#
============================================================
sit.ps1 (ALL-PY-REPOS)
============================================================
Updated: 2026-08-08

Situate dependencies, lint, test, and build docs.
For Python tooling repos only.

Run with:
.\sit.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

uv self update
uv python pin 3.15
uv lock --upgrade
uv sync --extra dev --extra docs

uv run pre-commit install
uv run pre-commit autoupdate

git add -A
uv run pre-commit run --all-files
# repeat if changes were made
uv run pre-commit run --all-files

# build docs
uv run python -m zensical build

Write-Host "All commands executed successfully."

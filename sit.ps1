#Requires -Version 7.0

<#
============================================================
sit.ps1 (ALL-PY-REPOS)
============================================================
Updated: 2026-09-18

Situate dependencies, lint, test, and build docs.
For Python tooling repos only.

Run with:
.\sit.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

uv self update
uv python install
uv lock --upgrade
uv sync

uvx prek install --force
uvx prek update

git add -A
uvx prek run --all-files
# repeat if changes were made
uvx prek run --all-files

Write-Host "All commands executed successfully."

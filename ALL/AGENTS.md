# ./AGENTS.md (ALL-REPOS)

## WHY

This file gives repository-specific instructions to AI coding assistants.

These instructions exist to prevent accidental project drift, unnecessary
rewrites, OS-specific assumptions, and replacement of the user's intended work.

## General Rules

When assisting with this repository:

- preserve existing project structure unless the user requests a change
- make small, reviewable changes instead of large rewrites
- do not replace the project with an unrelated solution
- do not hide important logic behind unnecessary abstraction
- keep filenames, paths, commands, and conventions consistent with this repository
- do not overwrite project-specific source code, tests, notebooks, data, or
  documentation unless requested
- explain behavior-changing changes before recommending them
- prefer restoring known-good working patterns over inventing new ones
- distinguish facts about this repository from general best practices

## Cross-Platform Requirements

Do not assume Linux-only paths, shell syntax, or tooling.
Commands and guidance should work on Windows, macOS, and Linux.
If shell-specific commands are unavoidable, provide both:

- PowerShell for Windows
- bash/zsh for macOS/Linux

## Managed Baseline Files

Some files in this repository may be managed by shared baseline tooling.
When editing managed files:

- preserve existing comments and annotations unless they are wrong
- do not remove WHY, OBS, REQ, or policy comments just to shorten files
- do not rename files or move configuration without confirming the repo contract
- do not narrow checks or weaken safeguards unless there is a demonstrated reason

## Ownership

Assist the user without taking over.
Contributors are the recognized authors of repository contents and
must be able to review, explain, and maintain their changes.

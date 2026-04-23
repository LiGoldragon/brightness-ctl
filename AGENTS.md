# Agent Bootstrap — brightness-ctl

## First thing

Run `bd list --status open` to see what's already on the table.

## Scope

Single Rust crate. Daemon for backlight + idle-dim handling on
laptops. Consumed by CriomOS as a flake input.

## Hard process rules

- Jujutsu only. Never `git` CLI.
- Push immediately after every change.
- Mentci three-tuple commit format:
  `(("CommitType", "scope"), ("Action", "what"), ("Verdict", "why"))`.

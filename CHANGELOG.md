# Changelog

All notable changes to Project Forge OS are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

> **Release procedure:** bump `VERSION`, set `forge_version` in
> `templates/project/.forge.md` to match (the doctor skill checks they
> agree), and add an entry below.

## [0.2.0] - 2026-07-03

### Added

- **`install.ps1`** — a Windows PowerShell installer that installs all 12
  skills for Claude Code (via the `skills` CLI when Node/`npx` is
  available, falling back to a direct copy of `skills/` otherwise) and
  registers this repo as `FORGE_OS_HOME`, a per-user environment variable,
  in one run. Idempotent; safe to re-run.
- **`package.json`** — a minimal, dependency-free npm wrapper
  (`npm run install-forge`) around `install.ps1`, for anyone who'd rather
  not invoke PowerShell directly.
- **`FORGE_OS_HOME` discovery** in `init-project`: the repo path is read
  from the environment variable automatically when it's set and valid,
  instead of always asking the user.
- **Disconnected-memory detection** in `doctor`: project mode now checks
  that `forge_repo` (or a fallback `FORGE_OS_HOME`) resolves to a real,
  complete Forge OS repo; repo mode checks whether the current repo is
  registered as `FORGE_OS_HOME` at all.

### Changed

- **Installation is now one connected flow** instead of two separate steps
  (install skills, then separately clone and hand-edit `.forge.md`).
  `docs/INSTALL.md` and the README's Installation section lead with the
  installer; the previous CLI-only / manual path is preserved as the
  non-Windows and advanced-use alternative.
- `templates/project/.forge.md`'s `forge_repo` field now documents that it
  auto-fills from `FORGE_OS_HOME`.

## [0.1.0] - 2026-07-02

### Added

- **12 skills**: init-project, idea-filter, mvp-cutter, stack-picker,
  plan-project, build-loop, decision-logger, error-capture, retro,
  memory-consolidator, doctor, resume-project.
- **Project templates** (`templates/project/`): BRIEF, PLAN, JOURNAL,
  DECISIONS, ERRORS, RETRO, and `.forge.md` metadata.
- **Forge Memory** (`memory/`): curated global knowledge split into
  lessons, stack notes, profile, and project history, with a budgeted
  INDEX and a candidate → active → deprecated lesson lifecycle.
- **Worked example** (`examples/weekend-mvp/`): a shipped weekend project
  (Clipboard Snippet Launcher) showing the full loop — brief, plan,
  journal, decisions, one captured error, and a retro.
- **Docs**: README, INSTALL, FIRST-PROJECT walkthrough, PRINCIPLES,
  FUTURE (parking lot for everything not in v0.1).

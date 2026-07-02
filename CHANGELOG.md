# Changelog

All notable changes to Project Forge OS are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

> **Release procedure:** bump `VERSION`, set `forge_version` in
> `templates/project/.forge.md` to match (the doctor skill checks they
> agree), and add an entry below.

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

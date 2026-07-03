---
name: init-project
description: Set up a forge/ folder in a project from the Forge OS templates. Asks four questions max, defaults to small scope, and surfaces relevant memory before work starts. Use when starting a new project or adding Forge to an existing one.
---

# init-project

## Purpose

Create the `forge/` folder — the project's shared state — with minimal
ceremony, and bring relevant past experience into view before the first line
of code.

## When to use

- Starting a brand-new project.
- Adding Forge OS to an existing project that has none.

## Reads

- The Forge OS repo path: check the `FORGE_OS_HOME` environment variable
  first (set once by `install.ps1`, or the equivalent on non-Windows
  shells). If it's set and points at a real Forge OS repo, use it
  automatically — don't ask. Only ask the user for the path if it's unset
  or invalid; remember their answer — it goes into `.forge.md` as
  `forge_repo`.
- `templates/project/` at that path.
- `memory/INDEX.md`, `memory/profile/`, and any lessons tagged for the
  project's type or stack (via the Forge OS repo).

## Writes

- `forge/BRIEF.md`, `forge/PLAN.md`, `forge/JOURNAL.md`, `forge/DECISIONS.md`,
  `forge/ERRORS.md`, `forge/RETRO.md`, `forge/.forge.md` — all from templates.

## Workflow

1. **Check for an existing `forge/` folder.** If one exists, stop — suggest
   `resume-project` (to continue) or `doctor` (to health-check) instead.
2. **Resolve the Forge repo path.** Check `FORGE_OS_HOME`. If it's set and
   `skills/`, `templates/project/`, and `memory/` all exist under it, use it
   silently — this is the common case after running `install.ps1`. If it's
   unset, or set but invalid, ask the user once for the path and remember
   the answer for step 4.
3. **Ask the minimal questions**, all in one message:
   - Project name?
   - Project type? (desktop-utility / discord-bot / web-app / website /
     automation / game / ai-tool / other)
   - Intended scope? (weekend / mvp / product — default **weekend**)
   - Preferred stack, if you already know it? (fine to say "not yet")
4. **Create `forge/`** from the templates. Fill in `.forge.md` (name, type,
   scope, `created` date, `forge_version` from the Forge OS repo's `VERSION`
   file, `forge_repo` path from step 2, `status: idea`). Fill the BRIEF's
   name and one-liner from the answers; leave the rest as template prompts.
5. **Surface memory.** From `memory/INDEX.md`, pick at most 5 entries relevant
   to this type/stack (active lessons, stack notes, profile patterns). Show
   each as one line with why it's relevant. If nothing matches, say
   "no relevant memory" — do not pad.
6. **Point to the next step.** The canonical order is
   `idea-filter → init-project → mvp-cutter → stack-picker → plan-project`.
   If `idea-filter` wasn't run before init, suggest it now (it works either
   way); otherwise continue with `mvp-cutter`.

## Output format

A short confirmation: files created, the `.forge.md` summary block, the
surfaced memory lines (or "none"), and the recommended next skill.

## Rules

- Default to `weekend` scope. Scope can be upgraded later; starting big is
  how projects die.
- Never overwrite an existing `forge/` folder or any existing project file.
- If the Forge OS repo can't be found, create `forge/` from the file formats
  described in the templates anyway, set `forge_repo` to `unknown`, and tell
  the user memory is disconnected.
- Log nothing to JOURNAL yet — the first journal entry belongs to the first
  work session.

## Failure modes

- **`forge/` already exists** → stop, recommend `resume-project` or `doctor`.
- **`FORGE_OS_HOME` set but invalid** (path doesn't exist, or is missing
  `skills/`/`templates/`/`memory/`) → don't trust it silently; ask the user
  for the correct path instead, same as if it were unset.
- **Templates missing / repo path wrong** → fall back per Rules; tell the
  user to fix `forge_repo` in `.forge.md` when they know the path, or re-run
  `install.ps1` to reset `FORGE_OS_HOME`.
- **User answers are vague** → accept them vague. The BRIEF gets sharpened by
  `idea-filter` and `mvp-cutter`; init is not an interrogation.

## What not to do

- Do not ask more than the four questions.
- Do not write code, pick a stack, or draft a plan — other skills own those.
- Do not dump the entire memory INDEX; five relevant lines maximum.

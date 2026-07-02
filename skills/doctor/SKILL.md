---
name: doctor
description: Health-check a Forge project or the Forge OS repo itself — missing files, broken references, stale plans, contradictory instructions, memory bloat. Reports findings by severity and suggests fixes; changes nothing without approval. Use when something feels off or before resuming old work.
---

# doctor

## Purpose

Catch drift before it costs a session: files that disagree with each other,
plans that lie about status, memory that quietly bloats, references that
point nowhere.

## When to use

- Something feels inconsistent in a project.
- Before `resume-project` on a long-paused project.
- Periodically on the Forge OS repo itself (skills/templates/memory).

## Reads

Everything in scope, read-only:

- **Project mode:** the whole `forge/` folder + `.forge.md`'s `forge_repo`
  link.
- **Repo mode:** `skills/`, `templates/`, `memory/`, `docs/`, `VERSION`.

## Writes

- Nothing, by default. Applies specific fixes only after the user approves
  them, one by one or "fix all safe".

## Checks — project mode

- **Missing files:** all seven `forge/` files present?
- **Metadata sanity:** `.forge.md` frontmatter parses; `status`, `scope`,
  `type` use known values; `forge_repo` points at a real Forge OS repo.
- **Status truth:** PLAN's Status line matches actual checkbox counts;
  `status: active` but no journal entry in 30+ days → flag as effectively
  paused; `status: shipped/killed` with unchecked P0/P1 tasks → flag.
- **Scope truth:** `scope: weekend` with 20+ tasks → the plan outgrew the
  scope; one of them is wrong.
- **Log integrity:** D-NNN / E-NNN ids sequential and unique; every decision
  has a Reconsider-when; any Reconsider-when triggers already met → surface.
- **Staleness:** BRIEF's definition of dead — is it currently met? Say so
  plainly.

## Checks — repo mode

- **Reference integrity:** every file referenced by a skill, doc, or README
  exists; every wikilink in `memory/` resolves (format examples inside the
  folder README files are exempt); skill folder names match their
  frontmatter `name`.
- **Contradictions:** skills whose instructions disagree with the templates
  or with each other (formats, field names, file paths).
- **Memory health:** INDEX.md within its one-page budget; every INDEX line
  points at an existing file; lessons have valid frontmatter and evidence;
  lessons past `review-by` → list for re-confirmation; near-duplicate
  lessons → list for merging.
- **Version sanity:** `VERSION` exists; templates' `forge_version` matches it.

## Output format

A findings report grouped by severity:

- 🔴 **Broken** — something will mislead an agent or human now.
- 🟡 **Drifting** — inconsistent, will break soon.
- ⚪ **Cosmetic** — worth fixing when convenient.

Each finding: file, what's wrong, one-line suggested fix. End with the
offer to apply approved fixes.

## Rules

- Diagnose against the *written contracts* (templates, formats, budgets) —
  not against taste.
- Suggest the smallest fix that restores consistency; never suggest
  redesigning the system.
- When two files disagree, say which one is authoritative (templates over
  skills' examples; `.forge.md` over prose) and fix the other.
- No findings → say exactly that, briefly. A clean bill is a valid result.

## Failure modes

- **Can't tell which of two conflicting files is right** → present both and
  ask; never pick silently.
- **Huge finding count** → report the top 10 by severity and the total;
  offer a follow-up pass.

## What not to do

- Do not fix anything unasked — a doctor that operates without consent gets
  disabled.
- Do not evaluate code quality, architecture, or idea quality — files and
  contracts only.
- Do not invent new checks mid-run that aren't listed here; propose them for
  the skill instead.

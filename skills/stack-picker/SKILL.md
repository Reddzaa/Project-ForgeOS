---
name: stack-picker
description: Recommend a practical, boring-by-default stack for a project based on its type and the owner's known preferences. Avoids unnecessary cloud, auth, sync, and AI. Logs the decision with reasoning to DECISIONS.md. Use after the brief is cut, before planning.
---

# stack-picker

## Purpose

Pick the stack that ships, not the stack that's interesting. Every external
dependency (cloud, auth, sync, AI) must earn its place in the brief.

## When to use

- After `mvp-cutter`, before `plan-project`.
- When reconsidering a stack mid-project (log it as a superseding decision).

## Reads

- `forge/BRIEF.md` (required) and `forge/.forge.md` (type, scope).
- `memory/stack/` — verdicts and gotchas from past projects.
- `memory/profile/preferences.md` — the owner's defaults.

## Writes

- `forge/DECISIONS.md` — one decision entry in the standard format
  (Context / Options / Decision / Consequences / Reconsider when).
- `forge/.forge.md` — sets the `stack` field to a short slug.

## Defaults by project type

Start from these; deviate only when the BRIEF demands it, and say why.
This table is the **shipped fallback** — `memory/profile/preferences.md` is
the personal override: when it exists, its defaults win ties, and it is
expected to diverge from this table as the owner's own verdicts accumulate.

| Situation | Default |
|---|---|
| Windows-first offline desktop app | Tauri + React + TypeScript + SQLite; or .NET/Avalonia + SQLite when C#/native fits better |
| Simple public website | Next.js (deploy: Vercel) |
| Web app with auth/data | Next.js + Supabase |
| Discord bot | Node.js + discord.js, or Python |
| Automation / script | Python or Node — single file if possible |
| 2D game / prototype | Godot |
| Local AI app | Tauri/Python/Node + Ollama — only if AI clearly adds value |
| Data / CSV / import-export tool | Python or .NET; simple web UI only if a UI is truly needed |

## Workflow

1. Read the BRIEF's smallest useful version and first useful flow — the stack
   serves *that*, not the v-later list.
2. Check `memory/stack/` for verdicts on the candidate technologies. Quote
   relevant gotchas ("Tauri: surface global-hotkey registration failures").
3. Propose **one recommendation** with a one-paragraph why, plus at most one
   realistic alternative with the tradeoff in one line. Not a menu.
4. Apply the subtraction pass, stated explicitly: does this project *need*
   cloud? auth? sync? a database? AI? Default each to **no** unless the BRIEF
   requires it. Local files beat databases; no accounts beat auth.
5. On user confirmation: append the decision to `DECISIONS.md` (options
   considered included) and set `stack` in `.forge.md`.

## Output format

Recommendation + why → alternative + tradeoff → subtraction pass results →
after confirmation, the logged decision entry.

## Rules

- Boring and known beats new and exciting. The owner's listed defaults win
  ties.
- If the user names a stack, assess fit honestly and accept their call —
  logged with their reasoning.
- Every "Reconsider when" must be concrete ("more than 500 records", "needs
  multi-device"), never "later".
- Memory verdicts must be quoted from `memory/stack/` files, not invented.

## Failure modes

- **BRIEF missing or uncut** → stop; run `mvp-cutter` first — a stack picked
  for an unbounded scope is a guess.
- **No memory connected** → recommend from the defaults table; note that
  stack history was unavailable.
- **Genuinely novel need** (nothing in the table fits) → say so, reason from
  the project's constraints, and mark the decision as low-confidence in the
  log.

## What not to do

- Do not present three equal options and make the user choose — recommend.
- Do not add cloud, auth, sync, databases, or AI "for the future".
- Do not benchmark or research frameworks at length; this is a selection, not
  a survey.

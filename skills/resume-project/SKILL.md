---
name: resume-project
description: Reopen a paused or old Forge project — summarize current state, last next-step, blockers, and stale decisions, then recommend continue, park, or kill. Use when returning to any project after a break.
---

# resume-project

## Purpose

Make returning to a project cost five minutes instead of an evening of
archaeology — and force an honest continue/park/kill call instead of a
guilty restart.

## When to use

- Returning to a project after weeks or months away.
- Deciding what to do with a shelf of half-finished projects (run per
  project).

## Reads

- The whole `forge/` folder: `.forge.md` (status, scope, dates), BRIEF
  (especially definitions of done and dead), PLAN (progress), JOURNAL (tail —
  the last 2–3 entries), DECISIONS (Reconsider-when triggers), ERRORS
  (unresolved entries), RETRO if one exists.
- Relevant memory (via `forge_repo`): the profile and any lessons about
  resuming/parking patterns.

## Writes

- `forge/JOURNAL.md` — one entry: "resumed after {gap}; state: {summary};
  decision: {continue/park/kill}".
- `forge/.forge.md` — status update if the verdict changes it
  (`active`, `parked`, `killed`).

## Workflow

1. **Reconstruct state from files only** — no memory of old chat exists, and
   that's by design:
   - Where it stopped: PLAN status + last journal entry's **Next**.
   - What's blocking: last journal **Blocked** + unresolved ERRORS entries.
   - What went stale: decisions whose Reconsider-when has triggered;
     dependencies/tools that moved on during the pause (flag, don't assume).
2. **Check the definitions.** Is the definition of dead met? Is the resume
   condition (if parked) actually true? Say so plainly.
3. **Present the state summary:** progress (X/N tasks, phase), last known
   next step, blockers, stale decisions, time since last session.
4. **Recommend one of:**
   - **Continue** — with the specific next action (usually the last journal
     "Next", validated against the plan).
   - **Park properly** — with a concrete resume condition written down.
   - **Kill** — definition of dead is met or the project no longer earns
     time; recommend `retro` so the learning isn't lost.
5. On the human's call: append the journal entry, update `.forge.md`. If
   continuing → hand off to `build-loop`. If killing → hand off to `retro`.

## Output format

State summary (5–8 lines) → stale items list → recommendation with one-line
reasoning → after the human decides, the journal entry.

## Rules

- Trust files over recollection — if the human remembers it differently from
  the journal, surface the mismatch instead of silently picking one.
- The recommendation must reference the BRIEF's definitions, not enthusiasm.
  "It's 80% done" is not an argument; definition-of-done items are.
- Killing must be presented as a respectable option every time. This skill
  exists to end zombie projects, not to resurrect all of them.
- A resumed project with a plan older than the code (things were built off-
  plan) → recommend a `doctor` pass before building.

## Failure modes

- **No `forge/` folder** → this isn't a Forge project; offer `init-project`
  (it can be added mid-project — fill the BRIEF from what exists).
- **Journal is empty or ancient** → reconstruct what's possible from PLAN,
  git history if available, and the code; say clearly that state confidence
  is low.

## What not to do

- Do not start building in this skill — hand off to `build-loop`.
- Do not guilt-trip about the pause length; it's a data point, not a sin.
- Do not re-litigate old decisions wholesale — only the ones whose
  Reconsider-when actually triggered.

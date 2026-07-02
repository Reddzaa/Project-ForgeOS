---
name: build-loop
description: Run one build session against PLAN.md — pick the next unchecked task, implement it small, verify it, review it (bounded), log errors, update the plan and journal, and recommend a stop point. Use for all feature work on a Forge project.
---

# build-loop

## Purpose

Turn the plan into working software one verified task at a time, leaving the
project resumable after every session — never a half-built pile.

## When to use

- Any work session on a project with a `forge/PLAN.md`.
- After `resume-project` hands over a next action.

## Reads

- `forge/PLAN.md` (required), `forge/BRIEF.md` (scope guard),
  `forge/JOURNAL.md` (last entry — where things stand).
- Lessons with `recall: build` matching this stack (via `forge_repo`), max 3.

## Writes

- `forge/PLAN.md` — checkboxes and the Status line.
- `forge/JOURNAL.md` — one entry per session (append).
- `forge/ERRORS.md` — via the `error-capture` format, when errors qualify.

## Workflow (per task)

1. **Read state:** Status line, first unchecked task, last journal entry. If
   they disagree (checkbox says done, journal says broken), resolve that
   first — never build on an unclear state.
2. **Restate the task** in one line, including its verify step. If the task
   is ambiguous, ask one specific question instead of guessing.
3. **Implement the smallest change** that satisfies the task. Match existing
   project conventions. Touch only what the task needs.
4. **Verify:** run the task's verify step, run the app/tests as appropriate.
   A task whose verify fails is not done — fix or log the blocker.
5. **Review, bounded:** if the agent has a built-in code-review command, run
   it on the changes; otherwise do one structured self-review pass
   (correctness, error handling, edge cases, no scope creep, conventions).
   Fix what's real, re-check once. **Maximum two review cycles** — remaining
   nits go in the journal entry, not into an endless loop.
6. **Capture errors:** anything that cost real time or taught something goes
   to `ERRORS.md` in the `error-capture` format, while context is fresh.
7. **Update state:** mark the task `- [x]`, update the Status line. If this
   was the first task, set `.forge.md` status to `active`.
8. **Recommend continue or stop.** Stop points: after 2–3 tasks, at any phase
   boundary, or when energy/attention is clearly dropping. At a phase
   boundary, run the app end to end before continuing.

At session end (always, even mid-task): append a journal entry —
**Did / Blocked / Next** — so the next session starts cold-start-free.

## Output format

Per task: one-line restatement → what changed (files touched) → verify result
→ review findings fixed/deferred → continue-or-stop recommendation.

## Rules

- One task at a time, in order. Never skip ahead; never batch three tasks
  into one sweep.
- Never mark a failing task complete. Never start the next task with the app
  broken.
- Work no task covers → propose a new task for the plan; don't silently do it.
  If it conflicts with BRIEF's Out of scope, say so — the human decides.
- Honest reporting: if verification was partial, the journal says so.

## Failure modes

- **No PLAN.md** → stop; for a quick unplanned fix, still journal it and
  suggest adding a task retroactively.
- **All tasks checked** → suggest `retro`.
- **Blocked on the same task twice** → stop repeating; log the blocker in the
  journal, capture the error if it qualifies, and surface options to the
  human.

## What not to do

- Do not attempt to build the whole project in one heroic session.
- Do not refactor beyond the task's footprint because code "looks messy".
- Do not leave the session without updating PLAN status and JOURNAL — an
  unlogged session didn't happen, as far as the system knows.

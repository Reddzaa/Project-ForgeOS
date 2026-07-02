---
name: plan-project
description: Write a small checkbox plan into PLAN.md — Phase 0 working skeleton, Phase 1 first useful feature, Phase 2 polish only if needed. Every task has a verify step; packaging/deploy is proven in Phase 0. Use after brief and stack are set.
---

# plan-project

## Purpose

Produce a plan small enough to finish and concrete enough that a build agent
can execute it one task at a time without guessing.

## When to use

- After `mvp-cutter` and `stack-picker`, before the first `build-loop` session.
- When re-planning after a scope change (rewrite the unchecked part only).

## Reads

- `forge/BRIEF.md` (required — the smallest useful version defines Phase 1).
- `forge/DECISIONS.md` (the stack decision shapes the tasks).
- Lessons with `recall: plan` from memory (via `forge_repo`).

## Writes

- `forge/PLAN.md` — the full plan.
- `forge/JOURNAL.md` — one entry noting the plan was written.

## Workflow

1. Read BRIEF and the stack decision. The plan implements the **first useful
   flow** and definition of done — nothing from Out of scope.
2. Draft the three phases:
   - **Phase 0 — Working skeleton:** project scaffold runs; the core loop
     exists as a stub; **the packaging/deploy path is proven now** (installer
     builds, script runs on a clean machine, bot connects). This is
     deliberately early: shipping-path problems kill more solo projects than
     code problems.
   - **Phase 1 — First useful feature:** the smallest useful version works
     end to end.
   - **Phase 2 — Polish (only if needed):** fixes that block daily use.
     Nothing new. For many weekend projects this phase is empty — leave it
     out rather than inventing tasks.
3. Write tasks in the format
   `- [ ] T01 — what to do (verify: how you know it works)`.
   Sequential IDs across phases. Every task gets a verify.
4. Size check: **weekend scope = 6–12 tasks total.** More means the cut
   wasn't deep enough — go back to `mvp-cutter` findings and trim.
5. Set the Status line (`0/N tasks · Phase 0`), show the user, adjust once,
   write PLAN.md, append a journal entry.

## Output format

The complete PLAN.md content, preceded by a two-line summary (task count per
phase, expected number of sessions).

## Rules

- Tasks are ordered for strict sequential execution — no cross-references, no
  "do this in parallel".
- One task ≈ one focused session-chunk (15–60 min). Split bigger; merge
  trivial.
- Every phase ends with something that runs and is demoable.
- Verify steps must be observable actions ("run app, press hotkey, see
  picker"), not "works correctly".

## Failure modes

- **BRIEF missing/uncut or no stack decision** → stop and name the missing
  prerequisite skill.
- **Plan won't fit the scope's size budget** → present the overflow honestly:
  cut tasks or upgrade `scope` in `.forge.md`. Never hide size by making
  tasks huge.

## What not to do

- Do not write roadmaps with 5 phases and 60 tasks — that is a different,
  bigger system than a Forge weekend/mvp plan.
- Do not include tasks for out-of-scope features "while we're at it".
- Do not start building; hand off to `build-loop`.

---
name: mvp-cutter
description: Aggressively reduce a project to its smallest useful version. Produces the first useful flow, an explicit out-of-scope list, a definition of done, and a definition of dead — all written into BRIEF.md. Use after init, before planning.
---

# mvp-cutter

## Purpose

Make the project small enough to finish. Scope is cut on paper here so it
doesn't have to be cut in frustration later.

## When to use

- After `init-project`, before `plan-project`.
- Any time a project feels too big or a plan keeps growing.

## Reads

- `forge/BRIEF.md` (required — run `init-project` first if missing).
- Lessons with `recall: plan` from memory (via `forge_repo`).

## Writes

- `forge/BRIEF.md` — fills or rewrites: Smallest useful version, First useful
  flow, Out of scope, Definition of done, Definition of dead.
- `forge/JOURNAL.md` — one entry noting the cut was made.

## Workflow

1. Read the BRIEF. List every feature the idea implies — including the ones
   the user hasn't said out loud but is clearly imagining.
2. Sort the list into three buckets, shown to the user:
   - **v-now** — without this, the tool is not useful at all.
   - **v-later** — real, but the tool is useful without it. Goes to Out of scope.
   - **v-never** — scope creep in disguise. Goes to Out of scope, marked as such.
3. Define the **first useful flow**: the single start-to-finish path that
   proves the tool works (e.g. "hotkey → pick snippet → pasted").
4. Write the **definition of done** — 2–4 observable statements. "I used it
   for a real task" beats "all features complete".
5. Write the **definition of dead** — the condition under which this project
   gets killed or parked on purpose (default suggestion:
   "not working and in use within 3 weekends").
6. Get the user's yes/adjust on the buckets, then update BRIEF.md and append
   a journal entry.

## Output format

The three buckets as short lists → proposed flow, done, and dead definitions
→ after confirmation, the updated BRIEF sections.

## Rules

- v-now must be buildable within the project's scope level (`weekend` = a few
  sessions). If it isn't, cut again — or tell the user the scope level in
  `.forge.md` is wrong and let them choose.
- Every cut is *written down* in Out of scope. Cuts that vanish come back as
  scope creep; cuts on paper stay cut.
- Definition of dead is mandatory. Refusing to define it is refusing to admit
  the project can fail — push back once, then accept the user's version.
- One first useful flow, not three. If two flows feel essential, the smaller
  one wins.

## Failure modes

- **BRIEF missing** → stop; run `init-project` first.
- **User rejects every cut** → do one honest pass: "at this size, history
  says this ships as `mvp`/`product` scope, not `weekend`" — then update
  `.forge.md` scope to match reality rather than pretending.

## What not to do

- Do not add features while cutting — not even "quick wins".
- Do not write the plan; that's `plan-project`'s job.
- Do not produce a vision document. The BRIEF stays under one page.

---
name: retro
description: Run a short retrospective — agent drafts from the project files, human answers three questions, output goes to RETRO.md with a verdict (shipped, parked, killed, continue) and lesson candidates. Use at project end, kill, park, or a major milestone.
---

# retro

## Purpose

Close the loop. The retro is where a project — finished or not — pays its
tuition: honest verdict, decision outcomes, and lesson candidates for memory.
It is the one Forge ceremony that should never be skipped.

## When to use

- A project is finished, being killed, or being parked.
- A major milestone on a long-lived project (then verdict = `continue`).

## Reads

- The whole `forge/` folder: BRIEF (definitions of done/dead), PLAN
  (checked vs unchecked), JOURNAL (the story), DECISIONS, ERRORS.

## Writes

- `forge/RETRO.md` — the retrospective (template format).
- `forge/.forge.md` — status updated to the verdict
  (`shipped` / `parked` / `killed`, or unchanged for `continue`).
- `forge/JOURNAL.md` — one entry: "retro held, verdict X".

## Workflow

1. **Draft first, ask second.** From the files, pre-fill: what shipped, what
   didn't, decision outcomes (held / failed / too early, one line each,
   checked against reality), and lesson candidates drawn from ERRORS entries,
   failed/held decisions, and journal patterns.
2. **Ask the human exactly three questions:**
   - What are you most satisfied with?
   - What drained you or kept getting postponed?
   - Would you start this project again, knowing what you know?
3. **Propose the verdict** by checking BRIEF's definitions: done met →
   `shipped`; dead condition met → `killed` or `parked`; otherwise discuss.
   The human makes the final call.
4. If `parked`: require a concrete resume condition (event or date). Refuse
   to write `parked` without one — offer `killed` as the honest alternative.
5. Write RETRO.md, update `.forge.md`, append the journal entry. If the
   retro dropped any planned tasks, mark them in PLAN.md as unchecked with
   `(dropped — see RETRO.md)` — never delete them.
6. **Hand off:** recommend running `memory-consolidator` now, while the
   retro is fresh — that's where lesson candidates become global knowledge.

## Output format

The filled RETRO.md, shown before writing. Total human time target:
under 10 minutes.

## Rules

- Lesson candidates must be practical ("prove the packaging path in
  Phase 0"), not observations ("packaging is hard"). Draft them in
  "do X when Y" form.
- Every candidate cites its source (an E-NNN, a D-NNN outcome, or a journal
  pattern). No sourceless wisdom.
- A `killed` verdict is written without apology — state what was learned and
  what the kill saved.
- 3–6 lesson candidates maximum. Ten candidates means none were selected.

## Failure modes

- **Sparse files** (thin journal, empty errors) → run the retro anyway on
  what exists; note the gaps; one honest lesson candidate may be "journal
  more / capture errors during sessions".
- **Human unavailable for the three questions** → write a draft RETRO marked
  `**Draft — answers pending**`; do not set a verdict without the human.

## What not to do

- Do not grade the human or moralize about skipped sessions — frame patterns
  as process fixes, never character judgments.
- Do not promote lessons to global memory here — candidates only;
  `memory-consolidator` owns promotion.
- Do not write a long narrative. The template's sections, tersely filled.

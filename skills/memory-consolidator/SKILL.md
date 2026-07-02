---
name: memory-consolidator
description: Promote confirmed lessons from a finished retro into global Forge Memory, write the project's history entry, update stack notes and profile, merge duplicates, mark stale entries, and keep INDEX.md small. Use right after a retro.
---

# memory-consolidator

## Purpose

The only gate between raw project experience and global knowledge. Everything
useful crosses here — small, evidence-backed, and human-confirmed — and
everything else deliberately doesn't.

## When to use

- Right after `retro` (the normal case).
- Periodically (a few times a year) as a pure maintenance pass: merge, prune,
  re-check stale entries — even with no new project.

## Reads

- `forge/RETRO.md`, `forge/ERRORS.md`, `forge/DECISIONS.md`, `forge/.forge.md`
  of the project being consolidated.
- All of `memory/` in the Forge OS repo (via `forge_repo`).

## Writes

- `memory/projects/{project-name}.md` — the project's permanent history entry.
- `memory/lessons/` — new or updated lesson files.
- `memory/stack/` — verdict/gotcha updates for technologies used.
- `memory/profile/` — pattern updates, only with the human's confirmation.
- `memory/INDEX.md` — kept current and within budget.

## Workflow

1. **Write the project history entry** to `memory/projects/{name}.md`: what
   it was, stack, outcome, duration, key decisions with their facit, links to
   lessons it produced. This always happens — even for killed projects;
   *especially* for killed projects.
2. **Process each lesson candidate** from RETRO.md:
   - **Duplicate check:** an existing lesson covers it → merge (add this
     project as evidence, sharpen wording); don't create a twin.
   - **Evidence check:** must cite at least one concrete source
     (`[[projects/{name}]]`, an E-NNN, a D-NNN). No evidence → rejected.
   - **Practicality check:** "do X when Y" beats "X is tricky". Vague
     candidates get one rewrite attempt, then rejection.
   - Survivors are shown to the human: **promote to `active`, keep as
     `candidate`, or drop** — the human confirms every promotion. A
     `candidate` from one project becomes `active` automatically-suggested
     when a second project confirms it.
3. **Update stack notes:** for each technology used, add/adjust the verdict
   line and any new gotchas in `memory/stack/{tech}.md`, dated.
4. **Suggest profile updates** when a cross-project pattern shows in
   `memory/projects/` (e.g. three bots parked at hosting). Frame as guidance
   ("prove hosting in Phase 0 for bots"), never as judgment. Human confirms.
5. **Prune while here:** lessons past their `review-by` date → re-confirm or
   mark `deprecated`; merge near-duplicates; deprecated entries leave
   INDEX.md but their files stay (history is kept, attention is not).
6. **Update INDEX.md:** one line per active entry. **Budget: one page
   (~40 lines).** Over budget → merge or deprecate before adding; never
   grow past it.

## Output format

A short consolidation report: history entry written; candidates
promoted / kept / dropped (with one-line reasons); stack and profile updates;
prune actions; INDEX line count.

## Rules

- Not every lesson becomes global knowledge. Rejecting candidates is the job
  working, not failing.
- Every lesson file follows the format in `memory/lessons/README.md`
  (frontmatter: type, status, tags, recall, evidence, added, review-by).
- Wikilinks (`[[projects/{name}]]`) connect lessons to evidence — keep them
  valid.
- The human confirms: all promotions to `active`, and all profile changes.
  Agents suggest; humans decide what the system believes.

## Failure modes

- **No RETRO.md** → run `retro` first; consolidation without a retro invites
  unfiltered noise.
- **Memory not reachable** (`forge_repo` wrong) → stop; fix the path. Never
  create a second, local memory.
- **INDEX over budget and nothing prunable** → present the least valuable
  entries and force a human choice. The budget is not negotiable; its
  contents are.

## What not to do

- Do not promote anything without evidence and human confirmation.
- Do not rewrite lesson history — deprecated lessons keep their files.
- Do not copy raw ERRORS/JOURNAL content into memory; memory stores
  conclusions, projects store history.

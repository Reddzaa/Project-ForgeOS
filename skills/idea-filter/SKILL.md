---
name: idea-filter
description: Pressure-test whether a project idea is worth starting. Checks personal usefulness, buildability, dependency risk, maintenance burden, and scope-creep risk against past project history. Can and should recommend "don't build yet". Use before committing to build.
---

# idea-filter

## Purpose

Stop bad projects before they cost a weekend. The filter's job is honest
triage, not encouragement — "do not build yet" is a successful outcome.

## When to use

- Before starting a new project — canonically *before* `init-project`
  (running it right after init works too).
- When choosing between several ideas.

## Reads

- The idea (from the user, or `forge/BRIEF.md` if it exists).
- `memory/projects/` — how similar past projects actually ended.
- `memory/profile/` and lessons with `recall: idea` (via `forge_repo`).

## Writes

- If `forge/` exists: a JOURNAL.md entry summarizing the verdict.
- Nothing else. The verdict is advice; the human decides.

## Workflow

1. Restate the idea in one sentence. If you can't, that is finding #1.
2. Score the five checks, one short line each, with a 🟢/🟡/🔴 rating:
   - **Personal usefulness** — will the owner actually use it, starting when?
   - **Buildability** — realistic in the stated scope with available time?
   - **Dependency risk** — does it need APIs, cloud, accounts, or auth? Each
     external dependency is friction now and breakage later.
   - **Maintenance risk** — what does this cost per month *after* it works?
   - **Scope-creep risk** — does the idea have a natural stopping point?
3. Check history: scan `memory/projects/` for similar projects and quote what
   happened ("2 of 3 Discord bots parked at hosting"). No matches → say so.
4. Give a verdict, one of:
   - **Build now** — name the one risk to watch.
   - **Build smaller** — name the cut that makes it viable.
   - **Not yet** — name the missing precondition and the cheapest way to test it.
   - **Don't build** — name the check it fails fatally.
5. If `forge/` exists, append a journal entry: verdict + one-line reasons.

## Output format

Idea restatement → five-line scorecard → history note → verdict block
(2–3 sentences). Fits on one screen.

## Rules

- Verdicts must cite the scorecard, not vibes.
- History claims must come from `memory/projects/` entries — never invent a
  track record. No memory available → skip the history step and say so.
- A 🔴 on personal usefulness is near-fatal for solo tools: nobody maintains
  what they don't use.
- Respect the human's override, once given — log it and move on.

## Failure modes

- **No memory connected** → run the five checks only; note that history was
  unavailable.
- **Idea is actually three ideas** → say so, ask which one to filter, or
  filter the smallest.

## What not to do

- Do not flatter. Do not soften a "don't build" with "but it could work!".
- Do not expand into market analysis, personas, or business models — this is
  a solo builder's triage, not a pitch review.
- Do not block: if the user says "build anyway", the filter's job is done.

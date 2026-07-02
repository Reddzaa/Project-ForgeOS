---
name: decision-logger
description: Append a significant decision to DECISIONS.md with context, options, consequences, and a concrete reconsider-when trigger. Use whenever a choice about stack, architecture, data, scope, or distribution gets made — in any conversation.
---

# decision-logger

## Purpose

Make every important "why" findable in two years — including whether the
decision turned out to be right.

## When to use

- The moment a significant decision is made in conversation: stack,
  architecture, data model/storage, scope changes, distribution/packaging,
  removing or adding a dependency.
- When reversing an earlier decision (logged as a new, superseding entry).

## Reads

- `forge/DECISIONS.md` (for the next `D-NNN` id and to spot related entries).
- The conversation context where the decision happened.

## Writes

- `forge/DECISIONS.md` — append one entry. Never edits past entries.

## Workflow

1. Confirm this is decision-worthy (see When to use). Small choices —
   variable names, minor library picks with no lock-in — are not logged.
2. Draft the entry in the standard format:

   ```markdown
   ## D-NNN — {short title} ({YYYY-MM-DD})
   **Context:** {what situation forced a choice}
   **Options:** {realistic alternatives, one line each — include "do nothing"}
   **Decision:** {what was chosen}
   **Consequences:** {what this commits to / rules out}
   **Reconsider when:** {concrete trigger}
   ```

3. The **Reconsider when** line is mandatory and must be concrete — a
   measurable condition or event, never "if needed" or "never".
4. If this reverses an earlier entry, add `Supersedes: D-00X` under the title
   and note the outcome of the old decision in one line.
5. Show the entry, adjust once if asked, append it.

## Output format

The complete entry as it will appear in the file.

## Rules

- Append-only. History is never rewritten — a wrong decision plus its
  reversal is more valuable than a cleaned-up log.
- Capture the *rejected* options honestly; they're half the value.
- One decision per entry. A bundled decision ("we'll use X and also
  restructure Y") is two entries.
- Keep entries under ~12 lines. This is a log, not an essay.

## Failure modes

- **No DECISIONS.md** → the project isn't Forge-initialized; offer to run
  `init-project`, or create just this file from the template for an
  already-running project.
- **Decision is still being debated** → don't log a debate. Say what's
  missing for it to become a decision, and wait.

## What not to do

- Do not log every choice — a log nobody reads because it's full of noise
  protects nothing.
- Do not editorialize past decisions when superseding them; state outcomes
  neutrally.
- Do not decide. The human decides; this skill records.

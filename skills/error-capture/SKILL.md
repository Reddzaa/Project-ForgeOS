---
name: error-capture
description: Record a real error in ERRORS.md — symptom, context, root cause, fix, prevention, cost, tags. Use when an error cost noticeable time or taught something, ideally right after fixing it while context is fresh.
---

# error-capture

## Purpose

Turn expensive debugging into cheap prevention. Today's captured error is
next project's surfaced lesson.

## When to use

- Right after fixing an error that cost roughly 30+ minutes or revealed
  something non-obvious (a silent failure, a platform quirk, a wrong
  assumption).
- During `build-loop` step 6, or any time — also outside build sessions.

## Reads

- `forge/ERRORS.md` (for the next `E-NNN` id).
- The debugging context: what happened, what was tried, what worked.

## Writes

- `forge/ERRORS.md` — append one entry. Never edits past entries.

## Workflow

1. Check the bar: did it cost real time, or teach something? Typos and
   instantly-fixed mistakes don't get logged.
2. Draft the entry:

   ```markdown
   ## E-NNN — {symptom in one line} ({YYYY-MM-DD})
   **Symptom:** {what was observed}
   **Context:** {stack, versions, what was being attempted}
   **Root cause:** {the actual cause}
   **Fix:** {what resolved it}
   **Prevention:** {how to avoid or catch it earlier next time}
   **Cost:** {rough estimate, e.g. "~2h"}
   **Tags:** {e.g. tauri, windows, build}
   ```

3. Root cause must be the *actual* cause. If it was never truly found
   ("restarting fixed it"), write `Root cause: not established` — an honest
   unknown beats a plausible story.
4. Prevention must be actionable ("check the Result of hotkey registration"),
   not aspirational ("be more careful").
5. Tags use lowercase, comma-separated, reusing existing tags where possible —
   they're how `memory-consolidator` finds patterns across projects.
6. Append the entry; mention it in the session's journal entry.

## Output format

The complete entry as it will appear in the file.

## Rules

- Append-only; newest last.
- Capture while fresh — a week later the root cause is folklore.
- One error per entry; a cascade of failures gets its own entries only if
  the causes differ.
- Cost is a rough estimate and explicitly allowed to be approximate.

## Failure modes

- **No ERRORS.md** → offer to create it from the template.
- **Root cause unknown** → log it as unknown with the failed hypotheses;
  update the entry's Fix/Root cause later *by appending a dated correction
  line*, not by rewriting.

## What not to do

- Do not log routine errors that any compiler message explains.
- Do not blame tools or the agent in the entry — describe mechanics, not
  fault.
- Do not generalize into lessons here; that's `retro` and
  `memory-consolidator` territory.

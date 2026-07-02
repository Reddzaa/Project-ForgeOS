# Lessons

One lesson per file. A lesson is a *reusable claim* — practical ("do X when
Y"), scoped (when it applies), and evidence-backed (which projects proved it).

## File format

```markdown
---
type: error | success | architecture | process | ai
status: candidate | active | deprecated
tags: [lowercase, comma, separated]
recall: [idea | stack | plan | build | retro]   # when skills should surface it
evidence: ["[[projects/project-name]]"]          # at least one, always
added: YYYY-MM-DD
review-by: YYYY-MM                               # when to re-confirm or deprecate
---

One short paragraph: the claim, when it applies, what to do, and what it
cost when it went wrong. Link related lessons with [[wikilinks]].
```

## Lifecycle

- **candidate** — proposed by a retro, unconfirmed. Not surfaced by recall.
- **active** — confirmed by the human (or by a second project). Surfaced at
  its recall points, listed in INDEX.md.
- **deprecated** — stale, disproven, or superseded. Leaves INDEX.md; the file
  stays as history.

## Rules

- Evidence is mandatory. A lesson nobody can trace is an opinion.
- Practical beats profound. "Check the hotkey registration result" outlives
  "handle errors carefully".
- Merge duplicates instead of creating twins — add evidence to the existing
  file.
- Filenames are kebab-case claims, e.g. `prove-packaging-in-phase-zero.md`.

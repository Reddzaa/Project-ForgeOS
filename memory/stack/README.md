# Stack notes

One file per technology, named in kebab-case (`tauri.md`, `dotnet-avalonia.md`,
`supabase.md`). These are *your* verdicts from real use — the stack-picker
skill quotes them when recommending.

## File format

```markdown
# {Technology}

**Verdict ({YYYY-MM}):** one or two sentences — when it's the right pick,
when it isn't. Dated, because verdicts age.

## Gotchas

- {Concrete trap and how to handle it. Link the error/lesson it came from.}

## Recipes

- {Setup step or config that took time to figure out and will be needed again.}
```

## Rules

- Verdicts are dated and get re-checked when quoted — a two-year-old verdict
  is a hypothesis, not a fact.
- Gotchas link to their evidence (`[[projects/...]]` or lesson files) where
  possible.
- Keep files short; this is a crib sheet, not documentation.

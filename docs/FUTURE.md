# Future ideas

The parking lot. Everything here is deliberately **not** in v0.1 — either
unproven, not yet needed, or waiting for real usage data. Nothing in this
file is a promise.

## Likely next (when usage proves the need)

- **Validation script** — a single dependency-free Python script that checks
  what the doctor skill checks mechanically: frontmatter parses, wikilinks
  resolve, INDEX budget holds, ids are sequential. LLM-as-validator is the
  known weak spot of Markdown systems; this closes it. Stays optional —
  Forge must keep working with zero runtimes installed.
- **Golden examples as regression tests** — 2–3 synthetic mini-projects that
  skill changes are run against before release, so a skill edit that breaks
  a template contract gets caught.
- **Per-agent adapter notes** — one small file per agent mapping "run a code
  review", "run tests" to that agent's concrete commands, so skills can stop
  saying "if your agent has a review command". Only worth it when a third
  agent is in regular use.

## Worth considering later

- **Update diffing in `install.ps1`** — the v0.2 installer wires up skills
  and `FORGE_OS_HOME` on first run; it doesn't yet diff template changes on
  update (that's still `git merge upstream/main`, per docs/INSTALL.md).
  Worth adding once template changes across versions are common enough to
  make a manual diff painful.
- **Scope tiers beyond weekend/mvp/product** — maintenance cadence and
  periodic-retro scheduling for long-lived (`product`) projects.
- **Lesson conflict handling** — when two active lessons disagree, the
  consolidator should force a scoped merge ("X when A, Y when B"). Hasn't
  happened yet with a small memory; will with a big one.
- **Multi-machine memory** — the memory lives in this git repo, so syncing
  is a `git pull`; conflicts in INDEX.md between machines may eventually
  need a convention.
- **Recall automation** — today, skills read INDEX.md and pick relevant
  entries by tags. If memory outgrows its one-page budget philosophy, a
  smarter recall mechanism would be needed — but the budget existing is what
  keeps this unnecessary. Prefer keeping the budget.

## Explicitly rejected (so they stay rejected)

- **Web app / dashboard / server / database** — Forge is files; the moment
  it needs infrastructure it loses the 10-year survivability that justifies
  it.
- **Automatic learning** — agents promoting their own lessons without human
  confirmation. This converts the memory from "what I believe" into "what a
  model guessed", and poisons trust in every recall.
- **Product-management layer** (personas, PRDs, brand strategy) — different
  tool for a different job. Forge plans builds, not businesses.
- **Skill marketplace / plugin system** — twelve maintained skills beat
  fifty drifting ones. New skills must displace or justify themselves
  against the granularity rule: one skill = one job.

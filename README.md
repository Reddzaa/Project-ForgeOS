# Project Forge OS

![Version](https://img.shields.io/badge/version-0.2.0-blue) ![License: MIT](https://img.shields.io/badge/license-MIT-green)

**A Markdown-first skill system that gives AI coding agents engineering discipline — and gives you a memory that survives every project.**

Project Forge OS is a collection of AI development skills — plain Markdown instructions plus a handful of file templates — that help Claude Code (and other coding agents) build projects in a structured, repeatable, and maintainable way. It turns an agent from something that autocompletes your next file into something that plans realistically, builds in small verified steps, records why it made the choices it made, and helps you carry what you learned into the next project.

There is no server, no database, no cloud service, and no subscription. Everything Forge OS needs is a folder of Markdown files and an agent that can read and write them.

It emphasizes:

- **Realistic planning** — scope cut to what a solo developer can actually finish
- **Engineering discipline** — one task at a time, verified before the next one starts
- **Project memory** — decisions, errors, and lessons that outlive a single chat session
- **Reusable workflows** — the same twelve skills work on your first project and your fiftieth
- **Documentation-driven development** — the plan, the decisions, and the history are files, not folklore
- **Avoiding endless scope creep** — every project defines what "done" and "dead" look like before it starts

## Contents

- [Why Project Forge OS?](#why-project-forge-os)
- [Core Principles](#core-principles)
- [Features](#features)
- [Skills Overview](#skills-overview)
- [Installation](#installation)
- [After Installation](#after-installation)
- [Quick Example](#quick-example)
- [Repository Structure](#repository-structure)
- [Forge Memory](#forge-memory)
- [Obsidian (Optional)](#obsidian-optional)
- [FAQ](#faq)
- [Contributing](#contributing)
- [Roadmap](#roadmap)
- [Versioning](#versioning)
- [License](#license)

## Why Project Forge OS?

Solo development with AI coding agents fails in the same handful of ways, over and over:

- **The agent loses context.** Chat history doesn't survive a restart, a new session, or a week away from the project — so the reasoning behind a decision evaporates with it.
- **Planning is inconsistent.** One project gets a careful plan, the next gets "just start coding," and there's no way to tell in advance which one is about to sprawl.
- **Decisions get forgotten.** Why SQLite instead of Postgres? Why no auth in v1? Six weeks later, nobody — human or agent — remembers, and the same debate happens again.
- **Mistakes repeat.** The same silent registration failure, the same deploy-day surprise, the same underestimated task costs the same hours in project after project, because nothing captured it the first time.
- **Scope creeps until the project stalls.** Without an explicit smallest useful version, "just one more feature" is always the next thing said — until the project is too big to finish.
- **Side projects get abandoned quietly.** No definition of "dead," no resume plan — so paused projects don't get finished or killed, they just disappear.

Project Forge OS exists to close each of those gaps with the smallest possible mechanism: a shared set of files per project, a small set of skills that read and write them, and a curated global memory that carries lessons from one project into the next. Humans still make every call — what to build, what to cut, what to promote into memory. The agent's job is discipline, not authority.

## Core Principles

1. **Plan before building.** A brief and a small plan come before code — even for a weekend project.
2. **Build the smallest useful version.** Every project defines a first useful flow, a definition of done, and a definition of dead before work starts.
3. **Record important decisions.** Stack, architecture, and scope choices are logged with their reasoning and a concrete trigger to reconsider them.
4. **Learn from previous projects.** Errors and retrospectives feed a global memory that later projects draw on.
5. **Keep architecture modular.** Twelve small skills, each with one job, rather than one skill that does everything.
6. **Improve through real usage.** Memory only grows from evidence — what actually happened in a real project — never from speculation.
7. **Prefer simplicity over complexity.** No server, no database, no cloud dependency, no framework to install. Markdown and git are enough.

The full list, with the reasoning behind each one, lives in [docs/PRINCIPLES.md](docs/PRINCIPLES.md).

## Features

- **Idea filtering** — pressure-test a project idea before committing a weekend to it; can recommend not building it yet
- **MVP cutting** — aggressively reduce scope to the smallest version worth building
- **Stack recommendations** — a boring-by-default stack pick, logged with reasoning
- **Build planning** — a small, checkbox-based plan: skeleton → first useful feature → polish
- **Build loop** — one task at a time, implemented, verified, and reviewed before the next
- **Decision logging** — a permanent, append-only record of why a choice was made
- **Error capture** — real errors turned into root cause, fix, and prevention
- **Resume projects** — pick a paused project back up with a state summary, not a guess
- **Project Doctor** — a health check for a project or for this repo itself
- **Forge Memory** — a curated, evidence-based knowledge base that spans every project
- **Memory consolidation** — lessons are promoted deliberately, never accumulated automatically

## Skills Overview

Every skill is a `SKILL.md` file — a complete, self-contained instruction set. None of them require each other to work; they're designed to chain, not to depend.

| Skill | Purpose | When to use it |
|---|---|---|
| [idea-filter](skills/idea-filter/SKILL.md) | Pressure-tests whether an idea is worth building: usefulness, buildability, dependency risk, maintenance burden, scope-creep risk | Before committing to build — can recommend "don't build yet" |
| [init-project](skills/init-project/SKILL.md) | Sets up the `forge/` folder from templates and surfaces relevant memory before work starts | Starting a new project, or adding Forge to an existing one |
| [mvp-cutter](skills/mvp-cutter/SKILL.md) | Cuts scope to the smallest useful version, with a first useful flow, a definition of done, and a definition of dead | After init, before planning |
| [stack-picker](skills/stack-picker/SKILL.md) | Recommends a practical, boring-by-default stack and logs the reasoning | After the brief is cut, before planning |
| [plan-project](skills/plan-project/SKILL.md) | Writes a small checkbox plan: working skeleton → first useful feature → polish (only if needed) | After the brief and stack are set |
| [build-loop](skills/build-loop/SKILL.md) | Builds one task at a time: implement, verify, bounded review, journal, recommend a stop point | Every build session |
| [decision-logger](skills/decision-logger/SKILL.md) | Logs a significant decision with context, options, consequences, and a reconsider-when trigger | Any time a real decision about stack, architecture, or scope gets made |
| [error-capture](skills/error-capture/SKILL.md) | Records a real error: symptom, root cause, fix, prevention, cost | Right after fixing something that cost real time |
| [retro](skills/retro/SKILL.md) | Runs a short retrospective and reaches a verdict — shipped, parked, killed, or continue | At project end, at a kill or park decision, or a major milestone |
| [memory-consolidator](skills/memory-consolidator/SKILL.md) | Promotes confirmed lessons into global Forge Memory; merges duplicates, marks stale entries | Right after a retro |
| [doctor](skills/doctor/SKILL.md) | Health-checks a project or this repo: missing files, broken references, stale plans, memory bloat | Something feels inconsistent, or before resuming old work |
| [resume-project](skills/resume-project/SKILL.md) | Reopens a paused project: state summary, last next step, blockers, continue/park/kill recommendation | Returning to any project after a break |

## Installation

Forge OS installs as one connected system: skills go into your agent, and this repo's `templates/` and `memory/` get registered so every project can find them automatically. No servers, no manual path-editing.

### Windows (recommended)

```bash
# 1. Fork this repo, then clone your fork somewhere permanent
git clone https://github.com/<you>/Project-ForgeOS C:\dev\project-forge-os
cd C:\dev\project-forge-os

# 2. Run the installer
.\install.ps1
```

`install.ps1` installs all 12 skills for Claude Code (via the `skills` CLI if Node is available, or by copying the skill folders directly if it isn't) and sets a `FORGE_OS_HOME` environment variable pointing at this clone — that's what lets `init-project` find `templates/` and `memory/` in every project, with nothing to configure by hand. It's safe to re-run any time.

Prefer npm to PowerShell directly? `npm run install-forge` runs the exact same script.

Forking rather than cloning the original directly means you can pull upstream updates later without ever conflicting with your own accumulated memory — see [docs/INSTALL.md](docs/INSTALL.md) for the update flow, installer parameters (`-Scope Project`, `-Agent`, `-Force`), and what to do if something goes wrong.

### Other agents, other platforms

The installer is Windows-first, but Forge OS itself isn't. See [docs/INSTALL.md](docs/INSTALL.md) for the manual, OS-agnostic path: installing skills with the `skills` CLI directly (any of its 40+ supported agents), wiring up Codex-style agents via `AGENTS.md`, and connecting memory by hand.

## After Installation

Restart Claude Code (or reload the window) so it picks up the newly installed skills. Then run `/doctor` once — a clean report confirms both halves of the install worked: the skills are in place, and `FORGE_OS_HOME` resolves to a real Forge OS repo with `templates/` and `memory/` in it.

Each skill is then available two ways: Claude invokes it automatically when your request matches what it does, or you invoke it directly with a slash command:

```
/idea-filter
/init-project
/mvp-cutter
/stack-picker
/plan-project
/build-loop
/decision-logger
/error-capture
/retro
/memory-consolidator
/doctor
/resume-project
```

## Quick Example

> **You:** "I want to build a Discord bot for my WoW guild."

1. **`/idea-filter`** scores it: personal usefulness 🟢 (you're in the guild), buildability 🟢, dependency risk 🟡 (bot token, always-on hosting), scope-creep risk 🟡 — "loot council + raid planner + attendance + progression tracking" is really four projects. Verdict: **build smaller**, not "don't build."
2. **`/init-project`** creates `forge/`, asks name, type, and scope (defaults to `weekend`), and surfaces any relevant memory — e.g. a past lesson about hosting cost killing a bot project before.
3. **`/mvp-cutter`** cuts it to one flow: `/raid-signup` posts a message, members react, the bot tracks who's in. Loot council and attendance history go to Out of scope. Definition of dead: "not in use by the guild within 3 raid weeks."
4. **`/stack-picker`** recommends Node.js + discord.js — the Discord-bot default — checks whether a database is actually needed yet (usually not, for one guild), and logs the decision with its reasoning.
5. **`/plan-project`** writes a 6–10 task plan. Phase 0 gets the bot online, responding to a ping, and *proves the hosting path* — before any feature is built.
6. **`/build-loop`** builds one task at a time against a real Discord server: implement, verify, bounded review, journal — until the plan is done.

## Repository Structure

```
project-forge-os/
├── skills/            # 12 skills — one folder per skill, each a self-contained SKILL.md
├── templates/project/  # the forge/ folder every project gets (BRIEF, PLAN, JOURNAL, ...)
├── memory/             # global Forge Memory: lessons, stack notes, profile, project history
├── examples/           # a complete worked example project (weekend-mvp)
├── docs/               # install guide, first-project walkthrough, principles, future ideas
├── install.ps1         # Windows installer: skills + FORGE_OS_HOME in one run
├── package.json        # optional npm wrapper (`npm run install-forge`) around install.ps1
├── VERSION
└── CHANGELOG.md
```

- **`skills/`** — the instruction set your agent follows. Nothing in here is project-specific.
- **`templates/project/`** — the seven files copied into a new project's `forge/` folder by `init-project`.
- **`memory/`** — the curated, cross-project knowledge base described below.
- **`examples/`** — a real project (a Windows clipboard-snippet launcher) shown at every stage: brief, plan, journal, one captured error, and a retro.
- **`docs/`** — everything about using and understanding the system that isn't a skill or a template.
- **`install.ps1` / `package.json`** — the installer described above. Neither is required reading to use Forge OS day to day; they exist purely to wire everything else up once.

## Forge Memory

Every project gets its own `forge/` folder — a brief, a plan, an append-only journal, an append-only decision log, an append-only error log, and a retrospective. That's project history: cheap, local, and free to grow.

Forge Memory, in this repo's `memory/` folder, is different on purpose — it's small, curated, and global:

- **`memory/lessons/`** — one reusable claim per file: a practical "do X when Y," scoped to when it applies, backed by evidence from at least one real project, with a lifecycle (`candidate` → `active` → `deprecated`).
- **`memory/stack/`** — dated verdicts and gotchas per technology, quoted back to you by `stack-picker` when it recommends a stack.
- **`memory/profile/`** — your own stack defaults and confirmed working patterns, framed as guidance, never as judgment.
- **`memory/projects/`** — a permanent history entry for every finished project, shipped or killed, with its key decisions and the lessons it produced.
- **`memory/INDEX.md`** — the only file loaded by default: one line per active entry, capped at roughly a page.

Knowledge accumulates in one direction only: a retro drafts lesson candidates from what actually happened, and `memory-consolidator` promotes the ones with real evidence — merging duplicates, marking stale entries, and keeping `INDEX.md` small. Nothing gets promoted without you confirming it. The system doesn't learn on its own; it remembers what you tell it was true, at the moment it's most useful to recall.

## Obsidian (Optional)

Project Forge OS does **not** require [Obsidian](https://obsidian.md). Every file in `memory/` is plain Markdown, and every skill works with nothing more than a text editor and git.

If you do open the `memory/` folder as an Obsidian vault, you get, for free:

- **Wikilinks** between lessons, stack notes, and the projects that proved them
- **Backlinks** — see every lesson a project produced, from the project's own page
- **Graph view** — a visual map of how your projects and lessons connect
- **Better navigation** through years of accumulated project history

Obsidian is a lens on the data, not a dependency of it.

## FAQ

**Do I need Obsidian?**
No. It's a nice way to browse `memory/`, never a requirement.

**Can I use this without Git?**
Mostly. The files are plain Markdown you can read and edit with anything. Git is recommended, though, since it versions your decisions and memory, and it's how you pull updates into your fork.

**Does it require cloud services?**
No. No server, no database, no auth, no subscription, no external API. Files only.

**Can I use it with existing projects?**
Yes. Run `init-project` inside a project that already has code — it adds a `forge/` folder alongside what's there without touching anything else.

**Can I create my own skills?**
Yes. A skill is a folder with a `SKILL.md` following the same frontmatter format used here (`name`, `description`) — it follows the open [Agent Skills](https://agentskills.io) standard, so nothing about it is specific to this repo or to one agent.

**What is `FORGE_OS_HOME`?**
A per-user environment variable, set once by `install.ps1`, that points at your local clone of this repo. It's how `init-project`, `doctor`, and the memory skills find `templates/` and `memory/` without you typing a path into every project. You can also set it by hand — see [docs/INSTALL.md](docs/INSTALL.md).

**I moved or re-cloned the repo — now what?**
Re-run `install.ps1` (or `npm run install-forge`) from the new location; it updates `FORGE_OS_HOME` to match. Existing projects keep their own `forge_repo` value until you re-run `init-project` or fix it by hand — `doctor` will flag the mismatch either way.

## Contributing

Issues and pull requests are welcome — bug reports, documentation fixes, and clarifications on existing skills are especially useful, since this system is only as good as the discipline it actually enforces in practice.

- **Found a bug or inconsistency?** Open an issue describing what you expected and what happened — the `doctor` skill's checklist (missing files, broken references, contradictory instructions) is a good frame for the report.
- **Have a new skill idea?** Open an issue first. Per the granularity principle in [docs/PRINCIPLES.md](docs/PRINCIPLES.md), a new skill needs a clear, single job and a reason nothing existing already covers it — that discussion is worth having before a PR.
- **Docs improvements** are always welcome as direct pull requests.

## Roadmap

**Current — v0.2**
Everything from v0.1 (the 12 skills, project templates, Forge Memory, a complete worked example), plus a one-command Windows installer (`install.ps1`) that installs skills and connects Forge Memory and templates via `FORGE_OS_HOME` — with `doctor` able to detect a disconnected or misconfigured install.

**Future direction — v0.3 and beyond**
No new features are committed yet. The direction is improving what already exists based on real usage: an update flow that diffs template changes instead of a manual `git merge`, more reliable consistency checks between skills and templates, sharper documentation where the walkthrough turns out to be unclear, and additional skills only where repeated real-world use shows a genuine gap. The full, honest parking lot — including ideas explicitly rejected for now — lives in [docs/FUTURE.md](docs/FUTURE.md).

## Versioning

The release version lives in [VERSION](VERSION), and each project stamps
the version it was created with in `forge/.forge.md`. Changes are recorded
in [CHANGELOG.md](CHANGELOG.md). Within 0.x, template and skill changes stay
backward-compatible: a newer version of Forge OS must always be able to read
and continue an older project's `forge/` folder without migration.

## License

MIT — see [LICENSE.txt](LICENSE.txt).

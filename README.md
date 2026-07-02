# Project Forge OS

**A Markdown-first operating system for AI-assisted solo development.**

Forge OS is a set of reusable agent skills, project templates, and a curated
memory that help you choose projects worth building, keep them small, build
them one task at a time, and carry what you learned into the next project.

It is inspired by the philosophy behind BuilderOS, but it has its own
architecture and opinions. The goal is not to finish one project — it is to
get a little better with every project you finish, park, or kill.

## The problem

Solo development with AI coding agents fails in predictable ways:

- Projects balloon past their useful scope before anything ships.
- Stacks get chosen for novelty, then abandoned at deploy time.
- Decisions are made in chat and forgotten by the next session.
- The same errors cost the same hours in project after project.
- Paused projects die because nobody remembers where they stopped.
- Every new project starts from zero, as if the last ten never happened.

Forge OS attacks all six with plain Markdown files and a small set of
disciplined skills.

## How it works

Every project gets a `forge/` folder — seven small files that are the
project's shared state. Skills read and write those files. A global
`memory/` folder (in this repo) holds what survives across projects.

```
  idea-filter ──► init-project ──► mvp-cutter ──► stack-picker ──► plan-project
       ▲                                                                │
       │                                                                ▼
   memory/  ◄── memory-consolidator ◄── retro ◄── build-loop (one task at a time)
   (lessons, stack notes, profile, project history)      │
       │                                        decision-logger · error-capture
       └────── surfaced back at the right moment ──────────────────────┘
```

Three rules hold the system together:

1. **Documents are the shared state.** Anything worth keeping goes in a file.
   Chat history is disposable; `forge/` is not.
2. **Humans decide, AI suggests.** Skills recommend, log, and draft. You make
   the calls — especially what gets promoted into global memory.
3. **Memory is curated, not accumulated.** Raw history is cheap and stays in
   each project. Global lessons are few, evidence-backed, and pruned.

### Obsidian (optional)

Forge Memory is designed to double as an [Obsidian](https://obsidian.md)
vault: open the `memory/` folder as a vault and wikilinks, backlinks, tags,
and graph view work out of the box — lessons link to the projects that
proved them. Nothing *requires* Obsidian: the files are plain Markdown, and
every skill works without it.

## What v0.1 includes

| Skill | What it does |
|---|---|
| [init-project](skills/init-project/SKILL.md) | Sets up a `forge/` folder from templates, minimal questions |
| [idea-filter](skills/idea-filter/SKILL.md) | Decides if a project is worth starting — can say "don't build yet" |
| [mvp-cutter](skills/mvp-cutter/SKILL.md) | Aggressively reduces scope; defines done *and* dead |
| [stack-picker](skills/stack-picker/SKILL.md) | Recommends a practical stack; logs the reasoning |
| [plan-project](skills/plan-project/SKILL.md) | Writes a small checkbox plan: skeleton → first useful feature → polish |
| [build-loop](skills/build-loop/SKILL.md) | Builds one task at a time; verifies, reviews, journals, stops |
| [decision-logger](skills/decision-logger/SKILL.md) | Appends significant decisions to `DECISIONS.md` |
| [error-capture](skills/error-capture/SKILL.md) | Records real errors with root cause and prevention |
| [retro](skills/retro/SKILL.md) | Short retrospective; verdict: ship, park, kill, or continue |
| [memory-consolidator](skills/memory-consolidator/SKILL.md) | Promotes confirmed lessons into global memory; prunes |
| [doctor](skills/doctor/SKILL.md) | Health-checks a project or this repo; reports, suggests fixes |
| [resume-project](skills/resume-project/SKILL.md) | Reopens a paused project with a state summary and next action |

Plus: project templates ([templates/project/](templates/project/)), the global
memory ([memory/](memory/)), a complete worked example
([examples/weekend-mvp/](examples/weekend-mvp/)), and docs ([docs/](docs/)).

## Quick start

1. **Fork this repo, then clone your fork** somewhere permanent
   (e.g. `C:\dev\project-forge-os`) — your Forge Memory will live inside it,
   so the fork is what makes updates mergeable. Details in
   [docs/INSTALL.md](docs/INSTALL.md).
2. Make the skills available to your agent — see [docs/INSTALL.md](docs/INSTALL.md).
3. In your project, tell your agent: *"Use the init-project skill to set up
   Forge in this project."*
4. Follow the walkthrough in [docs/FIRST-PROJECT.md](docs/FIRST-PROJECT.md).

## Repository layout

```
project-forge-os/
├── skills/            # 12 reusable agent skills (one folder per skill)
├── templates/project/ # the forge/ folder every project gets
├── memory/            # global Forge Memory: lessons, stack notes, profile, history
├── examples/          # a complete example project (weekend-mvp)
├── docs/              # install, first project, principles, future ideas
├── VERSION            # current release
└── CHANGELOG.md
```

## Agent support

Forge OS is agent-agnostic by construction: skills are plain Markdown
instructions, and all state lives in files any agent can read and write.

- **Claude Code** — install the skill folders into `.claude/skills/`
  (project) or `~/.claude/skills/` (user-wide).
- **Codex-style agents** — reference the skill files from `AGENTS.md`, or
  paste a skill's content into the session.
- **Any future agent** — if it can read files, follow instructions, and write
  files, it can run Forge OS. No vendor is hardcoded anywhere.

Where a skill benefits from an agent-specific feature (like a built-in code
review command), it names the capability and always provides a manual
fallback that works with any agent.

## What v0.1 deliberately does not include

- No CLI, server, database, web app, or cloud service — files only.
- No automatic learning. Agents *suggest* lessons; you confirm them.
- No per-agent adapters, install scripts, or validation tooling yet.
- No product-management layer (personas, PRDs, brand docs). Forge OS is for
  builders shipping small software, not startups writing decks.

Future ideas live in [docs/FUTURE.md](docs/FUTURE.md) — and only there.

## Versioning

The release version lives in [VERSION](VERSION) and each project stamps the
version it was created with in `forge/.forge.md`. Changes are documented in
[CHANGELOG.md](CHANGELOG.md). Within 0.x, template and skill changes stay
backward-compatible: newer skills must always be able to read older `forge/`
folders.

## License

MIT — see [LICENSE.txt](LICENSE.txt).

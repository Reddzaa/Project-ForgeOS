# Installing Project Forge OS

Forge OS has two parts, and both need to be in place: **the skills** (the
instructions your agent follows) and **Forge Memory + templates** (the
shared files every project reads and writes). No servers, databases, cloud
services, or external APIs — everything below is files and git.

## 1. Install the skills

### Claude Code — via the skills CLI (recommended)

```bash
# Preview what's in the repo before installing anything
npx skills add Reddzaa/Project-ForgeOS --list

# Install all 12 skills for Claude Code, in this project
npx skills add Reddzaa/Project-ForgeOS -a claude-code

# Install globally, so every project on this machine has them
npx skills add Reddzaa/Project-ForgeOS -g -a claude-code
```

`-a` targets an agent (the [skills CLI](https://github.com/vercel-labs/skills)
supports 40+ of them the same way); `-g` installs to your user-wide skills
directory instead of just the current project. A single skill can be
installed on its own with `--skill <name>`, e.g.
`npx skills add Reddzaa/Project-ForgeOS --skill build-loop -a claude-code`.

### Claude Code — manual copy

Copy the skill folders from `skills/` in a local clone (see step 2 below)
into your skills directory:

- **User-wide:** `~/.claude/skills/` (Windows: `C:\Users\<you>\.claude\skills\`)
- **Per-project:** `<project>\.claude\skills\`

Claude Code reads each skill by the `name` in its SKILL.md frontmatter
(`init-project`, `build-loop`, etc.) — the CLI above does the same copy for
you, just faster.

### Codex-style agents / anything with an AGENTS.md

Add a pointer to your project's `AGENTS.md` (or equivalent):

```markdown
## Forge OS
This project uses Project Forge OS (C:\dev\project-forge-os).
Skills live in <repo>\skills\<skill-name>\SKILL.md — when I name a skill
(e.g. "run the build-loop"), read that file and follow it exactly.
Project state lives in forge/ — read .forge.md first.
```

### Any other agent (including future ones)

Paste the relevant SKILL.md content into the session, or tell the agent to
read the file. Skills are self-contained instructions, following the open
[Agent Skills](https://agentskills.io) standard — nothing here is specific
to one vendor.

## 2. Connect Forge Memory and templates (required)

The `skills` CLI only installs the `skills/` folder — it doesn't fetch
`templates/` or `memory/`, which `init-project` and the memory skills need a
real, permanent copy of. Every project's `forge/.forge.md` stores a
`forge_repo` path pointing at this copy.

**Fork first, then clone your fork** — not the original repo directly. Your
Forge Memory will accumulate inside this clone's history, and forking keeps
your memory and upstream updates on separable paths instead of one that
conflicts with the other:

```bash
git clone https://github.com/<you>/Project-ForgeOS C:\dev\project-forge-os
```

Any path works; `C:\dev\project-forge-os` is used in examples throughout.
Commit your memory changes as you go — memory is data, and data deserves
version history. (No GitHub account? A plain download works too; you just
lose the easy update path below.)

## 3. Set up a project

In your project, tell your agent:

> "Use the init-project skill from C:\dev\project-forge-os to set up Forge
> in this project" — or just `/init-project` if the skill is installed.

It creates the `forge/` folder from `templates/project/` and records the
repo path in `forge/.forge.md`. Manual alternative: copy
`templates\project\` to `<your-project>\forge\` and fill in `.forge.md`
yourself — every `{placeholder}` is meant to be replaced.

> **Watch the dotfile:** `.forge.md` starts with a dot, and Windows Explorer
> hides files like that by default — it's easy to lose when copying by hand.
> Copy from a terminal instead
> (`Copy-Item -Recurse templates\project <your-project>\forge`) or enable
> hidden files, and verify all **seven** files arrived. The `doctor` skill
> checks this too.

## 4. Verify

Ask your agent to run the **doctor** skill (or `/doctor`) on the project. A
clean report means you're installed correctly, including the memory link.

## Updating Forge OS

```bash
git fetch upstream
git merge upstream/main
```

(First time: `git remote add upstream https://github.com/Reddzaa/Project-ForgeOS.git`.)
Then re-run the skills CLI (or re-copy skill folders) and check
`CHANGELOG.md`. Existing projects keep working — newer skills always read
older `forge/` folders (see the README's Versioning note). Your `memory/`
lives in *your fork's* history and is never overwritten by an upstream
skill or template change.

## Next step

Once installed, follow [docs/FIRST-PROJECT.md](FIRST-PROJECT.md) for a
complete walkthrough of the first project loop.

# Installing Project Forge OS

Forge OS has two parts, and both need to be in place: **the skills** (the
instructions your agent follows) and **Forge Memory + templates** (the
shared files every project reads and writes). No servers, databases, cloud
services, or external APIs — everything below is files, git, and one
PowerShell script.

## Windows: one-command install (recommended)

**Fork this repo, then clone your fork** — not the original directly. Your
Forge Memory will accumulate inside this clone's history, and forking keeps
your memory and upstream updates on separable paths instead of one that
conflicts with the other:

```bash
git clone https://github.com/<you>/Project-ForgeOS C:\dev\project-forge-os
cd C:\dev\project-forge-os
```

Then run the installer:

```powershell
.\install.ps1
```

or, if you'd rather not run PowerShell directly:

```bash
npm run install-forge
```

Both do exactly the same thing. In one run, it:

1. **Installs all 12 skills** for Claude Code — via the [`skills` CLI](https://github.com/vercel-labs/skills) if Node/`npx` is on your PATH, or by copying the `skills/` folders directly from this repo if it isn't. Either way you end up with the same result.
2. **Sets `FORGE_OS_HOME`**, a per-user environment variable pointing at this clone. That's the piece that used to require manually editing every project's `.forge.md` — now `init-project`, `doctor`, and the memory skills all resolve `templates/` and `memory/` from it automatically.

It's safe to re-run any time — re-running just re-syncs skills and confirms `FORGE_OS_HOME` still points here.

### Parameters

```powershell
.\install.ps1                                          # global skills + connect this repo (default)
.\install.ps1 -Scope Project -TargetPath C:\dev\my-app  # install into one project only
.\install.ps1 -Agent codex                              # install for a different agent
.\install.ps1 -Force                                    # repoint FORGE_OS_HOME without asking
```

`-Scope Global` (the default) installs skills to `~/.claude/skills/`, available to every project on the machine. `-Scope Project` installs to `.claude/skills/` under `-TargetPath` instead. If `FORGE_OS_HOME` is already set to a *different* Forge OS repo, the installer asks before repointing it — `-Force` skips that prompt, which is useful for scripted or repeat installs.

### If something goes wrong

The installer validates that it's being run from inside a real Forge OS repo (checks for `skills/`, `templates/project/`, and `memory/`) and stops with a clear message if not — the usual cause is running it from the wrong directory. Everything else it does is additive and scoped to your user profile (a skills folder, one environment variable), so there's nothing destructive to undo; just re-run it after fixing the issue.

## Any other agent, or non-Windows

The installer is Windows-first; Forge OS itself isn't. Everything it automates can be done by hand:

### 1. Install the skills

**Claude Code, via the skills CLI:**

```bash
# Preview what's in the repo before installing anything
npx skills add Reddzaa/Project-ForgeOS --list

# Install all 12 skills for Claude Code, in this project
npx skills add Reddzaa/Project-ForgeOS -a claude-code

# Install globally, so every project on this machine has them
npx skills add Reddzaa/Project-ForgeOS -g -a claude-code
```

`-a` targets an agent (the CLI supports 40+ of them the same way); `-g`
installs to your user-wide skills directory instead of just the current
project. A single skill can be installed on its own with `--skill <name>`,
e.g. `npx skills add Reddzaa/Project-ForgeOS --skill build-loop -a claude-code`.

**Claude Code, manual copy:** copy the skill folders from `skills/` in your
local clone into your skills directory — `~/.claude/skills/` (user-wide) or
`<project>\.claude\skills\` (per-project). Claude Code reads each skill by
the `name` in its SKILL.md frontmatter.

**Codex-style agents / anything with an AGENTS.md** — add a pointer to your
project's `AGENTS.md` (or equivalent):

```markdown
## Forge OS
This project uses Project Forge OS (C:\dev\project-forge-os).
Skills live in <repo>\skills\<skill-name>\SKILL.md — when I name a skill
(e.g. "run the build-loop"), read that file and follow it exactly.
Project state lives in forge/ — read .forge.md first.
```

**Any other agent (including future ones)** — paste the relevant SKILL.md
content into the session, or tell the agent to read the file. Skills are
self-contained instructions following the open
[Agent Skills](https://agentskills.io) standard — nothing here is specific
to one vendor.

### 2. Connect Forge Memory and templates by hand

The `skills` CLI only installs the `skills/` folder — it doesn't fetch
`templates/` or `memory/`. Set the `FORGE_OS_HOME` environment variable
yourself (PowerShell: `[Environment]::SetEnvironmentVariable('FORGE_OS_HOME', 'C:\dev\project-forge-os', 'User')`;
bash/zsh: `export FORGE_OS_HOME=~/dev/project-forge-os` in your shell
profile), or skip it entirely and answer `init-project`'s repo-path question
by hand each time — either works, `FORGE_OS_HOME` just saves you repeating
yourself.

## Set up a project

In your project, tell your agent:

> "Use the init-project skill to set up Forge in this project" — or just
> `/init-project` if the skill is installed.

It creates the `forge/` folder from `templates/project/`, resolves the repo
path from `FORGE_OS_HOME` (falling back to asking, if unset), and records it
in `forge/.forge.md`. Manual alternative: copy `templates\project\` to
`<your-project>\forge\` and fill in `.forge.md` yourself — every
`{placeholder}` is meant to be replaced.

> **Watch the dotfile:** `.forge.md` starts with a dot, and Windows Explorer
> hides files like that by default — it's easy to lose when copying by hand.
> Copy from a terminal instead
> (`Copy-Item -Recurse templates\project <your-project>\forge`) or enable
> hidden files, and verify all **seven** files arrived. The `doctor` skill
> checks this too.

## Verify

Ask your agent to run the **doctor** skill (or `/doctor`) — on a project, or
on the Forge OS repo itself. A clean report confirms the skills are in
place and `forge_repo` / `FORGE_OS_HOME` resolve to a real, complete Forge
OS repo. If memory is disconnected — `forge_repo` unset or invalid, or this
repo not registered as `FORGE_OS_HOME` — doctor names exactly which one and
the fix (usually: re-run `install.ps1`, or re-run `init-project`).

## Updating Forge OS

```bash
git fetch upstream
git merge upstream/main
```

(First time: `git remote add upstream https://github.com/Reddzaa/Project-ForgeOS.git`.)
Then re-run `.\install.ps1` (it re-syncs skills and confirms `FORGE_OS_HOME`)
and check `CHANGELOG.md`. Existing projects keep working — newer skills
always read older `forge/` folders (see the README's Versioning note). Your
`memory/` lives in *your fork's* history and is never overwritten by an
upstream skill or template change.

## Next step

Once installed, follow [docs/FIRST-PROJECT.md](FIRST-PROJECT.md) for a
complete walkthrough of the first project loop.

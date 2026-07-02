# Installing Project Forge OS

Forge OS is plain Markdown. Installing it means two things: putting this
repo somewhere permanent, and making the skills visible to your agent.
No servers, databases, cloud services, or external APIs.

## 1. Get the repo — fork first

Your Forge Memory lives *inside* this repo. If you work on a direct clone of
the official repository, your personal memory and upstream updates end up in
the same history and you can never pull cleanly. So:

1. **Fork** https://github.com/Reddzaa/project-forge-os on GitHub.
2. **Clone your fork** to a permanent location — this path matters, because
   every project's `forge/.forge.md` points back to it (`forge_repo`) to
   find the global memory:

   ```
   git clone https://github.com/<you>/project-forge-os C:\dev\project-forge-os
   ```

3. **Get updates later** by merging upstream — your memory commits and
   upstream changes stay cleanly separable:

   ```
   git remote add upstream https://github.com/Reddzaa/project-forge-os.git
   git fetch upstream
   git merge upstream/main
   ```

Any path works; `C:\dev\project-forge-os` is used in examples throughout.
Commit your memory changes as you go — memory is data, and data deserves
version history. (No GitHub account? A plain download works too; you just
lose the easy update path.)

## 2. Make the skills available to your agent

### Claude Code

Copy the skill folders into your skills directory:

- **User-wide (recommended):** copy each folder from `skills/` into
  `~/.claude/skills/` (Windows: `C:\Users\<you>\.claude\skills\`) — the
  skills then work in every project.
- **Per-project:** copy them into `<project>\.claude\skills\` instead.

Claude Code picks them up by the `name` in each SKILL.md's frontmatter
(`init-project`, `build-loop`, etc.).

> When you update this repo, re-copy the skill folders. Your memory and
> project files are never touched by a skill update.

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
read the file. Skills are self-contained instructions; all state is in
files. Nothing else is required.

## 3. Set up a project

In your project, tell your agent:

> "Use the init-project skill from C:\dev\project-forge-os to set up Forge
> in this project."

It creates the `forge/` folder from `templates/project/` and records the
repo path in `forge/.forge.md`. Manual alternative: copy
`templates\project\` to `<your-project>\forge\` and fill in `.forge.md`
yourself — every `{placeholder}` is meant to be replaced.

> **Watch the dotfile:** `.forge.md` starts with a dot, and Windows Explorer
> hides files like that by default — it's easy to lose when copying by hand.
> Copy from a terminal instead
> (`Copy-Item -Recurse templates\project <your-project>\forge`) or enable
> hidden files, and verify all **seven** files arrived. The doctor skill
> checks this too.

## 4. Verify

Ask your agent to run the **doctor** skill on the project. A clean report
means you're installed correctly, including the memory link.

## Updating Forge OS

`git fetch upstream && git merge upstream/main` (see step 1), re-copy skills
to your agent's skill directory, and check `CHANGELOG.md`. Existing projects
keep working — newer skills always read older `forge/` folders (see README
§ Versioning). Your `memory/` lives in *your fork's* history and is never
overwritten by an upstream skill or template change.

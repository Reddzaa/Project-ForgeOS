# Decisions — {Project Name}

> Append-only decision log. Never edit past entries — a reversed decision
> gets a *new* entry that references the old one (`supersedes D-001`).
> Log significant decisions only: stack, architecture, data, scope,
> distribution. Not every small choice.
>
> Entry format:
>
> ## D-001 — {short title} ({YYYY-MM-DD})
> **Context:** {what situation forced a choice}
> **Options:** {realistic alternatives, one line each}
> **Decision:** {what was chosen}
> **Consequences:** {what this commits us to / rules out}
> **Reconsider when:** {a concrete trigger — required, never "never"}

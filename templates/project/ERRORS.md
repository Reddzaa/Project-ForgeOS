# Errors — {Project Name}

> Append-only error log. Capture errors that cost real time (roughly 30+
> minutes) or taught something — not every typo. These entries are the raw
> material for lessons at retro time.
>
> Entry format:
>
> ## E-001 — {symptom in one line} ({YYYY-MM-DD})
> **Symptom:** {what you observed}
> **Context:** {stack, versions, what was being attempted}
> **Root cause:** {the actual cause, once found}
> **Fix:** {what resolved it}
> **Prevention:** {how to avoid or catch it next time}
> **Cost:** {rough time lost, e.g. "~2h" — estimate is fine}
> **Tags:** {comma-separated, e.g. tauri, windows, build}

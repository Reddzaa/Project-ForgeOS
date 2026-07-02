# Decisions — Clipboard Snippet Launcher

> Append-only decision log. Never edit past entries — a reversed decision
> gets a *new* entry that references the old one (`supersedes D-001`).

## D-001 — Tauri + React + TS over .NET/Avalonia (2026-06-20)

**Context:** Windows-first tray utility with a small keyboard-driven UI;
both stacks are in my defaults.
**Options:** Tauri + React + TS (web skills reuse, small bundle);
.NET/Avalonia (stronger native APIs, C#); Electron (ruled out — footprint
overkill for a tray tool).
**Decision:** Tauri + React + TypeScript.
**Consequences:** UI iteration is fast; OS-level features (hotkeys,
autostart, paste simulation) go through Tauri plugins — plugin quality is
the risk to watch.
**Reconsider when:** a needed OS integration has no workable Tauri plugin.

## D-002 — JSON file storage over SQLite (2026-06-22)

**Context:** Storage for snippets; stack default says SQLite, but the data
is ~tens of small text records, no queries beyond filtering in memory.
**Options:** SQLite (default, but adds schema/migration ceremony); single
JSON file in %APPDATA% (trivial, human-editable — which replaces the whole
editing UI for v1); do nothing / hardcode (not useful).
**Decision:** Single JSON file, watched for changes.
**Consequences:** Editing snippets = editing the file, so no editor UI
needed in v1. No concurrent-write safety — fine for a single-user tray app.
**Reconsider when:** more than ~500 snippets, or filtering feels slow, or an
editing UI becomes wanted anyway.

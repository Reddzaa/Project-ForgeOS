# Retro — Clipboard Snippet Launcher

**Date:** 2026-06-28
**Verdict:** shipped

## What shipped

Tray app with global hotkey → fuzzy picker → paste-into-focused-app. JSON
storage with live reload, autostart toggle, hotkey-conflict handling with
fallback. Single-file NSIS installer, verified on a clean profile. In daily
use since 2026-06-25.

## What didn't ship

Snippet editing UI (cut at brief stage — editing the JSON file is fine),
usage-frequency sorting (T10, dropped here: fuzzy filter made it
unnecessary). Both were good cuts.

## What went well

- Phase 0 installer task surfaced NSIS pain on day two instead of week two.
- JSON-over-SQLite decision deleted an entire feature (editor UI) for free.
- Scope held: zero unplanned features were built.

## What went wrong

- ~2h lost to the silent hotkey registration failure (E-001) — the plugin's
  error Result was ignored.
- Focus restore (T09) was fiddlier than its estimate; should have been two
  tasks.

## Decision outcomes

- D-001 (Tauri over Avalonia) — held: plugin risk materialized once (E-001)
  but was handleable; everything else smooth.
- D-002 (JSON over SQLite) — held: trivial storage, human-editable, no
  ceremony. Reconsider trigger nowhere near.

## Lesson candidates

- Always check and surface the result of OS-resource registrations
  (hotkeys, ports); fail loud with a fallback. (Source: E-001)
- Prove the packaging path in Phase 0 — installer problems on day one are
  cheap, in week two they stall projects. (Source: T03 + journal 06-21)
- Estimate focus/window-management tasks generously on Windows. (Source:
  T09 — weak candidate, one data point)

## If parked: resume condition

Not applicable — shipped.

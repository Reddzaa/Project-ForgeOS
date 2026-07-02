# Plan — Clipboard Snippet Launcher

**Status:** 9/10 tasks · Phase 2 (T10 dropped at retro — see RETRO.md)
**Updated:** 2026-06-28

> One task at a time, in order. The building agent marks tasks `- [x]` when
> verified, and keeps the Status line current. Task format:
> `- [ ] T01 — what to do (verify: how you know it works)`

## Phase 0 — Working skeleton

> Goal: the project runs end to end with nothing in it. Build, launch, and
> packaging path all work before any feature exists.

- [x] T01 — Scaffold Tauri + React + TS app with tray icon, no window on
  start (verify: app runs, tray icon visible, no taskbar window)
- [x] T02 — Register global hotkey that opens/closes an empty picker window
  (verify: Ctrl+Shift+Space toggles the window from any app)
- [x] T03 — Build NSIS installer and install on a clean user profile
  (verify: installer produces a working app on a machine without dev tools)

## Phase 1 — First useful feature

> Goal: the "smallest useful version" from BRIEF.md works — hotkey → filter
> → Enter → pasted.

- [x] T04 — Define snippet storage: JSON file in %APPDATA%, loaded on start,
  reloaded on change (verify: editing the file updates the picker) — see D-002
- [x] T05 — Picker UI: list + fuzzy filter box, keyboard-only navigation
  (verify: type to filter, arrows to move, Esc closes)
- [x] T06 — Paste on Enter: copy snippet to clipboard, hide window, send
  Ctrl+V to the previously focused app (verify: flow works in browser,
  editor, Discord)
- [x] T07 — Autostart on login, toggleable from tray menu (verify: reboot,
  app is running; toggle off, reboot, it isn't)

## Phase 2 — Polish (only if needed)

> Goal: rough edges that block daily use are fixed. Nothing new gets added
> here.

- [x] T08 — Handle hotkey registration failure: surface a tray notification
  and offer fallback hotkey (verify: start app while another tool owns the
  hotkey → clear message, fallback works) — added after E-001
- [x] T09 — Restore focus correctly when the picker loses focus without a
  pick (verify: Esc or click-away returns focus to the previous app)
- [ ] T10 — Snippet usage counter to sort by frequency (dropped at retro:
  alphabetical + fuzzy filter proved good enough — kept as a v-later note)

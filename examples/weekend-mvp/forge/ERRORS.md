# Errors — Clipboard Snippet Launcher

> Append-only error log. Capture errors that cost real time or taught
> something — not every typo.

## E-001 — Global hotkey silently does nothing (2026-06-22)

**Symptom:** App running, tray icon fine, but Ctrl+Shift+Space intermittently
"stopped working" — no error, no log output, picker never opened.
**Context:** Tauri global-shortcut plugin on Windows 11; PowerToys also
installed. Attempting T05 when the hotkey died.
**Root cause:** PowerToys had claimed Ctrl+Shift+Space. The plugin's
registration call returned an error Result that our code ignored — the app
started "successfully" with no hotkey registered.
**Fix:** Handle the registration Result: on failure, show a tray
notification naming the conflict and register a fallback hotkey
(Ctrl+Alt+Space). Added T08 to the plan for the permanent version.
**Prevention:** Never discard the Result of OS-resource registrations
(hotkeys, ports, protocol handlers) — check and surface, always. Test with
common hotkey-hungry tools (PowerToys, ShareX) running.
**Cost:** ~2h
**Tags:** tauri, windows, hotkeys

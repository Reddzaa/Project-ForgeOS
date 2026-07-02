# clipboard-snippet-launcher

**Type:** desktop-utility · **Stack:** tauri-react-ts
**Outcome:** shipped (2026-06) · **Duration:** ~1 week of evenings + a weekend
**One-liner:** Tiny local Windows tool for saving and launching reusable text
snippets via a global hotkey.

> Seeded from the worked example in `examples/weekend-mvp/` — kept as a
> format reference. Prune when your own history grows.

## How it went

Shipped at weekend scope. Phase 0 (skeleton + installer) surfaced NSIS
config issues early, which made the rest of the build calm. One real error:
the global hotkey registered silently against a conflict and cost ~2h
(E-001). Polish phase was cut short deliberately — snippet editing UI was
dropped in favor of editing the JSON file directly, which turned out to be
fine for a personal tool.

## Key decisions and their facit

- D-001 Tauri + React + TS over .NET/Avalonia — held: web skills reused,
  bundle small, no native-integration needs appeared.
- D-002 JSON file storage over SQLite — held: ~60 snippets, instant load,
  zero migration overhead. Reconsider trigger (500+ snippets) not reached.

## Lessons produced

- [[lessons/surface-registration-failures]]
- [[lessons/prove-packaging-in-phase-zero]]

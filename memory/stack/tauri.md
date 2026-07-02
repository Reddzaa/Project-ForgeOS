# Tauri

> **Seeded example** from the worked project in `examples/weekend-mvp/` —
> kept as a format reference. Replace with your own verdicts as they
> accumulate.

**Verdict (2026-06):** Good default for Windows-first offline utilities —
small bundles, web frontend skills reuse, SQLite/file storage integrates
cleanly. Right pick when the UI is the app. Reconsider for heavy native
integration or long background services, where .NET/Avalonia fits better.

## Gotchas

- Plugin calls that register OS resources (global shortcuts, autostart)
  return Results that are easy to ignore — handle and surface them. See
  [[lessons/surface-registration-failures]] and
  [[projects/clipboard-snippet-launcher]] (E-001).
- Unsigned NSIS installers trigger SmartScreen warnings on other machines —
  fine for personal tools, plan for it if distributing.

## Recipes

- Windows packaging: `tauri build` with the NSIS target produces a
  single-file installer; test it on a clean machine (or clean user profile)
  as part of Phase 0.

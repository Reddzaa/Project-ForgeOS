# Forge Memory — Index

> The only memory file loaded by default. One line per active entry.
> **Budget: one page (~40 lines).** Over budget → merge or deprecate before
> adding. Maintained by the memory-consolidator skill.
>
> The entries below are seeded from the worked example project
> (`examples/weekend-mvp/`). Keep them as format references or prune them
> once your own memory grows.

## Lessons (active)

- [[lessons/surface-registration-failures]] — OS-level registrations (hotkeys,
  ports, protocol handlers) fail silently; always check and surface the
  result. `tauri, windows` · recall: build
- [[lessons/prove-packaging-in-phase-zero]] — build the installer/deploy
  artifact before features; shipping-path problems kill more projects than
  code. `process` · recall: plan

## Stack

- [[stack/tauri]] — verdict: good default for Windows-first utilities; watch
  plugin result handling and installer signing noise.

## Profile

- [[profile/preferences]] — stack defaults, working style, agents in use.

## Projects

- [[projects/clipboard-snippet-launcher]] — 2026-06, shipped. Weekend Windows
  utility, tauri-react-ts. Source of both seeded lessons.

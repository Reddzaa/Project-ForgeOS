# Preferences

> **Seeded example.** This file describes a plausible owner so the format
> has real content. Replace every section with your own reality — from then
> on the memory-consolidator keeps it current (always with your
> confirmation).

**Updated:** 2026-07-02

## Environment

- Windows-first. Offline-first strongly preferred.
- Avoid by default: cloud services, accounts/auth, sync, subscriptions,
  external APIs. Each must be justified by the BRIEF.

## Stack defaults

> This section starts as a copy of the stack-picker skill's shipped
> defaults. This file is the *personal override*: stack-picker reads it, and
> it wins ties. The two are expected to diverge as your own verdicts
> accumulate — that's the point, not drift.

- Windows desktop utility → Tauri + React + TypeScript + SQLite
  (or .NET/Avalonia + SQLite when C#/native fits better)
- Simple public website → Next.js (+ Vercel)
- Web app with auth/data → Next.js + Supabase
- Discord bot → Node.js + discord.js, or Python
- Automation/script → Python or Node
- 2D game/prototype → Godot
- Local AI → + Ollama, only when AI clearly adds value
- Data/CSV tooling → Python or .NET

## Agents in use

- {your coding agents — e.g. Claude Code, a Codex-style CLI, others}

## Patterns

*(confirmed by the owner; each cites its evidence)*

- Prove the packaging/deploy path in Phase 0 — see
  [[lessons/prove-packaging-in-phase-zero]], from
  [[projects/clipboard-snippet-launcher]].

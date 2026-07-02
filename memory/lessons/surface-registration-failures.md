---
type: error
status: active
tags: [tauri, windows, hotkeys]
recall: [build]
evidence: ["[[projects/clipboard-snippet-launcher]]"]
added: 2026-06-28
review-by: 2027-06
---

OS-level registrations — global hotkeys, port binds, protocol handlers —
can fail silently when another process already owns the resource. The app
looks fine and simply doesn't respond, which reads as "mysterious bug"
instead of "registration failed".

**Do:** always check the registration call's result and surface failure to
the user (message + fallback, e.g. a tray-menu action or configurable
hotkey). **When:** any Windows utility that hooks global input or system
resources. Cost when missed: ~2h of misdirected debugging in
[[projects/clipboard-snippet-launcher]] (E-001).

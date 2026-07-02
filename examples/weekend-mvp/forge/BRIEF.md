# Clipboard Snippet Launcher — Brief

**One-liner:** A tiny local Windows tool for saving reusable text snippets
and pasting them anywhere via a global hotkey.

## Problem

The same text gets retyped constantly — support replies, code license
headers, addresses, WoW macros, prompt fragments. Windows clipboard history
only remembers recent items; notes apps require finding, opening, copying.
The friction means I retype instead.

## Target user

Me. If it survives a month of daily use, maybe friends.

## Smallest useful version

A tray app with a global hotkey that opens a searchable snippet picker;
choosing a snippet pastes it into the active window. Snippets managed as
simple data — no editor UI needed to be useful.

**First useful flow:** press `Ctrl+Shift+Space` → type 2–3 letters to filter
→ Enter → snippet is pasted into whatever app was focused.

## Out of scope (this version)

- Snippet editing UI (edit the storage file directly) — *v-later*
- Multi-machine sync — *v-later, probably v-never*
- Rich text / images — *v-never for this tool*
- Snippet variables/placeholders (`{date}`) — *v-later*

## Definition of done

- The first useful flow works reliably in 3 different target apps (browser,
  editor, Discord).
- Installs from a single installer file on a clean Windows machine.
- I used it for real tasks three days in a row.

## Definition of dead

- Not working and in daily use within 3 weekends of start.

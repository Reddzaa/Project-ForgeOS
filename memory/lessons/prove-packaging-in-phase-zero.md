---
type: process
status: active
tags: [process, packaging, deploy]
recall: [plan]
evidence: ["[[projects/clipboard-snippet-launcher]]"]
added: 2026-06-28
review-by: 2027-06
---

Build the installer / deploy artifact in Phase 0, before any feature exists.
Shipping-path problems (bundler config, signing warnings, hosting) are the
classic place solo projects stall — hitting them on day one, when motivation
is highest and the surface is smallest, defangs them.

**Do:** every plan's Phase 0 includes a "produce the installable/deployable
artifact on a clean machine" task. **When:** always; especially desktop apps
and bots. Confirmed in [[projects/clipboard-snippet-launcher]], where the
NSIS installer step surfaced config issues that would have been painful in
week two. (This rule is now baked into the plan-project skill's Phase 0.)

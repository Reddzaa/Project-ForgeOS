# Your first Forge project

A step-by-step walkthrough of one full project loop. Prompts are written for
any agent — phrase them your way. The worked example in
`examples/weekend-mvp/` shows what every file looks like when filled in.

## 0. Prerequisites

Forge OS installed and skills visible to your agent — see
[INSTALL.md](INSTALL.md).

## 1. Filter the idea (5 min)

> "Use the idea-filter skill on this idea: {your idea, 2–3 sentences}."

You get a five-check scorecard, a look at how similar past projects ended,
and a verdict. **"Don't build yet" is a win** — it just saved you a weekend.
If the verdict is build: continue.

## 2. Initialize (2 min)

> "Use the init-project skill to set up Forge in this project."

Answer the four questions (name, type, scope, stack-if-known). You now have
a `forge/` folder, and the skill shows you any relevant lessons from memory
before you start — read them; they're yours from past projects.

## 3. Cut the scope (10 min)

> "Use the mvp-cutter skill."

Everything the idea implies gets sorted into *now / later / never*. You
confirm the buckets. BRIEF.md ends up with a first useful flow, a definition
of done, and a definition of dead. The dead one matters most — it's what
lets you stop on purpose instead of fading out.

## 4. Pick the stack (5 min)

> "Use the stack-picker skill."

One recommendation with reasoning (your own stack notes from memory get
quoted), one alternative, and an explicit "does this need cloud/auth/sync/
AI? → no" pass. The choice is logged to DECISIONS.md with a reconsider-when
trigger.

## 5. Plan (10 min)

> "Use the plan-project skill."

You get 6–12 tasks in three phases. Phase 0 always ends with a working,
*packaged* skeleton — installer built, bot connected, script running — before
any feature. That's deliberate: shipping-path problems are where solo
projects die.

## 6. Build, one session at a time

> "Run the build-loop."

The agent takes the next unchecked task, implements it small, verifies it,
does a bounded review, updates PLAN.md, and writes a journal entry. It
recommends stopping after 2–3 tasks — respect the stop; the journal makes
next session's start free.

When something breaks and costs real time:

> "Capture this with the error-capture skill."

When you make a significant choice mid-build:

> "Log this with the decision-logger skill."

## 7. Pausing and coming back

Life happens. Because every session ended with a journal entry, resuming is:

> "Use the resume-project skill."

You get where-it-stopped, what's stale, and an honest continue / park / kill
recommendation.

## 8. Finish — whichever way it ends (15 min)

Shipped, killed, or parked — run the retro:

> "Run the retro skill."

Three questions, a verdict, decision facits, and lesson candidates. Then:

> "Run the memory-consolidator skill."

Confirmed lessons go into global memory, the project gets its permanent
history entry, your stack notes get updated. **This step is why project #10
will go better than project #1.** Don't skip it — the retro is ten minutes
and consolidation about five.

## The loop, complete

idea-filter → init-project → mvp-cutter → stack-picker → plan-project →
build-loop (×N, with decision-logger and error-capture as needed) → retro →
memory-consolidator → *your next project starts smarter*.

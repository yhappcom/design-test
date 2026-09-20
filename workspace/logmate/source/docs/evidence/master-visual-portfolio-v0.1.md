# LogMate Master Visual Portfolio v0.1

Status: **SUPERSEDED — historical reference only**
Date: 2026-09-18
Superseded by: `master-visual-portfolio-v0.2-detailed-contract.md`
Branch: `design/first-use-baseline-20260918`
Production Flutter: unchanged

## 0. Portfolio purpose

This portfolio is the cross-screen design direction reference for the next LogMate implementation phase. It has no independent UI-lock authority; lock governance is owned by `portfolio-governance-contract-20260918.md` and screen-family approval.

It exists to:
- establish one coherent LogMate visual language before Home, View Logbook and Settings are finalized;
- prepare screen families for progressive locking without waiting for every engine feature;
- keep design synchronized with rapidly advancing code/engine/PWA work;
- preserve product truth across native phone, tablet/EFB PWA, first-use and mature operational states;
- reduce later implementation churn by defining reusable UI grammar now.

This portfolio is not:
- authority to lock an individual screen merely because it appears here;
- a final production token sheet;
- a claim of device/AT/human validation;
- a replacement for `MASTER.md`, domain specs or engineering contracts;
- permission to change product semantics to fit a preferred visual.

---

# 1. Evidence basis

The portfolio must be refreshed against five live evidence streams.

## Product / code
- `yhappcom/logmate@main` — current product authority.
- `yhappcom/logmate@feature/data001-domain` — forward engineering evidence; currently materially ahead of main.
- `yhappcom/logmate@design/first-use-baseline-20260918` — active first-use design work.

## Design
- `yhappcom/design-studio@main`
- current transfer state observed:
  - Type: T051
  - Color: C082
  - Layout / Interaction: L073 / I069
  - Web: W082
  - Content: CD088

## Engineering research
- `yhappcom/software-engineering-studio@main`

## Web/PWA research
- `yhappcom/web-manager@main`

## Marketing / first-value research
- `yhappcom/marketing-manager@main`

Historical visual branches remain reference evidence only after reconciliation.

---

# 2. Product identity

## Core product character

LogMate should feel:

- Calm
- Exact
- Operational
- Legible
- Trustworthy
- Non-theatrical

Primary visual principle:

> **Macro Calm / Micro Precision**

The shell is calm.
The data is precise.
Density increases only when real operational data exists.

Secondary principle:

> **Datum Before Container**

Information hierarchy should come first from:
- typography;
- alignment;
- rhythm;
- rule ownership;
- luminance;
- semantic grouping.

Cards, outlines, fills and shadows are used only when the interaction contract genuinely needs containment.

---

# 3. Identity exclusions

The following are not part of LogMate's identity:

- cockpit / HUD / runway decoration;
- artificial aviation nostalgia;
- fake flight records used as atmosphere;
- oversized lifestyle slogans;
- generic AI dashboard cards;
- generic SaaS onboarding;
- Material visual identity used without authorship;
- feature-tour carousel as first-use default;
- high-chroma status decoration;
- trust superlatives not backed by actual product behavior.

Professional credibility should come from:
- correct domain semantics;
- controlled density;
- exact numbers;
- stable structure;
- truthful state representation.

---

# 4. Information-density gradient

The portfolio must prove one continuous progression:

```
WELCOME
Macro Calm
   ↓
PREVIOUS TOTAL
   ↓
EMPTY HOME
   ↓
ADD FIRST FLIGHT
   ↓
FIRST POPULATED HOME
   ↓
MATURE HOME
   ↓
VIEW LOGBOOK
Micro Precision
```

No transition should look like entering a different product.

The identity carrier changes over time:

- Welcome: typography + spacing + action hierarchy.
- Previous Total: first real operational numeric grammar.
- Empty Home: workspace structure.
- Add Flight: real professional input.
- Home: real user record/activity.
- View Logbook: dense ledger structure.

---

# 5. Working visual system

These are current portfolio design baselines, not yet production-final tokens.

## Typography

| Role | Current working size |
| --- | ---: |
| Exceptional product identity | 34 |
| Page/task title | 20 |
| Section / primary choice | 17 |
| Operational cumulative value | 17 |
| Body explanation | 15 |
| Field semantic label | 15 |
| Action label | 15 |
| Helper / error / status | 15 |

Rules:
- no 10–13 px first-use helper tier;
- no negative tracking to force fit;
- no semantic truncation to preserve geometry;
- full field labels beat one-line compactness;
- operational numerics may use tabular numeral features where mature fallback supports them;
- the whole UI does not become monospace;
- custom LogMate type remains gated; layout must work with mature fallback first.

Proof strings:
- `99,999+59`
- `Instrument Flight Time`
- `0+00`
- `12+30`
- `01 JAN 2022`
- ambiguity-critical `I / l / 1 / O / 0`

## Spacing

Working family:
`4 / 8 / 12 / 20 / 28 / 36`

Compact page inset:
approximately `24` on current phone composition.

Rules:
- whitespace must perform grouping or attention work;
- do not use repeated oversized gaps merely to signal premium quality;
- rows expand for text, helper and error;
- no fixed row height where semantics may wrap.

## Color

No exact final HEX values are frozen.

Current principles:
- luminance hierarchy before hue;
- brand accent has one explicit job at a time;
- selection, focus, error, disabled, read-only and recovery remain distinct state axes;
- color never owns meaning alone;
- visual hierarchy must survive grayscale;
- night/forced-color transfer remains validation work.

## Surfaces

Default hierarchy should prefer:
- page;
- section;
- datum;
- rule;
- field locus;

over:
- card;
- card inside card;
- elevated panel;
- decorative tile.

Where a product contract already requires containment, retain it quietly rather than removing it for style.

## Actions

Primary actions:
- visually clear but not oversized conversion-style CTAs;
- tied to task completion;
- do not float over data entry by default.

Secondary actions:
- remain discoverable without competing with the primary task.

First-use actions must not be mixed with advertising.

---

# 6. Frame 01 — Welcome

## Role

Welcome is the identity and intent-selection surface for a genuinely new/unbound first-use state.

Returning/restored users normally bypass it.

## Direction

```
LOGMATE
Pilot Logbook


[quiet space]


Start a new logbook  →

Sign in
```

## Must communicate
- product identity;
- one clear new-user action;
- one existing-user action.

## Must not communicate
- fake flight data;
- fake totals;
- fake routes;
- aircraft/registration examples;
- import feature list;
- sync promises;
- offline/backup superlatives;
- marketing carousel;
- ads.

## Portfolio role
Welcome sets:
- page axis;
- identity scale;
- primary/secondary action grammar;
- initial brand emphasis;
- visual temperature.

## Lock state
**DIRECTION LOCKED**
- no fake operational data;
- Start a new logbook = primary;
- Sign in = secondary;
- returning/restored users normally skip Welcome;
- no first-launch advertising.

**VISUAL OPEN**
- exact wordmark treatment;
- exact vertical placement;
- exact accent use;
- exact action geometry.

---

# 7. Frame 02 — Previous Total / Starting Point

## Role

A required ledger-boundary decision before the first manually entered Flight.

It is not a tutorial.

## Direction

```
PREVIOUS TOTAL

Set the totals carried forward
before your first LogMate record.

STARTING POINT

( ) Start from zero
    No previous totals will be carried forward.

( ) Carry forward previous totals
    Enter totals from before your first LogMate record.

Continue
```

## Key design requirement

This is a truth decision, not a preference setting.

Therefore:
- do not silently default to zero;
- do not use two large selectable cards;
- do not embed editors inside the choice row;
- choice state must survive grayscale;
- Continue stays unavailable until the required decision exists.

## Lock state

**DIRECTION LOCKED**
- explicit zero vs carry-forward decision;
- blank is not zero;
- choice control separated from value editor;
- no field configuration wizard before this step.

**VISUAL OPEN**
- exact selection mark;
- selected/focus treatment;
- exact relationship between title, explanation and choice group.

---

# 8. Frame 03 — Previous Total / Carry Forward

## Role

First legitimate operational-numeric screen in the first-use flow.

## Direction

```
Carry forward previous totals

Block                                  2350+25
─────────────────────────────────────────────

Night                                    412+10
─────────────────────────────────────────────

Instrument Flight Time                 1125+30
─────────────────────────────────────────────

+ Add previous total

Continue
```

The field list is dynamic and product-owned.

## Input grammar

One semantic duration = one editor.

Supported working behavior:
- raw while editing;
- completion normalization to `H+MM`;
- Next advances to the next semantic;
- Done normalizes/dismisses keyboard;
- Done does not submit the form.

Rejected:
`[hours] + [minutes]` split editor.

## Field-state truth

```
0+00    = explicit numeric zero
blank   = omitted / unresolved
value   = explicitly entered
```

Engineering now provides a sparse `PreviousTotalBaseline` direction, reinforcing this separation.

## Long-label reflow

Normal:
```
Instrument Flight Time            1,125+30
```

When relationship fails:
```
Instrument Flight Time

1,125+30
────────
```

Never solve with:
- smaller type;
- abbreviation;
- negative tracking;
- clipped label.

## Lock state

**DIRECTION LOCKED**
- one H+MM editor per duration semantic;
- persistent full semantic label;
- blank != zero;
- local field errors;
- Add previous total != Customize / Add column / Custom Field;
- dynamic system-owned eligibility.

**VISUAL OPEN**
- exact input rule/boundary;
- raw/read grouping commas;
- optional semantic chooser surface;
- exact prioritized initial field set.

---

# 9. Frame 04 — Empty Home

## Role

The user's real workspace after baseline setup but before the first Flight.

## Direction

```
LOGMATE

No flights yet.

Add flight  →

Import records

Previous total        Set
```

Possible baseline states:
- Starts from zero
- Set
- Needs review

## Must not show
- fake Recent;
- mock Activity;
- zero-filled totals cards;
- synthetic month statistics;
- disabled fake search results.

## Portfolio role

Empty Home establishes the actual Home shell without pretending mature data already exists.

## Lock state

**DIRECTION LOCKED**
- true empty state;
- Add Flight is primary first-value action;
- Import remains available but optional;
- baseline recovery/status is visible but quiet.

**VISUAL OPEN**
- final Home header;
- exact action arrangement;
- navigation/chrome;
- empty-state copy;
- how Search appears before records exist.

---

# 10. Frame 05 — Add First Flight

## Role

First real operational record creation.

Marketing first-value research correctly frames this as materially closer to value than Welcome, Home or authentication.

Current engineering branch now has substantial manual-create/application/repository foundations, but production Save/UI binding is still incomplete.

## Portfolio direction

Do not redesign product semantics here.

Transfer the accepted visual language into the existing professional field structure.

Key requirements:
- Previous Total and Add Flight feel like one application;
- field labels remain legible;
- high-frequency input stays efficient;
- error/focus grammar transfers consistently;
- section containment stays only where current product contract requires it;
- data entry cannot become aesthetically sparse at the cost of speed.

## Lock state

**PRODUCT STRUCTURE — KEEP**
Current field semantics and confirmed input model remain authoritative.

**VISUAL OPEN**
Requires dedicated screen-family lock after portfolio approval.

---

# 11. Frame 06 — First Populated Home

## Role

The bridge between first-use and mature operation.

This frame is critical because it proves that:
- first-use did not create a separate visual subsystem;
- one real record can transform Empty Home naturally;
- operational density arrives through data rather than decoration.

## Required proof

The same page hierarchy must support:
- one recent record;
- initial activity/totals where semantically available;
- continued Add Flight / View Logbook access.

Do not invent generic/lifetime totals whose semantics remain unresolved.

## Lock state
**DIRECTION OPEN / PORTFOLIO CRITICAL**

This frame must be designed before Home visual lock.

---

# 12. Frame 07 — Mature Home

## Role

Recurring daily entry and lookup workspace.

The Home portfolio must preserve current product families:
- Add flight;
- View logbook;
- Search;
- Recent;
- Activity;
- Totals;
- Settings access.

The visual portfolio may transform presentation, not silently remove product semantics.

## Visual direction

Avoid:
- dashboard KPI-card proliferation;
- one equal rounded card per section;
- career/lifetime hero if semantics are not product-authorized;
- brand color as the only hierarchy tool.

Prefer:
- readout hierarchy;
- aligned datum planes;
- ledger excerpt where appropriate;
- section rhythm;
- restrained rule ownership.

## Lock state
**INFORMATION ARCHITECTURE KEEP**
**VISUAL OPEN**

---

# 13. Frame 08 — View Logbook

## Role

LogMate's highest-density professional surface and strongest Micro Precision expression.

Current product/code evidence makes this the most structurally mature visual area.

Preserve:
- landscape phone View Logbook;
- both landscape directions;
- stable column boundaries;
- compact headers;
- continuous page chain;
- active vs completed page semantics;
- Page / Previous / New Total logic;
- neutral total hierarchy;
- local two-dimensional ledger behavior where justified.

## Portfolio implication

View Logbook should look like the same product as Welcome without inheriting Welcome's low density.

Identity transfers through:
- type roles;
- rule hierarchy;
- luminance;
- spacing discipline;
- restrained accent;
- semantic state treatment.

## Lock state

**CORE LEDGER STRUCTURE — KEEP**
**FINAL VISUAL TOKENIZATION — OPEN**

---

# 14. Frame 09 — Settings / Trust-Control Specimen

## Role

Prove that the visual language handles lower-frequency control surfaces without reverting to generic ListTile UI.

This frame should include only implemented/truthful states.

Potential specimen families:
- Previous Total entry/review;
- rows-per-page;
- account/owner access;
- backup/export when real;
- sync when real;
- appearance only if product authority confirms the policy.

## Cross-repo truth requirement

Do not conflate:
- local storage;
- sync;
- remote acknowledgement;
- backup;
- recovery.

Avoid copy such as:
- Fully synced
- Safely backed up
- Works offline everywhere

unless release evidence supports it.

## Lock state
**VISUAL OPEN**
Truth hierarchy is locked; specific rows depend on implementation maturity.

---

# 15. Frame 10 — Tablet / EFB PWA

## Role

Show the same LogMate identity on the company EFB target without pretending PWA/native runtime equivalence.

## Direction

Do not simply center phone cards in landscape.

Use:
- bounded operational measure;
- real simultaneous context only where useful;
- View Logbook local 2-D density;
- relationship-driven reflow.

Do not place universal `Install app` onboarding into core first-use.

PWA installation/update/recovery are platform-specific.

## Must leave room for future states
- locally available;
- update waiting;
- degraded capability;
- unresolved/review;
- storage/recovery risk.

Do not show these as production features until implemented.

## Lock state
**VISUAL LANGUAGE CONTINUITY — DIRECTION LOCKED**
**PLATFORM-SPECIFIC RUNTIME UI — OPEN**

---

# 16. Frame 11 — Recovery / Degraded-State Specimen

## Role

This is not necessarily a production screen.

It tests whether LogMate's visual language can represent uncertainty and recovery without collapsing into generic error UI.

Required state distinctions:
- local committed;
- pending;
- unresolved;
- review required;
- failure;
- read-only reference;
- owner locked;
- update/recovery state when real.

Engineering/Web evidence requires these distinctions to remain truthful.

## Rule

Do not use one green check or one red banner for multiple semantic states.

## Lock state
**STATE-ORTHOGONALITY PRINCIPLE — DIRECTION LOCKED**
Exact production states remain implementation-dependent.

---

# 17. First-value continuity contract

The portfolio must preserve:

```
specialist recognition
      ↓
Welcome
      ↓
minimum required setup
      ↓
Previous Total
      ↓
Add First Flight
      ↓
durable personal record
      ↓
normal retrieval / View
      ↓
reason to return
```

Do not place before first value unless truly required:
- import tutorial;
- field catalog setup;
- PWA install instruction;
- ad;
- sync configuration;
- marketing tour.

Import remains a first-class optional route for users with existing records, not a mandatory lifecycle.

---

# 18. Store / marketing continuity

The product itself should later support truthful Store proof.

Future Store proof stack:
1. Recognition
2. Outcome
3. Specialist competence
4. Workflow
5. Trust/control
6. Breadth
7. Return value

Portfolio requirement:
A populated Home/View Logbook screenshot should be strong enough to act as product proof without hiding the real first-use path.

Do not optimize in-app UI to look like a Store graphic.
Do make the actual UI credible enough that marketing does not need to fake the product.

---

# 19. Advertising boundary

First launch, onboarding, Previous Total, import continuation, save, restore and recovery are protected user intent.

**Direction lock:**
No ad placement is designed into:
- Welcome;
- Previous Total;
- Add First Flight before first-value completion;
- recovery-critical flow.

Advertising work begins only where it does not tax normal specialist work.

---

# 20. Lock hierarchy

Every screen family moves through three gates.

## DIRECTION LOCK
Meaning:
- information role;
- product flow;
- major interaction model;
- major composition principle;
- rejected alternatives.

May be locked before exact visual tokens.

## VISUAL LOCK
Meaning:
- hierarchy;
- typography application;
- spacing;
- field/control grammar;
- selection/focus/error states;
- responsive composition;
- representative default + stress states.

Requires product-owner visual approval.

## IMPLEMENTATION LOCK
Meaning:
- actual Flutter/PWA rendering;
- safe area;
- IME;
- 200% text;
- native/PWA transfer;
- real state wiring;
- device/runtime checks.

Requires implementation evidence.

---

# 21. Current lock map

| Area | Direction | Visual | Implementation |
| --- | --- | --- | --- |
| Welcome role/flow | LOCKED | OPEN | OPEN |
| Welcome exact composition | — | OPEN | OPEN |
| Returning-user bypass | LOCKED | — | OPEN/WIRING |
| Previous Total meaning | LOCKED | — | ENGINEERING ADVANCED |
| Zero vs carry decision | LOCKED | OPEN | OPEN |
| H+MM baseline editor | LOCKED | OPEN | OPEN |
| Blank vs zero | LOCKED | — | DOMAIN-ALIGNED |
| Empty Home semantics | LOCKED | OPEN | OPEN |
| Add First Flight product structure | KEEP | OPEN | ENGINEERING IN PROGRESS |
| First populated Home | OPEN | OPEN | OPEN |
| Mature Home IA | KEEP | OPEN | CURRENT SHELL |
| View Logbook ledger structure | KEEP | PARTIAL | CURRENT SHELL / ENGINE ADVANCING |
| Settings visual language | OPEN | OPEN | MIXED |
| Native/PWA identity continuity | LOCKED | OPEN | PARTIAL EVIDENCE |
| PWA install/update UX | OPEN | OPEN | PLATFORM VALIDATION NEEDED |
| Recovery-state grammar | LOCKED PRINCIPLE | OPEN | IMPLEMENTATION-DEPENDENT |
| Final typeface | OPEN | OPEN | OPEN |
| Final palette | OPEN | OPEN | OPEN |
| Exact radii/strokes | OPEN | OPEN | OPEN |

---

# 22. Portfolio approval gate

The portfolio should be approved only if the answer is YES to this question:

> Can Welcome, Previous Total, Empty Home, Add Flight, populated Home, View Logbook and Settings all extend from the same LogMate visual language without semantic distortion, framework-template leakage or false product claims?

Approval does **not** freeze every pixel.

It authorizes screen-family locking using this visual language.

---

# 23. Immediate screen-lock order

1. Welcome
2. Previous Total family
3. Empty Home
4. Add First Flight transfer
5. First Populated Home
6. Mature Home
7. Sign-in / owner recovery
8. View Logbook visual finalization
9. Settings / secondary
10. EFB/PWA adaptation and recovery surfaces

The purpose of this order is to unblock implementation quickly while preserving system coherence.

---

# 24. Update protocol

This portfolio is a living master until Visual Lock is complete.

Refresh whenever one of these changes materially:
- LogMate product authority;
- `feature/data001-domain` engineering state;
- Design Studio transferable finding;
- Web/PWA platform constraint;
- Marketing first-value/trust requirement;
- screen-family lock decision.

Do not churn the portfolio for unrelated research.

For every material refresh:
1. record exact repo/ref/commit;
2. identify affected frame/lock;
3. classify:
   - NO IMPACT
   - NOTE
   - REWORK
   - REOPEN REQUIRED
4. preserve locked decisions unless new evidence creates an actual contradiction;
5. never silently rewrite a locked contract.

---

# 25. Current portfolio judgment

Research breadth is sufficient.

The design bottleneck is now:
- visual synthesis;
- screen-family approval;
- lock propagation;
- implementation transfer.

The project should not wait for research completion before UI work proceeds.

From this point forward, new research is most valuable when it:
- resolves a portfolio conflict;
- validates a candidate;
- closes a screen-lock blocker;
- identifies a product/runtime contradiction.

The next concrete task after v0.1 is to create the **Master Visual Portfolio board** using the frames in this document, then review it as one system before locking Welcome.

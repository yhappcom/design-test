# HOME-B v0.11 — Visual System Consolidation

> **CURRENT-STATE NOTICE — 2026-09-19**
>
> This file is a chronological research/iteration record and intentionally contains superseded Home values.  
> For current implementation/design review, use **[HOME_CURRENT_SNAPSHOT.md](HOME_CURRENT_SNAPSHOT.md)**.  
> Earlier order, track ratios, spacing, fixed-cell trials, and other intermediate values in this document must not be treated as the current Home specification.

Status: INTERNAL ITERATION / OWNER-APPROVED LARGE-SCOPE RECOMPOSITION / NOT PRODUCT AUTHORITY
Date: 2026-09-19
Lineage: HOME-B v0.10 -> v0.11

## Owner authorization

The owner approved a whole-Home visual-system recomposition with one explicit constraint:
- do not use the in-progress custom/produced LogMate font.

No product semantic family is removed.

## Latest research reconciliation

Checked against current Design Studio main before modification:
- Type 009, T017, T018, T020 and current TYPE_STATUS;
- Layout 006, L001, L002 and current LAYOUT_STATUS;
- Interaction I041/I042;
- Content CD004 and current CONTENT_STATUS;
- LogMate case-study notes.

The newest T067/L089/I085/CD104 lifecycle work does not require a Home composition change.

### Type

Use a mature inherited UI family only.
No custom type is assumed or embedded.

One role matrix governs the screen:
- Identity;
- Context;
- Section;
- Data Label;
- Primary Data;
- Operational Data;
- Metadata;
- Action;
- Utility Action.

Same semantic role means the same base size/weight/leading/contrast.

### Layout

The Home is rebuilt as a relationship system rather than patched widgets:
- Header -> Search -> Current Period -> equal-level Actions -> Recent -> Activity -> Totals.
- Current-period metrics are centered.
- Recent uses 20 / 22 / 38 / 20 Date / Flight / Route / Block tracks.
- Activity summary uses three equal centered tracks.
- Totals preserves one-line full terminology with 30 / 28 / 42 tracks.

### Interaction

Add Flight and View Logbook are equal-level actions.
They use no surrounding rail, divider, filled button or selected-state styling.
Period selection removes the underline/tab cue and uses a local selected surface + weight.

### Content

Explicit 7 days / 28 days / 90 days wording is retained.
Instrument Flight Time remains full and one-line.
No semantic abbreviation is invented to solve layout.

## Internal review gate

First render is internal evidence only.
After render:
1. compare typography role usage;
2. compare grid balance and optical mass;
3. compare spacing/grouping;
4. compare action/state affordances;
5. inspect Light/Dark;
6. repair any contradiction;
7. rerender before owner delivery.


## Post-implementation latest-research audit

Design Studio main was queried again after the implementation.

Latest main head remained in the T067/L089/I085/CD104 unsaved-exit/lifecycle transfer family. Those additions do not alter the Home static hierarchy decision made here.

Current status boundaries remain:
- Type: Stage 2 PRACTICE; no T021/custom-font production PASS.
- Layout: Stage 3 PRACTICE; no representative-human/native PASS.
- Content: Stage 3 PRACTICE; no representative-pilot comprehension PASS.

No produced/custom font is used by v0.11.

## Whole-screen contradiction audit

### Typography

PASS for current static candidate:
- Identity: LogMate only.
- Context: September 2026.
- Section: Recent Flights / Activity / Totals.
- Data Label: This month / This year / Date / Flight / Route / Block / Legs / TO / LD / Night / Instrument Flight Time.
- Primary Data: current-period and summary values.
- Operational Data: route and block-time rows.
- Metadata: dates / flight identifiers.
- Action / Utility: Home commands and section actions.

No same-level label receives an ad-hoc alternate size/weight in the 390px reference.

### Layout / optical balance

PASS for current static candidate:
- top commands moved below current-period orientation and no longer form a visual toolbar beneath the brand;
- actions are equal hierarchy and free of surrounding rails/dividers;
- current-period metrics are centered;
- Recent tracks use 20 / 22 / 38 / 20 rather than Route-dominant remainder allocation;
- Activity uses four equal period targets and three equal summary tracks;
- Totals uses 30 / 28 / 42 to preserve full Instrument Flight Time on one line while keeping values centered.

### Interaction cues

PASS for current static candidate:
- period selection does not use a tab-like underline;
- selected period is represented by local surface + weight;
- Add Flight / View Logbook are actions, not selected-state controls.

### Content fidelity

PASS for current static candidate:
- 7 days / 28 days / 90 days remain explicit;
- Instrument Flight Time is not abbreviated;
- no new product metric is invented.

## Stress reference

Static 390px stress strings:
- airports: WAW / ICN / JFK / LAX / LHR / CDG;
- flights: 7C1123 / SQ321 / KE28;
- block: 12+40 / 999+59 / 1+05.

Measured static reference:
- screen clientWidth = scrollWidth = 390;
- each Recent row clientWidth = scrollWidth = 342;
- Date / Flight / Route / Block tracks remain 20 / 22 / 38 / 20;
- Totals columns remain within their allocated width.

## Remaining OPEN evidence

GitHub Actions run 56 ended as failure without usable runtime-gate evidence for this review.

Do not claim:
- Flutter analyze PASS;
- semantic-contract execution PASS;
- 200% text PASS;
- Search + IME PASS;
- native iOS/Android raster PASS;
- representative-pilot usability PASS.


## Approved refinement pass

Owner clarified the Block stress boundary: only values through 7+59 need to be considered for this Home preview.

Changes:
- Search -> Current Period major gap: 18 -> 10;
- current-period title: 22 -> 19;
- Search visible surface: 40 -> 34 while retaining a 40 interaction target;
- Add Flight / View Logbook: equal hierarchy retained; both use the same neutral leading-glyph grammar;
- utility actions: accent green removed; neutral secondary role used;
- Recent row Date / Flight / Route / Block values use one shared visual hierarchy;
- Recent track budget: 21 / 23 / 34 / 22;
- flight display formatting inserts a thin space between carrier designator and numeric flight portion;
- Block remains tabular and right anchored.

### Post-change Color check

Current Color research does not establish green/accent as a default treatment for generic utility navigation.
Using accent for View all / Details / Customize would over-allocate color salience without a state/semantic requirement.

Decision:
- neutral secondary for utility actions;
- accent retained for focus/selection where it carries state.

### Post-change stress check

Stress corpus:
- Sep 30 · 7C 1123 · WAW -> ICN · 7+59
- Aug 31 · SQ 321 · JFK -> LAX · 6+45
- Aug 29 · KE 28 · LHR -> CDG · 5+05

Static 390px reference:
- screen clientWidth = scrollWidth = 390;
- Recent rows clientWidth = scrollWidth = 342;
- no horizontal overflow observed;
- Block right axis remains stable through 7+59.

### Latest-research recheck

Design Studio main was checked after the refinement.
Latest head remained CD104 / W098 / L089 / C098 / T067 lifecycle work.
No new conflicting static-Home requirement was found.


## Totals three-slot cumulative-width stress — 2026-09-19

Owner direction:
- keep the current three-slot Home Totals composition for this test;
- render all three values as `99,999+59` before deciding whether a fourth slot is necessary;
- do not infer a 2x2 layout yet.

Implementation:
- Block = `99,999+59`
- Night = `99,999+59`
- Instrument Flight Time = `99,999+59`

Static 390px code-render measurement:
- Home screen: clientWidth = scrollWidth = 390;
- Totals columns at the current 30 / 28 / 42 allocation are approximately 103 / 96 / 144 px;
- each `99,999+59` value remains within its allocated column without horizontal overflow in this review render.

Interpretation:
- three cumulative values fit at the current 18px Primary Data size in the static reference;
- this test does not decide the final Home Totals slot count or category set;
- TOTAL-001 remains OPEN / USER DECISION REQUIRED.


## Activity-focused integrated refinement — 2026-09-19

Owner-approved scope:
- keep Activity product policy at 7 / 28 / 90 / Custom;
- keep Home Activity summary at Legs / Block / TO/LD;
- apply the remaining Home layout/type refinements without adding a new Activity metric or 1-year quick period.

Changes:
- Home order returns to Header -> Actions -> Search -> Current Period -> Recent -> Activity -> Totals.
- Add Flight and View Logbook occupy opposite ends of the top action row with equal hierarchy.
- Recent Date / Flight / Route / Block allocation changes to 23 / 25 / 30 / 22 after capacity review; Route no longer receives the residual majority.
- Activity's four period choices use four equal full-width interaction zones; the selected state remains local-surface + weight with no underline.
- Current Period values use the 17px primary-data role; repeated Activity/Totals summary values use a quieter 15.5px summary-data role.
- Totals uses the existing compact canonical `Inst` label for Instrument Flight Time.
- Totals returns to equal thirds because all three cumulative values now share the same `99,999+59` capacity requirement.

Product-state reconciliation:
- D009 remains owner-confirmed at 7 / 28 / 90 / Custom.
- `MASTER.md` previously still reported the legacy 30-day implementation as if it were current policy.
- The branch status now distinguishes confirmed 28D policy from the still-unmigrated legacy Home implementation.

Evidence boundary:
- no new custom font is used;
- Design Studio latest T068/C099/L090/W099/CD105 work concerns form/autofill provenance and introduces no contradictory static-Home requirement;
- native Flutter/runtime, 200% text and IME execution remain OPEN until executable evidence exists.


## Post-render whole-screen audit — activity refinement

Static code-render reference: 390 x 844, Light/Dark.

Measured geometry:
- screen clientWidth = scrollWidth = 390;
- top Add Flight visual box begins at x=24;
- top View Logbook visual box ends at x=366;
- Recent tracks at 342px content width:
  - Date ≈ 78.7px;
  - Flight ≈ 85.5px;
  - Route ≈ 102.6px;
  - Block ≈ 75.3px;
- Activity period interaction zones = four × 82.5px with 4px inter-zone spacing;
- Totals = three × 114px equal columns.

Stress:
- Flight = `7C 1123A`;
- Route = `WAW -> ICN`;
- Block = `7+59`;
- all Recent rows retain clientWidth = scrollWidth = 342;
- all Block right edges remain aligned at x=366;
- each Totals column with `99,999+59` retains clientWidth = scrollWidth = 114.

Whole-screen contradiction review:
- Actions no longer interrupt Current Period -> Recent reading flow.
- Equal action hierarchy is preserved while edge placement makes the group legible.
- Route remains the widest Recent semantic track, but no longer dominates the row.
- Activity period controls occupy the available horizontal space rather than clustering around text width.
- Current Period remains visually stronger than rolling Activity/Totals summary values.
- Utility actions remain neutral; no generic accent-green hierarchy is reintroduced.
- Totals uses the canonical compact `Inst` semantic label and does not force a multi-line title.

No new product-policy change was made by this pass.


## Section-destination grammar refinement — 2026-09-19

Owner direction:
- remove Home Totals `Customize`;
- keep customization one level deeper inside Totals Detail because it is expected to be low-frequency after initial setup;
- make Home section destinations visually explicit and consistent.

Home grammar:
- Recent Flights -> `View all ›`;
- Activity -> `Details ›`;
- Totals -> `Details ›`;
- Totals `Customize` is no longer exposed on Home.

Layout rationale:
- one right-edge destination per section preserves a repeated scan rhythm;
- removing the second Totals utility reduces right-edge visual mass and exceptional layout behavior;
- chevrons are reserved for the section destination grammar rather than added mechanically to every utility;
- the future Totals Detail should expose `Customize` directly in its top-level visible controls rather than burying it in an overflow menu.

This remains candidate behavior until the Home visual baseline and Totals Detail composition are selected.


### Section-destination static render audit

390 x 844 Light/Dark static code-render review:
- Recent Flights -> View all ›;
- Activity -> Details ›;
- Totals -> Details ›;
- no Home Customize control remains;
- all three section-heading rows now resolve to one left title / one right destination;
- Totals no longer carries a denser right-side control cluster than the other summary sections;
- section destination tone remains secondary-neutral rather than accent-colored.

No additional product-policy change was introduced by this render pass.


## UI detail pass — Recent alignment, Search scope copy, Settings edge — 2026-09-19

Owner observations:
- Recent Date / Flight / Block values should visually sit under their headers like Route;
- Recent Block must reserve normal Home capacity for at least `00+00`;
- Search copy should not be decided from intuition alone;
- Settings gear is semantically plausible, but its glyph appeared optically inset from the right content edge.

Applied candidate:
- restore the intended v0.11 branch baseline after detecting that a later documentation-tree commit had reintroduced stale prototype content;
- Home order remains Header -> Actions -> Search -> Current Period -> Recent -> Activity -> Totals;
- Recent tracks remain 23 / 25 / 30 / 22;
- center Date, Flight identifier component, Route and Block value component within their semantic tracks;
- preserve Flight's explicit internal `19px carrier + 2px gap + 42px number/suffix` zoning instead of centering an opaque combined string;
- reserve a 52px tabular Block value box, centered under the Block header, so `00+00` is a normal capacity target;
- keep the 40x40 Settings target and optically move only the 18px settings glyph toward the right content edge;
- use `Search logbook` as a Design Studio candidate placeholder after search-scope/content review; this is not a finalized Search-content decision.

Static 390px code-render stress:
- Recent content width = 342px;
- test Flight = `7C 1123A`;
- test Route = `WAW -> ICN`;
- test Block = `00+00`;
- all Recent rows: clientWidth = scrollWidth = 342;
- Flight identifier component: 63px clientWidth = scrollWidth;
- Block component: 52px clientWidth = scrollWidth;
- no horizontal overflow observed in the static reference.

Evidence boundary:
- this is a browser/static code-render reference, not native Flutter proof;
- 200% text, native iOS/Android glyph metrics, focus/IME, and physical-device optical judgment remain OPEN.


## Operational identifier alignment requirement — 2026-09-19

Owner direction:
- keep the current Home Recent Flight presentation grammar; do not replace it with intrinsic whole-string centering;
- eliminate visible horizontal jitter caused by proportional Latin glyph advances in short operational identifiers such as DEP/ARR airport codes;
- treat this as a repeated-system problem, not a one-off optical nudge.

Verified mechanism:
- the current Route renderer centers an entire 3-letter airport string inside a fixed 36px box;
- proportional Latin glyph advances therefore allow equal-length codes such as WAW / ICN / GMP to occupy different internal widths and apparent positions;
- numeric tabular-figure features do not equalize alphabetic advances;
- global monospace substitution would change the product's typographic voice and is not required to solve the geometry.

Candidate system rule:
- preserve the normal product font;
- for fixed-format operational code fields that require stable cross-row comparison, render each character in an equal-width layout cell and center the glyph inside that cell;
- center the complete fixed-cell code group inside the semantic column;
- do not simulate this with letter-spacing alone;
- field-specific cell count and width must follow the field's semantic capacity and be stress-tested with wide glyphs such as W / M plus narrow glyphs such as I / 1.

Home Route candidate geometry:
- IATA DEP = 3 equal character cells;
- arrow = independent fixed zone;
- IATA ARR = 3 equal character cells;
- current 30% Route track (~102.6px in the 342px Recent content width) can be evaluated against a 42 + 18 + 42px candidate geometry.

This is a candidate implementation rule pending rendered proof. The no-jitter requirement and preservation of the current Flight presentation grammar are owner-directed.


### Operational identifier implementation pass

Applied to Home Recent Route:
- DEP and ARR IATA codes render as three equal character cells;
- each cell is 14px at the base 13.5px operational-data size;
- the existing product font is preserved;
- the arrow remains an independent 18px zone;
- base geometry becomes 42 + 18 + 42 = 102px, fitting the current ~102.6px Route track at the 390px reference width;
- each glyph is centered inside its own cell, so proportional glyph advances no longer move subsequent character origins.

This specifically solves layout-position jitter. It does not make different glyph contours visually identical in width, and it does not convert the product to a monospace typeface.

Flight presentation remains unchanged by owner direction.


## Fixed-cell Home-only trial — 2026-09-19

Owner direction:
- trial the alignment treatment on the current Home UI first;
- do not promote it to View Logbook or the whole app until the rendered result is reviewed.

Trial scope:
- Recent Date: 3 month-letter cells + gap + 2 numeric day cells;
- Recent Flight: preserve the existing carrier / number+suffix zoning, but give carrier characters and number/suffix positions fixed origins;
- Recent DEP/ARR: keep the 3-cell IATA treatment;
- Recent Block: retain the existing fixed-width tabular numeric box;
- other Home prose/control text remains proportional.

This trial deliberately does **not** change View Logbook or establish an app-wide renderer rule.

Static stress strings include:
- Date: May 08 / Jul 11 / Nov 28;
- Flight: WW 1123A / II 8888W / KE 28;
- Route: WAW -> ICN / III -> MWM / GMP -> CJU;
- Block: 00+00 / 11+11 / 01+08.

The trial is intended for visual judgment. Its purpose is to determine whether stable character origins improve scan stability enough to justify the additional spacing before any broader rollout.


## Fixed-cell trial rejection and selective monospace follow-up — 2026-09-19

Owner review:
- equal per-character cells produced unacceptable visible spacing in letters and numbers;
- therefore the fixed-cell Home trial is REJECTED as a visual direction and must not be promoted app-wide.

Follow-up candidate:
- restore Date and Flight to the prior Home presentation;
- retain Block tabular numeric treatment;
- trial selective monospace only for short operational alphabetic codes such as DEP/ARR;
- keep general UI typography proportional.

This follow-up is Home-only and remains a candidate. It does not authorize View Logbook or app-wide monospace use.


## Selective monospace weight review — 2026-09-19

Screen review was performed against whole-screen Light/Dark static references and a focused Route/Block crop.

Observed:
- Route monospace at inherited operational-data weight 600 carries too much black/white mass and visually competes with Flight and Block;
- keeping the same 13.5px size and zero extra tracking while reducing only the monospace weight restores a calmer Route treatment;
- in the current Chromium control environment, generic monospace resolves to a regular face for both CSS 400 and 500, so this environment does not provide evidence to distinguish 400 from 500;
- 600 is visibly heavier in both Light and Dark;
- no size reduction is recommended at this stage because that would introduce a new hierarchy level rather than solve the weight mismatch.

Candidate applied:
- Home Recent DEP/ARR selective monospace: weight 400;
- size remains 13.5px;
- letter spacing remains 0;
- Route label and arrow remain in the existing proportional UI system;
- Date, Flight and Block remain unchanged.

Evidence boundary:
- these are static Chromium references;
- actual iOS/Android generic-monospace family resolution and weight mapping remain unverified until native-device review.


## Home Recent Date monospace trial — 2026-09-19

Owner direction:
- before broader rollout, apply the candidate Date treatment to the current Home UI and review the full screen.

Applied:
- Recent Date values use selective monospace at 13.5px / weight 400 / letterSpacing 0;
- numeric date figures retain tabular-figure support;
- Date header remains proportional UI typography;
- DEP/ARR remain selective monospace 13.5px / weight 400;
- Flight keeps the existing carrier + number/suffix presentation;
- Block keeps proportional operational data + tabular figures.

Static screen review:
- Light and Dark references show Date and Route as a coherent secondary operational/identifier voice without the excessive spacing seen in the rejected fixed-cell trial;
- stress dates May 08 / Jul 11 / Nov 28 retain stable character spacing;
- stress routes WAW -> ICN / III -> MWM retain stable code alignment;
- the current Home composition remains within the existing column geometry.

Status:
- Home-only candidate;
- this does not yet promote monospace Date to Activity Detail, View Logbook, or an app-wide typography contract;
- native iOS/Android font-family resolution and physical-device review remain required.


## Current Period semantic closure — 2026-09-19

Owner confirmed that Home Current Period `This month` / `This year` duration values are **Block Time**.

This closes only the metric identity. The following remain outside this visual consolidation and OPEN in canonical product decisions:
- raw versus credited aggregation;
- opening-balance treatment;
- exact operational-date / UTC period boundary;
- real calculation-engine connection.

Current-state implementation values and visual rules are consolidated in `design/HOME_CURRENT_SNAPSHOT.md`.

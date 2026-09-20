# LogMate Master Visual Portfolio v0.2 — Detailed Contract

Status: **ACTIVE / NON-LOCKING / OWNER REVIEW REQUIRED**
Date: 2026-09-18
Branch: `design/first-use-baseline-20260918`
Supersedes: `master-visual-portfolio-v0.1.md` as the active portfolio contract
Governance: `portfolio-governance-contract-20260918.md`

---

# 0. What this document is

This is the detailed contract for rebuilding the LogMate Master Visual Portfolio.

It is deliberately more detailed than a visual board.

The portfolio exists to answer:

> Can Welcome, Previous Total, Empty Home, Add Flight, Home, View Logbook, Settings and EFB/PWA all grow from one LogMate visual language without semantic distortion, framework-generic drift or later implementation rework?

This document does **not** lock UI.

Portfolio approval means only:
- the overall visual language is coherent enough to continue;
- screen families may proceed into dedicated review;
- downstream code/design may use this as a continuity reference.

Actual UI lock remains screen-family specific.

---

# 1. Evidence snapshot

## Product authority
- `yhappcom/logmate@main`
- observed head: `b551ce43`

## Forward engineering evidence
- `yhappcom/logmate@feature/data001-domain`
- observed head: `14a3bfa5`

Current engineering advances materially relevant to UI:
- canonical `PreviousTotalBaseline`;
- canonical Known Field metadata;
- local repository and persistence;
- timeline/page projection foundation;
- owner access persistence;
- manual Flight create/application seams;
- targeted View Logbook read;
- browser/PWA/iOS/Android/host CI evidence.

These remain forward engineering evidence, not automatic product authority.

## Active first-use design branch
- `design/first-use-baseline-20260918`

## Design Studio latest observed
- Type: T052
- Color: C083
- Layout / Interaction: L074 / I070
- Web: W083
- Content: CD089

## Cross-repo inputs
- Software Engineering Studio
- Web Manager
- Marketing Manager

## Rejected visual reference
The broad blue multi-screen portfolio image generated on 2026-09-18 is **REJECTED** and has no visual precedent value.

---

# 2. Portfolio design objective

The target is not a "portfolio-looking" product.

The target is a real specialist utility whose visual identity remains stable from first launch to dense operational ledger use.

Core product character:

- Calm
- Exact
- Operational
- Legible
- Trustworthy
- Non-theatrical

Primary principle:

> **Macro Calm / Micro Precision**

Secondary principle:

> **Datum Before Container**

Interpretation:
- quiet shell;
- exact operational data;
- density grows from real content;
- hierarchy begins with type, alignment, spacing, luminance and rule ownership;
- containers exist only when interaction or grouping actually requires them.

---

# 3. Visual language boundaries

## Must not become

- aviation-themed lifestyle UI;
- cockpit/HUD simulation;
- generic Material demo;
- SaaS dashboard;
- AI-generated card collage;
- luxury minimalism that sacrifices task speed;
- dense professional tool that becomes visually harsh everywhere;
- onboarding marketing carousel;
- Store screenshot art disguised as product UI.

## Professional credibility comes from

- correct aviation/logbook semantics;
- consistent operational numerics;
- restrained state treatment;
- clear hierarchy;
- predictable placement;
- full professional labels;
- stable focus/recovery behavior;
- dense data only where real data exists.

---

# 4. Density continuum

The product should move through one continuous density gradient.

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

This is not seven separate styles.

Identity carriers change by context:

| Surface | Main identity carrier |
| --- | --- |
| Welcome | typography, spacing, action hierarchy |
| Previous Total | numeric precision + semantic labels |
| Empty Home | workspace framing |
| Add Flight | fast professional form grammar |
| First Populated Home | first real record + emerging structure |
| Mature Home | aligned operational summaries |
| View Logbook | ledger/grid precision |

---

# 5. Working typography system

These are **portfolio baselines**, not production tokens.

| Role | Working size |
| --- | ---: |
| Exceptional identity | 34 |
| Page/task title | 20 |
| Section/choice emphasis | 17 |
| Operational numeric emphasis | 17 |
| Body | 15 |
| Field label | 15 |
| Action label | 15 |
| Helper/error/status | 15 |

Rules:
- do not create 10–13 px tiers to manufacture density;
- do not shrink type to solve layout pressure;
- do not use negative tracking as rescue;
- do not abbreviate full semantic labels simply to preserve one-line geometry;
- if label/value relation fails, recompose to stacked layout;
- whole-app monospace is rejected;
- tabular/operational numeral treatment is allowed where actual values justify it;
- custom LogMate type remains gated by Type research; composition must survive a mature fallback first.

Pressure corpus:
- `99,999+59`
- `Instrument Flight Time`
- `Previous Total`
- `Carry forward previous totals`
- `01 JAN 2022`
- `I / l / 1 / O / 0`

Latest Type T052 does not justify compression. Dynamic-state pressure returns to Layout/Interaction if mature type renders correctly.

---

# 6. Spacing and alignment system

Working spacing family:

`4 / 8 / 12 / 20 / 28 / 36`

Phone working page inset:
approximately `24`.

Rules:
- whitespace must communicate grouping or attention;
- no repeated "premium" empty space without structural purpose;
- form rows may grow;
- error/helper insertion must not overlap the next semantic object;
- data columns align by semantic relationship, not arbitrary equal-width cards;
- wide surfaces should not automatically become multi-column.

---

# 7. Surface grammar

Default order of preference:

1. page
2. section
3. datum
4. rule
5. field locus
6. container only where needed

Avoid:
- card inside card;
- one rounded card per fact;
- elevation/shadow as brand identity;
- full-screen panelization without interaction need.

Existing product contracts that require containment are retained until deliberately changed.

---

# 8. Color grammar

No final HEX values are frozen.

Principles:
- luminance before hue;
- brand accent has one job at a time;
- selected / focused / error / disabled / read-only / recovery are distinct axes;
- color never owns meaning alone;
- selected state must survive grayscale;
- error must remain identifiable without red;
- focus must move with semantic ownership.

Latest C083 transfer:
when a focused object disappears, visual focus must migrate to the declared semantic fallback owner. Never keep stale focus paint at the old ordinal location.

---

# 9. Interaction/focus grammar

Current Design Studio transfer adds an important system rule.

Stable semantic identity owns:
- focus;
- recovery;
- mutation feedback;
- fallback destination.

Not:
- row index;
- visual order alone;
- English display label alone.

If an object disappears:
1. prefer semantic survival if possible;
2. otherwise choose a deterministic logical survivor/workflow destination;
3. reveal that destination;
4. do not generic-unfocus to root/body without reason.

This matters later for:
- Customize hide/reset;
- optional Previous Total semantic removal;
- dynamic forms;
- recovery flows;
- responsive recomposition.

---

# 10. Advertising grammar

Advertising is not a LogMate component.

Protected / no-ad:
- Welcome
- Previous Total
- Empty Home before first value
- Add First Flight
- first-save transition
- First Populated Home
- Import / Review / Reconcile
- Restore / Recovery / Migration
- Sign in / Owner recovery
- View Logbook
- View Logbook Customize
- Settings trust/control
- Search initially

Primary candidate:
- Mature returning-user Home
- anchored adaptive bottom banner
- only with pre-reserved stable geometry

Secondary candidate:
- read-only Activity / Totals detail

Hold:
- App Open
- Interstitial
- Recent inline
- PWA ads
- Rewarded

Rewarded inventory remains zero unless a genuine additive non-core reward independently exists.

---

# 11. Frame 01 — Welcome

## A. Role
First identity + intent selection for a genuinely new/unbound user.

Returning/restored users normally bypass it.

## B. Product truth
Primary:
- Start a new logbook

Secondary:
- Sign in

## C. Required
- LogMate identity;
- product category recognition such as Pilot Logbook where needed;
- clear primary/secondary actions;
- enough quiet space for orientation.

## D. Forbidden
- fake Flight;
- fake totals;
- route/registration examples;
- aircraft image used as brand atmosphere;
- feature tour;
- sync/offline claims;
- backup claims;
- ad;
- marketing slogan not derived from product contract.

## E. Hierarchy
1. identity
2. new-user action
3. existing-user action

## F. Component grammar
- page-level identity
- primary action
- secondary action
- no card system

## G. Density
Lowest product density.

## H. Responsive
- vertical composition remains simple;
- tablet/EFB does not need a split marketing panel by default;
- 200% text must preserve both actions without overlap.

## I. States required later
- normal first launch;
- large text;
- short height;
- offline availability if product entry behavior requires state exposure;
- incoming preserved intent, if deep-link continuity is later implemented.

## J. Ads
No ads.

## K. Dependencies
- startup/owner-access product behavior;
- exact auth orchestration;
- final identity typography.

## L. Lock
- product direction: DIRECTION LOCKED
- visual: OPEN
- portfolio: pending approval

---

# 12. Frame 02 — Previous Total / Starting Point

## A. Role
Explicit ledger starting-boundary decision before first manual Flight.

## B. Product truth
Two mutually exclusive assertions:
- Start from zero
- Carry forward previous totals

No implicit zero.

## C. Required
- concept explanation;
- two explicit choices;
- consequence of each choice;
- Continue after valid decision.

## D. Forbidden
- generic preference-setting tone;
- nested numeric fields inside choice rows;
- feature list;
- View Logbook Customize controls;
- fake default values.

## E. Hierarchy
1. Previous Total concept
2. starting-point decision
3. consequence
4. Continue

## F. Component grammar
- selection row, not giant radio card;
- structural selected mark;
- consequence text;
- document-order primary action.

## G. Density
Low–medium.

## H. Responsive
- choice label/consequence can wrap;
- no type reduction;
- control and text remain associated at large text.

## I. States
- undecided;
- zero selected;
- carry selected;
- focus/keyboard path;
- disabled Continue;
- 200%.

## J. Ads
No ads.

## K. Dependencies
- explicit zero UX semantics;
- baseline persistence representation;
- owner/access entry.

## L. Lock
Direction: LOCKED
Visual: OPEN

---

# 13. Frame 03 — Previous Total / Carry Forward

## A. Role
First operational numeric entry surface.

## B. Product truth
Production-domain direction:
- sparse baseline;
- only user-entered semantics;
- only total-eligible Known Fields;
- omitted != zero;
- zero is a valid quantity.

## C. Required
- full semantic label;
- one value editor per semantic;
- add-previous-total path;
- local validation slot;
- Continue.

## D. Forbidden
- two-box hour/minute editor;
- compact ledger abbreviations as form labels;
- invisible error;
- all 35 fields at once;
- View Logbook visibility controls.

## E. Hierarchy
1. context
2. semantic label
3. value
4. local helper/error
5. add optional semantic
6. Continue

## F. Component grammar
Current direction:
- full label;
- right-aligned H+MM editor where width allows;
- quiet rule/boundary;
- stronger focus locus;
- local helper/error slot.

## G. Density
Medium.

## H. Responsive
Normal:
`Instrument Flight Time        1,125+30`

When relationship fails:
```
Instrument Flight Time
1,125+30
────────
```

## I. Required state family
- carry empty;
- raw focus;
- normalized;
- `99,999+59`;
- local error;
- optional semantic added;
- 200% stacked;
- short-height + IME;
- earlier-boundary review.

## J. Ads
No ads.

## K. Dependencies
- final eligible semantic set;
- duration validation;
- partial baseline rule;
- persisted semantic removal;
- count-value grammar.

## L. Lock
Direction: LOCKED
Visual: OPEN

---

# 14. Frame 04 — Empty Home

## A. Role
Real workspace before first Flight.

## B. Product truth
No records yet.

## C. Required
- Add Flight primary;
- Import available but optional;
- Previous Total state/recovery access;
- Home identity.

## D. Forbidden
- fake Recent;
- fake Activity;
- zero-filled KPI cards;
- fake Totals;
- fake search results;
- banner ad before first value.

## E. Hierarchy
1. Add Flight
2. Import
3. baseline status
4. secondary navigation

## F. Component grammar
- workspace, not empty marketing card;
- no decorative illustration required;
- action hierarchy should transfer to populated Home.

## G. Density
Low–medium.

## H. Responsive
Must share the same shell as populated Home.

## I. States
- baseline zero;
- baseline set;
- baseline needs review;
- import path available;
- PWA/native differences only when actual behavior requires them.

## J. Ads
No ads.

## K. Dependencies
- final Home shell;
- auth/owner access;
- import entry behavior.

## L. Lock
Direction: LOCKED
Visual: OPEN

---

# 15. Frame 05 — Add First Flight

## A. Role
First real operational record creation.

## B. Product truth
Current product field semantics remain authoritative.

Forward engineering has:
- manual create planner/service;
- guarded binding;
- airport/time adapters;
- local repository session;
- owner-access foundation.

Actual production Save UI binding remains incomplete.

## C. Required
- current core Flight fields;
- fast-entry efficiency;
- clear Save;
- field-level validation;
- Previous Total visual-language transfer.

## D. Forbidden
- onboarding marketing;
- ad;
- unnecessary sparse presentation;
- inferred data not supported by engineering contract.

## E. Hierarchy
1. operational essentials
2. expandable optional details
3. Save
4. local error/recovery

## F. Component grammar
Transfer from Previous Total:
- semantic labels;
- focus;
- error;
- action hierarchy.

Do not force Previous Total layout onto Add Flight if it reduces efficiency.

## G. Density
Medium–high.

## H. Responsive
- keyboard and short-height are primary constraints;
- tablet may exploit width only where relationships justify it.

## I. States
- pristine;
- focused;
- partially valid;
- validation blocked;
- save pending/local committed if implementation later exposes these;
- save error.

## J. Ads
No ads.

## K. Dependencies
- owner gate;
- actual Save binding;
- dayOffset and crew decisions;
- calculation integration.

## L. Lock
Product structure: KEEP
Visual: OPEN

---

# 16. Frame 06 — First Populated Home

## A. Role
First proof that the user's data has become real product value.

## B. Product truth
One or very few real records.

## C. Required
- first real record;
- Add Flight;
- View Logbook;
- only summaries that are semantically valid at that point.

## D. Forbidden
- ad;
- fake mature dashboard;
- invented lifetime Total Time;
- feature-tour celebration.

## E. Hierarchy
1. real personal result
2. next useful action
3. emerging summary structure

## F. Component grammar
Must be the same Home system as Mature Home.

## G. Density
Medium.

## H. Responsive
No special first-use-only shell.

## I. States
- one record;
- few records;
- baseline present/absent;
- calculation sections unavailable/available.

## J. Ads
No ads.

## K. Dependencies
- actual Home data binding;
- total semantics;
- View entry.

## L. Lock
Portfolio-critical
Visual: OPEN

---

# 17. Frame 07 — Mature Home / no-ad state

## A. Role
Recurring primary workspace.

## B. Product truth
Preserve current functional families:
- Add Flight;
- View Logbook;
- Search;
- Recent;
- Activity;
- Totals;
- Settings access.

## C. Required
- fast access to core actions;
- real recent record context;
- readable activity/totals;
- clear hierarchy without dashboard-card proliferation.

## D. Forbidden
- generic KPI dashboard;
- one equal card per section;
- generic lifetime hero if semantics remain unresolved;
- accent-only selection.

## E. Hierarchy
1. core actions
2. current useful context
3. recent
4. activity
5. totals
6. secondary access

## F. Component grammar
Prefer:
- datum planes;
- aligned readouts;
- ledger excerpt;
- section rules;
- restrained containers.

## G. Density
Medium–high.

## H. Responsive
- phone portrait primary;
- wider surfaces may recompose;
- no automatic equal card grid.

## I. States
- normal;
- no search data;
- partial calculation availability;
- local/pending/recovery states only when truthful.

## J. Ads
No-ad state must remain first-class.

## K. Dependencies
- TOTAL-002 / TOTAL-004;
- search implementation;
- activity data;
- actual repository binding.

## L. Lock
IA: KEEP
Visual: OPEN

---

# 18. Frame 08 — Mature Home / ad-eligible state

## A. Role
Same Mature Home with legitimate passive monetization.

## B. Product truth
Ad eligibility is not universal.

## C. Required
- same core Home hierarchy as no-ad state;
- reserved banner region;
- clear separation;
- no layout jump.

## D. Forbidden
- banner adjacent to core controls;
- fake ad content in design mock;
- ad-styled-as-LogMate content;
- collapsible banner by default.

## E. Hierarchy
Product content remains primary.
Ad is outside the product hierarchy.

## F. Component grammar
Ad region is layout infrastructure, not a LogMate card.

## G. Density
Same as Mature Home.

## H. Responsive
Native only as current candidate.
PWA remains separate decision.

## I. States
- eligible;
- no-fill;
- protected intent;
- ad unavailable.

## J. Ads
Anchored adaptive bottom banner candidate.

## K. Dependencies
- ad SDK;
- geometry validation;
- useful-return measurement.

## L. Lock
Ad policy direction: candidate
Visual: OPEN

---

# 19. Frame 09 — View Logbook

## A. Role
Signature professional surface.

## B. Product truth
Preserve current confirmed ledger behavior:
- phone landscape;
- both landscape directions;
- stable semantic columns;
- continuous pages;
- active/completed distinctions;
- Page/Previous/New Total chain;
- 36px row/header rhythm where current product contract owns it;
- neutral total hierarchy.

## C. Required
- strong column alignment;
- compact headers;
- readable totals;
- controlled horizontal/vertical navigation;
- visible current context.

## D. Forbidden
- ad;
- card conversion;
- decorative aviation chrome;
- fake dense data as atmosphere;
- semantic compression that changes meaning.

## E. Hierarchy
1. ledger data
2. page/context controls
3. totals
4. Customize

## F. Component grammar
Grid/rule system, not card system.

## G. Density
Highest.

## H. Responsive
Phone landscape and larger surfaces may differ spatially but preserve semantic projection.

## I. States
- first-use Empty;
- baseline-only Empty;
- populated Active;
- Completed;
- trailing Empty Active;
- unresolved boundary diagnostic.

## J. Ads
No ads.

## K. Dependencies
- real-data binding;
- renderer tuning;
- exact widths;
- record tap behavior;
- configuration persistence.

## L. Lock
Core structure: KEEP
Final visual: OPEN

---

# 20. Frame 10 — Settings / trust-control

## A. Role
Lower-frequency control without generic ListTile identity.

## B. Product truth
Only implemented/truthful controls may be shown as final.

## C. Required candidate families
- account/owner;
- rows/page;
- Previous Total review;
- import/export when real;
- backup/sync only when real;
- support/help.

## D. Forbidden
- ads;
- generic green "all synced";
- "backed up" without evidence;
- "works offline" as broad superlative;
- decorative settings cards.

## E. Hierarchy
1. data/owner controls
2. logbook configuration
3. import/export
4. support

## F. Component grammar
Rows/sections with semantic status, not default Material ListTile look.

## G. Density
Medium.

## H. Responsive
Wide settings may use bounded two-region structure only when master-detail relation is real.

## I. States
- owner unlocked;
- owner locked;
- local-only/unbound;
- pending/recovery only when actual product exposes them.

## J. Ads
No ads.

## K. Dependencies
- owner orchestration;
- backup/sync implementation;
- Settings product decisions.

## L. Lock
Visual: OPEN

---

# 21. Frame 11 — Sign in / Owner Recovery

## A. Role
Continuity/access path, not product protagonist.

## B. Product truth
Forward engineering has durable owner-access metadata:
- unbound;
- bound + unlocked;
- bound + locked after explicit sign-out.

Production application orchestration remains incomplete.

## C. Required
- identity/account action;
- clear consequence;
- same-owner recovery;
- fail-closed different-owner condition when relevant.

## D. Forbidden
- auth-first product framing;
- ad;
- sync promise as reason to sign in unless truthful;
- generic SaaS auth card as visual precedent.

## E. Hierarchy
1. access state
2. required action
3. recovery/support

## F. Component grammar
Use core LogMate type/action/field grammar.

## G. Density
Low–medium.

## H. Responsive
Simple bounded form.

## I. States
- sign in;
- verification;
- locked local ledger;
- different owner;
- retry/recovery.

## J. Ads
No ads.

## K. Dependencies
- LocalLedgerAccessCoordinator;
- auth orchestration;
- verification flow.

## L. Lock
Visual: OPEN

---

# 22. Frame 12 — EFB / PWA adaptation

## A. Role
Same product identity under different platform/runtime constraints.

## B. Product truth
Native and PWA are first-class targets but not runtime-equivalent.

## C. Required
- same semantic content;
- same calculation/projection result;
- platform-appropriate layout adaptation;
- room for update/degraded state when actual product requires it.

## D. Forbidden
- universal install step;
- native-style background-sync promise;
- backup claim derived from browser storage;
- ad parity requirement.

## E. Hierarchy
Task remains primary.

## F. Component grammar
Same system components, recomposed by constraint.

## G. Density
Depends on surface, not platform.

## H. Responsive
Relationship-driven.
Do not center a phone UI in a wide blank canvas.

## I. States
Future:
- offline local availability;
- update waiting;
- storage risk;
- degraded capability;
- owner/access state.

## J. Ads
PWA advertising HOLD.

## K. Dependencies
- actual managed EFB acceptance;
- service worker lifecycle;
- storage/recovery;
- platform policy.

## L. Lock
Visual-language continuity: DIRECTION LOCKED
Runtime UI: OPEN

---

# 23. Frame 13 — Degraded / Recovery specimen

## A. Role
Prove the design system can represent uncertainty.

## B. Product truth
Engineering/Web require distinctions such as:
- local save;
- sync pending;
- acknowledged;
- reconciled;
- backup;
- conflict;
- review;
- failure.

Do not expose all states unless product implementation actually has them.

## C. Required
- semantic state;
- consequence;
- next safe action;
- preserved data truth.

## D. Forbidden
- generic red error box for every state;
- generic green success;
- "retry fixed it" without semantic confirmation.

## E. Hierarchy
1. what is known
2. what is unresolved
3. what user can safely do

## F. Component grammar
Status + supporting copy + action.
No alarmist modal unless blocking consequence requires it.

## G. Density
Medium.

## H. Responsive
Message and action must reflow without truncating semantic identifiers.

## I. States
One representative specimen initially.
Real product states later.

## J. Ads
No ads.

## K. Dependencies
Actual runtime state contracts.

## L. Lock
Principle: DIRECTION LOCKED
Exact UI: OPEN

---

# 24. Appendix A — Import-first continuity

Import remains optional.

Portfolio must later prove:

```
Empty Home
→ Import
→ Parse/Preview
→ Reconcile accepted canonical records
→ determine earliest accepted record
→ Previous Total if required
→ Confirm
→ Home / View
```

No import tutorial before user chooses Import.

No ad in this flow.

---

# 25. Appendix B — Earlier-boundary baseline review

Trigger:
accepted/manual record set moves earliest-known Flight earlier.

Required:
- previous boundary;
- new boundary;
- current baseline as reference;
- new baseline entry;
- clear explanation.

Do not:
- silently subtract imported totals;
- automatically preserve old baseline as valid;
- color-code the entire problem without text.

---

# 26. Appendix C — Large text / 200%

Portfolio-level proof must include:
- Welcome;
- Previous Total choice;
- Previous Total H+MM;
- one Home section;
- one ledger/control context where applicable.

Rules:
- reflow before shrink;
- no clipped full labels;
- no overlay CTA obscuration;
- focus reveal targets the semantic object.

---

# 27. Appendix D — Advertising states

Portfolio should eventually show:
1. First Populated Home — no ad.
2. Mature Home — no-ad.
3. Mature Home — reserved banner candidate.
4. View Logbook — no ad.
5. optional Totals/Activity read-only ad candidate.

Do not use real ad creative in the design portfolio.
Use a neutral placeholder region only when geometry is being reviewed.

---

# 28. Portfolio approval checklist

Portfolio is ready for owner approval only when:

## Identity
- same app from Welcome to View Logbook;
- no fresh unresearched brand language;
- no generic framework visual identity dominates.

## First-value continuity
- required setup is minimal;
- no marketing tour;
- no ad interruption;
- no auth-first bias;
- first real Flight remains visible as the core value path.

## Density
- low-density first-use and high-density ledger feel related;
- Home bridges them convincingly.

## Typography
- 20/17/15 working hierarchy survives;
- `99,999+59` fits;
- full semantic labels survive;
- no microtext rescue.

## State truth
- blank != zero;
- focus/error/read-only/selected remain distinct;
- degraded/recovery specimen is truthful.

## PWA/native
- same product identity;
- no false capability equivalence.

## Advertising
- ads do not define layout;
- protected flows remain ad-free;
- mature Home can accept a reserved banner without redesign.

## Implementation readiness
- no visual decision contradicts current code/engine direction;
- open technical dependencies are localized rather than blocking unrelated screens.

---

# 29. What portfolio approval will authorize

Portfolio approval authorizes:

1. Welcome dedicated screen-family review.
2. Previous Total dedicated screen-family review.
3. Empty Home dedicated screen-family review.
4. Add Flight transfer review.
5. Home visual finalization.
6. View Logbook visual tokenization.
7. Settings/PWA/recovery transfer.

It does not authorize production implementation by itself.

---

# 30. Next execution step

After this contract is accepted:

1. build one restrained visual continuity board using only the rules above;
2. no new slogans, photography, blue brand system or invented widgets;
3. show only enough fidelity to judge identity, hierarchy, density and transfer;
4. use neutral/provisional content where exact screen details remain open;
5. then begin Welcome screen-family design separately.


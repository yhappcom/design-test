> **SUPERSEDED FOR GOVERNANCE** — active design-process authority has moved to `design/README.md`, `design/DECISIONS.md`, `design/VISUAL_BASELINE.md`, and `design/ROOT_CAUSE_AUDIT_20260918.md`. This file remains historical design evidence only and does not create product/UI lock.

# LogMate Portfolio Governance Contract

Status: **ACTIVE GOVERNANCE CONTRACT**
Date: 2026-09-18
Branch: `design/first-use-baseline-20260918`

## 0. Decision operating model

Owner-review and candidate/revision workflow is governed by `design-decision-operating-model-20260918.md`. The owner is the decision maker; research synthesis and cross-repo integration are coordinator responsibilities. Local feedback must preserve candidate lineage unless the direction is explicitly rejected or contradicted by authoritative evidence.

## 1. Purpose

The LogMate portfolio is a **design coordination and review instrument**, not a UI-locking artifact.

Its purpose is to:
- show how Welcome, onboarding, Home, Add Flight, View Logbook, Settings, PWA/EFB and monetization belong to one product;
- expose visual contradictions before implementation;
- carry current product, engineering, Design Studio, Web and Marketing constraints into design review;
- keep design progress synchronized with code/engine progress;
- accelerate later implementation by pre-resolving system-level visual relationships.

The portfolio must **not** lock a screen merely because a screen appears in the portfolio.

## 2. Authority model

### Product authority
`MASTER.md` and confirmed subordinate product/domain specs.

### Forward engineering evidence
Current feature/engineering branches may inform design but do not automatically supersede product authority.

### Design research authority
Design Studio canonical research informs judgment and validation criteria.

### Portfolio authority
The portfolio may establish:
- visual direction;
- cross-screen continuity expectations;
- provisional component families;
- candidate layout grammar;
- candidate monetization envelopes;
- unresolved contradictions.

The portfolio may **not** establish:
- final screen geometry;
- final typography tokens;
- final color tokens;
- final control dimensions;
- final field behavior;
- production accessibility PASS;
- final runtime behavior;
- production implementation authorization.

## 3. Lock separation

Portfolio approval and UI lock are separate events.

### Portfolio Approval
Means:
- the overall product image is coherent;
- the selected visual language is worth extending;
- the density progression is credible;
- first-use and mature states feel like one app;
- no major cross-screen contradiction is visible;
- the direction is suitable for screen-by-screen refinement.

Portfolio Approval does **not** mean:
- individual screen UI is frozen;
- exact copy is frozen;
- exact spacing/font/color is frozen;
- individual component behavior is final.

### Screen Family Direction Lock
Granted only after a dedicated review of one screen family.

Examples:
- Welcome family
- Previous Total family
- Empty Home family
- Add Flight family
- Home family
- View Logbook family
- Settings family

Direction Lock freezes:
- role;
- hierarchy;
- major interaction model;
- major information architecture;
- major state relationships.

It does not freeze:
- exact token values;
- all runtime details.

### Screen Family Visual Lock
Granted only after:
- required states are shown;
- long-text/large-data pressure states are shown;
- focus/error/disabled/read-only states are resolved;
- cross-screen transfer has been checked;
- owner explicitly approves the family.

Only then may exact layout/component visual grammar be treated as frozen enough for implementation.

### Implementation Lock
Granted only after actual Flutter/PWA implementation and required runtime/device validation.

## 4. Explicit non-lock rule

A portfolio image, collage, storyboard, AI-generated mockup or presentation board has **zero lock authority by itself**.

No UI may be marked VISUAL LOCKED because:
- it looks polished;
- it appeared in the master portfolio;
- it was generated from a prompt;
- it visually resembles a previous draft.

Only a documented screen-family review plus explicit approval can create Visual Lock.

## 5. Continuity-before-detail rule

The portfolio is allowed to stay visually approximate where needed.

Its first job is to prove:
- Welcome → Previous Total → Empty Home → Add First Flight → First Populated Home → Mature Home → View Logbook continuity;
- native → PWA/EFB continuity;
- ad-free protected flow → monetized mature Home continuity;
- calm first-use → dense professional ledger continuity.

Fine detail belongs to screen-family work after portfolio approval.

## 6. Portfolio construction rule

The portfolio must be built **from existing approved/researched direction**, not from a fresh visual invention pass.

For every portfolio frame:
1. identify the latest product truth;
2. identify current engineering implications;
3. identify current Design Studio guidance;
4. identify current screen-specific design evidence;
5. reuse previously supported visual relationships;
6. only invent missing composition where there is no prior direction;
7. label that invention as provisional.

## 7. Drift prevention rule

A new portfolio frame must not silently introduce:
- a new brand color system;
- a new typography hierarchy;
- a new button style;
- a new card system;
- a new icon language;
- a new navigation model;
- a new onboarding metaphor;
- new marketing slogans;
- fake flight data;
- new ad formats;
- new auth/backup/sync claims.

If a new element is necessary, it must be recorded as:
`NEW PROVISIONAL ELEMENT — REVIEW REQUIRED`.

## 8. Portfolio detail level

The portfolio should be **detailed in documentation, selective in visual fidelity**.

Documentation should capture:
- frame purpose;
- product truth;
- required content;
- forbidden content;
- hierarchy;
- component families used;
- density;
- responsive behavior;
- state requirements;
- ad eligibility;
- dependencies;
- open questions;
- transfer risks.

Visuals should capture:
- composition;
- density;
- hierarchy;
- cross-screen identity;
- major component grammar.

Visuals do not need to finalize:
- all microcopy;
- all spacing values;
- all error text;
- all edge states;
- all accessibility/runtime details.

## 9. Portfolio frame contract template

Every core frame must contain:

### A. Role
Why the frame exists.

### B. Product truth
What is authoritative.

### C. Required content
What must appear.

### D. Forbidden content
What must not appear.

### E. Hierarchy
Primary / secondary / tertiary.

### F. Component grammar
Which system components are used.

### G. Density level
Macro Calm ↔ Micro Precision position.

### H. Responsive behavior
What changes under narrow/wide/large text.

### I. State coverage
What additional states are required later.

### J. Ad policy
No ads / candidate / hold.

### K. Dependencies
Engineering / PWA / Marketing / product dependencies.

### L. Lock status
OPEN / PORTFOLIO-APPROVED / DIRECTION LOCKED / VISUAL LOCKED / IMPLEMENTATION LOCKED.

## 10. Current portfolio sequence

Core:
1. Welcome
2. Previous Total — starting point
3. Previous Total — carry forward
4. Empty Home
5. Add First Flight
6. First Populated Home
7. Mature Home — no ad
8. Mature Home — ad-eligible
9. View Logbook
10. Settings / trust-control specimen
11. Sign in / owner recovery
12. EFB/PWA adaptation
13. Degraded/recovery specimen

Appendix:
- import-first path;
- earlier-boundary Previous Total review;
- 200% text;
- short-height + IME;
- night/forced-color candidate;
- Activity/Totals monetization candidate.

## 11. Current protected decisions

These may appear in the portfolio because they are already supported, but appearance does not elevate them beyond their current lock level:
- no fake Welcome data;
- Start a new logbook primary / Sign in secondary;
- Previous Total before first manual Flight;
- explicit zero vs carry forward;
- blank != zero;
- one H+MM editor per duration semantic;
- true Empty Home;
- first-value-critical flow ad-free;
- first populated Home ad-free;
- View Logbook ad-free by default;
- Mature Home as primary banner candidate;
- native/PWA same product identity, different capability truth;
- Macro Calm / Micro Precision;
- Datum Before Container;
- no aviation cosplay.

## 12. Portfolio rejection criteria

Reject or rework the portfolio if:
- it looks like a generic pitch deck rather than a real product;
- it introduces a new visual language not supported by prior research;
- the Welcome style cannot transfer to Home/View Logbook;
- the mature Home style cannot transfer backward to first-use;
- fake content is used to create credibility;
- ads visually dominate the product;
- marketing slogans replace product semantics;
- the visual direction depends on unresolved engineering claims;
- the board looks cohesive only because every screen has been forced into the same card template;
- the board is too abstract to inform implementation.

## 13. Last generated visual board

The broad multi-screen visual board generated on 2026-09-18 is classified:

**REJECTED AS PORTFOLIO DIRECTION / REFERENCE ONLY**

Reasons:
- it introduced a materially different visual tone from the prior first-use work;
- it behaved like a presentation board rather than a product-system continuation;
- it introduced unsupported slogans, imagery and blue-heavy visual identity;
- it used illustrative UI that could be mistaken for design decisions;
- it did not preserve enough continuity with the researched first-use direction;
- it risked accidental UI locking through polish rather than evidence.

It must not be used as a screen-lock reference.

## 14. Update governance

Scheduled research and parallel engineering continue.

A portfolio update is required only when new evidence materially changes:
- product truth;
- state model;
- first-value path;
- platform capability;
- ad eligibility;
- screen hierarchy;
- component transfer;
- visual-language constraint.

Do not redraw the whole portfolio for every new study.

Record impact as:
- NO IMPACT
- NOTE
- PORTFOLIO UPDATE
- SCREEN REWORK
- REOPEN REQUIRED

## 15. Release-speed principle

The portfolio exists to reduce delay, not create a new research bottleneck.

Therefore:
- broad research continues in parallel;
- portfolio direction may be approved while some implementation details remain open;
- screen families are locked progressively;
- production code can proceed against locked families;
- unresolved items stay local to the affected component/screen rather than blocking unrelated UI.


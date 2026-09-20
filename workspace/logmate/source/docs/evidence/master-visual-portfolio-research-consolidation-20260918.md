# LogMate Master Visual Portfolio — Research Consolidation & Input Hierarchy

Status: **PORTFOLIO PREPARATION / CONSOLIDATION**
Date: 2026-09-18
Purpose: define what evidence may feed the next LogMate Master Visual Portfolio, what is historical, what is current-but-unmerged engineering evidence, and what must remain OPEN.

## 1. Why consolidation is required

LogMate now has four materially different evidence streams:

1. product authority on `main`;
2. very advanced but unmerged technical work on `feature/data001-domain`;
3. Design Studio canonical specialist research on `yhappcom/design-studio@main`;
4. multiple generations of visual exploration on LogMate design branches.

The visual portfolio must not treat all four as equal authority.

The risk is no longer insufficient research. The risk is **mixing obsolete explorations, provisional visual decisions, current product contracts and forward engineering implementation into one presentation without provenance**.

Therefore the next portfolio must be built from a curated input hierarchy rather than from direct reading of every historical design file.

## 2. Evidence hierarchy for the portfolio

### Tier A — current product authority

Primary:
- `yhappcom/logmate@main/MASTER.md`
- current authoritative `docs/specs/*` subordinate to MASTER

Use for:
- confirmed product semantics;
- current interaction contracts;
- confirmed View Logbook behavior;
- field/configuration meaning;
- existing navigation/product scope.

Caution:
- `main` is materially behind current technical implementation work.
- It remains product authority unless/until newer decisions are merged or explicitly adopted.

### Tier B — current technical implementation evidence

Reference branch:
- `feature/data001-domain`
- observed head: `14a3bfa542720d33869eee8fcf648225321304e5`
- branch is currently hundreds of commits ahead of `main`.

Use as **forward implementation evidence**, not automatic product authority.

Major portfolio-relevant advances observed:
- production-domain `PreviousTotalBaseline`;
- closed Known Field inventory / total metadata foundation;
- canonical Flight/Simulator record domain;
- local repository/persistence;
- timeline/page projection foundation;
- local owner-access persistence;
- AUTH-001 local owner-access behavior documented/implemented in the branch;
- manual Flight creation/application binding seams;
- targeted View read path;
- browser/PWA/iOS/Android/host CI validation artifacts.

Do not promote branch implementation into final product/UI truth unless:
- the corresponding product decision is confirmed;
- the portfolio labels it as current engineering direction where still unmerged.

### Tier C — Design Studio canonical research

Source:
- `yhappcom/design-studio@main`

Current specialist maturity observed:
- Type: Stage 1 PASS; Stage 2 PRACTICE, latest T051 transfer corpus;
- Color: Stage 1/2 PASS; Stage 3 PRACTICE, latest C082;
- Layout/Interaction: Stage 1/2 PASS; Stage 3 PRACTICE, latest L073/I069;
- Web: Stage 1/2 PASS; Stage 3 PRACTICE, latest W082;
- Content: Stage 1/2 PASS; Stage 3 PRACTICE, latest CD088.

Use for:
- visual hierarchy;
- type roles and pressure handling;
- luminance/state systems;
- responsive/reflow/focus/interaction geometry;
- browser/PWA transfer criteria;
- content/state/recovery semantics.

Do not claim:
- production visual PASS;
- physical-device PASS;
- AT/screen-reader PASS;
- representative-pilot usability/comprehension PASS;
- custom LogMate type production readiness.

### Tier D — current first-use design proposal

Branch:
- `design/first-use-baseline-20260918`

Current durable artifacts:
- `first-use-previous-total-baseline-policy.md`
- `first-use-baseline-composition-spec.md`
- `previous-total-interaction-input-detail-spec.md`
- `previous-total-state-matrix-20260918.md`
- `first-use-visual-scale-composition-contract-20260918.md`
- `first-use-research-progress-20260918.md`

Use as the **current first-use/onboarding design working set**.

This branch defines the strongest current design direction for:
- Welcome with no fabricated operational data;
- Start a new logbook / Sign in split;
- Previous Total before first manual Flight;
- import/backfill baseline handling;
- blank vs explicit zero;
- single H+MM cumulative input;
- 20/17/15 first-use visual scale baseline;
- state matrix and reflow requirements.

It remains design research, not production approval.

### Tier E — historical visual exploration

Primary historical/reference branch:
- `design/visual-language-working`

Useful only through its own reconciliation documents:
- `visual-sot-reconciliation-audit.md`
- `visual-production-reconciliation-map.md`
- latest review/decision packages

Do **not** use old exploration files directly as active direction without checking whether they were later KEEP/REWORK/REJECT/SUPERSEDED.

Examples of already reconciled historical directions:
- persistent Home bottom navigation: not authorized;
- Career/lifetime Home hero: rejected while semantics remain unresolved;
- universal removal of rounded containers: rejected as an over-general rule;
- Add Flight total section-card removal: superseded by contract-aligned direction;
- single low-luminance appearance: design direction only, still SOT-dependent.

Historical explorations remain valuable as alternatives/rejected-evidence, but must not silently re-enter the portfolio.

## 3. Critical new engineering facts that change portfolio preparation

The portfolio must be reconciled against `feature/data001-domain`, because several assumptions from the earlier first-use work have materially advanced.

### Previous Total

Engineering branch now contains a real production-domain `PreviousTotalBaseline` object.

Current domain direction:
- sparse;
- non-empty by construction;
- contains only user-entered semantics;
- only currently total-eligible Known Fields;
- quantity type checked;
- omitted semantics remain absent;
- zero is a valid numeric value but is not a special presence/confirmation state.

Portfolio implication:
- visual design must preserve sparse semantics;
- blank/unset must not be styled as zero;
- “Start from zero” remains a UX assertion and must not be confused with the domain object's presence semantics.

### Total eligibility

The engineering branch has advanced beyond the older OPEN-only state.

Current branch documentation identifies a confirmed/implemented temporary total-eligibility set for many duration/count semantics and explicitly holds several others OPEN.

Portfolio implication:
- Previous Total examples can now be grounded in current metadata rather than the old three-field mock alone;
- however the visual portfolio should avoid implying every eligible semantic must appear in first-use;
- field prioritization remains a UX/product decision.

### Local owner access / AUTH-001

Engineering branch now documents and implements durable:
- unbound;
- bound + unlocked;
- bound + locked-by-explicit-sign-out

owner-access metadata at repository level.

Portfolio implication:
- the old assumption that signed-out/local entry is entirely unimplemented is outdated for technical planning;
- however production Home/Add/View owner-gate orchestration and final UI binding are still not complete;
- Welcome/Sign-in portfolio must reflect the current product direction without implying already-finished production wiring.

### Local persistence

Canonical local repository is host/CI validated with narrow browser/native/EFB observations.

Portfolio implication:
- local-first/offline-oriented UI is now supported by substantially stronger engineering evidence;
- do not add unsupported “cloud-first” visual messaging;
- do not claim installed-PWA/storage-recovery completeness.

## 4. What must be distilled before drawing the portfolio

Create one portfolio input pack containing only:

### A. Product truths
- first-use/returning-user flow;
- Home/Add/View primary actions;
- View Logbook semantics;
- Previous Total meaning;
- owner/auth relationship;
- import/manual-first/local-first principles.

### B. Visual laws
From Design Studio and reconciled LogMate work:
- Macro Calm / Micro Precision;
- Datum before container;
- luminance hierarchy before hue;
- semantic role before font;
- full professional labels before geometry compression;
- state orthogonality;
- stable semantic identity through focus/recovery;
- responsive recomposition by relationship failure;
- product-specific delta instead of tutorial volume;
- no aviation cosplay;
- no fake operational data.

### C. Current component candidates
Only candidates with enough evidence:
- page/task title hierarchy;
- body/label/action scale;
- primary/secondary action grammar;
- choice row;
- H+MM cumulative editor;
- error/helper placement;
- document-order primary action;
- Empty Home action hierarchy;
- ledger/data typography roles.

### D. Pressure-test corpus
Portfolio must visibly demonstrate:
- no-data Welcome;
- Previous Total zero/carry;
- `99,999+59`;
- `Instrument Flight Time`;
- local error;
- 200%/stacked reflow;
- IME/short-height;
- tablet/EFB;
- populated operational Home;
- View Logbook dense state.

## 5. What should NOT be consolidated into a final style yet

Keep OPEN:
- exact final typeface;
- exact custom-font metrics;
- exact HEX values;
- exact radius/stroke token set;
- exact low-luminance-only vs multi-appearance production decision where SOT remains unresolved;
- exact navigation IA where still open;
- final Search ranking/result semantics;
- final total/generic Total Time meaning where still unresolved;
- physical device/AT/human usability claims.

The Master Visual Portfolio may use provisional rendered values to communicate direction, but every such value must remain labeled as a candidate until screen-family lock or implementation validation closes it.

## 6. Recommended archive/organization policy

Do not delete historical research.

Use three logical states:

### ACTIVE INPUT
Current evidence allowed to shape the portfolio directly.

### REFERENCE / HISTORICAL
Useful prior explorations, alternatives, rejected directions and superseded states.

### OPEN / BLOCKED
Questions that must not be visually “decided” by the portfolio.

A portfolio reference should never cite a historical exploration without also citing the later reconciliation decision that explains its current standing.

## 7. Portfolio preparation gate

Before generating the Master Visual Portfolio, complete these checks:

1. reconcile `main` vs `feature/data001-domain` for all first-use/Home/View/owner/baseline facts;
2. extract latest Design Studio cross-specialist constraints into one project-specific matrix;
3. extract only KEEP/current-direction visual ideas from `design/visual-language-working`;
4. merge those with `design/first-use-baseline-20260918`;
5. list unresolved conflicts explicitly;
6. only then render portfolio candidates.

If a conflict is visual only, the portfolio may compare alternatives.
If a conflict changes product semantics or data truth, it must remain OPEN and not be solved by styling.

## 8. Current judgment

Research quantity is now sufficient for the portfolio.

The missing step is **curation and reconciliation**, not more broad foundational research.

Therefore the next major work should be:

`Research consolidation → Portfolio input matrix → Master Visual Portfolio candidate(s) → owner approval → screen-family lock`

rather than:

`More unrelated research → more exploration files → portfolio later`.

## 9. Portfolio acceptance question

The portfolio should answer one top-level question:

> Can Welcome, Previous Total, Empty Home, Add Flight, populated Home, View Logbook and Settings all be extended from this same LogMate visual language without semantic distortion or generic-framework leakage?

Only after that answer is YES should individual screen-family detail locking begin.

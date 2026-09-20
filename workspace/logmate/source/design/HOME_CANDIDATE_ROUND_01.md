# LogMate Home Candidate Round 01

Status: OWNER DECISION CANDIDATES — NON-CANONICAL
Date: 2026-09-18
Baseline state: NONE SELECTED
Product authority: `main` / `MASTER.md`

## Preflight

This round follows `design/README.md`, `design/DECISIONS.md`, `design/VISUAL_BASELINE.md`, `design/ROOT_CAUSE_AUDIT_20260918.md`, and the latest source snapshot/delta review. It does not create a lock.

All candidates use the same product semantics and provisional visual system. They differ only in hierarchy/order/grouping/density strategy.

Shared invariants:
- medium information density / low visual noise;
- no KPI-card grid, career hero, aviation imagery, slogan, invented bottom navigation, or decorative dashboard identity;
- one primary vertical datum on compact widths;
- typography roles remain provisional: 20 task/screen title, 17 section/numeric emphasis, 15 body/action/label; no sub-15 helper tier invented for density;
- neutral luminance hierarchy first; accent is reserved for actionable/selected state, not section decoration;
- sections are primarily established by spacing, alignment and restrained rules rather than repeated containers;
- Add Flight is the strongest direct action; View Logbook is a strong adjacent action, not an equal decorative tile;
- Search is a real retrieval control and must remain keyboard/focus viable;
- Recent is row-based operational context, not a card carousel;
- Activity and Totals remain subordinate monitoring/reference regions and must not imply calculation/persistence maturity beyond product authority;
- first populated Home remains ad-free; mature eligible Home may reserve an anchored adaptive banner outside protected semantic groups;
- responsive changes follow relationship failure, not device labels.

## HOME-A v0.2 — Action → Current Period → Recent → Retrieval

### Representative composition

Header datum
- `LogMate` / current product context at start edge
- Settings utility at opposite edge

Primary work band
- `Add Flight` — dominant direct action
- `View Logbook` — adjacent secondary direct action

Current period summary
- preserve the current Home month/year summary family already present in product UI/implementation evidence;
- keep it as operational context, not a career/lifetime hero;
- date presentation remains locale-contract driven.

Recent
- section title + restrained `View all`
- latest accepted records as compact aligned rows
- row identity and primary operational values remain together

Search
- full-width retrieval field/action below Recent

Activity
- period context + compact aligned values/rows

Totals
- cumulative/reference values in aligned rows, no hero number

Mature-only ad boundary
- reserved anchored region after product content geometry; no ad on first populated Home

### Why it exists
- puts the product's manual-first core action first;
- Recent immediately confirms/resumes operational work;
- Search follows the likely scan-before-retrieve pattern without competing with first action;
- keeps monitoring/reference information lower in hierarchy.

### Trade-off
- Search is one scroll/scan step later than in retrieval-led layouts;
- users returning specifically to find an older flight get slightly less immediate access.

## HOME-B v0.2 — Action → Retrieval → Current Period → Recent

### Representative composition

Header datum
- `LogMate`
- Settings utility

Primary work band
- `Add Flight`
- `View Logbook`

Search
- full-width retrieval control directly below primary actions

Current period summary
- preserve the existing month/year summary family;
- keep it subordinate to direct action/retrieval and do not convert it into an unsupported career hero.

Recent
- compact aligned rows + `View all`

Activity
- period context + aligned values

Totals
- aligned reference values

Mature-only ad boundary
- same rule as HOME-A

### Why it exists
- treats search as a first-class daily logbook job;
- minimizes path length for crew/airport/route/flight-number lookup;
- preserves manual-first entry while giving retrieval a stronger rank.

### Trade-off
- Search's large interactive geometry interrupts continuity between action and current operational context;
- keyboard/focus state can dominate the upper Home surface more often;
- Recent becomes less immediate as a passive confirmation/resume surface.

## HOME-C v0.1 — Resume → Action → Retrieval

### Representative composition

Header datum
- `LogMate`
- Settings utility

Recent / current operational context
- latest accepted records first, compact row treatment
- no hero metric or fabricated summary

Primary work band
- `Add Flight`
- `View Logbook`

Search
- full-width retrieval control

Activity
- period context + aligned values

Totals
- aligned reference values

Mature-only ad boundary
- same rule as HOME-A

### Why it exists
- optimizes Home as a resume/verification surface;
- lets returning users first confirm the most recent known record before acting;
- gives operational context more weight than navigation chrome.

### Trade-off
- weakens the direct-action-first model;
- first-use/low-data states need a larger hierarchy transition because Recent may be absent;
- risks making Home feel like a feed/resume screen rather than the work hub.

## Coordinator recommendation

**Recommend HOME-A v0.2.**

Reason:
1. It best preserves Manual-first without turning Home into an Add Flight hero.
2. It keeps Recent close enough to the primary action to answer “what did I just record / where was I?” before secondary monitoring.
3. Search remains first-class but does not let its focus/keyboard geometry dominate the top of Home.
4. It transfers most cleanly to Empty Home: when Recent/Activity/Totals are absent, the same action datum survives without inventing fake zero states.
5. It provides a clean system bridge to Add Flight (action/form) and View Logbook (row/rule/datum) without importing ledger density into Home.

## Transfer checks required before owner selection becomes baseline

### Add Flight specimen
- preserve the same page datum, 20/17/15 role hierarchy and restrained rule grammar;
- field sections may be denser than Home but must not become rounded-card stacks;
- duration numerics may use tabular/operational treatment where semantically justified.

### View Logbook specimen
- Home row/rule grammar must tolerate transfer to the existing confirmed compact ledger hierarchy;
- View Logbook remains landscape/two-dimensional where required and is not forced into Home's one-dimensional reflow model;
- totals remain neutral and differentiated by rule/weight rather than colored KPI cards.

## Cross-screen transfer audit — 2026-09-19

Scope: current `main` implementation evidence only; this is not runtime validation and does not select a candidate.

### Add Flight transfer
Current Add Flight is explicitly entry-UI-only: persistence is deferred until canonical ledger/local repository connection. It already exposes clock and duration input families, date selection, airport lookup, takeoff/landing counts and expandable time detail. Therefore Home must transfer a hierarchy/interaction grammar, not imply save/sync completion.

Candidate impact:
- **HOME-A — SUPPORTS CURRENT DIRECTION.** Action-first Home hands off directly to a denser task surface without requiring a new hero/dashboard grammar. The Home datum/rule hierarchy can compress into form sections while preserving one clear task title and semantic labels.
- **HOME-B — SUPPORTS, WITH LOCAL COST.** The same transfer works, but Search is unusually prominent on Home while Add Flight is a focused form task; this creates a larger interaction-density discontinuity between adjacent surfaces.
- **HOME-C — LOCAL REVISION NEEDED if selected.** Resume-first Home makes the Add Flight transition feel like a hierarchy inversion: passive record context precedes the action on Home, then action becomes dominant immediately after navigation. This is not fatal, but would need a stronger action handoff treatment.

Transfer invariant: do not carry current stock Material `FilledButton`, rounded field or bottom-sheet appearance forward merely because it exists in implementation. Preserve semantics/accessibility; authored visual treatment remains candidate work.

### View Logbook transfer
Current View Logbook is explicitly a presentation-only landscape ledger shell and does not read or modify `FlightRecord`. Its Standard projection is Date / Aircraft Type / Registration / Flight Number / Route / Block / Night / Instrument Flight Time / Remark, with compact column widths and right-aligned duration columns.

Candidate impact:
- **HOME-A — SUPPORTS CURRENT DIRECTION.** Recent can use a restrained subset of the same semantic row identity without pretending to be a mini-ledger. `View Logbook` remains an adjacent direct action, so the density jump to a two-dimensional ledger is intentional and legible.
- **HOME-B — SUPPORTS CURRENT DIRECTION.** Search-first retrieval also transfers well to ledger inspection, but gives retrieval more visual authority than the Standard ledger itself currently proves necessary.
- **HOME-C — SUPPORTS row continuity, but SCREEN COST remains.** Recent-first creates the strongest row-to-ledger continuity, but still carries the previously identified Empty Home and manual-first hierarchy penalties.

Transfer invariant: Home does not inherit fixed ledger column geometry. Shared identity is semantic datum/rule/numeric discipline; the ledger retains local horizontal/two-dimensional overflow when relationships require it.

### Cross-screen result
No transfer failure meets the reopen threshold. HOME-A remains the coordinator recommendation because it is the only candidate with no identified cross-screen hierarchy correction while preserving the strongest Empty Home continuity. HOME-B remains a valid retrieval-weighted alternative. HOME-C remains valid but has two known costs: Empty Home hierarchy discontinuity and Add Flight action-handoff inversion.

This audit satisfies the required pre-selection *design transfer analysis*, but not the visual-reference gate in `design/VISUAL_BASELINE.md`: owner selection still requires representative Home + Add Flight + View Logbook visual specimens, not prose alone.

## New research delta impact — 2026-09-18 late cycle

Design Studio advanced to T054 / C085 / L076-I072 / W085 / CD091 around causal Undo/restoration. Classification for HOME-A/B/C: **NO IMPACT on base Home hierarchy**. These findings apply to future recovery/dynamic-removal states, not the normal Home candidate composition.

Web Manager advanced provenance publication atomicity/partial-history recovery. Classification: **NO IMPACT on normal Home composition; NOTE for future recovery/status states**. Do not display local/sync/reconciled/backup as equivalent.

Marketing retention/useful-return work: **SUPPORTS CURRENT DIRECTION** insofar as Home should expose durable core jobs and recognizable return reasons rather than open/login/customize as value. It does not justify a new visual element.

### Design Studio delta — CD092
CD092 adds recovery-branch eligibility distinctions (eligible / consumed / superseded / no-op / failed) and continues to prohibit fabricated persistence/focus claims. Classification for HOME-A/B/C normal composition: **NO IMPACT**. It remains relevant to future recovery/status specimens only.

## Decision boundary

No candidate is selected by this document. Owner selection is required before `design/VISUAL_BASELINE.md` may record an active baseline. If HOME-A is selected with a local adjustment, revision lineage becomes `HOME-A v0.1 -> HOME-A v0.2`; do not regenerate a new system.

## Coordinator correction — 2026-09-19

The first A/B synthesis accidentally omitted the existing Home month/year summary family while simplifying the semantic regions. That omission would have changed current Home information architecture rather than only visual hierarchy.

This was caught during the mandatory product/code preflight before owner-ready visual generation.

Correction:
- HOME-A lineage advances to **v0.2** and restores Current Period summary between Work band and Recent.
- HOME-B lineage advances to **v0.2** and restores Current Period summary between Search and Recent.
- No visual baseline is selected.
- The omission is classified as a coordinator synthesis defect, not a product decision.
- No owner action is required to restore the omitted confirmed/current product family.

This correction demonstrates the new preflight rule: candidate simplification cannot silently delete an existing product information family.

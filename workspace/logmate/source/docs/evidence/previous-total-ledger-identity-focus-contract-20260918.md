# Previous Total → Ledger Identity & Focus Contract

Status: **ACTIVE DESIGN EVIDENCE / FORWARD-ENGINEERING RECONCILIATION**
Date: 2026-09-18
Branch: `design/first-use-baseline-20260918`
Production Flutter: unchanged

## Purpose

Close two design blockers before Previous Total Visual Lock:
1. verify that baseline entry can preserve one semantic identity into page/cumulative totals without UI-owned arithmetic;
2. define what happens to focus when an optional Previous Total semantic is removed from the active projection.

## Evidence classification

### CONFIRMED PRODUCT POLICY
- `PreviousTotalBaseline` and `OpeningBalance` are distinct concepts.
- Previous Total belongs before the earliest LogMate-known ledger record in the active projection.
- `Page Total`, `Previous Total`, and `New Total` are distinct paper-ledger semantics; `New Total = Previous Total + Page Total` at the product/domain level.
- hidden columns preserve underlying data; visibility/reorder are projection concerns, not deletion.

### FORWARD ENGINEERING EVIDENCE — NOT MAIN AUTHORITY
`feature/data001-domain` is ahead of `main` and currently supplies:
- `KnownFieldKey` as canonical semantic identity;
- `KnownFieldDefinition` with total eligibility, aggregate kind, aggregation scope, and formatter;
- sparse `PreviousTotalBaseline<Map<KnownFieldKey, TotalQuantity>>`;
- typed `DurationQuantity` / `CountQuantity` requirements;
- duration `H+MM` and count integer total format metadata;
- page read models keyed by `KnownFieldKey` for record fields.

This evidence materially reduces design uncertainty but does not authorize production adoption until reconciled/merged through product authority.

### OPEN ENGINEERING CONTRACT
The production Aggregation Engine and final page-total projection/recalculation are still not implemented. The current canonical page read model explicitly performs no total aggregation or display formatting. Therefore the UI must not invent aggregation, correction, hidden-field fallback, or baseline migration behavior.

## Semantic identity chain

The design must preserve this chain:

`KnownFieldKey`
→ baseline semantic row
→ typed baseline quantity
→ record/page aggregate semantic
→ Previous/Page/New cumulative output
→ visible/hidden ledger projection

The displayed label, row index, chooser order, compact ledger header, and current column position are not identity.

### Consequence

A semantic such as `blockTime` may appear as:
- full Previous Total label: `Block time`;
- compact View Logbook header: `Block`;
- a duration editor/total formatter: `H+MM`;
- a hidden column in one profile.

Those are presentation differences around one semantic owner. Hiding or reordering the ledger column must not change the baseline quantity or cumulative semantic identity.

## Aggregate family transfer

Current forward metadata establishes two aggregate families:

### Duration
- editor/output family: `H+MM`;
- quantity family: duration;
- examples currently eligible in forward evidence include Block, Night, Instrument Flight Time, IFR, PIC, SIC/FO and other confirmed catalog semantics.

### Count
- editor/output family: integer;
- quantity family: count;
- current forward evidence marks Takeoff/Landing count semantics as eligible.

Design rule:
> The semantic metadata chooses the editor family. The user never configures whether a field is duration or count.

Previous Total remains sparse: absent is not manufactured zero. Explicit numeric zero is a legitimate entered quantity.

## Previous Total removal interaction

Optional total semantics may be added and removed from the draft baseline projection. Removal is not the same as deleting a canonical field from LogMate and is not the same as hiding a View Logbook column.

### Focus-owner rule

Rows/actions are owned by stable semantic identity, not ordinal position.

If a focused optional semantic row is removed:
1. if a next visible optional semantic exists, focus transfers to that semantic's equivalent actionable locus;
2. otherwise, if a previous visible optional semantic exists, focus transfers there;
3. otherwise focus transfers to the `Add total` / eligible-semantic chooser trigger for the owning section;
4. focus must never land on the row that merely inherited the removed row's index;
5. focus must never fall silently to root/body when a declared workflow destination exists.

If removal is rejected/no-op, focus remains on the surviving semantic/action.

This hierarchy is a **DESIGN STUDIO JUDGMENT / portfolio contract candidate**, not a runtime PASS claim.

## Keyboard/touch implications

- Removing a non-focused row must not steal focus from the active editor.
- Removing the focused row must close/retarget the editor before paint of the new focus owner; stale focus ring/caret must not remain on a removed geometry.
- `Next` navigation resolves against the current semantic sequence after mutation, not a cached row index.
- At 200% text or after responsive stacking, semantic ownership remains unchanged even if geometry/order wraps.
- touch removal and keyboard removal must converge on the same post-mutation semantic state.

## Recovery boundary

Draft-field removal is ordinary reversible form editing before baseline commit. Do not add a generic Undo snackbar solely because a draft optional row was removed.

Committed-baseline mutation/recovery remains OPEN because persistence transaction scope and recomputation behavior are not yet product-authoritative on `main`.

## Visual implications for the state board

The Previous Total Visual Lock board must now include:
- sparse duration baseline;
- at least one count semantic specimen, clearly marked forward-evidence/contract validation rather than production availability if not on `main`;
- optional semantic added;
- focused optional semantic removed → deterministic focus fallback;
- non-focused semantic removed while another editor remains active;
- 200% stacked labels with semantic focus continuity;
- hidden View Logbook column while cumulative semantic remains intact as a cross-screen proof.

## Portfolio impact

- PT sparse baseline: **KEEP / strengthened**.
- Duration H+MM editor: **NO IMPACT / strengthened**.
- Count editor family: **NOTE / forward evidence now strong; main adoption still pending**.
- Exact prioritized first-use semantic set: **OPEN**.
- Optional-row focus fallback: **NEW DIRECTION-LOCK CANDIDATE**.
- Page/Previous/New visual arithmetic: **NO UI implementation claim**; Aggregation Engine remains OPEN.
- View Logbook Hide != delete: **KEEP / strengthened by semantic identity chain**.

## Validation needed

No PASS is claimed for:
- production aggregation;
- baseline persistence/reconciliation;
- keyboard focus runtime;
- browser accessibility tree;
- screen reader behavior;
- physical phone/tablet/EFB;
- 200% runtime geometry;
- pilot-human workload/discoverability.

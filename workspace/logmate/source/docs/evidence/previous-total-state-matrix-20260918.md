# Previous Total State Matrix & Component Gates

Status: **DESIGN RESEARCH — NOT PRODUCTION APPROVAL**  
Date: 2026-09-18  
Branch: `design/first-use-baseline-20260918`

This document advances the Previous Total surface from interaction grammar into a state-complete component contract. It deliberately does not modify production Flutter.

## 1. Canonical reconciliation

LogMate `main` remains at `b551ce4` while technical work continues on separate branches. The production Add Flight surface already separates raw time editing from completion normalization through `TimeInputFormatter`; duration values accept digits/`:`/`+`, remain raw while editing, and normalize on completion to variable-width `H+MM`. That behavior is reusable evidence, not proof that Previous Total persistence or validation exists.

Design Studio current specialist evidence remains non-final: Type Stage 2 PRACTICE, Color/Layout/Web/Content Stage 3 PRACTICE. Therefore this document transfers constraints but does not claim specialist or product PASS.

## 2. New design decision: separate choice control from value editor

The zero/carry-forward choice and cumulative value editor are different semantic components. They must not be visually fused into selectable cards containing editable fields.

Selected architecture:

```
Previous total
Set the totals carried forward before your first LogMate record.

STARTING POINT

( ) Start from zero
    No previous totals will be carried forward.

( ) Carry forward previous totals
    Enter totals from before your first LogMate record.

[entry region appears only after Carry is chosen]
```

Why:
- prevents nested interactive targets;
- makes the ledger assertion explicit before editing;
- preserves a stable reading/focus order;
- allows the value region to scale independently to long labels and many semantics;
- keeps selection state legible without relying on accent fill.

The rows are not elevated cards. The whole label + consequence line is one choice target with a persistent selection mark and structural state change.

## 3. Ten required UI states

### S0 — UNDECIDED

Visible:
- title/explanation;
- two starting-point choices;
- Continue present but unavailable.

Not visible:
- value-entry rows;
- fake zeros;
- keyboard.

Invariant: no baseline truth has been asserted.

### S1 — ZERO_SELECTED

Visible:
- `Start from zero` selected;
- concise consequence;
- no entry rows;
- Continue available.

Changing to Carry is reversible before commit.

### S2 — CARRY_SELECTED_EMPTY

Visible:
- Carry selected;
- prioritized eligible rows;
- values blank;
- `Add previous total` action.

Do not auto-focus the first value merely because the choice was selected. The user explicitly taps the field to start numeric entry.

Continue behavior remains dependent on the OPEN partial-baseline policy.

### S3 — CARRY_EDIT_FOCUSED

One row owns focus.

Row anatomy at adequate width:

```
Block                                      235025
─────────────────────────────────────────────────
                                    H+MM on completion
```

While editing:
- raw supported text is preserved;
- no thousands separator is inserted;
- stable label remains visible;
- focus is shown through more than hue alone;
- helper text may show the completion convention only when useful, not under every idle row.

On Next/Done/focus loss, the shared completion grammar may normalize `235025 → 2350+25`.

### S4 — CARRY_NORMALIZED

Read/edit-ready row:

```
Block                                     2350+25
────────────────────────────────────────────────
```

The read state may later adopt grouping (`2,350+25`) if a separate display-format contract approves it. Editing syntax must not be silently changed by a visual grouping decision.

### S5 — LARGE_TOTAL

Proof string: `99,999+59` in read state; raw equivalent in edit state.

Acceptance:
- value never collides with label/action;
- no font shrink or negative tracking;
- digits and punctuation remain distinguishable;
- row can recompose vertically before semantics are truncated.

### S6 — LOCAL_ERROR

Structure:

```
Night                                     <raw value>
─────────────────────────────────────────────────
Specific problem. Specific correction if known.
```

Requirements:
- preserve user text;
- identify affected semantic in accessible name/error association;
- no snackbar-only error;
- no red-only state;
- error insertion expands the row and pushes later content rather than overlaying it.

Do not write a minute-range error until product/engine closes that rule.

### S7 — OPTIONAL_TOTAL_ADDED

`Add previous total` exposes only LogMate-approved eligible semantics. After selection, the semantic returns into the form at a stable product-defined position.

The added row may expose Remove before initial commit. Remove means remove from this baseline-entry composition, not delete field/data or change View Logbook visibility.

No drag/reorder control is introduced here. Baseline entry order is not another user-customizable ordering system.

### S8 — 200_PERCENT_OR_RELATIONSHIP_FAILURE

When label and value can no longer share one safe row:

```
Instrument Flight Time

1125+30
──────────────────────
```

Acceptance:
- full label preserved;
- input follows label in semantic/focus order;
- helper/error remains immediately associated;
- action targets remain usable;
- Continue does not cover last field/error when IME is open.

This transition is based on relationship failure, not `phone` vs `tablet` naming.

### S9 — BOUNDARY_REVIEW

Used when accepted canonical records move the earliest-known ledger boundary earlier.

```
Review previous total
Your logbook now starts earlier.

Previous start              01 JAN 2022
New earliest record         03 MAY 2019

CURRENT BASELINE
Block                           2350+25
Night                            412+10

TOTALS BEFORE 03 MAY 2019
Block                          [      ]
──────────────────────────────────────
Night                          [      ]
──────────────────────────────────────
```

Current baseline is read-only reference; new-boundary values use the same editor as initial entry. Section structure and editability, not tint alone, communicate the distinction.

## 4. Focus and keyboard contract

Focus order:
1. Back/navigation if present;
2. starting-point choice 1;
3. starting-point choice 2;
4. revealed value editors in semantic order;
5. Add previous total;
6. Continue.

When Carry is revealed, focus does not jump automatically into a value editor.

For value editors:
- intermediate rows: Next;
- last visible value row: Done;
- Next completes current value then advances;
- Done completes current value then dismisses IME;
- neither action commits the entire baseline.

When a row error appears, focus is not forcibly moved away from the row. If Continue detects an unresolved local error later, focus/reveal should target the first actionable problem under the eventual validation contract.

## 5. Action placement decision

Do not use a permanently overlaying floating/fixed CTA over scroll content.

Selected structural rule:
- Continue belongs after the form in document order;
- SafeArea/inset padding must keep it reachable;
- platform-specific sticky behavior may be explored only if it never obscures focused fields, helper/error text, or 200% reflow.

This intentionally prioritizes data-entry integrity over constant CTA visibility.

## 6. Selection visual grammar

Avoid filled radio cards.

Working grammar:
- persistent circular/other platform-neutral selection mark;
- selected row gains structural emphasis through mark + weight/luminance/border ownership as appropriate;
- consequence line remains readable in both states;
- selection remains obvious in grayscale/forced-colors adaptation;
- focus, selected, pressed and disabled are independent axes.

Exact accent/token/radius remain unfrozen.

## 7. Value-row visual grammar

Avoid default filled/outlined TextField boxes repeated as cards.

Working grammar:
- full semantic label;
- right-aligned numeric editor at adequate width;
- one quiet baseline/rule defining editability;
- stronger focus rule/outline where required;
- local helper/error slot;
- optional trailing remove action only for removable unsaved semantics.

At narrow/large text, switch to stacked label→value rather than compressing type.

## 8. Add-previous-total chooser decision

For a short eligible remainder, prefer an anchored inline/sheet list over a new full-screen configuration workflow. For a long final eligible set, a dedicated sheet remains possible.

Every chooser item requires:
- stable semantic ID;
- full field name;
- selection/add affordance;
- no View Logbook visibility control;
- no rename/custom-field affordance.

The chooser closes or updates immediately after a semantic is added; duplicate addition is impossible.

Exact surface type remains conditional on the final eligible-field count.

## 9. Content contract

Use `Previous total` as the working concept label, but explanatory copy must always bind it to the ledger boundary.

Initial context:
`Set the totals carried forward before your first LogMate record.`

Import context:
`Set the totals carried forward before [earliest accepted date].`

Review context:
`Your logbook now starts earlier.` followed by previous/new boundary values.

Do not use vague phrases such as `Initial total`, `Starting hours`, or `Import total` because they collapse distinct semantics.

## 10. Cross-specialist transfer

### Type
Proof corpus now includes:
- `Previous total`
- `Carry forward previous totals`
- `Instrument Flight Time`
- `99,999+59`
- raw `9999959`
- date pairs in review state.

Failure belongs to Layout if geometry fails while mature fallback renders correctly; do not shrink/track custom type to rescue composition.

### Color
State axes to keep orthogonal:
- selected/unselected;
- focused/unfocused;
- valid/error;
- enabled/disabled;
- editable/read-only reference.

No one accent token may carry multiple meanings without non-color structure.

### Layout / Interaction
The state matrix requires exact target/focus/reflow evidence before production approval. It reuses the studio rule that input paths must converge on the same semantic state; no drag interaction is needed for baseline fields.

### Content
Full semantic names are authoritative. Compact View Logbook headers must not leak into this form merely to save width. English strings never select state.

### Web/PWA
Required future runtime scenarios:
- 200% zoom/text;
- short viewport + IME;
- keyboard-only choice/value/Continue path;
- light/night/forced-colors;
- large total proof;
- local error insertion without layout obstruction.

No browser/device/AT PASS is claimed here.

## 11. Product/engineering decisions still OPEN

1. partial Previous Total allowed vs at-least-one value required;
2. exact duration semantic validation (`minutes < 60`, normalization, rejection, etc.);
3. editing vs read-state thousands grouping;
4. final total-eligible semantic set and prioritized subset;
5. persistence transaction/pending/failure semantics;
6. behavior when removing a previously persisted baseline semantic;
7. exact treatment of Custom Duration/Count totals;
8. whether count-based totals share this surface or use a parallel numeric row grammar.

## 12. Validation gate before visual approval

A visual candidate is not ready for product-owner approval until the same authored grammar is demonstrated for at least:
- S0 undecided;
- S1 zero;
- S2 carry empty;
- S3 focused/raw editing;
- S4 normalized;
- S5 `99,999+59`;
- S6 local error;
- S7 added optional semantic;
- S8 200%/stacked reflow;
- S9 boundary review.

The candidate must also show one short-height/IME case. A single pristine default-state mock is insufficient evidence.

## 13. Next research target

Build one coherent Previous Total visual state board from this matrix, then critique it against:
- generic Material leakage;
- selection vs focus ambiguity;
- label/value collision;
- error expansion;
- 200% reflow;
- large cumulative numerals;
- import/backfill review continuity.

Do not expand to more onboarding screens until this core input grammar survives the matrix.
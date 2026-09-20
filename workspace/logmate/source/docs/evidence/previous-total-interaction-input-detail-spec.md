# Previous Total Interaction & Input Detail Specification

Status: **DETAILED DESIGN SPEC — RESEARCH/DESIGN BRANCH ONLY**  
Date: 2026-09-18  
Branch: `design/first-use-baseline-20260918`  
Depends on:
- `docs/evidence/first-use-previous-total-baseline-policy.md`
- `docs/evidence/first-use-baseline-composition-spec.md`

No production Flutter change is authorized by this document.

---

## 1. Purpose

This spec advances Previous Total from flow-level wireframe to detailed interaction grammar.

It defines:
- the zero-vs-carry-forward decision;
- cumulative `H+MM` entry;
- blank vs explicit zero;
- field focus and completion behavior;
- add/remove eligible totals;
- validation and error placement;
- keyboard behavior;
- large-text / narrow / tablet recomposition;
- baseline-review reuse.

It does **not** freeze:
- exact total-eligible field set;
- invalid duration range policy such as whether minute values `60–99` are rejected, normalized, or interpreted;
- canonical persistence schema;
- final font, color, radius, or spacing tokens;
- production component implementation.

---

## 2. Existing product input contract reused

Current Add Flight already establishes:
- Clock display: `HH:mm`.
- Duration / cumulative duration display: `H+MM`.
- Duration hours are variable width.
- While editing, supported raw characters remain raw rather than inserting a separator early.
- On completion, one/two digits are treated as minute shorthand:
  - `5 → 0+05`
  - `11 → 0+11`
- Three or more digits use final two digits as minutes:
  - `135 → 1+35`
  - `1350 → 13+50`
- Existing formatter accepts digits, `:`, and `+`, then normalizes completed duration to `H+MM`.
- Cumulative UI must accommodate at least `99,999+59`.

Important boundary:
- exact invalid duration range validation remains OPEN in the current product contract.
- this design spec must not invent a `minutes < 60` engine rule as already confirmed, even though the UI should reserve a clear error path if engineering/product later confirms it.

---

## 3. Primary interaction decision

### Selected: one cumulative-duration field per semantic

Use one editable value field:

```
Block                         2,350+25
Night                           412+10
Instrument Flight Time        1,125+30
```

Do **not** split a value into separate hour and minute text fields.

### Why

A single field:
- matches LogMate's established `H+MM` presentation grammar;
- supports direct paste of an existing paper/electronic total;
- creates one focus stop instead of two;
- scales to five-digit+ hour totals naturally;
- keeps `0+00` as one semantic value;
- maps cleanly to the current raw-edit → completion-normalization behavior;
- reduces tab/Next-key burden;
- avoids a second failure mode where hour/minute subfields become desynchronized;
- works better when labels wrap under large text.

### REJECT: split hours / minutes boxes

```
Block      [ 2350 ] + [ 25 ]
```

Reject as primary direction because:
- two focus targets for one domain value;
- slower repeated entry;
- poor paste behavior;
- more difficult screen-reader/voice-control naming;
- high cumulative hours create asymmetric field geometry;
- visually resembles generic time pickers rather than a professional ledger value.

### REJECT: wheels / steppers

Not appropriate for cumulative values such as `12,486+35` or `99,999+59`.

---

## 4. Choice architecture: zero vs carried-forward

The earlier radio-card mock is **REWORK**.

The decision is not a preference setting; it changes the baseline truth of the ledger.

### Selected semantic choices

Preferred user-facing concepts:

- `Start from zero`
- `Carry forward previous totals`

The second label may be shortened later only if content testing shows no loss of meaning.

### Visual grammar

Use a quiet two-row decision block rather than two elevated cards.

Concept:

```
PREVIOUS TOTAL

Carry forward the totals before your first LogMate record.

STARTING POINT

● Start from zero
  No previous totals will be carried forward.

○ Carry forward previous totals
  Enter totals from before your first LogMate record.
```

The selected state uses at least:
- selection indicator;
- text/state relationship;
- optional luminance reinforcement.

Color alone never owns selection.

### Behavior

Initial state:
- neither choice should be silently assumed if the product needs an explicit assertion.
- primary Continue remains unavailable until the user chooses a starting-point state.

After `Start from zero`:
- no entry rows are shown merely as `0+00`;
- a concise consequence line remains visible;
- Continue becomes available.

After `Carry forward previous totals`:
- prioritized eligible fields are revealed in place;
- first field may receive focus only after an explicit user action that logically requests entry; do not unexpectedly summon the keyboard merely from screen appearance;
- Continue behavior depends on baseline completeness policy, which is not fully frozen here.

---

## 5. Entry-row anatomy

A Previous Total row is not a generic filled TextField card.

### Wide-enough phone

```
Block                                      2,350+25
──────────────────────────────────────────────────

Night                                        412+10
──────────────────────────────────────────────────
```

Semantic anatomy:

1. **Full label** — stable semantic name.
2. **Value** — single cumulative-duration editor.
3. **Interaction line / field affordance** — visible enough to indicate editability.
4. **Local helper/error slot** — appears beneath the row only when needed.
5. **Optional remove action** — only for user-added optional baseline fields, not required/default-priority rows.

### Focus

On focus:
- preserve label;
- expose a stronger structural focus treatment;
- keep raw typed text;
- do not move the label into a floating micro-label merely to mimic default Material behavior;
- focus treatment must survive grayscale / forced-color adaptation.

### Completion

On focus loss or keyboard Next/Done:
- run the shared duration completion-normalization path;
- normalized value becomes visible if interpretation is unambiguous under the current formatter contract;
- if later semantic validation rejects the value, preserve the user's text and show a specific local error rather than silently coercing it.

---

## 6. Raw editing grammar

The design should reuse the existing Add Flight mental model.

Examples:

| Typed | While editing | On completion |
|---|---|---|
| `5` | `5` | `0+05` |
| `35` | `35` | `0+35` |
| `135` | `135` | `1+35` |
| `235025` | `235025` | `2350+25` |
| `2350+25` | `2350+25` | `2350+25` |
| `2350:25` | `2350:25` | `2350+25` |

Formatting separators such as grouping commas are a **display-format decision**, not confirmed editing syntax.

Therefore:
- do not insert thousands separators while the user is typing unless a future formatter contract explicitly approves it;
- a formatted read state like `12,486+35` may be considered separately from editable raw text.

---

## 7. Explicit zero vs blank

This distinction is mandatory in the interaction model.

### Explicit zero

`0+00` means:
- user supplied a zero value for that semantic, or
- the user explicitly chose `Start from zero` for the whole baseline if product semantics map that choice to all applicable baseline values.

### Blank

Blank means:
- no value supplied / unresolved for that semantic.

Blank must **not** silently become `0+00`.

### Consequence

If the product eventually permits partial Previous Total:
- Page Total may be calculable;
- Previous/New cumulative total for an unresolved semantic must not claim a complete value;
- View Logbook needs a direct `Set previous total` recovery path.

Exact partial-baseline calculation policy remains OPEN.

---

## 8. Default visible baseline fields

The visual composition must not hard-code the final semantic set.

Design interface:

```
systemPrioritizedEligibleFields[]
```

The product model supplies:
- semantic ID;
- full label;
- value type;
- total eligibility;
- priority/default-display status;
- current baseline state/value.

The initial screen may show a small prioritized subset when product policy later confirms one.

Current mock examples such as Block/Night/Instrument are not the final generic contract.

---

## 9. Add previous total

Rename the conceptual action from generic `Add field` to a baseline-specific command.

Preferred working label:
- `Add previous total`

Alternative to test:
- `More previous totals`

Do not use:
- `Add column`
- `Customize`
- `Add field`

because those imply presentation/schema changes.

### Eligible-total chooser

It contains only LogMate-approved, currently unselected baseline semantics.

Each row:
- full semantic label;
- optional compact category/support text only if necessary;
- Add action or direct selectable row.

The chooser must not expose:
- ineligible Known Fields;
- arbitrary Custom Field creation;
- View Logbook visibility;
- semantic rename.

### Returning from chooser

Selected semantics are inserted into the Previous Total form using a stable product-defined order unless a later baseline-order rule exists.

Do not create a second user reorder system for baseline entry.

---

## 10. Removing an added baseline field

Only optional/user-added baseline rows may expose removal.

Removal means:
- remove this semantic from the current baseline-entry form;
- it does **not** delete a Known Field;
- it does **not** change View Logbook Customize;
- it does **not** erase existing record values.

If an already-saved baseline value exists, `Remove` may become consequential. Exact persistence behavior is OPEN, so production copy/action must wait for that contract.

For first unsaved entry, simple removal is low-risk and should not require a confirmation dialog.

---

## 11. Keyboard behavior

### Phone

Use the numeric keyboard appropriate to the platform while still allowing the supported `+` / `:` input paths where practical.

Current Flutter implementation uses numeric keyboard and accepts formatter-supported characters; final platform keyboard details require runtime validation.

### Return/Next sequence

For a visible entry list:

```
field 1 → Next
field 2 → Next
...
last field → Done
```

Next:
- completes/normalizes current field;
- moves to the next editable baseline value.

Done:
- completes current field;
- dismisses keyboard;
- does **not** automatically submit the entire baseline unless production interaction explicitly decides that behavior.

The main Continue/Save action remains a separate visible command.

### Keyboard overlap

The focused field, its label, and local error/helper must remain visible above the IME.

Do not rely on a permanently fixed bottom CTA that can cover the last field or error text.

---

## 12. Error architecture

Follow:
`prevent → detect → identify → suggest → preserve`.

### Local error

Error belongs adjacent to the affected semantic.

Structure:

```
Night                                      [raw value]
────────────────────────────────────────────────────
Specific error / correction guidance
```

The error text must:
- identify the affected input;
- state what is wrong;
- give a correction when product rules know one;
- preserve the entered value.

Do not use:
- `Invalid`
- red border only;
- toast/snackbar as the sole field error;
- clearing the user's value.

### Range-policy caution

Current LogMate contracts explicitly leave invalid duration-range policy OPEN.

Therefore this design may reserve examples such as:
- malformed duration;
- unsupported value;
- out-of-range minutes;

but it must not claim a specific minute-range rule until product/engine confirms it.

---

## 13. Continue action state

### Before starting-point choice

Continue unavailable.

The UI must still expose why through visible structure; disabled color alone is not enough.

### Start from zero selected

Continue available.

### Carry forward selected

Two possible future contracts exist:

A. at least one baseline value required;
B. partial baseline allowed.

This remains a product decision.

The visual system must support both without redesign:
- local row states;
- form-level unresolved state;
- Continue enabled/disabled or review path as required.

Do not encode the unresolved product decision into a static button mock.

---

## 14. Review Previous Total variant

This surface reuses the same entry rows and input grammar, but the top context changes.

### Required context

```
REVIEW PREVIOUS TOTAL

Your logbook now starts earlier.

Previous start        01 JAN 2022
New start             03 MAY 2019
```

Then:

```
CURRENT BASELINE
Block                 2,350+25
Night                   412+10

TOTALS BEFORE 03 MAY 2019
Block                 [        ]
Night                 [        ]
```

### Distinction

Current baseline:
- read-only reference.

Updated baseline:
- editable.

Do not distinguish them only by tint.

Use:
- section heading;
- editability affordance;
- reading order;
- focus behavior.

---

## 15. Import variant

When baseline is entered after accepted import records are known, show the boundary before input.

Example architecture:

```
PREVIOUS TOTAL

Imported records begin
01 JAN 2022

Set totals carried forward before this date.
```

Then reuse the same:
- Start from zero / Carry forward;
- H+MM rows;
- Add previous total;
- error/focus/keyboard system.

Do not invent a separate import-specific duration-entry component.

---

## 16. Large text and narrow reflow

At normal width:

```
Instrument Flight Time                    1,125+30
```

When label/value competition becomes unsafe:

```
Instrument Flight Time
1,125+30
─────────────────────
```

Rules:
- full semantic label wins over one-line compactness;
- value remains large enough to read;
- no negative tracking;
- no font shrink to keep the two-column row;
- helper/error stays associated beneath the value;
- field hit target remains adequate.

This is a relationship-failure breakpoint, not a device-name breakpoint.

---

## 17. Tablet / EFB

Do not stretch value fields across the whole landscape viewport.

Preferred structure:

```
[ context / meaning ]        [ baseline entry measure ]
```

only if the left-side context is real and useful.

Otherwise use a bounded leading-aligned form measure rather than centering a phone-width card inside a large canvas.

No decorative cockpit/ledger illustration is needed.

---

## 18. State machine

User-facing states:

```
UNDECIDED
 ├─ choose ZERO
 │    └─ ZERO_CONFIRMED
 │          └─ change choice → UNDECIDED/CARRY
 │
 └─ choose CARRY
      └─ CARRY_EDITING
           ├─ add eligible semantic
           ├─ remove unsaved optional semantic
           ├─ edit raw value
           ├─ normalize on completion
           ├─ field error
           └─ READY / PARTIAL / UNRESOLVED according to future policy
```

Review branch:

```
BOUNDARY_CHANGED
   ↓
REVIEW_REQUIRED
   ↓
REVIEW_EDITING
   ↓
BASELINE_UPDATED
```

Persistence/pending/failure states will be added only when the storage transaction contract exists.

---

## 19. Interaction invariants

1. blank ≠ zero.
2. hiding a View Logbook field ≠ deleting baseline.
3. adding a Previous Total semantic ≠ adding a View Logbook column.
4. removing an unsaved baseline row ≠ deleting a Known Field.
5. one semantic duration = one text-entry focus target.
6. raw input is preserved while editing.
7. completion normalization ≠ silent semantic correction.
8. errors preserve user input.
9. long labels reflow; semantics do not truncate to save geometry.
10. imported/manual backfill reuse the same baseline input grammar.
11. baseline-review context must name why the review is required.
12. Continue/Save state must reflect real completeness rules, not optimistic styling.

---

## 20. Evidence-backed design rationale

Current Apple HIG guidance supports:
- making required data clear before users proceed;
- using an input field presentation appropriate to expected data;
- matching keyboard/input method to the content;
- validating fields when legitimate values are constrained;
- keeping labels available rather than relying solely on disappearing placeholder text.

Current WCAG 2.2 Input Assistance supports:
- labels/instructions for inputs;
- textual identification of detected errors;
- correction suggestions when known;
- avoiding error indication that depends only on color.

These are platform/accessibility constraints, not proof that this exact LogMate composition is human-validated.

---

## 21. Next visual prototype target

Produce one detailed Previous Total prototype family rather than another full onboarding storyboard.

Required frames:

1. undecided;
2. Start from zero selected;
3. Carry forward selected;
4. first field focused + keyboard;
5. long cumulative value;
6. field error;
7. additional-total chooser;
8. added semantic;
9. 200% / long-label reflow;
10. Review Previous Total after earlier record boundary.

Only after this surface reaches sufficient detail should the same grammar be transferred to Import and other first-use forms.

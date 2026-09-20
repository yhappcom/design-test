# Record Calculation Engine Specification

> Authority: RECORD-LEVEL CALCULATION DOMAIN CONTRACT ONLY
> Status: CURRENT — CONFIRMED DECISIONS AND OPEN IMPLEMENTATION DETAILS
> Source of Truth: [MASTER.md](../../MASTER.md)

## 1. Scope and status

This contract defines the future local/on-device Calculation Engine behavior for one `FlightRecord`. It is **CONFIRMED** product/domain policy, but the engine, derived-value persistence, Add Flight auto-fill, mismatch presentation, and save-warning UI are all **NOT IMPLEMENTED**.

This document does not change the current Add Flight input behavior. It does not define a canonical schema, field/type/codec, migration, formatter behavior, or an import-parser implementation.

## 2. Three-variable relationships — CONFIRMED

Block and Actual are not one-way formulas. Each is a relationship where any two values can derive the third.

| Relationship | Two known values | Derived value |
| --- | --- | --- |
| Block | Ramp out + Ramp in | Block time |
| Block | Ramp out + Block time | Ramp in |
| Block | Ramp in + Block time | Ramp out |
| Actual | Takeoff + Landing | Actual time |
| Actual | Takeoff + Actual time | Landing |
| Actual | Landing + Actual time | Takeoff |

The Actual relationship uses the same principles as Block.

These are the OOOI relationships: OUT/Ramp out, OFF/Takeoff, ON/Landing, IN/Ramp in; therefore `Block = IN - OUT` and `Actual = ON - OFF`.

For either relationship:

| Available values | Engine result |
| --- | --- |
| 0 | Cannot calculate |
| 1 | Cannot calculate |
| 2 | Derive the missing third value |
| 3 | Run consistency validation; do not auto-overwrite a supplied value |

Example: Ramp out `23:30` plus Block time `1+40` derives Ramp in `01:10` on the next day. Conversely, Ramp in `01:10` plus Block time `1+40` derives Ramp out `23:30` on the previous day relative to Ramp in.

Actual duration alone cannot reconstruct both Takeoff and Landing clocks. One duration supplies only their difference; at least one endpoint clock is also required.

## 3. Midnight / day rollover — CONFIRMED

Assume an individual flight/operation duration never exceeds 24 hours. For clock difference:

- `end >= start`: same-day difference.
- `end < start`: treat end as the next day and add 24 hours.
- A calculation can roll over at most once.

Thus Ramp out `23:30` and Ramp in `01:10` derive Block time `1+40`. Reverse derivation follows the same one-rollover rule.

Future internal calculation may distinguish a clock value from a day offset so rollover information is not lost. Its canonical representation is **OPEN** and is not set by this contract.

## 4. Provenance and manual precedence — CONFIRMED

A directly entered value always overrides a calculated value. A manual target is never silently replaced when its source values change.

For example, Ramp out `09:10` and Ramp in `10:45` calculate Block `1+35`. If the user enters Block `1+37`, the retained user value is `1+37`, not `1+35`. If Ramp in later changes to `10:46`, the calculation becomes `1+36`; manual Block stays `1+37`, while its mismatch result updates against `1+36`.

Calculated values must remain distinguishable from values supplied by the user or company source material. The future model must conceptually represent provenance such as manual, imported, and calculated, without treating an automatically derived value as if it had existed in company source data.

The exact enum/field names and resolution behavior after deleting a manual value are **OPEN**.

## 5. Consistency and mismatch — CONFIRMED

When all three values exist, the engine calculates the comparison result from the two source values and checks it against the supplied target. It does not overwrite the target.

Example:

| Ramp out | Ramp in | Entered Block | Calculated Block | Result |
| --- | --- | --- | --- | --- |
| 09:10 | 10:45 | 1+35 | 1+35 | consistent |
| 09:10 | 10:45 | 1+37 | 1+35 | mismatch |

Actual follows the same policy. A mismatch warning occurs only when all three comparable values are present. Ramp out plus Block with Ramp in missing is a derive-missing-value state, not a mismatch state.

When a mismatch remains, presentation must make the field warning clear and the user must be warned again before save. The warning is not a hard validation error: a user who recognizes it may keep the manual value and save.

Exact warning component, save confirmation copy/actions, tolerance, seconds comparison, and invalid clock/duration range validation are **OPEN**.

## 6. Company import — CONFIRMED

Company import may provide Ramp out and Block time without Ramp in. The common Block relationship must derive Ramp in:

```text
Imported:  Ramp out 23:30, Block 1+40, Ramp in missing
Calculated: Ramp in 01:10 next day
```

This is a derived value from two confirmed inputs, not a guessed source value. The import parser should use the common Record Calculation Engine relationship rather than own a separate calculation rule.

Parser integration remains **NOT IMPLEMENTED**.

## 7. Explicit negative boundary — CONFIRMED

- Night is a pilot/company-recorded logbook duration. This engine does not derive it from OOOI, Block, Actual, coordinates, or solar state, and it does not overwrite it from a solar calculation.
- Instrument Flight Time is a recorded semantic. This engine does not derive it from Actual. Pilot practice such as rounding or copying a value is not an application formula.
- FOM Duty Code PIC/FO credit is not part of the Block/Actual three-variable relationship. It belongs to a separate company-rule component with source context and provenance.
- A future solar helper, if adopted, is separate from this deterministic engine and may only assist Day/Night T/O/L/D classification. The exact astronomical/regulatory boundary and local coordinate-reference architecture remain OPEN.

## 8. Responsibility boundary — CONFIRMED

```text
Flight Record source values
  → Record Calculation Engine
  → Derived / Validation State
  → Presentation State
  → UI
```

The Calculation Engine owns Block/Actual relationships, rollover, derived-value generation, provenance awareness, consistency validation, and mismatch state. UI displays engine-provided presentation/validation state and does not own the formulas.

This record-level responsibility is distinct from Aggregation Engine responsibility across records, such as Block totals, PIC/SIC totals, monthly totals, and yearly totals.

## 9. Page-total projection — CONFIRMED semantics / NOT IMPLEMENTED

The future Aggregation Engine, not a UI widget, owns paper-page projection: `Page Total` is the sum of actual FlightRecords on that page; `Previous Total` is the cumulative total before it; and `New Total = Previous Total + Page Total`. The chain is continuous across years. A manual initial Previous Total may be the starting cumulative value before LogMate-known data; it is not historical FlightRecord recreation and remains distinct from OpeningBalance.

An insert, edit, delete, date/order change, or page-membership change re-projects the affected page and later Page/Previous/New totals from app data. Explicit page-start anchors are preserved. Page boundaries, including a user-selected early break, are paper-ledger presentation/alignment and do not define month/quarter/half-year/year statistics; those remain date-based record aggregation. Exact page projection, anchor resolution, and incremental invalidation algorithms are OPEN.

## 10. Explicitly not implemented

- Calculation Engine class or calculation code
- Add Flight auto-fill or UI behavior change
- mismatch visual state or save-warning dialog
- persistence, canonical schema, migration, or derived-value storage
- import-parser integration
- Aggregation Engine class or totals calculation
- Page-total projection or recalculation implementation

## 11. Open details

- Exact provenance enum/field naming
- Whether and how calculated values are stored versus regenerated at runtime
- Manual-value deletion and return to calculated mode
- Canonical clock/day-offset representation and codec
- Mismatch warning component, copy, and save-confirmation actions
- Tolerance, seconds-level comparison, and invalid clock/duration range policies
- Page projection/invalidation algorithm and manual page-start anchor resolution

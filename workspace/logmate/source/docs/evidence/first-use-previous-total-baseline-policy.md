# First-Use / Previous Total / Import Baseline Design Policy

Status: **DESIGN POLICY PROPOSAL — NO PRODUCTION CODE CHANGES**  
Date: 2026-09-18  
Product evidence base: `yhappcom/logmate@main` at `b551ce434ad72b1895033e0f3617c73b026d40ea`  
Design evidence base: `yhappcom/design-studio@main` through `e15017f1`

## 1. Scope

This document defines the current first-use and ledger-baseline design direction while technical validation and DATA-001/AUTH-001/TOTAL/IMPORT work continue in parallel.

It does **not** freeze:
- canonical entity/field names;
- persistence or migration format;
- total-eligibility metadata schema;
- Sync behavior;
- import-engine implementation;
- Calculation/Aggregation implementation;
- final visual tokens, typeface, accent color, navigation IA, or production Flutter code.

The purpose is to prevent UI work from either blocking on engineering or silently inventing unresolved domain contracts.

## 2. Confirmed product evidence reused

Current LogMate contracts already establish:

- Manual-first: direct entry must be sufficient for core use.
- Import-optional: import may occur before manual data, after it, repeatedly, or never.
- Local-first direction: core data operation should not conceptually depend on network availability.
- LogMate Standard is zero-configuration by default.
- `PAGE TOTAL + PREVIOUS TOTAL = NEW TOTAL`.
- A manual initial Previous Total may carry cumulative values from before LogMate-known records.
- `PreviousTotalBaseline` and `OpeningBalance` are distinct concepts and must not be double counted.
- View Logbook Customize controls presentation; hiding a field does not delete record truth.
- Exact generic total eligibility remains OPEN and must be semantic/catalog-controlled, not user-invented.

## 3. First-use entry policy

### Returning user

A normal returning user with restorable product/session state should enter Home directly. Welcome is not designed as a repeated promotional surface.

### New / unbound user

Welcome contains no fabricated operational data.

Primary branch:

```
WELCOME
  ↓
START A NEW LOGBOOK
  ↓
PREVIOUS TOTAL
  ↓
EMPTY HOME
  ↓
ADD FIRST FLIGHT
  ↓
FIRST POPULATED HOME
```

Existing-user exception branch:

```
WELCOME
  ↓
SIGN IN
  ↓
EXISTING HOME / RECOVERY PATH
```

Welcome must not contain fake flight numbers, routes, registrations, aircraft, totals, hours, or synthetic ledger rows merely to create a technical atmosphere.

## 4. Previous Total is a ledger boundary, not onboarding decoration

Design meaning:

> Previous Total represents cumulative carried-forward totals immediately before the current earliest LogMate-known flight boundary.

This is a conceptual UI rule only. DATA-001 still owns exact persistence/linkage.

Consequences:

1. Previous Total is not bound permanently to account creation.
2. It is not owned by one import batch.
3. It is not a synonym for Opening Balance.
4. It may need review when the known ledger extends earlier.
5. Presentation visibility does not own the value.

The UI may display the earliest known date as human context, but exact engine linkage must not be reduced to a mutable row index or inferred schema.

## 5. Initial manual-start policy

The Previous Total step is required as a decision before the first manual Flight, but numeric entry has two legitimate outcomes:

### A. Start from zero

The user explicitly states that there is no carried-forward total before the first LogMate-known record.

This is different from leaving fields blank.

### B. Enter previous totals

The user enters one or more carried-forward totals.

Important design rule:

> Blank / not supplied must not silently mean zero.

The UI must preserve a distinction between:
- explicit zero;
- explicit entered value;
- not set / unresolved.

Exact storage representation remains OPEN.

## 6. Do not force View Logbook Customize before Previous Total

Previous Total introduces a field-system dependency, but it must **not** turn first use into a field-configuration wizard.

Rejected flow:

```
Start new logbook
→ choose columns
→ configure totals
→ previous totals
→ start
```

Reason:
- conflicts with zero-configuration LogMate Standard;
- confuses display configuration with ledger truth;
- front-loads a professional configuration task before first use;
- makes hidden fields appear equivalent to deleted/untracked data.

Preferred relationship:

```
LogMate-owned total eligibility
        ↓
Previous Total values
        ↓
View Logbook projection
        ↓
visible field → show total
hidden field  → preserve value, do not show
```

## 7. Total-eligibility audit: current evidence boundary

Current contracts do **not** justify a universal rule such as “every Duration or Count field totals.”

### 7.1 Explicitly non-total semantic classes

Current evidence or semantic type supports NO total behavior for:
- Operational Date;
- Aircraft Type;
- Registration;
- SE / ME;
- Category / Class;
- Flight Number;
- Departure / Arrival / Route presentation group;
- Ramp Out;
- Takeoff Time;
- Landing Time;
- Ramp In;
- Approach text / runway metadata;
- Duty Code;
- PF / PM role state;
- Remark;
- non-time Simulator/FSTD metadata.

Clock timestamps are not cumulative durations.

### 7.2 Strong profile-specific total evidence

Current evidence identifies PROFILE_SPECIFIC total behavior for at least:
- Block;
- Actual;
- Night;
- Instrument Flight Time;
- PIC Time;
- SIC / FO Time;
- Takeoff count;
- Landing count;
- Day/Night Takeoff/Landing count variants;
- Simulator/FSTD session time.

This does **not** mean each is globally enabled in every LogMate projection.

Specific strong fixture evidence:
- Alpha-K page/previous/new totals are verified for Block, PIC and FO.

Current Standard mock also renders Page/Previous/New rows for Block, Night and Instrument Flight Time, but that mock does not freeze generic eligibility policy.

### 7.3 Still OPEN for generic eligibility

Do not freeze generic baseline/total behavior yet for:
- IFR Time;
- Actual Instrument;
- Simulated Instrument;
- Instrument Ground Time;
- Cross-Country;
- PICUS;
- SPIC;
- Multi-Pilot;
- Solo;
- Dual;
- Instructor;
- Examiner / Check Pilot;
- generic Total Time;
- generic credited Block/Airborne;
- Custom Duration / Count fields.

Some of these have profile or paper-logbook evidence, but the current generic LogMate eligibility contract is not closed.

Approach Count has profile evidence but is not in the V1 selectable catalog.

## 8. Previous Total UI must be dynamic

Do not hard-code the screen to exactly:
- Block;
- Night;
- Instrument Flight Time.

The composition must support a LogMate-supplied eligible-field list.

Recommended information model for the surface:

```
PREVIOUS TOTAL

[ contextual explanation / boundary ]

Start from zero

or

Carried-forward totals
  [system eligible field]  [value]
  [system eligible field]  [value]
  ...

More totals
```

`More totals` means “show other LogMate-approved total-eligible semantics.” It must not:
- create a new semantic;
- change View Logbook visibility;
- edit the Known Field catalog;
- imply that the user controls eligibility.

For an entered-baseline path, omitted eligible fields remain unknown/not set unless product policy later decides otherwise.

## 9. Contextual baseline reuse

The same baseline interaction family should serve multiple entry contexts.

### Context A — first manual logbook

```
Start a new logbook
→ Previous Total
→ Start from zero / Enter totals
→ Empty Home
→ Add Flight
```

### Context B — import into an empty ledger

Do **not** ask for Previous Total before knowing which records will actually be accepted.

Preferred sequence:

```
Choose/import source
→ Parse
→ Mapping / Preview
→ Duplicate / review decisions
→ determine prospective earliest accepted FlightRecord
→ Previous Total
→ Confirm import
→ Home / View Logbook
```

The relevant boundary is the earliest **accepted** record, not merely the earliest row present in the raw file.

### Context C — import into an existing ledger without an earlier accepted record

If the resulting canonical earliest known Flight does not move earlier:
- existing baseline remains unchanged;
- no baseline interruption is required solely because import occurred.

### Context D — import extends the ledger earlier

If accepted imported records move the earliest known Flight earlier:
- Previous Total requires review;
- do not silently keep the old baseline as though its meaning were unchanged;
- do not silently subtract imported totals from the old baseline without evidence that the imported interval is complete.

Current import contracts do not establish complete historical coverage, so automatic authoritative subtraction is not justified.

### Context E — manual backfill extends the ledger earlier

The same trigger applies to manual entry.

Current Add Flight allows historical dates. Therefore:

> Baseline review is triggered by an earlier resulting canonical record boundary, not by “Import” as a feature.

Preferred UX:
1. allow the valid historical record work to be preserved;
2. make the changed start boundary explicit;
3. route immediately to Previous Total review;
4. do not present baseline-sensitive cumulative totals as fully resolved until review is complete.

Exact commit/staging transaction behavior remains an engineering dependency.

## 10. Baseline-review variant

When the ledger start moves earlier, this is not the same screen as initial entry.

The UI needs a contextual review state such as:

```
PREVIOUS TOTAL — REVIEW

Your logbook now starts earlier.

Previous start
[old context]

New earliest record
[new context]

Set the totals carried forward before the new start.

Current baseline
[read-only old values]

Updated baseline
[editable new values]
```

The old baseline may be shown as reference, but it must not be presented as automatically valid for the new boundary.

## 11. Unknown baseline behavior in View Logbook

If a total-eligible semantic is visible but its carried-forward value is unresolved:
- do not silently assume zero;
- Page Total may still be calculable from known page records;
- Previous Total / New Total must not claim a complete cumulative value without a valid baseline;
- the surface should expose a direct recovery path to set/review Previous Total.

Exact placeholder, warning style, and partial-total behavior remain design/aggregation follow-up items.

If the user explicitly selected Start from zero, the zero baseline is a deliberate user assertion rather than a missing value.

## 12. Progressive disclosure for additional totals

To avoid a large first-use form while preserving professional depth:

- show system-prioritized baseline fields first;
- provide `More totals` for other approved total-eligible semantics;
- later enabling a total-eligible View Logbook field with no baseline should offer contextual baseline completion rather than rewriting first-run onboarding;
- do not require users to learn the 35-field catalog before first use.

The exact prioritized default field set remains dependent on the total-eligibility decision and should not be frozen by the visual mock.

## 13. Import + baseline correctness rules

The UI design must preserve these invariants:

1. import is optional and not a second authoritative logbook;
2. duplicate/skipped rows do not move the baseline boundary;
3. baseline review is based on accepted canonical records;
4. an import batch does not own the baseline;
5. later earlier-range import may require baseline review;
6. overlapping/re-import that does not move the earliest canonical record does not inherently require baseline change;
7. imported semantic values must not be substituted into nearby fields merely to complete totals;
8. Opening Balance and Previous Total remain separate;
9. hidden View Logbook fields retain data;
10. incomplete source history must not be treated as complete merely because a file has an earliest row.

## 14. Design Studio transfer

### Typography
- Welcome has no fake operational values.
- Operational numeric treatment begins where real values exist.
- Previous Total is the first legitimate first-use surface for dense cumulative numerics.
- Do not shrink type or apply negative tracking to force long semantic labels into one geometry.

### Color
- Baseline state must remain understandable in grayscale.
- Explicit zero, entered, unresolved, and review-required states cannot depend on hue alone.

### Layout
- First-use remains low visual density.
- Previous Total may grow vertically with the eligible field list.
- `More totals` is progressive disclosure, not a card grid.
- Large text must reflow; required semantics are not ellipsized to preserve a preferred composition.

### Interaction
- explicit zero ≠ blank;
- initial baseline ≠ review-required baseline;
- hidden ≠ deleted;
- record insertion may change baseline context;
- state change and recovery must remain inspectable.

### Content
- explain the product-specific delta: what “Previous Total” means in LogMate.
- do not teach pilots what a logbook is.
- avoid celebratory or aviation-theatrical copy.
- name the boundary/context when import or backfill makes the ledger start earlier.

### Web / PWA
- form/control surfaces reflow normally;
- keyboard/focus/action reachability must survive short-height and large-text conditions;
- final View Logbook may retain justified local 2-D behavior independently of the baseline form.

## 15. Current selected flow

```
APP LAUNCH
│
├─ returning/restored
│    └─ HOME
│
└─ no product state
     └─ WELCOME
          ├─ SIGN IN → existing-user path
          │
          └─ START A NEW LOGBOOK
                ↓
           PREVIOUS TOTAL
          ┌───────────────┐
          │ Start from 0  │
          │ Enter totals  │
          └───────────────┘
                ↓
             EMPTY HOME
            /          \
       ADD FLIGHT      IMPORT
           │              │
           │         Parse/Preview/Review
           │              │
           │       baseline if resulting
           │       earliest boundary needs it
           │              │
           └──────→ HOME / VIEW LOGBOOK
```

Any later manual/imported record that moves the canonical earliest-known Flight earlier enters the baseline-review variant.

## 16. OPEN dependencies

Still unresolved and intentionally not invented here:

- exact total-eligible field metadata for the generic LogMate projection;
- exact baseline persistence entity/linkage/codec/migration;
- treatment of Custom Field totals;
- exact simulator/FSTD cumulative relationship;
- generic Total Time meaning;
- generic credited Block/Airborne;
- partial baseline display/calculation rules;
- transaction/staging behavior when historical backfill changes the baseline boundary;
- auth/local-owner binding;
- final navigation IA;
- production visual tokens and typography;
- device/browser/AT/pilot-human validation.

## 17. Next design block

Next UI work should produce and critique one coherent visual family for:

1. Welcome — no data;
2. Previous Total — initial zero/entered state;
3. Previous Total — expanded More Totals state;
4. Previous Total Review — earlier import/manual backfill;
5. Empty Home;
6. Import Preview handoff into baseline review.

The visual work must not hard-code unresolved total eligibility as a domain fact.

# First-Use Baseline Composition Specification

Status: **DESIGN COMPOSITION SPEC — PROVISIONAL VISUAL DIRECTION**  
Date: 2026-09-18  
Depends on: `docs/evidence/first-use-previous-total-baseline-policy.md`  
No production Flutter changes are authorized by this document.

## 1. Selected composition principle

The first-use family is designed as a progression from **Macro Calm** to **Micro Precision**.

- Welcome: identity + intent only; no fabricated operational values.
- Previous Total: first legitimate appearance of cumulative operational numerics.
- Empty Home: low-density real workspace with actual next actions.
- First Flight: operational entry density increases through real data.
- Populated Home: real records become the identity carrier.

The UI must remain recognizable as LogMate without:
- stock Material AppBar + card + FilledButton composition;
- SaaS split-auth layout;
- aviation HUD/runway/cockpit decoration;
- fake flight data;
- marketing slogans doing the work of product identity.

## 2. Screen A — Welcome

### User question
“What do I do with LogMate from this device/state?”

### Required content
- LogMate identity;
- Pilot Logbook descriptor if needed for recognition;
- primary: `Start a new logbook`;
- secondary: `Sign in`.

### Excluded
- flight totals;
- routes;
- registrations;
- aircraft;
- sample ledger rows;
- feature-tour bullets;
- Previous Total fields;
- Import choice;
- account-benefit marketing.

### Composition
Prefer one calm vertical axis.

```
LOGMATE
Pilot Logbook


[ substantial quiet field ]


Start a new logbook  →

Sign in
```

The whitespace must separate identity from intent; it must not be decorative filler.

Primary and secondary actions must remain visibly distinct in grayscale.

## 3. Screen B — Previous Total / initial state

### User question
“What cumulative totals should LogMate carry forward before my first known record?”

### Copy architecture
Title:
`Previous total`

Short explanation:
`Set the totals carried forward before your first LogMate record.`

Do not explain what a pilot logbook is.

### Interaction architecture

Use one adaptive surface, not a separate intro carousel.

```
PREVIOUS TOTAL

Set the totals carried forward
before your first LogMate record.


○ Start from zero

● Carry forward totals

  Block                         [ value ]
  Night                         [ value ]
  Instrument Flight Time        [ value ]

  Add previous total  →

Continue
```

The field names above are **layout examples only**, not a frozen product set.

### Why this structure

- the zero path is explicit rather than inferred from blanks;
- users with history can enter values without another route transition;
- the surface can expand as eligible semantics change;
- `Add previous total` can expose other LogMate-approved eligible semantics without becoming View Logbook Customize.

### Geometry

Avoid repeated large rounded input containers.

Preferred field grammar:
- stable label lane;
- aligned numeric lane;
- thin structural rule or controlled baseline;
- right-aligned cumulative numeric values;
- interaction hit area larger than the visible rule;
- error/helper text owns vertical expansion.

The form should visually suggest ledger discipline without imitating paper.

### Numeric treatment

Previous Total is the first first-use surface where operational numeral treatment is legitimate.

Requirements:
- stable figures / punctuation;
- sufficient capacity for `99,999+59` where required;
- clear 0/O and 1/I/l behavior where alphanumeric content appears nearby;
- no font-size reduction to solve fit;
- no hard dependency on unfinished custom type.

## 4. Start-from-zero state

Selecting `Start from zero` is an explicit assertion.

The UI should collapse or deactivate value-entry rows and make the consequence visible.

```
● Start from zero
○ Carry forward totals

Your first LogMate record will begin
with no carried-forward totals.

Continue
```

Do not render dozens of `0+00` values merely to prove zero.

## 5. Carry-forward state

Selecting `Carry forward totals` reveals prioritized eligible fields.

Rules:
- blank ≠ zero;
- a blank field remains not set unless a later product decision says otherwise;
- labels use full semantic names on the form;
- View Logbook compact headers are not reused merely to save width;
- eligibility is system-owned.

`Add previous total` opens a system-approved eligible-field chooser.

It must not:
- toggle View Logbook visibility;
- create a Custom Field;
- redefine semantics;
- expose ineligible fields.

## 6. Additional-total chooser

This is advanced progressive disclosure, not a required onboarding step.

Phone direction:

```
ADD PREVIOUS TOTAL

Eligible totals

[ field name ]                    Add
[ field name ]                    Add
[ field name ]                    Add
...
```

After selection, return to Previous Total with the added entry row visible.

If the final eligible list becomes short enough, this secondary surface can collapse into inline disclosure. Do not freeze the route until eligibility breadth is known.

## 7. Screen C — Previous Total Review / earlier ledger start

### Trigger
The accepted canonical record set would move the earliest-known Flight earlier.

This may come from:
- later import;
- historical manual entry;
- another future record source.

### User question
“What totals apply before the newly earlier start of my LogMate-known records?”

### Composition

```
REVIEW PREVIOUS TOTAL

Your logbook now starts earlier.

Previous start                 01 JAN 2022
New earliest record            03 MAY 2019

Current baseline
Block                           2,350+25
Night                             412+10
...

Totals before 03 MAY 2019

Block                         [        ]
Night                         [        ]
...

Start from zero

Update previous total
```

Example dates/values are illustrative test data only.

### Rules

- old baseline is reference, not silently valid input for the new boundary;
- do not automatically subtract the new records unless completeness is proven by a future domain contract;
- a user must be able to understand why review appeared;
- the screen must state the new boundary context;
- color must not be the only cue distinguishing current/reference vs editable/new values.

## 8. Import handoff

Previous Total occurs **after** import preview/reconciliation has determined what records will actually be accepted.

Preferred sequence:

```
Import source
→ parse
→ source mapping
→ preview
→ duplicate/reconciliation decisions
→ prospective accepted record set
→ earliest-boundary comparison
→ Previous Total if required
→ final import confirmation
```

The raw file's earliest row is not sufficient.

### Empty ledger import

If the import creates the first accepted FlightRecords:
- baseline decision is required;
- show earliest accepted record as context;
- user chooses Start from zero or Carry forward totals.

### Existing ledger import

If the accepted set does not move the earliest-known boundary:
- do not interrupt with baseline UI.

If it does move the boundary:
- route to Review Previous Total.

## 9. Manual historical backfill handoff

Current Add Flight supports historical dates, so the same baseline rule must exist outside Import.

Preferred behavior:

1. user enters/saves a valid older Flight;
2. LogMate detects that the canonical earliest-known boundary moved earlier;
3. the historical record work is preserved;
4. route to Review Previous Total;
5. baseline-sensitive cumulative output remains visibly unresolved until review is complete.

Exact transaction timing is an engineering dependency.

The UI should warn before commitment when the date already proves the boundary will change, but warning copy must not claim a result before save/validation succeeds.

## 10. Screen D — Empty Home after baseline setup

### User question
“What can I actually do now?”

### Required
- actual empty-record state;
- primary `Add flight`;
- secondary `Import records`;
- persistent but quiet baseline recovery entry.

```
LOGMATE

No flights yet.

Add flight  →

Import records

Previous total     Set
```

Variants:
- `Previous total — Starts from zero`
- `Previous total — Set`
- `Previous total — Needs review`

Do not show:
- fake Recent rows;
- fake totals;
- 0-filled dashboard cards;
- empty Search if no records exist and search has no useful first-use role;
- mock Activity.

## 11. Empty Home → first Flight transition

When the first real Flight is added, the surface should grow into the populated Home rather than feeling like a different app.

Continuity should be carried by:
- same page margins / start axis;
- same product wordmark scale family;
- same action grammar;
- same luminance hierarchy;
- operational type roles appearing only with real data.

The first real record, not a marketing illustration, becomes the product identity carrier.

## 12. Visible field vs baseline value

The View Logbook projection must never own baseline existence.

```
semantic value
  ├─ baseline value
  └─ record values

View Logbook configuration
  ├─ visible → render
  └─ hidden  → preserve
```

If a total-eligible field is later made visible:
- existing baseline value appears if known;
- explicit zero appears as zero;
- unresolved baseline must not silently render as zero.

## 13. View Logbook unresolved-total behavior

Design follow-up must include a field-level unresolved cumulative state.

Example concept:

```
              PAGE TOTAL    PREVIOUS      NEW TOTAL
PIC              6+15        Not set          —
```

This is not final copy.

Required behavior:
- Page Total can remain usable if record data is valid;
- Previous/New do not claim a complete cumulative value;
- direct action exists to set/review baseline;
- error/warning state does not depend on color only.

## 14. Responsive behavior

### Phone portrait
- single reading axis;
- labels may stack above numeric entry when measure fails;
- no fixed two-column form if full semantic labels become cramped.

### Phone short-height / keyboard
- content-before-action order;
- scrolling allowed;
- primary action remains reachable;
- no absolute bottom CTA that covers fields/errors.

### Tablet / EFB landscape
- do not simply center a phone form in a huge canvas;
- use a bounded input measure plus real context;
- context may include the baseline boundary and concise meaning, not decorative illustration.

### Large text
- full semantic labels wrap/recompose;
- numeric lane may move below the label;
- no semantic truncation or reduced type size to preserve the normal-size composition.

## 15. Visual-state requirements

Minimum design states:
- no baseline choice yet;
- explicit zero selected;
- carry-forward selected / empty;
- valid entered values;
- invalid local format;
- not-set optional semantic;
- baseline review required;
- baseline review edited;
- pending persistence when eventually implemented;
- known failure;
- outcome unknown if persistence/sync semantics ever require it.

Do not collapse these into one red error style.

## 16. Anti-generic critique

Reject candidate screens if:
- removing the LogMate wordmark makes them indistinguishable from a generic finance/account setup app;
- every datum is inside a rounded card;
- input rows are default Material filled fields repeated vertically;
- all hierarchy depends on mint/green;
- `Previous total` is styled like a marketing onboarding slide;
- aviation motifs are used to simulate professional credibility;
- fake data is introduced merely to make the screen look operational.

## 17. Current selected first-use family

```
WELCOME
  ↓
PREVIOUS TOTAL
  ↓
EMPTY HOME
  ↓
ADD FIRST FLIGHT
  ↓
POPULATED HOME
```

Parallel branches:
- Welcome → Sign in → existing-user path.
- Empty Home → Import → preview/review → Previous Total when required.
- Any later record source that moves the ledger start earlier → Review Previous Total.

## 18. Next visual validation

The next visual candidate should render together, from one design grammar:

1. Welcome;
2. Previous Total — zero state;
3. Previous Total — carry-forward state;
4. Previous Total Review;
5. Empty Home.

Validation matrix:
- light / night;
- phone portrait;
- short-height + keyboard;
- 200% text;
- tablet/EFB landscape;
- grayscale;
- long full labels;
- cumulative `99,999+59`;
- one baseline field unknown.

The candidate is not production-ready until the complete set remains coherent under these states.

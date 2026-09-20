# Logbook Configuration Specification

> Authority: LOGBOOK PRESENTATION / CONFIGURATION CONTRACT ONLY
> Status: CURRENT — CONFIRMED CUSTOMIZE V1 CONTRACT, IMPLEMENTED IN TEMPORARY MOCK/SESSION SHELL
> Source of Truth: [MASTER.md](../../MASTER.md)

## 1. Purpose and boundary

This contract defines the future presentation/configuration architecture for **View Logbook**. It does not define the `FlightRecord` or `SimulatorRecord` schema, calculations, import mapping, renderer/UI widgets, local persistence, Firebase path, or Sync implementation.

The seven tracked output profiles remain presentation/layout evidence in [logbook-format-plan.md](logbook-format-plan.md). Only mappings supported by a matching semantic source are confirmed; unsupported source-to-profile substitutions remain blank/user-entered or OPEN.

## 2. Confirmed current product direction

- A user must not have to choose a branded format during onboarding or the first View Logbook entry.
- With no saved configuration, View Logbook must be able to use a **LogMate Standard** projection immediately.
- LogMate Standard has nine default-ON Customize items and ten leaf columns, in order: operational date, aircraft type, registration, flight number, Route group (`Departure`, `Arrival`), Block, Night, Instrument Flight Time, Remark. The leaf projection is exactly `Date | Type | Reg | Flight | DEP | ARR | Block | Night | Inst | Remark`.
- Departure and Arrival remain distinct Known Field semantics. `Route` is a system-defined presentation Field Group for those leaves, not a stored/canonical value, and moves as one Customize reorder unit.
- Aircraft Type and Registration are independent semantic fields and remain separate ledger columns. They must not be collapsed into one `Aircraft / Reg` semantic column.
- Flight presentation is an IATA-style commercial identifier: 2-character IATA carrier designator + 1–4 digit flight number + optional 1-character operational suffix, with a 7-character maximum presentation capacity. This presentation decision does not define canonical storage constituents, source/raw representation, automatic parsing, or leading-zero normalization; those remain DATA-001 OPEN.
- Logbook presentation customization has one current user-facing entry point: **View Logbook → Customize**. A separate `Settings > Logbook` configuration entry is not currently required; Settings remains oriented toward app and data management.
- A separate user-facing Template Editor, template selector, or multiple-template picker is not required for V1. An internal Logbook Configuration or template-like model remains compatible with this direction; future preset/template support is OPEN / DEFERRED.
- Configuration changes are presentation/projection metadata. They do not create a second ledger, mutate a `FlightRecord`/`SimulatorRecord`, delete a value, or change source/provenance precedence.
- Every Standard default item/group may be shown/hidden and reordered within the visible area. A hidden item does not imply its values are absent or deleted. A stored/imported/calculated value can be displayed even when its Add Flight field is not currently visible.
- Known Field semantic identity, full semantic name, and compact ledger header are owned by LogMate. V1 does not support Known Field rename or arbitrary user display-label editing.
- Customize V1 uses one catalog, with visible/ON items above hidden/OFF items. It has no separate Add Column, Common, or More Fields navigation.
- View Logbook display-column configuration and Add Flight entry-field presentation are separate concerns. Current Add Flight Time Compact/Expanded behavior remains unchanged; their future integration must avoid duplicated settings.
- The intended configuration use is local-first: after a user changes it, the configured projection should be usable locally before network Sync. It may later be an owner Sync subject for cross-device consistency.
- Phone and tablet share the same configuration, field catalog, projection state, and totals semantics. Their layout composition may adapt to available width; exact breakpoint/composition is not set here.

Implementation status: **IMPLEMENTED — temporary mock/session presentation shell only.** Home opens the ten-leaf LogMate Standard landscape ledger with explicit mock rows and Page/Previous/New totals for Block, Night, and Instrument Flight Time. Current-session Customize implements all 35 top-level catalog items, nine default-ON items, stable hidden order, visible reorder, immediate changes, and renderer-controlled Route, Takeoff/Landing, Approach, and Simulator/FSTD groups. It enforces at least one visible top-level item and resets to the Standard session projection. `+ Custom Field` is a disabled entry point; Custom Field creation/rename/values, FlightRecord projection, calculation, page-policy UI, local configuration persistence, and Sync remain **NOT IMPLEMENTED**.

## 3. Primary model — PROPOSED

The recommended primary model is:

```text
canonical/current FlightRecord + SimulatorRecord
                 ↓
Known Field Catalog (LogMate-owned semantic identities)
                 ↓
Logbook Configuration (selected columns and presentation policy)
                 ↓
projection state + page/total state
                 ↓
width-adaptive View Logbook ledger / export renderers
```

This is deliberately not a free-form report builder for built-in fields. A user selects a known semantic field, chooses whether it is visible, and orders it. They do not define an arbitrary data source, formula, computed column, or total rule. User-created Custom Fields are separately confirmed below; their v1 types are constrained and manual-input-centred.

The conceptual configuration may need: selected item/group identities, visibility, visible order, group child options, time-display preference, rows per page, and total-presentation/page-policy preferences. Known Field labels are renderer-owned catalog metadata rather than user-editable configuration. These are requirements for a future model, **not** approved class/enum/field names, JSON codec, database schema, migration, or Firebase representation.

## 4. LogMate Standard — CONFIRMED default projection

The existing profile matrix supports a LogMate-owned generic ledger rather than mandatory first-use branded selection. Its default semantic column set and order are confirmed:

| Customize order | Item / semantic | Leaf semantics | Default ledger header(s) |
| ---: | --- | --- | --- |
| 1 | operational date | operational date | `Date` |
| 2 | aircraft type | ICAO Aircraft Type Designator semantic value | `Type` |
| 3 | registration | aircraft registration / ident | `Reg` |
| 4 | flight number | flight number | `Flight` |
| 5 | Route system Field Group | departure; arrival | `DEP`; `ARR` |
| 6 | Block | Block duration semantic field; not Actual | `Block` |
| 7 | Night | recorded Night duration semantic field | `Night` |
| 8 | Instrument Flight Time | pilot/company-recorded Instrument Flight Time; not IFR Time or Actual Instrument | `Inst` |
| 9 | Remark | free/uninterpreted user text | `Remark` |

These nine default-ON Customize items produce exactly ten leaf columns. Their semantic identities, order, group boundary, and compact headers are **CONFIRMED**. Remark is the only newly default-ON item beyond the previous Standard membership. A default item may be hidden or reordered without deleting record data; Route always moves and toggles as one unit in V1.

Aircraft Type uses the ICAO Aircraft Type Designator direction and the bundled offline lookup foundation specified in [aircraft-type-reference-spec.md](aircraft-type-reference-spec.md). Registration is independent flight/user data and is never inferred from Type. Add Flight Type/Registration entry UI, real ledger data projection, and canonical representation remain separate and unimplemented.

### Confirmed default membership

| Semantic field/group | Existing mapping evidence |
| --- | --- |
| Operational date | All seven profile definitions include a date identity. |
| Aircraft type | Compact, EASA/European, Alpha-K, Jeppesen Professional (US), and ASA-SP-57 mappings identify it; Jeppesen/European uses the EASA field set. |
| Registration / ident | A separate field from Aircraft Type in the same mappings. |
| Route group (`Departure`, `Arrival`) | The distinct leaves are present across profile mappings as route or from/to; EASA/European additionally projects place/time. Grouping is presentation-only. |
| Flight number | Present in Compact and Alpha-K; it is confirmed Standard membership, not a generic required field. |
| Block | Standard uses the current Block semantic. Alpha-K explicitly labels B/T; generic profile Total Time mapping remains OPEN. |
| Night / Instrument Flight Time | Both are recorded-duration semantics in Standard and source material. Profile labels that require another semantic are not substitutes. |
| Remark | Repeated as `Remark` or `Remarks and Endorsements`; Standard uses uninterpreted user text and does not generate an endorsement. |
| Page totals | The page/previous/new total model is confirmed for paper-logbook projection, but it is a page presentation rather than a Standard row column. |

V1 does not divide selectable items into Common and specialized tiers. Evidence breadth still constrains semantic meaning, but every confirmed selectable item appears in the single catalog defined below.

## 5. V1 selectable catalog — CONFIRMED

The catalog is the single semantic bridge between known record values and selectable ledger columns. The table order is the stable V1 catalog order: visible items may be user-reordered, while hidden items are not reorderable and retain this relative order. If a visible item is turned OFF, it returns to its position in this stable hidden order.

| Order | Item / semantic | View compact header | Customize label | Standard default |
| ---: | --- | --- | --- | --- |
| 1 | Operational date | `Date` | `Date` | ON |
| 2 | Aircraft Type | `Type` | `Type (Aircraft Type)` | ON |
| 3 | Registration | `Reg` | `Reg (Registration)` | ON |
| 4 | SE / ME | `SE/ME` | `SE/ME (Single-Engine / Multi-Engine)` | OFF |
| 5 | Category / Class | `Category/Class` | `Category/Class` | OFF |
| 6 | Flight Number | `Flight` | `Flight (Flight Number)` | ON |
| 7 | Route system Field Group | leaf `DEP`, `ARR` | `Route` | ON |
| 8 | Ramp Out | `R/O` | `R/O (Ramp Out)` | OFF |
| 9 | Takeoff Time | `T/O Time` | `T/O Time (Takeoff Time)` | OFF |
| 10 | Landing Time | `L/D Time` | `L/D Time (Landing Time)` | OFF |
| 11 | Ramp In | `R/I` | `R/I (Ramp In)` | OFF |
| 12 | Takeoff / Landing system Field Group | grouped child headers | `Takeoff / Landing` | OFF |
| 13 | Block | `Block` | `Block` | ON |
| 14 | Actual | `Actual` | `Actual` | OFF |
| 15 | Night | `Night` | `Night` | ON |
| 16 | Instrument Flight Time | `Inst` | `Inst (Instrument Flight Time)` | ON |
| 17 | IFR Time | `IFR` | `IFR (IFR Time)` | OFF |
| 18 | Actual Instrument | `Actual Inst` | `Actual Inst (Actual Instrument)` | OFF |
| 19 | Simulated Instrument | `Sim Inst` | `Sim Inst (Simulated Instrument)` | OFF |
| 20 | Instrument Ground Time | `Inst Ground` | `Inst Ground (Instrument Ground Time)` | OFF |
| 21 | Approach system Field Group | `TYPE` [+ `RWY`] | `Approach` | OFF |
| 22 | PIC Time | `PIC` | `PIC (PIC Time)` | OFF |
| 23 | SIC / FO Time | `SIC/FO` | `SIC/FO (SIC / FO Time)` | OFF |
| 24 | PICUS | `PICUS` | `PICUS` | OFF |
| 25 | SPIC | `SPIC` | `SPIC` | OFF |
| 26 | Multi-Pilot | `Multi-Pilot` | `Multi-Pilot` | OFF |
| 27 | Cross-Country | `Cross-Country` | `Cross-Country` | OFF |
| 28 | Solo | `Solo` | `Solo` | OFF |
| 29 | Dual | `Dual` | `Dual` | OFF |
| 30 | Instructor | `Instructor` | `Instructor` | OFF |
| 31 | Examiner / Check Pilot | `Exam/Check` | `Exam/Check (Examiner / Check Pilot)` | OFF |
| 32 | Duty Code | `Duty Code` | `Duty Code` | OFF |
| 33 | PF / PM | `PF/PM` | `PF/PM (Pilot Flying / Pilot Monitoring)` | OFF |
| 34 | Simulator / FSTD system Field Group | `Time` [+ selected child headers] | `Simulator / FSTD` | OFF |
| 35 | Remark | `Remark` | `Remark` | ON |

The independent selectable Known Fields are every non-group row above. The group rows own the specific leaf semantics defined in section 8; group parents are presentation/configuration identities rather than stored values. Exact catalog class, codec, persistence, migration, and total-eligibility metadata remain OPEN under DATA-001 and configuration design. A total-eligible duration leaf must retain cumulative display capacity for `99,999+59`, but this pass does not decide total eligibility for every optional field.

## 6. Column semantics and source mapping — CONFIRMED boundary

A selectable Known Field must refer to a LogMate-known semantic value. Selecting it must not ask the user “what data should this column contain?” Existing mappings already establish examples of fixed semantic projections:

| Presentation label/slot in existing mapping | Confirmed semantic projection |
| --- | --- |
| Standard `Inst` | Instrument Flight Time |
| Jeju Air `instTme` | Instrument Flight Time only; never IFR Time or Actual Instrument |
| Compact `Actual` / `Block` | Actual and Block as separate semantics; no generic FOM-prorated duration |
| Alpha-K `B/T` | Block semantic. Generic Total Time fields in other profiles remain OPEN unless separately evidenced. |
| Alpha-K `Actual Inst`; EASA `IFR`; US `Actual Instrument` | Their named semantics only. If a matching source does not exist, leave blank/user-entered; do not substitute Instrument Flight Time. |
| Night | Recorded Night duration; never a solar-derived replacement and never Duty-Code-prorated |
| PIC / FO(SIC) | User-entered or verified context-specific PIC/FO credit; Duty Code alone does not set PF/PM |
| ASA-SP-57 / Jeppesen Professional day/night landings and source Approach Count evidence | personal day/night landing counts retain their named semantics; source evidence for Approach Count does not make it V1-selectable |

The evidence does not establish a generic user-facing selector that lets one arbitrary “Flight Time” column switch between Block and Actual. Such **selectable-source slots are OPEN**; no source-selection UI is approved by this contract.

## 7. Display columns versus entry fields — CONFIRMED boundary

**Entry Fields** are the fields a user sees and enters in Add Flight. **Display Columns** are the fields a View Logbook ledger projects. Neither is the other’s whitelist.

Consequences:

- A compact Add Flight user can enter Block/Night/Instrument Flight Time while viewing a broader ledger column set.
- An operational value that is hidden in Add Flight Compact can still be shown in View Logbook when it exists from input, import, or a future calculation.
- Hiding a ledger column must not remove record data, provenance, source evidence, or a future derived value.
- Current Add Flight Compact/Expanded presentation must not be changed by this contract. Future entry-field customization and its relationship to that Show/Hide control are **OPEN**.

## 8. Customize / Column options — CONFIRMED direction

### User-facing boundary

`Customize` is optional progressive disclosure, not a first-use requirement: a first-time user can immediately use the LogMate Standard projection without configuration. Users enter it only when they want the presentation to resemble their own paper logbook more closely.

View Logbook → `Customize` is the single current user-facing surface for changing that presentation. It is not a separate Template Editor, template selection flow, or multiple-template picker. Internal use of a Logbook Configuration or template-like model does not change this V1 user-facing boundary; multiple presets/templates remain OPEN / DEFERRED.

### Single catalog and immediate changes

The first View Logbook experience is zero-configuration LogMate Standard. V1 keeps all selectable items on the existing Customize surface:

- visible/ON items appear first and are reorderable;
- hidden/OFF items appear below and are not reorderable;
- OFF→ON moves the item into the visible area;
- ON→OFF restores the item to its position in the stable catalog order from section 5;
- Switch changes and reorder drops apply immediately;
- Back does not roll back changes, and there is no Done, Apply, Save, or Cancel;
- `+ Custom Field` remains available between the active and inactive areas; exact visual placement may be tuned during implementation;
- Reset restores the LogMate Standard default projection without deleting Custom Field definitions or any record values.

No separate Add Column, Common, or More Fields navigation is required. Hiding any item/group is presentation-only and never deletes a source, current, calculated, imported, or manually entered value. System Field Groups toggle and move as one reorder unit; V1 does not split or reassemble them.

**Current implementation evidence:** the temporary mock Customize surface applies changes immediately and has SHOWN/HIDDEN areas, visible-only reorder, stable hidden catalog order, OFF-to-stable-HIDDEN/ON-to-SHOWN-bottom behavior, Back-without-rollback, and no commit controls. It implements the 35-item catalog, Standard Remark membership, `+ Custom Field` label, and the four system Field Group session projections. The `+ Custom Field` control remains disabled; Custom Field definitions/values and all configuration persistence/Sync are NOT IMPLEMENTED.

### Known Field names — CONFIRMED

LogMate owns every Known Field's semantic identity, full semantic name, and compact ledger header. Known Field rename and arbitrary user display-label editing are not supported in V1. Customize uses this display rule:

- if compact header equals full name, show that one name;
- otherwise show `Compact (Full Name)`.

The exact V1 names are in section 5, including `Date`, `Type (Aircraft Type)`, `Reg (Registration)`, `Flight (Flight Number)`, `Inst (Instrument Flight Time)`, `PIC (PIC Time)`, `SIC/FO (SIC / FO Time)`, and `Actual Inst (Actual Instrument)`. Future preset/dedicated renderers may use other system-owned output labels; that is not user free-rename functionality. Custom Field names remain user-defined and renameable.

### System Field Groups — CONFIRMED / IMPLEMENTED IN MOCK/SESSION SHELL

Only leaf semantics bind record values. A system Field Group is a presentation/configuration unit and has no stored record value of its own.

- **Route:** owns the distinct `Departure` and `Arrival` leaves. Customize shows `Route`; View Logbook shows `DEP` and `ARR`. Route is not a new stored/canonical value and cannot be split in V1.
- **Takeoff / Landing:** owns total or Day/Night count leaves. While the parent is ON, it exposes `Split by Day / Night`. With split OFF, the leaves are Takeoffs and Landings and View may use `T/O` and `L/D`. With split ON, the leaves are Day Takeoffs, Night Takeoffs, Day Landings, and Night Landings, rendered under system groups `TAKEOFFS → DAY / NIGHT` and `LANDINGS → DAY / NIGHT`. Never infer a Day/Night value from total Takeoffs/Landings or from the other endpoint.
- **Approach:** the primary Approach value is free/uninterpreted Text. While the parent is ON, it exposes `Show Runway`. With Runway OFF, View shows only the Approach/Type text column. With Runway ON, the system group contains `TYPE` and `RWY`; Runway is also free Text. LogMate does not enum-interpret company/user codes such as `M`, `O`, `A`, `2`, `3`, `ILS Z`, or `RNP AR`.
- **Simulator / FSTD:** parent ON always projects the Simulator / FSTD Time leaf; Time is not a separate user-selectable child option. Optional children are Type, Device / Qualification, and Instruction Type, all default OFF. Their leaf semantics remain Simulator / FSTD Time, FSTD Type, Device / Qualification Number, and Instruction Type. The three optional child selections persist across parent OFF→ON during the session. This presentation grouping does not change the canonical data relationship; that contract remains owned by [data-schema-spec.md](data-schema-spec.md).

### V1 exclusions

The following are not V1-selectable: Distance, Holds, Approach Count, separate Landing Detail, generic Total Time, generic credited Block/Airborne, Auto Land count/RWY/RVR-VIS/S-U as built-in Known Fields, and Crew as a generic ledger column. Evidence/source documents may retain those fields without making them V1 catalog members. Auto Land may be tracked through a Custom Field.

V1 also excludes free Known Field rename, free column resize, a free Header Group editor, group split/reassembly, arbitrary cell merge, and formula/custom calculated fields.

### Import mapping boundary — CONFIRMED direction

Import maps a source column to a user-confirmed Known Field or Custom Field, then to canonical stored data. View Logbook renders Known Fields with LogMate-owned catalog/header metadata and only the system groups above. Import mapping must not use a compact header, Customize label, renderer-specific label, or Field Group as data identity.

LogMate Standard import format can provide a simple path without manual mapping. Generic CSV/XLS/XLSX mapping is an optional advanced import path. Exact Import UI, parser, schema, and the CrewConnex-specific importer are outside this configuration task.

### Field-specific confirmed behavior

- **PIC / SIC:** both are selectable Known Fields and support manual credited-time entry. Import-derived credited time is allowed only from preserved raw Duty Code / Position plus a verified company/FOM-specific rule. Do not infer it through a universal airline rule, a Captain→PIC shortcut, an FO→SIC shortcut, or absent source data.
- **Crew / Remark / PF-PM:** Crew is not V1-selectable as a generic ledger column; structured crew data may instead support Search and other features. Remark is free Text. PF/PM remains a separate selectable Known Field, and its input/source/derivation UX remains DATA-002 OPEN.
- **Cross-Country:** this is a selectable Known Field; Departure != Arrival must not auto-classify it. Import may provide a value; otherwise it may be blank or manually entered.
- **Instrument semantics:** Instrument Flight Time, IFR Time, Actual Instrument, Simulated Instrument, and Instrument Ground Time are separate Known Fields. Standard `Inst` means Instrument Flight Time. Jeju Air `instTme` maps only to Instrument Flight Time and is never derived from Actual. A profile field stays blank/user-entered when the matching semantic is unavailable.
- **Night:** Night is a recorded duration. Solar/coordinate state may assist only Day/Night T/O/L/D classification and never calculates, replaces, or mismatch-checks the Night duration. Missing Night is unresolved, not Day.
- **Auto Land:** Auto Land count/RWY/RVR-VIS/S-U are not built-in Known Fields and receive no automatic population. A user may track them through Custom Fields. An Alpha-K A/L slot remains blank or may later use user-selected/custom mapping; it does not force a canonical Auto Land semantic.

### Width and full-value presentation

V1 has no user column-width resize UI. Known Field and system Field Group widths are LogMate-controlled renderer metadata. Existing Standard pixel dimensions, including 96px-class duration columns, remain implementation evidence/reference; they do not establish one shared final width for every optional or Custom column. Exact new pixel widths remain implementation tuning under VIEW-LOGBOOK-001.

Custom Fields retain the same ledger body font size; the renderer must not shrink text to fit. Automatic Custom Field width is based on the larger of the width required by the Custom Field name and the minimum width required by its data type. The V1 data types remain Text, Duration, and Count.

Cells keep the base ledger body font size and a one-line presentation. They do not auto-scale text. Text exceeding its column displays an ellipsis (`…`) in presentation only; the stored source/current value is never truncated. Tapping an ellipsized or otherwise full-value cell must provide popup/overlay inspection of the complete value. Exact popup visual and interaction remain OPEN.

### User Custom Fields — CONFIRMED v1 direction

Users may create and rename Custom Fields in the app. `+ Custom Field` is available between the visible and hidden catalog areas. Custom Field v1 types are **Text**, **Duration**, and **Count**; Clock is excluded. Custom Field definitions and their record values are data concerns, distinct from presentation-only column configuration. Reset does not delete either definitions or values. They are intended for manual entry, owner data, Firebase owner Sync, Excel export, and re-import.

V1 is manual-input-centred and excludes formula/custom calculated fields. Exact canonical schema, persistence path, migration, Sync conflict behavior, and stable Custom Field ID format remain OPEN under DATA-001 and configuration/data design.

Known Fields and Custom Fields must remain internally distinguishable. LogMate must not interpret a Custom Field as though it were a Known Field. Custom Field schema, persistence, and stable identity remain OPEN and are not implemented by the current Customize surface.

## 9. Page policy and totals — CONFIRMED product contract / NOT IMPLEMENTED UI

The established paper-ledger total model remains:

```text
PAGE TOTAL + PREVIOUS TOTAL = NEW TOTAL
```

`Page Total` is the sum of actual FlightRecords on the current page. `Previous Total` is the cumulative total before the page, and `New Total` is their sum; the next page uses that New Total as its Previous Total. The chain is continuous across the whole Logbook and never resets by year. Page totals are derived rather than independently fixed.

`PreviousTotalBaseline` and `OpeningBalance` are distinct and must not be double counted. A manual initial Previous Total may provide the cumulative starting point before the records known to LogMate; it does not recreate those past flights. This confirms a simple starting direction only: detailed category/aircraft/role baselines and a setup wizard are **DEFERRED**.

Rows per page belongs to Logbook Configuration: default capacity is **15**, and the configurable range is **3–100**. Capacity is the maximum number of Flight rows; it does not require that many records. The first View Logbook position is the latest page in the current data projection. Page numbering is a single continuous record stream (`Page 1`, `Page 2`, …), not a per-year sequence.

Users may manually end a page before capacity or set a particular Flight as a page start to align imported/app records with their physical paper logbook. Exact action label and interaction are **OPEN**. A page that ends early renders its remaining capacity as blank presentation rows. Blank rows are not FlightRecords or stored flight data and never participate in search, flight count, statistics, or Page Total.

Manual page-start anchors must use stable FlightRecord identity rather than a mutable row index. Exact anchor/configuration schema, segment-editing UI, and persistence are **OPEN** under DATA-001. A future configuration or rows-per-page change may be anchored after a Flight, but it must not reset cumulative totals; Volume model/UI and canonical schema are **DEFERRED**.

Monthly, quarterly, half-year, and yearly page breaks are not automatic features. A user may manually break at those times for paper presentation, but page boundaries never define period statistics; those statistics are date-based FlightRecord calculations. Finalized/locked pages, paper-correction reconciliation, posted-paper snapshots, and delta-carry workflows are **OUT OF SCOPE**. After an insert, edit, or delete, page projection and later cumulative totals re-project from app data while explicit page-start anchors are preserved; the incremental invalidation/recalculation algorithm belongs to the future Aggregation Engine.

Total eligibility must be semantic/catalog-controlled rather than user-authored. Existing contracts confirm, by profile, that:

- Compact totals time, count, PIC/FO; it excludes aircraft/flight/route/duty/Remark.
- EASA/European, Jeppesen/European, and Alpha-K total time and landing-count columns.
- The Alpha fixture verifies page/previous/new totals for Block, PIC, and FO.

This evidence is sufficient to require explicit total eligibility metadata, but not to declare every duration or count summable in every generic configuration. Exact generic total-column selection/presentation is **OPEN**.

## 10. Mobile and tablet ledger — CONFIRMED direction

View Logbook is a digital ledger intended to help paper-logbook transcription, not merely a flight-history card list. Phone presentation is landscape-oriented; tablet can show a wider version of the same ledger concept. A single flight record should correspond to a ledger row as far as the selected configuration permits.

The mock fixed-column View Logbook shell is **IMPLEMENTED** as landscape-only while mounted: it supports `landscapeLeft` and `landscapeRight`, and restores the app-default orientation policy when disposed. Width breakpoints, tablet-specific composition, portrait View Logbook product UX, and the final real-data renderer remain OPEN / NOT IMPLEMENTED. Platform-specific domain branches and duplicated catalog/projection/totals logic are out of scope.

The current mock shell's sticky header and minimal left-side iOS-style scroll indicator are **IMPLEMENTED**. The indicator represents only vertical position inside the current page; it is not a page-number or whole-logbook progress indicator.

## 11. Existing seven profiles — preserved contract and proposed future role

The following is current, not historical: Compact airline, EASA/European, Jeppesen/European, Alpha-K, Jeppesen Professional (US), ASA-SP-57, and Custom have confirmed coverage/mapping in [logbook-format-plan.md](logbook-format-plan.md). General Aviation remains import/reference only, not an output profile.

### Option A — retain seven renderers and add Standard

Keep every current branded/profile renderer as an equal primary first-use choice and add a separate LogMate Standard layout.

### Option B — configuration-first primary model

Make LogMate Standard plus Known Field Catalog configuration the first-use model; preserve the seven mappings as field-coverage evidence and potentially offer selected mappings as optional starting presets later.

### Recommendation — PROPOSED

Option B best matches Simple is Best and the confirmed no-mandatory-branded-selection direction. It also avoids making View Logbook architecture depend on exact branded layout replication. It **does not** supersede the existing seven output-profile contract: whether each becomes an optional product preset, retains a dedicated renderer, or changes V1 scope requires a later MASTER decision (LOGBOOK-001).

## 12. Local-first and Firebase Sync — CONFIRMED direction / OPEN details

Configuration should apply locally immediately and later participate in owner-based Firebase Sync for cross-device consistency. It must remain separate from canonical records and their source/revision rules.

The following are intentionally not fixed: collection/path, field names, configuration version, codec, migration, `updatedAt`, merge strategy, and conflict handling. For example, a Phone offline change to 12 rows/page and an iPad offline change to 15 rows/page require a dedicated unresolved conflict policy (**CONFIG-SYNC-001**).

## 13. Product-design boundary for branded forms

A LogMate-owned generic configurable ledger reduces product dependence on reproducing an exact branded paper layout. This is a product-design rationale only. It makes no legal conclusion and does not alter the existing reference/mapping evidence or the current prohibition on external brand/design replication.

## 14. Status summary

### CONFIRMED

- First use must not require branded format selection; LogMate Standard is the immediate configuration-free projection direction.
- LogMate Standard has nine default-ON Customize items and exactly ten leaves: `Date | Type | Reg | Flight | DEP | ARR | Block | Night | Inst | Remark`. Remark is the only newly default-ON item.
- Route is the non-stored system group for distinct Departure/Arrival semantics and moves as one V1 unit.
- Aircraft Type and Registration are distinct catalog fields and distinct Standard columns. Type uses the ICAO Aircraft Type Designator reference direction; it does not determine Registration.
- Configuration is a local-first presentation/projection concern, separate from records, provenance, and entry-field visibility.
- V1 uses one catalog with reorderable visible items above stable-order non-reorderable hidden items; it has no Add Column/Common/More Fields path.
- Takeoff/Landing, Approach, and Simulator/FSTD use the fixed system-group behavior in section 8; V1 has no free Header Group editor or group split/reassembly.
- LogMate owns Known Field full names and compact headers; Known Field free rename is unavailable. Customize uses `Compact (Full Name)` when they differ.
- User Custom Fields support renameable Text, Duration, and Count definitions; Clock and formula/custom calculated fields are excluded.
- V1 has no user width resize. Known/system widths are renderer metadata; Custom width uses the larger of name width and data-type minimum without shrinking body text.
- PIC/SIC may be manually entered; import-derived values require raw role evidence and a verified company/FOM-specific rule. Cross-Country is never inferred from route inequality.
- View Logbook → Customize is the current user-facing presentation-configuration entry point; a separate Settings > Logbook entry is not required.
- Distance, Holds, Approach Count, separate Landing Detail, generic Total Time/credited Block/Airborne, generic Crew, and built-in Auto Land details are not V1-selectable.
- The supported semantic/layout evidence from the seven profiles, General Aviation’s import/reference-only status, and the page/previous/new total model remain intact. A profile slot without a matching source semantic is blank/user-entered or OPEN.

### PROPOSED

- LogMate Standard + configuration-first as the primary model.
- Option B migration path.
- Generic ledger as the common phone/tablet presentation source.

### OPEN

- Exact built-in catalog class/schema/codec/migration and total-eligibility metadata.
- Optional branded presets/dedicated profile renderer scope.
- Exact configuration model/schema/codec/version/migration/local adapter.
- Exact page-control wording/interaction, page-anchor/configuration schema, segment editing, horizontal-scroll behavior on page change, and generic total-column presentation.
- Time-display configuration scope and selectable-source slots.
- Entry-field customization relationship to Add Flight Compact/Expanded.
- Exact Custom Field schema/path/migration/stable-ID format and Sync conflict behavior.
- Future multiple preset/template support and any template-selection UX.
- Exact full-value popup visual and exact Known/system/Custom pixel widths.
- Phone/tablet breakpoint, portrait View Logbook product UX, and exact adaptive layout.
- Firebase path, Sync/conflict/merge policy (CONFIG-SYNC-001).

### NOT IMPLEMENTED

- Real-data View Logbook projection/renderer, Custom Field create/rename/value UI, and page-policy UI. The Remark-inclusive Standard reset, optional catalog, stable hidden order, and system Field Groups exist only in the temporary mock/session shell.
- LogMate Standard configuration persistence/local-first application, Firebase Sync, and conflict handling.
- Calculation/Aggregation Engine integration, branded renderer/preset delivery, and PDF/Excel/print rendering.

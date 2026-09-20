# Flight Import Contract

> Authority: IMPORT DOMAIN CONTRACT ONLY
> Status: CURRENT — CONFIRMED BOUNDARIES; OPEN ITEMS EXIST
> Source of Truth: [MASTER.md](../../MASTER.md)

최종 갱신: 2026-09-13

## 1. Purpose and implementation status

Import is an optional path into the same personal Pilot Logbook used by manual entry. No import parser, reconciliation repository, production export, or import UI is currently implemented; Settings contains an Import menu only.

This contract owns general import optionality, local processing, matching, provenance, reconciliation, and source-column mapping boundaries. [crewconnex-parser-plan.md](crewconnex-parser-plan.md) owns only the CrewConnex parser profiles and failure rules. [logbook-format-plan.md](logbook-format-plan.md) owns output projection, not import behavior.

## 2. Manual-first and import-optional

- LogMate must be fully usable with manual flight entry only.
- Import may happen before manual records exist, after they exist, once, repeatedly, or never.
- A manual FlightRecord may exist without external `SourceEvidence`.
- No required lifecycle such as `initial company import → monthly verification import → CrewConnex refresh` exists.
- Import and re-import operate against the current local ledger; they do not create a second authoritative logbook.

## 3. Local/on-device processing target

When implemented, the normal pipeline is:

```text
local file selection
  → on-device parser and source-profile validation
  → normalized source record with raw values/locator
  → local record matching and duplicate/conflict detection
  → preview/review
  → user-confirmed local create/update
  → later owner Sync, when available
```

Source files are not uploaded to Firebase merely for parsing, matching, or reconciliation. Firebase Auth/owner Sync is a connectivity layer over local operation, not the normal query/compute backend. Original company, roster, and Maint Log files are not retained in app backup/Sync; only the approved normalized evidence/provenance direction may persist.

## 4. Matching and reconciliation

| Match result | Required behavior |
| --- | --- |
| No existing match | Present a new-record candidate. It is not silently committed before the applicable validation/review flow. |
| One clear existing match | Compare field-by-field and present reconciliation where values differ. |
| Ambiguous candidates | Keep the candidate in review/staging; do not create, attach, or overwrite automatically. |

User-confirmed current values are never silently overwritten. External sources have field-specific roles; company operational data and CrewConnex roster data are not interchangeable. Re-import may update source evidence or an unresolved source-managed value, but it must preserve a manual edit or explicit retain decision.

Exact duplicate composite keys, confidence thresholds, review copy, and update transaction schema remain OPEN under DATA-001/import design.

## 5. Jeju Air company source boundary

The tracked Jeju Air samples support these mappings:

| Company column | Semantic | Boundary |
| --- | --- | --- |
| `fltDat` + `fltTime` | source operational date + Ramp Out | `fltTime` matched Maint Log R/O in the verified sample legs. |
| `bt` | recorded source Block | Preserve as source Block. |
| `at` | recorded Actual | `Actual = Landing - Takeoff` is a calculation/validation relationship only when enough clocks exist. |
| `ntTme` | recorded Night duration | Do not derive from solar state or treat missing as Day. |
| `instTme` | Instrument Flight Time | Do not derive from Actual or map to IFR Time/Actual Instrument. |
| `toCnt` / `ldCnt` | source personal T/O/L/D indicator | Does not establish PF/PM. |

Ramp In is absent from the company Excel columns. The common Record Calculation Engine may derive `Ramp In = Ramp Out + Block`. That value must retain calculated provenance and remain distinguishable from imported/manual Ramp In; it must never be described as company-imported. The available source does not establish why the company omitted Ramp In, so no intentional-omission rationale is adopted.

Actual alone cannot recover both Takeoff and Landing endpoint clocks. Import must not manufacture both endpoints from one duration.

Duty Code remains raw source evidence. A separate verified FOM/company rule may derive PIC/FO experience only where its required context is present. It must not prorate Night or Instrument Flight Time, create generic credited Block/Airborne, or infer PF/PM.

## 6. Day/Night T/O/L/D helper boundary

Recorded Night remains an independent source/current value. A user-confirmed current value is not replaced by astronomy or a later external source without review. Solar/coordinate input may only assist Day/Night T/O/L/D classification when personal T/O/L/D counts exist:

- explicit Night `0` may support a Day candidate;
- `Night = Block` may support a Night candidate;
- `0 < Night < Block` indicates only a partial-night leg and does not establish either endpoint state or prove that departure and arrival states are opposite;
- one endpoint's state must never be derived from the other endpoint;
- a future helper must evaluate each relevant endpoint independently from sufficient event-time/location inputs under the finally approved astronomical/regulatory Night boundary;
- missing Night, insufficient/unsafe independent endpoint inputs, or an unresolved boundary remains unresolved and user-editable, with no Day fallback.

A solar difference is not a Night-duration mismatch. The exact required clock/location inputs, solar algorithm, sunset/civil-twilight/regulatory boundary, helper review UX, provenance, and coordinate-reference architecture remain IMPORT-001/AIRPORT-GEO-001 OPEN. No solar helper is implemented.

## 7. CrewConnex role

CrewConnex PDF and verified TSV are optional enrichment/cross-check sources only:

- existing-record-only;
- crew snapshot and BLH evidence, not an independent FlightRecord;
- no fixed cadence;
- future, unmatched, ambiguous, and non-flight activity must not create a FlightRecord;
- no source-file cloud upload merely for parsing.

Date `-1/0/+1` is a matching candidate comparison, not automatic operational-date correction. Parser-profile details and safe failure are in [crewconnex-parser-plan.md](crewconnex-parser-plan.md).

## 8. `7C` flight-number normalization

This normalization applies **only** to Jeju Air (`7C`) records. Do not infer, trim, pad, or otherwise normalize another carrier until an explicitly approved rule exists.

The company file supplies combined `fltNo`. Preserve the received raw value. Trim surrounding whitespace and uppercase only for validation. A supported normalized candidate matches `^7C(\d+)$`.

| Source `fltNo` | carrierCode | sourceFlightNumber | displayFlightNumber | UI display |
| --- | --- | --- | --- | --- |
| `7C0125` | `7C` | `0125` | `125` | `7C 125` |
| `7C125` | `7C` | `125` | `125` | `7C 125` |
| `7C1107` | `7C` | `1107` | `1107` | `7C 1107` |

For `7C`, strip leading zeroes from the numeric suffix for display. If the suffix is all zeroes, display one `0`. Preserve separate raw, carrier, source-number, and display-number concepts; DATA-001 still owns final canonical field names/codec. A missing or malformed value is reviewable with the original value intact, and no carrier is guessed.

Required future tests include the three examples above, lowercase/surrounding-whitespace validation, all-zero suffix, and malformed/unsupported carrier review.

## 9. Generic CSV/XLS/XLSX advanced mapping

Blind arbitrary unknown spreadsheet auto-understanding is out of scope. An optional advanced direction is user-confirmed source-column mapping:

```text
source column → Known Field or Custom Field → preview → confirmed local import
```

- Mapping targets a semantic Known Field or stable Custom Field identity, never a display label/Header Group.
- Unknown or ambiguous columns remain unmapped until the user confirms them.
- Confirmed mapping reuse is intended.
- Exact source signature, mapping-profile identity, persistence schema, version/migration, and conflict behavior remain IMPORT-004/DATA-001 OPEN.
- A source field must not be substituted into a nearby semantic. In particular `instTme` is not IFR Time or Actual Instrument.

## 10. LogMate Excel round trip

Production export/re-import is not implemented. The direction remains:

```text
LogMate export → user edits known/custom/blank values → re-import → preview/review
```

Workbook direction is `Logbook`, `Field Definitions`, and `Instructions`. An exact exported Record ID is strong existing-record identity. Without it, possible matches require review (`Update existing`, `Import as new`, or `Skip`) rather than automatic overwrite. Custom Field mapping uses stable identity when present; absent/ambiguous identity requires review. Exact workbook columns and Custom Field schema remain OPEN.

## 11. Paper-page alignment

Import does not create calendar page breaks or bind records to mutable row indexes. After any manual or imported record change, View Logbook uses its stable-record page policy, configurable capacity, and user-controlled early breaks/anchors. Exact import/page-policy UI remains OPEN.

# Aircraft Type Reference Specification

> Authority: AIRCRAFT TYPE REFERENCE / LOOKUP CONTRACT ONLY
> Status: CURRENT — FAA SNAPSHOT / OFFLINE LOOKUP FOUNDATION IMPLEMENTED; UI AND CANONICAL DETAILS OPEN
> Source of Truth: [MASTER.md](../../MASTER.md)

## 1. Purpose and boundary

This contract defines the reference/lookup contract for the **Aircraft Type** semantic field. It does not define an Add Flight field, persistence schema, or canonical codec.

Aircraft Type and Registration are distinct values. This contract does not define Registration autocomplete, history, recent values, or inference.

## 2. Confirmed semantic direction

- Aircraft Type is based on the **ICAO Aircraft Type Designator** semantic value (for example `B738`, `B38M`, `A320`, `A21N`, `B77W`). A Boeing 737-800 is represented by `B738`; a Boeing 737 MAX 8 by `B38M`.
- Registration is separate flight/user data (for example `HLxxxx`). Aircraft Type must not infer Registration, and Registration must not redefine Type.
- Aircraft Type input uses this offline autocomplete/reference direction: authoritative aircraft-type reference → bundled dataset → offline lookup → future user selection → ICAO Aircraft Type Designator.
- The lookup direction is code-centred, case-insensitive, and supports prefix search. Multiple candidates require user selection.
- No Guessing applies: the product must not silently correct an unknown code into a different type.

This is analogous to the **reference-data architecture** of Airport lookup, not an instruction to combine aircraft types with the Airport domain. `AirportReference` and `AircraftTypeReference` remain separate datasets. Common future infrastructure is possible but not designed here.

## 3. Authoritative source and ICAO relationship — VERIFIED

The runtime snapshot is generated from the U.S. **Federal Aviation Administration (FAA)** public [Order JO 7360.1K — Aircraft Type Designators](https://www.faa.gov/regulations_policies/orders_notices/index.cfm/go/document.current/documentNumber/7360.1):

- FAA identifies the Order as Active, Public, issued 2025-04-10; the downloaded PDF is effective 2025-06-12.
- Appendix A, *Decode – Aircraft Type Designator*, is the source table. It contains designator, class/engine/wake fields, and explicit `MANUFACTURER, Model` rows. LogMate uses only the designator and explicit manufacturer/model data.
- FAA Order paragraph 2-1 says ICAO provides the standard type designators; paragraph 2-2 says ICAO publishes updates every 28 days and FAA publishes the designators it approves for NAS use. FAA's official flight-planning FAQ says that where FAA and ICAO differ, filing must use ICAO Doc 8643.
- ICAO's official [Doc 8643 page](https://www.icao.int/operational-safety/Designators-and-indicators) identifies Doc 8643 as the ICAO type-designator source and describes annual editions plus an AIRAC-updated online database. Its complete downloadable data is not a public, unauthenticated dataset; ICAO directs data downloads through its API/contact path.

Therefore, this is an FAA-public **snapshot reference foundation** for the ICAO-designator semantic direction. It does not claim complete parity with the current ICAO database. Future source refresh must verify current ICAO parity before replacing this snapshot.

The FAA's active [Notice JO 7360.7](https://www.faa.gov/regulations_policies/orders_notices/index.cfm/go/document.information/documentID/1044340) adds temporary `EL2*` and explicitly says it is not a permanent ICAO type designator. It is not merged into this ICAO-semantic asset.

The Order page declares public access. No source-specific reuse licence was located on that page; this contract records provenance and makes no separate legal conclusion.

## 4. Dataset / generator — IMPLEMENTED

```text
FAA public PDF (ignored reference source)
  → tool/extract_faa_aircraft_type_appendix.py
  → ignored Appendix A UTF-8 text
  → tool/generate_aircraft_type_dataset.dart
  → assets/data/aircraft_types.json
  → AircraftTypeLookup
```

- Raw PDF and extracted text live under ignored `reference/aircraft-types/`; they are not tracked external source copies.
- The extractor uses `pypdf` and extracts the 112 Appendix A PDF pages only.
- The Dart generator reads only the explicit extracted source text. It never derives a designator, manufacturer, or model.
- Runtime asset record shape is `[designator, [[manufacturer, model], ...]]`. Multiple pairs are retained for one designator; no primary manufacturer/model is inferred.
- FAA's `*` table marker is removed only because paragraph 2-1 expressly defines it as a military-aircraft annotation rather than part of the designator value.
- Header designator rows are required to be unique; duplicate headers fail generation. Explicit comma-separated manufacturer/model rows are accepted, malformed description rows are counted and dropped without repair, and output is sorted by designator.
- Current generated snapshot: 2,691 designators, 7,409 accepted manufacturer/model pairs, 7 dropped malformed description rows, zero duplicate designator headers; `aircraft_types.json` is 612,195 bytes.

Update procedure: acquire the current FAA Order and any active related notices, retain the raw source only in the ignored reference directory, run the extractor then generator, inspect the generated summary and fixture tests, update [assets/data/README.md](../../assets/data/README.md), and explicitly decide whether any FAA notice is permanent/ICAO-compatible before merging it. Do not silently merge a notice or derive a missing code.

## 5. AircraftType / lookup foundation — IMPLEMENTED

- [AircraftType](../../lib/aircraft/aircraft_type.dart) is a lookup-only reference model containing a designator and source-supported manufacturer/model pairs. It is not a `FlightRecord` type.
- [AircraftTypeLookup](../../lib/aircraft/aircraft_type_lookup.dart) caches and loads the bundled asset offline.
- `searchByDesignator` is trim/case-insensitive prefix search. It returns candidates only; it has no auto-resolve or write behavior.
- `searchByManufacturerOrModel` is implemented because FAA Appendix A provides explicit manufacturer/model fields. It uses only case-insensitive prefixes of those source fields; it adds no aliases, punctuation removal, family mapping, or model-to-designator derivation.
- Unknown queries return an empty candidate set. They are not corrected into another designator.

## 6. Existing implementation boundary

Airport lookup remains a separate dataset and implementation. Aircraft Type lookup/dataset foundation is implemented, but search UI, Add Flight Type/Registration fields, View Logbook renderer, selection behavior, and canonical schema are **NOT IMPLEMENTED**. This contract does not alter current Add Flight layout or Airport lookup behavior.

## 7. OPEN — AIRCRAFT-REF-001

Closed by this foundation:

- public FAA JO 7360.1K Appendix A source snapshot and its actual PDF/table structure;
- PDF Appendix A extraction procedure, deterministic generator, runtime asset shape, record/drop/duplicate reporting;
- bundled offline cached lookup, case-insensitive designator prefix search, and source-supported manufacturer/model prefix search.

Still open:

- current ICAO Doc 8643 parity and source-refresh validation/automation, including the policy for active FAA notices;
- result-row presentation and exact-match auto-resolve policy;
- unknown-code/free-text policy and user correction flow;
- canonical representation/provenance implications under DATA-001.

No missing designator, manufacturer, model, alias, or source notice is inferred by this implementation.

## 8. Explicitly not implemented

- Aircraft Type autocomplete/search sheet or selection UI
- Add Flight Aircraft Type or Registration UI
- Registration autocomplete/history/recent-value behavior
- persistence/schema/codec/migration
- Firebase Sync or configuration integration

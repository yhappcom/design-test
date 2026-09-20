# Search Interaction Spec

Authority: **SEARCH INTERACTION CONTRACT ONLY**  
Status: **PARTIAL CONTRACT / QUERY + RESULTS NOT IMPLEMENTED / SEARCH-001 OPEN**  
Updated: 2026-09-19

## 1. Purpose

LogMate Search is a core personal-logbook retrieval function. It must help the pilot recover past flight records and related context from the local logbook without requiring a network query.

This document separates current product truth from historical ideas. It does not promote archived brainstorming into a current requirement.

## 2. Confirmed current scope

Current product documents confirm that Search is local-first/offline and may retrieve across:

- person / crew;
- airport / route;
- flight number;
- aircraft type;
- period/date;
- user-entered free-text `Remark`.

Search results must not hide the field that caused the match when that context is necessary to understand the result. Deleted records are excluded from normal search.

Current implementation evidence is limited to the Home search input/focus shell. Query execution and results are **NOT IMPLEMENTED**.

## 3. Historical input-assistance evidence

Historical pre-foundation planning contains:

- `archive/planning/pre-foundation/plan 1.00 260809.md`
  - Quick Input considered recent values, autocomplete, previous-record recommendations, and saved aircraft/registration/airport/crew/flight values.
  - The same document separately listed searchable fields and explicitly marked the final Search structure as TBD.
- `archive/planning/pre-foundation/plan 1.02 260810.md`
  - Search considered partial-name matching, English initials and Korean initial-consonant matching.
  - Quick-entry guidance again mentioned autocomplete, prior values and recent values.
- `archive/planning/pre-foundation/plan 1.03 260813.md`
  - Search input expansion again considered initials / Korean initial-consonant search, with implementation scope still requiring later confirmation.

These records prove that input assistance and flexible matching were considered. They do **not** prove that Home Search autocomplete/suggestions were approved.

## 4. Important separation

### Add Flight autocomplete

Add Flight airport lookup already has its own confirmed interactive autocomplete/input-assistance behavior over the bundled airport reference.

That behavior is task-specific lookup and must not be treated as the Home Search interaction contract.

### Home Search suggestions

Whether Home Search shows suggestions while typing is **OPEN**.

A future design may distinguish:
- actual local-record matches;
- recent searches;
- previous-record values;
- typed-query completion;
- category/group labels such as Crew, Airport/Route, Flight, Aircraft or Remark.

No ordering, trigger length, grouping, ranking, keyboard behavior, acceptance behavior or recent-search persistence is currently confirmed.

## 5. SEARCH-001 — owner decision required before implementation

Before query/results implementation, decide:

1. whether suggestions appear while typing;
2. which sources may generate a suggestion;
3. whether suggestions are grouped by semantic category;
4. whether selecting a suggestion immediately opens a record, applies a query token/scope, or opens the result list;
5. how partial matching, English initials and Korean initial-consonant matching participate;
6. whether recent searches are stored, for how long, and whether they can be cleared;
7. how all of the above work fully offline against the local index.

## 6. Current Home visual candidate

The Design Studio Home candidate uses the concise placeholder `Search logbook` to communicate scope without implying that a short example list is exhaustive.

This is a **DESIGN CANDIDATE**, not a final Search-content decision. It does not imply that suggestions are implemented.

## 7. Evidence boundary

Do not claim:
- Home Search autocomplete is confirmed;
- suggestion ranking exists;
- local indexing is implemented;
- Korean initial-consonant matching is implemented;
- recent-search persistence exists;
- query/results runtime has passed.

Those claims require later implementation and validation evidence.

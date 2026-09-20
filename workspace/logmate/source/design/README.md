# LogMate Design Working Area

Status: ACTIVE DESIGN COORDINATION AREA
Branch: design/first-use-baseline-20260918
Product authority: MASTER.md

## Purpose

This directory exists because LogMate previously lacked a durable project-specific visual decision layer between:
- Design Studio research;
- product authority in MASTER.md / docs/specs;
- visual exploration;
- production implementation.

Design Studio is research/advisory evidence, not a universal LogMate style guide.
docs/evidence is validation evidence and cannot create product decisions.
Therefore active design candidates, revision lineage, rejection history and pre-approval visual baseline work live here.

## Authority

Nothing in this directory is product authority by itself.

When the owner approves a visual/product decision:
1. record the owner decision here with provenance;
2. promote product-level decisions to MASTER.md;
3. promote detailed UI/visual contracts to the appropriate docs/specs contract;
4. implementation then follows the promoted canonical contract.

A design decision is not locked until promotion occurs.

## Mandatory preflight before any new visual candidate

Read, in order:
1. MASTER.md
2. relevant docs/specs
3. design/VISUAL_BASELINE.md
4. design/DECISIONS.md
5. design/ROOT_CAUSE_AUDIT_20260918.md
6. design/SOURCE_SNAPSHOT.md
7. only the Design Studio / Engineering / Web / Marketing evidence that changed materially since the snapshot

Do not regenerate from a blank prompt when an active baseline exists.

## Owner review gate

Design Studio I041/I042 process evidence is mandatory for owner-facing visual work.

Do not send the first successful render to the owner.

Before owner delivery, run this internal loop:
1. compare the candidate against the current Type / Color / Layout / Interaction evidence that materially applies;
2. render the integrated candidate;
3. inspect the rendered light/dark result for hierarchy, balance, density, alignment, state and accessibility mismatches;
4. record and correct deterministic/research mismatches;
5. rerender and repeat until no known deterministic/research mismatch remains;
6. only then package the coherent owner-review candidate.

Intermediate renders are internal evidence, not owner deliverables.
The owner should receive the internally reviewed final candidate plus only the material open questions that genuinely require owner judgment.

## Candidate rule

When no approved visual baseline exists:
- present at most 2–3 coherent complete candidates;
- use the same confirmed product semantics/data;
- identify each candidate by stable ID;
- explain material trade-offs;
- recommend one.

After owner selection:
- selected candidate becomes the active visual baseline;
- all revisions use the same lineage;
- local feedback produces local deltas;
- no fresh visual identity is allowed unless REOPEN criteria are met.

## Reopen criteria

A selected visual baseline can be reopened only if:
1. owner explicitly rejects it;
2. canonical product authority contradicts it;
3. engineering proves it infeasible;
4. cross-screen transfer proves systemic failure;
5. runtime/accessibility evidence proves it invalid.

New research that merely offers another plausible style is not a reopen reason.

## Visual revision rule

Revision package must always state:
- baseline ID;
- revision number;
- exact requested delta;
- affected components/regions;
- explicit unchanged invariants;
- new evidence requiring the delta, if any.

Whenever possible, revise the selected visual artifact directly rather than generating a new artifact from scratch.

## Research update rule

Scheduled research updates:
- design/SOURCE_SNAPSHOT.md
- a delta/impact note if material

It does not mutate the active visual baseline automatically.

Impact classes:
- NO IMPACT
- SUPPORTS BASELINE
- LOCAL CHANGE PROPOSAL
- SCREEN REWORK PROPOSAL
- SYSTEM REOPEN PROPOSAL

Only owner approval + canonical promotion changes the locked product UI.

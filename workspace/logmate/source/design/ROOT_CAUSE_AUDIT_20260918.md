# LogMate Visual Inconsistency Root-Cause Audit

Status: ACTIVE PROCESS CORRECTION
Date: 2026-09-18

## Executive finding

The repeated visual inconsistency was not caused by insufficient design research.

It was caused by a missing integration/authority layer.

Research, product contracts, historical visual explorations and generated mockups existed, but there was no durable owner-approved visual baseline that every later revision was required to inherit.

As a result, each new visual pass effectively re-solved the whole design problem.

## Evidence reviewed

### Design Studio governance

AGENTS.md explicitly says:
- Design Studio is not a component library or universal visual style guide;
- project work must retrieve relevant evidence across specialists;
- diagnose the project-specific problem;
- produce alternatives and a recommendation;
- record project-specific decisions in the project repository.

Implication:
Design Studio cannot itself be treated as “the LogMate style”.
A coordinator must convert research into a project-specific selected visual system.

### LogMate governance

AGENTS.md explicitly says:
- MASTER.md is the current product-state authority;
- docs/evidence is validation evidence only and cannot create new product decisions;
- docs/specs contains detailed contracts subordinate to MASTER;
- code/tests are implementation evidence.

Implication:
Recent design lock/governance files placed in docs/evidence could not actually create a durable product/UI lock.
They created the appearance of a lock without canonical authority.

### Historical visual-language branch

visual-sot-reconciliation-audit.md shows that historical visual explorations already contained contradictions that required later reconciliation:
- Add Flight card removal was rejected/superseded;
- persistent Home bottom navigation was not authorized;
- Career/lifetime Home hero was rejected while semantics were unresolved;
- one low-luminance appearance remained SOT-dependent;
- exact palette/type/radius/spacing remained open.

visual-production-reconciliation-map.md also says the current production app can be migrated visually without changing semantics, but several large visual decisions remained unpromoted.

Implication:
“Titanium Ledger” was a strong exploration family, but not a fully canonical product visual system.

### Recent first-use work

Recent first-use work correctly improved:
- Previous Total semantics;
- blank != zero;
- H+MM entry;
- state/reflow/error behavior.

But the visual pass introduced a new light/teal form language rather than inheriting a selected whole-product baseline.

Implication:
interaction research transferred; visual lineage did not.

### Generated portfolio boards

The recent portfolio boards introduced additional unapproved:
- blue-heavy identity;
- aircraft imagery;
- slogans;
- card systems;
- navigation assumptions;
- mixed light/dark visual language.

These boards were generated before a canonical visual baseline existed.

Implication:
the portfolio generator filled unresolved design gaps by invention.

## Root causes

### RC1 — No project-specific canonical visual baseline

The project had:
- product SOT;
- design research;
- visual explorations;
- implementation shells;

but no owner-selected visual baseline with inheritance rules.

Consequence:
every new pass could reinterpret the same research differently.

### RC2 — Research was modular, but synthesis was ephemeral

Design Studio correctly separates Type, Color, Layout/Interaction, Web and Content.

The coordinator synthesized these inside chat turns rather than into one durable project-level selected system.

Consequence:
the next turn often re-read a different subset and produced a different weighting.

### RC3 — Failure/reconciliation records were not mandatory preflight inputs

Historical reconciliation files existed, but later mock generation did not require reading them first.

Consequence:
previously rejected patterns could re-enter:
- invented navigation;
- card-heavy Home;
- lifestyle imagery;
- unsupported hero totals;
- new color systems.

### RC4 — Visual generation was performed from text, not from a selected artifact lineage

A text-to-image generation pass has many degrees of freedom.
When prior design is described only in words, the renderer must invent:
- precise spacing;
- component shapes;
- color relationships;
- typography;
- icon treatment;
- illustration;
- device framing.

Consequence:
a “revision” became a new synthesis.

### RC5 — Portfolio scope was too broad before screen/system convergence

Generating 7–12 screens at once forced unresolved decisions to be invented simultaneously.

Consequence:
portfolio polish concealed large amounts of unsupported design creation.

### RC6 — Premature use of LOCK language

Direction Lock / Visual Lock language was introduced before:
- canonical product promotion;
- stable visual reference;
- cross-screen transfer;
- runtime validation.

Consequence:
decisions appeared fixed but had no enforcement mechanism and were reopened easily.

### RC7 — Authority location error

Recent governance/lock records were stored under docs/evidence even though project governance says that area cannot create product decisions.

Consequence:
future agents could correctly ignore those “locks” as non-authoritative evidence.

### RC8 — Optimization for per-turn efficiency caused lifecycle inefficiency

Repeatedly reading only a narrow “relevant subset” reduced immediate work, but because no durable synthesis existed it caused:
- repeated source retrieval;
- repeated visual reinterpretation;
- repeated portfolio generation;
- repeated user correction.

Consequence:
local resource optimization increased total resource consumption and delayed convergence.

## Why more research alone would not solve it

More evidence expands the set of plausible choices.

Without:
- a selected baseline;
- explicit rejected alternatives;
- inheritance rules;
- canonical promotion;

additional research can increase visual degrees of freedom instead of reducing them.

The missing mechanism was decision persistence, not knowledge volume.

## Corrective architecture

### Layer 1 — Research evidence
Design Studio / Engineering / Web / Marketing.
May change continuously.

### Layer 2 — Project synthesis
LogMate-specific alternatives, trade-offs, recommendation.
Lives in design working area.

### Layer 3 — Owner-selected Visual Baseline
One selected candidate + exact lineage + unchanged invariants.
Cannot be mutated by scheduled research.

### Layer 4 — Canonical product/UI contract
After owner approval:
- product-level decision -> MASTER.md
- detailed visual/UI contract -> docs/specs

This is the real lock.

### Layer 5 — Implementation evidence
Theme/components/screens + tests/screenshots/runtime validation.

## Corrective process

1. Complete historical visual audit.
2. Build 2–3 complete Home-led candidates from the same current product semantics.
3. Each candidate must include Home + small Add Flight/View Logbook transfer specimen.
4. Owner selects one.
5. Assign stable baseline ID.
6. Record exact visual invariants and rejected alternatives.
7. Promote approved decisions to canonical product/UI contracts.
8. All later work inherits the baseline.
9. Local revision is an edit/diff, never a fresh generation.
10. Scheduled research can only propose an impact/reopen; it cannot silently change baseline.
11. Implement and validate screen by screen.
12. Portfolio is assembled from selected lineages; portfolio never creates the lineages.

## Lock definition after correction

“Locked” means all of the following:
- explicit owner approval;
- stable decision ID;
- selected visual reference;
- invariant list;
- rejected-alternative list;
- canonical promotion into MASTER/docs/specs as appropriate;
- downstream screens know whether the decision is global or local.

Visual Lock is not a label inside a design evidence file.

## Resource-efficiency correction

Maintain a source snapshot of exact repository heads.

On each scheduled run:
- compare current heads to snapshot;
- only inspect changed repositories/files;
- classify the delta;
- do not resynthesize unchanged research.

This replaces repeated broad rereads with controlled delta review while preserving full prior synthesis.

## Immediate implication

Do not make another portfolio or “visual DNA” board now.

First:
- finish the historical inconsistency classification;
- establish the candidate-generation contract;
- produce one decision-worthy Home candidate round.

The next visual artifact must be a candidate round, not another portfolio.

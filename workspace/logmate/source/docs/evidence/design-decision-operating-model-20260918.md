> **SUPERSEDED FOR GOVERNANCE** — active design-process authority has moved to `design/README.md`, `design/DECISIONS.md`, `design/VISUAL_BASELINE.md`, and `design/ROOT_CAUSE_AUDIT_20260918.md`. This file remains historical design evidence only and does not create product/UI lock.

# LogMate Design Decision Operating Model

Status: **ACTIVE — OWNER AS DECISION MAKER**
Date: 2026-09-18
Branch: `design/first-use-baseline-20260918`

## 1. Problem this contract fixes

Recent design work repeatedly failed in the same way:

1. research existed but was not fully synthesized before a visual draft;
2. owner feedback exposed a missed research constraint;
3. the coordinator reread research only after feedback;
4. the next draft changed too many unrelated things;
5. owner feedback on one detail caused a new concept instead of a revision;
6. no stable candidate lineage survived long enough to converge.

This is a coordination failure, not an owner-input problem.

The owner should not need to specify research conclusions, layout theory, typography rules, platform constraints, ad rules, or state semantics in order to get a coherent proposal.

## 2. Owner role

The owner is the **decision maker**, not the working-level design integrator.

Expected owner actions:
- choose among coherent candidates;
- reject a direction;
- approve a direction;
- request a local change;
- state a product preference when evidence cannot resolve it.

The owner should not need to:
- remind the team of existing research;
- restate known product constraints;
- identify every cross-repo dependency;
- explain basic layout/design consequences;
- protect prior decisions from accidental redesign.

## 3. Coordinator responsibility

Before presenting any candidate, the coordinator must internally reconcile:

1. current LogMate product authority;
2. latest forward engineering evidence;
3. current Design Studio research;
4. Web/PWA constraints;
5. Marketing/first-value/ad constraints;
6. prior owner decisions;
7. prior candidate lineage;
8. known rejected directions;
9. current lock register.

Only then may a candidate be presented.

If a material contradiction is unresolved, state it explicitly before presenting the candidate. Do not hide the unresolved issue inside the visual.

## 4. Candidate package standard

For each major design decision, present **2–3 complete candidates maximum**.

Every candidate must be sufficiently complete for real decision-making.

A candidate package must include:

### A. Candidate identity
Example:
- HOME-A — Action-led operational
- HOME-B — Resume-led operational
- HOME-C — Context-led operational

### B. Full representative UI
Not just wireframe fragments.

Show enough fidelity to judge:
- composition;
- typography hierarchy;
- grouping;
- spacing;
- primary/secondary actions;
- data density;
- navigation/chrome;
- ad/no-ad geometry when relevant;
- relationship to adjacent screens.

### C. Why it exists
2–4 concise bullets tied to actual research/product evidence.

### D. Trade-offs
State what gets better and what gets worse.

### E. Coordinator recommendation
Select one candidate as the recommended default.

The coordinator must make a recommendation instead of transferring the synthesis burden to the owner.

## 5. Research synthesis rule

Research is consumed **before** candidate generation.

Do not present:
- “research says X, what do you think we should do?”
when the research already supports a design judgment.

Instead present:
- “research converges on X; therefore A/B/C were produced, and A is recommended because …”

Only escalate to owner when:
- evidence is genuinely ambiguous;
- the decision is product preference, not design technique;
- two trade-offs are both valid and materially different;
- implementation/business constraints require owner priority.

## 6. Revision lineage rule

Once the owner selects or provisionally prefers a candidate, that candidate gains a stable lineage.

Example:
`HOME-A v0.1 → HOME-A v0.2 → HOME-A v0.3`

A local owner comment must produce a **local revision** unless the comment explicitly rejects the underlying direction.

Example:
Owner: “Recent should be more prominent.”

Correct:
- adjust HOME-A hierarchy;
- preserve typography, action grammar, card/rule strategy, navigation and overall visual identity unless directly affected.

Incorrect:
- produce a new color system;
- change navigation;
- introduce cards;
- change type scale;
- redesign Welcome;
- change ad strategy.

## 7. Change-scope classification

Every owner comment must be classified before revision.

### LOCAL
Affects one element or relationship.
Examples:
- make Recent more prominent;
- reduce Home title prominence;
- move Search;
- adjust CTA size.

Rule:
Change only the affected locus and necessary dependencies.

### SCREEN
Affects one screen's overall hierarchy.
Examples:
- Home feels too dashboard-like;
- Previous Total is too form-heavy.

Rule:
Recompose the screen while preserving global visual system.

### SYSTEM
Affects shared visual language.
Examples:
- overall type scale feels too small;
- containers are too dominant across the app.

Rule:
Update the shared system, then propagate intentionally.

### PRODUCT
Changes product semantics/flow.
Examples:
- Import should be primary;
- Previous Total should be optional.

Rule:
Reconcile product authority before redesign.

Do not treat LOCAL feedback as SYSTEM feedback.

## 8. No-reset rule

Do not restart from a blank canvas unless one of these is true:

1. owner explicitly rejects the candidate direction;
2. new product authority contradicts the candidate;
3. new engineering evidence makes it infeasible;
4. cross-screen transfer proves the visual system fails;
5. accessibility/runtime evidence proves the composition invalid.

Otherwise revise the current lineage.

## 9. Portfolio rule

The portfolio is not a collage of independently invented screens.

It is assembled **after** candidate directions are coherent enough to represent the same system.

Portfolio generation sequence:

1. establish Home candidate family;
2. select a Home direction;
3. transfer that system to View Logbook and Add Flight as cross-checks;
4. derive Welcome / Previous Total / Empty Home from the selected system;
5. assemble portfolio using the selected lineages;
6. owner reviews whole-product continuity;
7. screen-family Visual Lock proceeds separately.

A portfolio board must not invent a new visual language.

## 10. Home-first operating sequence

Current recommended execution:

### Stage H1 — Candidate synthesis
Coordinator produces 2–3 complete Home UI candidates from all current research.

### Stage H2 — Owner decision
Owner selects:
- one direction;
- or one preferred direction plus local modifications.

### Stage H3 — Revision
Coordinator produces revision within the same lineage.

### Stage H4 — Cross-screen transfer
Apply selected Home system to:
- View Logbook control/chrome specimen;
- Add Flight form specimen.

Only changes required by task density are allowed.

### Stage H5 — Home Direction Lock
After owner approval.

### Stage H6 — derive first-use
Welcome / Previous Total / Empty Home inherit the same visual system.

## 11. Decision memo format

Each candidate round must be reported in this order:

1. **Recommendation**
2. **Candidates**
3. **Why the recommendation fits the evidence**
4. **Material trade-offs**
5. **What is unchanged from the prior round**
6. **What specifically changed**
7. **Owner decision requested**

No long research dump unless the owner asks.

## 12. Automatic research interaction

Scheduled research continues in parallel.

It must not automatically redraw an approved candidate.

New research impact must be classified:

- NO IMPACT
- SUPPORTS CURRENT DIRECTION
- LOCAL REVISION NEEDED
- SCREEN REWORK NEEDED
- SYSTEM REWORK NEEDED
- REOPEN REQUIRED

Only the last four may alter an active candidate, and the exact affected lineage must be named.

## 13. Current process reset

Effective immediately:

- the recent portfolio images are not active visual candidates;
- the v0.2 portfolio contract remains a non-locking research/continuity document;
- the next visual work begins with **Home candidate synthesis**;
- candidates must be complete enough for owner selection;
- no candidate may be replaced wholesale in response to local feedback;
- after owner chooses a candidate, all future revisions preserve its lineage until explicitly rejected.

## 14. Success criterion

The process is working when the owner can mostly say:

- “A”
- “B”
- “A, but move Search below Recent”
- “Keep A; make the type calmer”
- “Reject all three”

and the coordinator can continue without asking the owner to rediscover the research basis.

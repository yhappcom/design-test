# First-Use / Previous Total Research Progress — 2026-09-18

Status: **DESIGN RESEARCH PROGRESS SUMMARY — NOT PRODUCTION APPROVAL**  
Branch: `design/first-use-baseline-20260918`  
LogMate production main observed: `b551ce434ad72b1895033e0f3617c73b026d40ea`  
Latest durable design-branch commit observed before this summary: `86fb8332a5a94265d26ec6321d99636dfa2e406d`

## 1. Purpose

This file summarizes the durable first-use/onboarding/Previous Total research accumulated through active chat work plus the hourly `Opening Benchmark Research` schedule.

It separates:
- product/flow decisions that are sufficiently stable for continued design work;
- interaction/composition decisions that are strong working directions;
- visual details still requiring refinement;
- engineering/product contracts that remain OPEN;
- specialist research that informs the work but does not constitute runtime or human PASS.

No production Flutter code is changed or approved by this summary.

---

## 2. Durable design artifacts now present

### A. `first-use-previous-total-baseline-policy.md`
Role: baseline/domain-facing design policy.

Key advances:
- Welcome contains no fabricated flight/totals data.
- Returning/restored users normally bypass Welcome and enter Home.
- `Start a new logbook` leads to Previous Total before first manual Flight.
- Previous Total is treated as the cumulative ledger boundary immediately before the earliest LogMate-known Flight.
- `PreviousTotalBaseline` remains distinct from `OpeningBalance`.
- Import users may also need Previous Total before the earliest accepted imported record.
- Later manual/import backfill that moves the earliest known record earlier triggers baseline review.
- Baseline is not owned by one import batch or one onboarding moment.
- Hide in View Logbook does not delete baseline truth.
- Exact total eligibility remains semantic/catalog-controlled and OPEN where evidence is insufficient.

Commit: `70985732`

### B. `first-use-baseline-composition-spec.md`
Role: first-use surface family and composition contract.

Key advances:
- Welcome → Previous Total → Empty Home → Add First Flight → Populated Home.
- Sign in remains an existing-user exception branch.
- Previous Total becomes the first legitimate first-use surface for operational cumulative numerics.
- Empty Home avoids zero-filled dashboard cards and fake records.
- Import Preview hands into baseline entry/review only after accepted records are known.
- Large-text, narrow, short-height/IME and tablet/EFB composition constraints are defined.
- Generic Material/card-heavy composition remains a REWORK/REJECT trigger.

Commit: `6b13409e`

### C. `previous-total-interaction-input-detail-spec.md`
Role: detailed Previous Total interaction/input grammar.

Key advances:
- One semantic cumulative duration = one `H+MM` editor.
- Split hour/minute boxes are rejected as the primary design.
- Reuses Add Flight raw-edit → completion-normalization model.
- `blank != explicit zero`.
- Start-from-zero and carry-forward are distinct explicit ledger assertions.
- Full semantic labels remain persistent.
- Local error text stays with the affected field and preserves user input.
- Next/Done behavior is separated from form submission.
- `Add previous total` is not View Logbook Customize and not Custom Field creation.
- Long-label / enlarged-text reflow is relationship-driven, not device-name-driven.
- Review Previous Total reuses the same editor grammar.

Commit: `8637a72f`

### D. `previous-total-state-matrix-20260918.md`
Role: state-complete component gate.

Key advances:
- Zero/carry-forward choice is separated from the value editor.
- Radio-card + nested-form composition is rejected.
- Ten required states are defined:
  - S0 undecided
  - S1 zero selected
  - S2 carry selected / empty
  - S3 focused raw editing
  - S4 normalized
  - S5 large total
  - S6 local error
  - S7 optional total added
  - S8 200%/relationship-failure recomposition
  - S9 earlier-boundary review
- Continue belongs after the form in document order by default.
- No permanently overlaying CTA without obscuration evidence.
- Selection, focus, valid/error, enabled/disabled, editable/read-only are independent state axes.
- A pristine default-state mock is explicitly insufficient for visual approval.

Commit: `4a2201da`

### E. `first-use-visual-scale-composition-contract-20260918.md`
Role: integrated typography/layout/color/composition baseline.

Key advances:
- Current LogMate production-compatible type ladder becomes the starting point:
  - 34 exceptional identity/display
  - 20 page task title
  - 17 section/choice and candidate numeric value
  - 15 body, field labels, actions, helper/error/status
- 10–13 px first-use helper/field-label tier is rejected.
- Current 24 px page inset family is retained as a working compact-screen baseline.
- Existing 4/8/12/20/28/36 spacing rhythm is reused instead of inventing an onboarding-only spacing system.
- Initial Previous Total remains single-column by default, including wide surfaces unless real comparison context justifies two regions.
- `99,999+59`, `Instrument Flight Time`, 200% text, IME-short-height, local error, optional semantic and Boundary Review become mandatory stress cases.
- Repeated filled Material fields/cards, sticky CTA without evidence, fake Welcome data and semantic truncation are rejected.
- Current Add Flight 13 px field-label override is flagged for later cross-surface review rather than copied into first-use.

Commit: `86fb8332`

---

## 3. Current product/flow maturity

### KEEP — strong enough to continue design against

1. Welcome contains no sample or fictional operational data.
2. Returning/restored user normally enters Home directly.
3. New-user primary branch:
   `Welcome → Start a new logbook → Previous Total → Empty Home → Add First Flight`.
4. Previous Total is a ledger baseline concept, not onboarding decoration.
5. `PreviousTotalBaseline != OpeningBalance`.
6. Import does not remove the need for a pre-import Previous Total.
7. Baseline relevance depends on the earliest **accepted canonical record**, not the raw file's first row.
8. Later manual/import backfill that moves the earliest-known Flight earlier requires baseline review.
9. View Logbook visibility does not own or delete baseline data.
10. One cumulative duration semantic uses one `H+MM` editor.
11. `blank != zero`.
12. Full semantic names take priority over compact visual fit.
13. First-use flow does not force the user through the 35-field Customize catalog.
14. Empty Home is a true first-use empty state, not a dashboard filled with zeros.

### REWORK — direction accepted, detailed authored UI not approved

1. Exact selection mark and selected/focus treatment.
2. Exact Previous Total input boundary/rule geometry.
3. Exact form max width.
4. Exact optional-total chooser presentation.
5. Exact Boundary Review wide-layout composition.
6. Exact read-state grouping such as `2,350+25` vs `2350+25`.
7. Empty Home authored visual identity.
8. Welcome authored identity after removal of decorative/generated symbols and slogans.
9. Sign-in/auth visual grammar.
10. Exact action placement under real IME/device rendering.

### REJECTED directions

1. Fake operational data on Welcome.
2. Feature-tour carousel as the default first-use mechanism.
3. Zero-filled dashboard empty state.
4. Generic radio cards containing nested entry fields.
5. Two-box hour/minute editor as the primary cumulative-time input.
6. Repeated filled/outlined Material TextField cards as the authored first-use language.
7. 10–13 px helper/field-label tier to manufacture visual density.
8. Fixed-height rows that cannot grow with text/error.
9. Device-name breakpoints used instead of relationship failure.
10. Truncating professional field semantics to save geometry.
11. Sticky/floating CTA without focused-field/error visibility evidence.
12. Aviation cosplay / HUD / runway / cockpit motifs.

---

## 4. Current typography/composition working baseline

This is a **candidate design baseline**, not a final theme.

| Role | Working size |
| --- | ---: |
| Exceptional product identity | 34 |
| Page/task title | 20 |
| Section / primary choice | 17 |
| Numeric editable cumulative value | 17 |
| Body explanation | 15 |
| Field semantic label | 15 |
| Action label | 15 |
| Helper/error/status | 15 |

Rules:
- no negative tracking to rescue layout;
- no type shrinking when labels/values collide;
- full labels recompose to stacked layout;
- operational mono/tabular treatment only when numerics/identifiers justify it;
- custom LogMate type remains gated by Type specialist evidence.

Working horizontal/spacing basis:
- compact page inset around 24;
- reuse 4/8/12/20/28/36 spacing family;
- initial Previous Total single-column by default;
- wide/two-region layout only when simultaneous comparison is a real task need.

---

## 5. Latest Design Studio specialist maturity

Observed latest specialist status on 2026-09-18:

### Type
Stage 1 PASS; Stage 2 PRACTICE / NOT PASSED.
Latest: T051 semantic-identity transfer.
Still blocks:
- T021 drawing closure;
- later spacing/kerning gates;
- production custom-font transfer;
- cross-browser/native, AT and human recognition evidence.

Implication for LogMate:
- use mature production-compatible typography for layout decisions;
- do not freeze product composition around unfinished custom metrics.

### Color
Stage 1 PASS; Stage 2 PASS; Stage 3 PRACTICE / NOT PASSED.
Latest: C082 semantic focus-owner rendering.

Implication:
- selection/focus/error/disabled/read-only/recovery states must remain orthogonal;
- accent color may reinforce but cannot own meaning.

### Layout / Interaction
Stage 1 PASS; Stage 2 PASS; Stage 3 PRACTICE / NOT PASSED.
Latest: L073 / I069 semantic-locus geometry and stable identity restoration.

Implication:
- focus/recovery should follow semantic object identity, not stale row position;
- recomposition and scroll reveal must preserve the correct semantic locus;
- enlarged-text/target/focus geometry remains a real validation requirement.

### Web
Stage 1 PASS; Stage 2 PASS; Stage 3 PRACTICE / NOT PASSED.
Latest: W082 semantic focus identity runtime provenance.

Implication:
- source intent or a screenshot is not runtime PASS;
- 200% text, focus/scroll, forced-colors and independent-engine/browser execution are still required before web/PWA accessibility claims.

### Content
Stage 1 PASS; Stage 2 PASS; Stage 3 PRACTICE / NOT PASSED.
Latest: CD088 semantic object + recovery message binding.

Implication:
- visible English string, row index and actual semantic object identity must remain separate;
- wording must preserve distinctions such as hidden≠deleted, Reset≠Undo≠erase, no-op≠failure;
- localization, AT comprehension and representative-pilot evidence remain OPEN.

---

## 6. What the hourly first-use schedule has actually produced

Durable branch evidence shows the design branch advanced after the initial policy/composition work through:

- `8637a72f` — detailed Previous Total interaction/input;
- `4a2201da` — state matrix/component gates;
- `86fb8332` — visual scale/composition contract.

The schedule continues to run hourly. However, the latest durable design-branch commit observed is `86fb8332` at 2026-09-18 06:24 UTC. Later automation run timestamps by themselves are **not** treated as proof of additional durable research output unless a persisted artifact or separately inspectable result exists.

This summary intentionally avoids claiming invisible background conclusions that cannot be independently inspected.

---

## 7. Technical/product contracts still OPEN

Do not close these from design alone:

1. partial Previous Total allowed vs minimum required value;
2. exact duration validation/minute-range behavior;
3. final total-eligible semantic set;
4. prioritized baseline field subset;
5. Custom Duration/Count total policy;
6. generic Total Time / credited Block/Airborne semantics;
7. exact baseline persistence/linkage/codec/migration;
8. persisted baseline removal behavior;
9. transaction behavior when historical backfill changes the earliest boundary;
10. pending/failure/outcome-unknown persistence states;
11. signed-out local ownership/recovery under AUTH-001;
12. final navigation IA;
13. production typeface/accent/radius/stroke values.

---

## 8. Current validation boundary

Completed:
- repository/source reconciliation;
- flow/semantic analysis;
- specialist transfer analysis;
- state modeling;
- design pressure-test specification;
- draft visual mock review.

Not completed / no PASS claim:
- production Previous Total implementation;
- real persistence/calculation/import integration;
- physical iPhone/iPad/EFB validation;
- actual 200% runtime render of this new surface;
- keyboard/IME runtime obscuration test;
- screen-reader/AT verification;
- independent browser engine validation;
- forced-colors runtime;
- representative-pilot discoverability/workload/comprehension study.

---

## 9. Current overall judgment

### First-use architecture
**MATURE DRAFT / KEEP**

The large structural questions are substantially resolved enough to continue visual/component work without waiting for all engineering contracts.

### Previous Total semantic/interaction model
**ADVANCED DESIGN SPEC / KEEP WITH OPEN ENGINEERING DEPENDENCIES**

The state model and input grammar are now significantly more mature than the initial storyboard.

### Previous Total visual design
**REWORK / NOT YET PRODUCT-OWNER APPROVAL**

The visual-scale contract is now strong enough to rebuild the earlier mock, but the previous generated state board itself should not be treated as final because it still contains small-text/card-like/generic form tendencies.

### Welcome / Empty Home visual authorship
**EARLY–MID DESIGN**

Flow and content roles are clear, but exact authored product identity remains underdeveloped.

### Runtime/human validation
**OPEN**

No visual direction has earned production/runtime/human PASS.

---

## 10. Next execution order

1. Rebuild **Previous Total** visual state board using the 20/17/15 scale contract.
2. Demonstrate at minimum:
   - undecided;
   - explicit zero;
   - carry empty;
   - focused/raw;
   - normalized;
   - `99,999+59`;
   - local error;
   - optional total added;
   - 200% stacked state;
   - IME short-height;
   - earlier-boundary review.
3. Critique the board for:
   - Material/template leakage;
   - selected vs focused ambiguity;
   - label/value collision;
   - error expansion;
   - target geometry;
   - grayscale state clarity;
   - cross-screen continuity.
4. Once Previous Total survives that matrix, transfer the same authored grammar to:
   - Welcome;
   - Empty Home;
   - Import baseline handoff;
   - Sign-in/recovery.
5. Only after the above should exact production component/token implementation be considered.

---

## 11. Operating rule

Hourly scheduled research continues even without user confirmation.

Lack of user confirmation:
- does **not** pause research, critique or branch-only design-spec work;
- **does** prevent unreviewed design work from being treated as final product approval or production implementation.

Chat work and scheduled work remain parallel and should reconcile newer user decisions before continuing older assumptions.

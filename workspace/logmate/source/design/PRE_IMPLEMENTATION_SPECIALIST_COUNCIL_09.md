# LogMate Pre-Implementation Specialist Council 09

Status: PRE-PRODUCTION REVIEW / OWNER DECISION INPUT
Date: 2026-09-19
Scope: HOME-B v0.4 + Welcome + Previous Total + Empty Home
Rule: no production Flutter promotion until owner reviews this council result.

## 1. Typography / Type Design

Position: KEEP direction; do not polish by compression.

Opinion:
- 15/17/20 role hierarchy is a sound current base.
- Home should scroll rather than shrink text to keep Activity/Totals above fold.
- operational numerals should use tabular figures where supported.
- do not introduce a custom LogMate typeface yet; T021 drawing gate is still open.
- compact aviation strings and large durations must remain protected strings, not be fixed with negative tracking or arbitrary abbreviations.
- the visual system must survive `99,999+59`, long semantic labels and 200% text.

Recommendation:
- retain mature system/Roboto fallback for the next implementation pass;
- preserve type size before preserving one-screen composition;
- validate Home, Previous Total and View Logbook together before any font lock.

## 2. Color

Position: KEEP C017 System C as working direction; not yet final physical-device proof.

Opinion:
- low-chroma operational palette is the strongest existing research fit for a dense professional log/data product.
- it keeps data stronger than chrome and avoids the generic aviation-blue branding trap.
- light/dark must be separately authored semantic mappings, never inversion.
- action, focus, selection, success, caution and critical must remain independent roles.
- no state may depend on color alone.
- accent should remain sparse; section decoration should stay neutral.

Recommendation:
- continue HOME-B with System C values for implementation prototype;
- do not reintroduce production green or stronger blue unless a later brand requirement proves it necessary;
- final token lock waits for rendered adjacency, dark, forced-color/device evidence.

## 3. Layout / Spatial

Position: KEEP HOME-B hierarchy; RECOMPOSE rather than preserve current Home shell.

Opinion:
- current production Home is not the target geometry.
- `Actions -> Search -> Current Period -> Recent -> Activity -> Totals` is coherent.
- Home should not become a card dashboard.
- first viewport should optimize task start and orientation, not screen completeness.
- vertical scroll is preferable to reducing type/spacing.
- Activity/Totals below fold is acceptable.
- the professional ledger may remain horizontally dense, but Home and onboarding should not inherit two-dimensional density.

Recommendation:
- retain one strong vertical datum and rule-based grouping;
- allow action pair to reflow when text/width pressure requires;
- keep Recent compact but not compressed;
- treat first viewport and full-page information architecture as different optimization problems.

## 4. Interaction

Position: KEEP Home interaction model; Previous Total needs state-complete implementation before lock.

Opinion:
- Search is correctly promoted as direct retrieval.
- 7D / 28D / 90D / Custom should behave as explicit state, not decorative tabs.
- focus and selection require geometry/text cues in addition to color.
- Search + software keyboard must preserve the focused field and meaningful context.
- Previous Total must preserve `none / zero / carry-forward / invalid / needs-review` as distinct states.
- one H+MM editor per duration semantic remains the preferred interaction direction.

Recommendation:
- do not modify product semantics to fix geometry;
- complete 200% / keyboard / error / earlier-boundary review pressure states before onboarding lock;
- do not add tutorials to compensate for unclear controls.

## 5. Content / UX Writing

Position: strong support for minimal Welcome and professional neutral tone.

Opinion:
- Welcome is not a Store page or feature tour.
- professional users should reach the primary task without consuming optional education.
- `LogMate / Pilot Logbook / Start a new logbook / Sign in` is sufficiently clear for the current first-use contract.
- do not emphasize `Captain`; role-based praise has no product requirement.
- routine actions should not use congratulatory language.
- product-specific consequence should be explained at the decision point, not in generic onboarding.

Recommendation:
- keep Welcome extremely quiet;
- teach only LogMate-specific differences when they become relevant;
- keep Previous Total explanation concise and consequence-oriented;
- avoid slogans, lifestyle copy, trust superlatives and PWA capability claims.

## 6. Web / PWA

Position: KEEP semantic visual system; avoid platform-equivalence claims.

Opinion:
- the same semantic UI can transfer to PWA/EFB, but native and PWA capabilities are not equivalent by default.
- installability does not prove durable offline data, update behavior, background work or sync.
- responsive behavior should follow constraint failure rather than device labels.
- browser/runtime validation is still required for focus, zoom, storage and actual EFB behavior.

Recommendation:
- do not make Welcome carry PWA messaging;
- keep phone-first visual semantics portable;
- treat wide/EFB layout as recomposition after Home phone baseline, not as a stretched phone.

## 7. Marketing / Monetization

Position: Home should remain ad-free.

Opinion:
- Home is an intent-rich launch/work surface: Add Flight, View Logbook, Search and current/recent context.
- app-open/foreground intent belongs to the user once actionable content is ready.
- monetization should not take the highest-value foreground attention area.
- first-use, Add/Edit, Import/Restore, dense View Logbook and immediate Search selection are protected surfaces.
- later read/browse detail surfaces are stronger ad candidates than Home.

Recommendation:
- preserve Home ad-free through initial release;
- evaluate Activity detail, Totals detail, history/reference surfaces later under real usage evidence;
- do not optimize screen geometry to manufacture ad inventory.

## 8. Product / Aviation-domain semantics

Position: preserve semantic families, not the current visual presentation.

Opinion:
- Current Period, rolling Activity and Totals answer different questions and may coexist.
- 28D is the selected rolling period because it aligns better with aviation-domain windows than 30D, but it is not a compliance claim.
- Previous Total is a semantic carry-forward baseline immediately before earliest-known LogMate record, not a generic lifetime-total screen.
- PreviousTotalBaseline remains distinct from OpeningBalance.
- blank != zero.
- hiding/display changes cannot alter stored semantic truth.

Recommendation:
- keep `This Month / This Year` as calendar orientation;
- keep 7D / 28D / 90D / Custom as activity analysis;
- do not label Home filters as legality/currency monitoring;
- keep baseline semantics independent of View Logbook visibility.

## 9. Software / Quality / Data Engineering

Position: prototype architecture is suitable for design validation; production promotion should be controlled.

Opinion:
- the independent design preview is the correct place to validate layout without destabilizing production code.
- current CI analyze/contract/golden evidence is useful but not evidence that persistence, sync, backup or calculations work.
- design tests should protect semantic invariants such as 28D, English-only, no fake first-use totals and Previous Total meaning.
- production migration should separate visual refactor from data-engine introduction where practical so regressions are attributable.
- local save, durable persistence, sync, backup and recovery must remain separate state claims.

Recommendation:
- promote approved visual primitives incrementally into production;
- preserve tests at each promotion step;
- do not couple Home visual rewrite with unresolved ledger/persistence engine changes in one opaque change;
- retain exact commit/build provenance for review renders.

## 10. Council consensus

Strong consensus:
- HOME-B direction is worth continuing.
- Home should be redesigned from research, not visually copied from current production.
- scrolling is correct; do not compress typography to avoid it.
- C017 low-chroma operational is the correct working color direction.
- Home remains ad-free.
- no stock card/dashboard grammar.
- Welcome remains minimal.
- Previous Total must remain semantically rigorous and state-complete.
- production code should only be promoted after the current pressure/review gate.

## 11. Material disagreements / open judgments

No specialist currently argues for a fundamentally different Home visual system.

Open owner/product judgments:
1. exact first-viewport balance between Current Period and Recent;
2. whether Search remains enabled on zero-record Empty Home;
3. exact three Totals slots on Home once engine semantics close;
4. exact vertical optical balance of Welcome;
5. final light/dark production token values after device/runtime validation.

## 12. Coordinator recommendation

Do not restart Home.
Use HOME-B v0.4 as the system base, but treat the next production-code pass as a specialist-led composition refinement rather than a reskin of current Home.

Recommended sequence:
1. close current pressure tests;
2. owner reviews this specialist council;
3. revise only agreed Home composition details;
4. render again from Flutter code;
5. lock Home direction;
6. derive and refine Welcome / Previous Total / Empty Home;
7. only then promote approved primitives/screens into production Flutter;
8. defer Add Flight multi-leg optimization until Home/first-use visual baseline is stable.
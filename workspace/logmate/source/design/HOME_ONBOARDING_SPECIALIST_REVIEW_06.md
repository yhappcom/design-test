# LogMate Home + Welcome/Onboarding Specialist Review 06

Status: CROSS-SPECIALIST REVIEW / NO FINAL VISUAL LOCK
Date: 2026-09-19
Reviewed artifact: latest portfolio render after HOME-B v0.3 direction

## Executive result

### HOME
**KEEP DIRECTION / REWORK DETAIL**

The Home direction is sufficiently coherent to continue in HOME-B lineage.
The main remaining issue is not hierarchy but over-compression: the render attempts to show Current Period, Recent, Activity and Totals in one viewport even though scrolling is allowed. This risks smaller type, reduced breathing room and equalized section weight.

Recommended Home refinement:
- keep Actions -> Search -> Current Period -> Recent -> Activity -> Totals;
- keep Home ad-free;
- allow natural vertical scroll;
- do not optimize for seeing every section simultaneously;
- preserve 15/17/20 type roles rather than shrinking metadata;
- move Activity/Totals naturally below the first viewport when needed;
- verify duration/numeric presentation consistency before lock.

### WELCOME / ONBOARDING
**REWORK REQUIRED BEFORE DIRECTION LOCK**

The current rendered Welcome/Onboarding composition reintroduced patterns already rejected by prior research:
- feature-tour bullets;
- marketing copy;
- broad trust claim (`private and secure`);
- PWA-like claim (`Access anywhere`);
- decorative first-use content that delays the intent decision.

Previous Total also drifted from the confirmed interaction/domain work:
- generic Total Flight Time / Total Flights / Total Landings instead of the sparse semantic baseline model;
- separate hour/minute boxes instead of the current one-field H+MM direction;
- zero/carry states are visually mixed rather than progressively disclosed.

Empty Home is closer to the target but should remove decorative marketing copy and inherit the final Home shell directly.

## 1. Type specialist

### KEEP
- calm sans hierarchy;
- operational numerals can use tabular figures;
- Home's major hierarchy is readable without display-type theatrics;
- no need for a custom LogMate typeface before the T021 drawing gate closes.

### REWORK
- do not compress Home so all sections fit in one viewport;
- avoid helper/metadata tiers below the established readable role system;
- Welcome bullet copy creates unnecessary type tiers;
- exact data strings should pressure-test `99,999+59`, `Instrument Flight Time`, long airport/flight identifiers and 200% text.

### Type verdict
**Home: KEEP / pressure-test after scroll reflow.**
**Welcome: simplify before further type polishing.**

## 2. Color specialist

### KEEP
- C017 low-chroma operational direction is appropriate;
- light/dark should remain separate semantic mappings;
- neutral surfaces allow operational data to dominate;
- focus/selected/status/action must remain distinct.

### REWORK
- rendered accent must be checked against the actual C017/C020/C021 role map rather than visually approximated;
- do not use teal/cyan decoratively in icons/section chrome;
- selection state must survive grayscale and forced-color removal;
- current render is not physical-device or CVD evidence.

### Color verdict
**Direction supported. Exact palette application remains candidate-level, not final tokens.**

## 3. Layout specialist

### KEEP
- HOME-B hierarchy: Actions -> Search -> Current Period -> Recent -> Activity -> Totals;
- no bottom navigation introduced;
- no hero aviation image;
- rule/alignment-based sections are more appropriate than equal cards.

### REWORK
- stop forcing every Home section into the first viewport;
- scrolling is preferable to visual compression;
- first viewport should prioritize action + retrieval + orientation/resumption;
- Activity and Totals may sit below fold without being demoted semantically;
- action controls may have authored boundaries, but must not become a repeated rounded-card system.

### Layout verdict
**Home-B structure supported. Recompose vertically with more breathing room.**

## 4. Interaction specialist

### KEEP
- Search remains a direct retrieval task;
- Activity 7D/28D/90D/Custom remains explicit;
- Current Period and rolling Activity remain different interaction concepts;
- Home itself should remain ad-free.

### REWORK
- search focus/keyboard state needs a real focused specimen;
- scrolling + keyboard reveal must not obscure Current/Recent context unexpectedly;
- selected period must use control geometry/text as well as color;
- Previous Total must return to explicit zero vs carry-forward state handling;
- one H+MM input per duration semantic, not separate hour/minute boxes.

### Interaction verdict
**Home needs focused-search/scroll state validation. Previous Total render is not acceptable as-is.**

## 5. Content specialist

### KEEP
- English-only product UI;
- concise operational labels on Home;
- no greeting/Captain hero needed.

### REWORK
Remove or strongly reduce:
- `A modern logbook for pilots...` style promotional copy;
- `Log flights quickly / See your progress / Access anywhere` feature list;
- `Your data stays private and secure` unless the exact claim is evidence-backed and needed;
- `Every journey starts somewhere` decorative copy.

Preferred Welcome content remains close to:
- `LogMate`
- `Pilot Logbook`
- `Start a new logbook`
- `Sign in`

### Content verdict
**Welcome should become materially quieter and more task-direct.**

## 6. Web/PWA specialist

### KEEP
- same semantic visual system across native and PWA;
- no requirement that PWA visually advertise itself.

### REWORK
- `Access anywhere` is too broad and may imply unsupported platform/runtime equivalence;
- do not expose install/offline/storage/background claims in Welcome;
- wide/EFB adaptation should recompose by constraint, not stretch phone layout;
- actual service-worker/storage/update/recovery states remain implementation-specific.

### Web verdict
**No PWA claim belongs in Welcome at this stage.**

## 7. Marketing / product specialist

### KEEP
- Home ad-free;
- Home acts as an intent hub rather than inventory;
- first-value path remains protected;
- detailed low-intent read/browse surfaces are better future ad candidates.

### REWORK
- Welcome feature-tour content delays first action and duplicates Store marketing;
- trust superlatives should not substitute for product evidence;
- Home should not be made longer or denser merely to create ad inventory.

### Marketing verdict
**Home ad-free direction strongly supported. Welcome should optimize intent-to-first-value, not persuasion.**

## 8. Domain / engineering review

### Previous Total
Current render must be corrected to current domain direction:
- Previous Total is sparse semantic carry-forward data, not one generic `Total Flight Time` object;
- zero != blank;
- carry-forward may include approved total-eligible semantics;
- one H+MM editor per duration semantic;
- hidden/omitted semantic != numeric zero;
- generic `Total Flights / Total Landings` presentation is not enough to represent the canonical baseline model.

### Home duration values
Before final Home lock, confirm whether Home Activity/Total durations use H+MM or decimal-hour rendering. Do not leave Home numerics inconsistent with the broader LogMate duration grammar.

### Engineering verdict
**Home layout can proceed; Previous Total visual must be rebuilt from the existing semantic contract before onboarding approval.**

## 9. Add Flight owner feedback

Owner feedback:
- UI itself is not the current priority issue;
- future refinement should support fast sequential entry of roughly 2–4 legs/day.

Specialist handling:
- record as a later interaction-efficiency requirement;
- do not redesign Add Flight now;
- future pass should study carry-forward/defaulting, next-leg continuation, focus order, repeated route/aircraft/crew/time reuse, and safe duplication without silently copying wrong operational values.

## 10. Priority after review

1. Refine HOME-B v0.3 into v0.4 with natural scroll and no over-compression.
2. Rebuild Welcome from confirmed minimal first-use contract.
3. Rebuild Previous Total from the existing semantic/input research instead of the current portfolio illustration.
4. Make Empty Home a true zero-data state of the selected Home shell.
5. Cross-review the refined Home + first-use trio again.
6. Only then proceed to code-based Flutter implementation/rendering.
7. Add Flight multi-leg optimization remains queued for the later detailed-screen phase.

## Cross-specialist consensus

**Home is the closest surface to a stable direction. Welcome/Onboarding is not yet at the same maturity.**

The next work should not invent another whole portfolio. It should revise the existing HOME-B lineage and derive Welcome/Previous Total/Empty Home from that selected visual system.
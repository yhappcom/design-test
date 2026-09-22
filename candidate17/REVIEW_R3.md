# Candidate 17 — Discipline Review R3

Exact candidate source reviewed: `93274ba7a1262a6c35414020972c34907d564899`
Renderer/font chain: `6a70c28f4fedf2d6f8985a53cfe933b0422a2b00`
Frozen structural source: `79fd5c43ca6b09ea5b773c77319709139f1b8089`
Authority snapshot: `design-studio@74dcb12d278c110dd682ac0ff8c4988aceaba28b`
Prior reviews: R1 superseded by ineffective wrapper; R2 superseded after inherited compile defect was discovered.
Evidence boundary: exact source/static review; deterministic runtime PNG is the next gate.

- **Type — KEEP.** Original sizes, line heights, weights, tabular-figure roles, flight carrier/number zoning and operational grid widths are retained. C17Sans (Inter) and C17Mono (Roboto Mono) are bundled/resolved explicitly. No custom-font maturity, kerning closure or human preference claim is made.
- **Color — KEEP.** Non-pastel cool-white/blue-black grounds, cobalt functional primary and separate lime micro-signal create clear hierarchy. Selected Activity state is redundant through fill, weight and semantic selected state. Search focus changes both boundary color and thickness. Runtime/accessibility-mode/glare/human evidence remains open.
- **Layout/Spatial — KEEP.** Candidate is a direct baseline copy with the same page padding, section order, spacers, controls, metric rows, 23/25/30/22 flight grid, Activity and Totals placement. The only structural repair replaces invalid `SizedBox(minHeight:30)` with equivalent `ConstrainedBox(minHeight:30)`; intended geometry is unchanged. Paint borders consume no layout space.
- **Interaction — KEEP.** Baseline focusable Search, settings/month/actions/row handlers and Activity selection mechanics remain intact. No visual layer intercepts input or changes destinations.
- **Content/UX Writing — KEEP.** Baseline authored strings and fixtures are unchanged. No new product promise, unsupported state copy or localization assumption is introduced.
- **Web/runtime — KEEP TO RENDER.** The invalid package import and inherited minHeight compile defect are repaired. Candidate-specific 390×844 Light/Dark renderer, bundled fonts and artifact workflow are present. Successful exact runtime execution remains the required next evidence.
- **Accessibility/Human Factors — KEEP (source gate).** Baseline semantics and large-text recomposition remain. Selection and focus use redundant cues. No AT, physical-device, representative-pilot or product WCAG PASS is claimed.
- **Brand/Identity — KEEP.** The candidate has a materially distinct visual code while retaining the original layout: high-contrast field, cobalt functional emphasis, lime micro-signal, hard compact corners and deterministic operational mono. It avoids pastel softness, aviation ornament, cockpit/watch mimicry and layout novelty.
- **External-reference integrity — KEEP.** Flighty, Linear Mobile and Things informed only abstract principles of salience, compact state clarity and reduced chrome. No external layout, screenshot, asset, branded component, icon language or palette is reproduced.

**Coordinator verdict: UNANIMOUS KEEP / Web KEEP TO RENDER. Render gate OPEN.**
Any runtime/visual defect or material source change reopens the full review gate.

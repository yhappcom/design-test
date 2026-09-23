# Candidate 22 — Flight Manifest

Status: AWAITING OWNER DECISION

Baseline: `79fd5c43ca6b09ea5b773c77319709139f1b8089`
Candidate branch: `candidate/22-flight-manifest`
Final render HEAD: `418ea565b79fc7c85950cf7d2dc470a8428dc5ad`
Visual-source commit: `8f60e0c51f88704de8c0d78488bf43b8c7336a64`
Final renderer commit: `418ea565b79fc7c85950cf7d2dc470a8428dc5ad`

## Independence
Candidate 22 was created independently from the structural baseline. Candidates 01, 02–11 and 17–21 were not used as visual-generation inputs, stylistic seeds or derivation references. Candidate 12 remains preserved but was not used as a style reference. Frozen invariants were derived from the actual baseline source/contracts.

## Frozen invariants
Preserved: Home section/order; LogMate/settings; Add Flight/View Logbook; Search logbook; September 2026 navigation; This month 42+15 / This year 318+40; Recent Flights fixtures and column geometry; Activity periods and metrics; Totals metrics; 44px action/control zones; baseline grid flex 23/25/30/22 and flight-row height 31.

## Visual thesis
Flight Manifest: restrained operational-document language rather than soft card UI. Square search field, hairline rules, compact uppercase micro-labels, tabular data, blue instrument accent, section datum marks and selected-period underline. Light and dark are semantic counterparts.

## Canonical discipline review — R1 pre-render
- Type: KEEP
- Color: KEEP
- Layout/Spatial: KEEP
- Interaction: KEEP
- Content/UX Writing: KEEP
- Web/runtime: KEEP TO RENDER
- Accessibility/Human Factors: KEEP
- Brand/Identity: KEEP

## Render / revision record
- Added missing Candidate 22 push-trigger workflow: `bea8117f3784fa923ede6a0bfc4e14d420572a8b`.
- Fixed renderer package/import harness: `cf5c3720a8abf939b091f5469547164c9af18860`.
- Corrected one missing closing parenthesis in `action()` without altering the intended visual tree: `8f60e0c51f88704de8c0d78488bf43b8c7336a64`.
- Replaced unstable direct-render harness with the proven golden pipeline: `b00b56a413da443ac751e812c9d6f82232f3ab0f`.
- Final renderer explicitly loads deterministic sans, monospace and Material Icons families: `418ea565b79fc7c85950cf7d2dc470a8428dc5ad`.

Intermediate failures were renderer/tooling defects, not candidate-design verdicts. The first successful artifact still failed visual inspection because monospace data and Material Icons rendered as placeholders; it was not accepted.

## Final runtime evidence
GitHub Actions run: `35846085082`
Conclusion: SUCCESS
Artifact ID: `10743457322`
Artifact: `candidate22-390x844`
Artifact digest: `sha256:60ee0e59634c57bccb516d9333f0a0ef8cc6cbddf69ac4bd709b98517070e979`
Artifact evidence paths:
- `test/goldens/candidate22_light_390x844.png`
- `test/goldens/candidate22_dark_390x844.png`

Both files were downloaded from the final artifact and verified as 390×844 RGBA PNGs.

## Canonical discipline review — R2 post-render
- Type: KEEP — visible sans and monospace glyphs resolve correctly; tabular data remains stable; `7C 1123` fits without clipping.
- Color: KEEP — low-chroma surface hierarchy and restrained blue accent remain coherent in both themes; selected Activity state is not color-only.
- Layout/Spatial: KEEP — no clipping/overflow; alignment, section rhythm, grid columns and section boundaries remain intact at 390×844.
- Interaction: KEEP — 44px control geometry remains intact; controls/signifiers and selected state remain visually distinguishable. Static render evidence does not claim behavioral/runtime task completion.
- Content/UX Writing: KEEP — frozen labels, dates, flight data and metrics remain visible and untruncated; no semantic copy was invented.
- Web/runtime: KEEP — exact branch rendered successfully through GitHub Actions; final Light/Dark artifact was downloaded and inspected.
- Accessibility/Human Factors: KEEP — legibility, target geometry and redundant selected-state cues survive both themes. No WCAG, screen-reader, physical-device or human-usability PASS is claimed.
- Brand/Identity: KEEP — operational manifest character remains restrained and product-specific without airline-livery mimicry or decorative aviation metaphor.

Current Design Studio governance lists five official specialists (Type, Color, Layout/Spatial & Interaction, Web, Content); Accessibility/Human Factors remains cross-cutting. No additional official specialist role required a separate canonical pass.

Coordinator final verdict: KEEP — AWAITING OWNER DECISION.

## Final visual inspection
PASS:
- text/glyph/font rendering
- Material Icons rendering
- monospace operational data
- `7C 1123` fit
- clipping/overflow
- alignment
- spacing/rhythm
- section boundaries
- Light/Dark contrast hierarchy
- selected-state expression
- overall visual integrity

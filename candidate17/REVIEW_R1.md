# Candidate 17 — Discipline Review R1

Implementation reviewed: `97d5992929ecf2246c20deddbba18d92ebc7cc13`
Authority snapshot: `design-studio@74dcb12d278c110dd682ac0ff8c4988aceaba28b`
Evidence boundary: static/source review only until deterministic render exists.

- **Type — KEEP.** Baseline text roles, sizing, weights, tabular operational figures, monospaced airport codes, and fixed carrier/number zones are inherited unchanged. Candidate wrapper changes no text metrics contract.
- **Color — KEEP.** Cool white/blue-black ground, navy/near-white text and cobalt primary provide non-pastel separation. Lime is limited to a non-semantic edge signal; state meaning remains redundant in inherited shape/weight treatment. Runtime transformation evidence remains render-gated.
- **Layout/Spatial — KEEP.** Candidate directly embeds `HomeV011`; page inset, vertical spacers, action/search/month/metric locations, 23/25/30/22 flight grid, Activity selector and Totals geometry are unchanged. Overlay is IgnorePointer and Stack-positioned outside layout flow.
- **Interaction — KEEP.** Existing focusable controls, action destinations/prototype handlers, period selection semantics and hit geometry are inherited; overlay cannot intercept input.
- **Content/UX Writing — KEEP.** Exact baseline labels, fixture strings, month context, action labels and 7/28/90/Custom semantics are inherited without authored copy changes.
- **Web/runtime — KEEP TO RENDER.** Source is isolated and structurally minimal. Deterministic 390×844 Light/Dark runtime evidence is the next required gate.
- **Accessibility/Human Factors — KEEP (source gate).** Existing semantics and large-text fallback remain present; no human/AT conformance claim is made. H/A evidence remains explicitly OPEN outside this candidate gate.
- **Brand/Identity — KEEP.** Split Signal is recognizably different through cobalt/blue-black field character and narrow active signal while avoiding aviation ornament, cockpit mimicry, glass/metal and pastel styling.

**Coordinator verdict: UNANIMOUS KEEP / Web KEEP TO RENDER.** Render gate OPEN. Any visible runtime defect or material source change requires repair and full discipline re-review.

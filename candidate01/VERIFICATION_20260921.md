# Candidate 01 Preservation & Reconstruction Verification — 2026-09-21

Status: **PRESERVED OWNER REFERENCE / REPRODUCIBLE RECONSTRUCTION VERIFIED**
Role: owner comparison reference only; never generation input.

## Owner-authoritative source image

The owner supplied the Candidate 01 screen directly in chat.

Original:
- PNG dimensions: 853 x 1844
- SHA-256: `9584c63f2f43a59228d55138b7507aed50b3e02050409f663a0f76e0e4961725`
- persistent exact copy: ChatGPT Library `/LogMate/Candidate01/candidate01_owner_reference_original.png`
- 390 x 844 comparison resample SHA-256: `b9fc15fd5fbf7effbdd64d8aefaf16be0279a5ea506eaa9d792e16e8318a330e`

## Historical lineage

Candidate 01 was historically stored as a static visual concept, not as a dedicated Flutter implementation.

Canonical historical evidence:
- `yhappcom/logmate@47777f08bcd6d818c5b0ef9b2621655f38afa114`
  - `design/visual_identity/HOME_WHITE_CANVAS_DRAFT_01.md`
- `yhappcom/logmate@501f18ff22ef0ea1fd80bb32700d17cde905371d`
  - `design/visual_identity/candidates/HOME_CANDIDATE_01_20260920.md`

The owner image matches the historical fixture values, hierarchy, order, operational axes, accent behavior, and card-free visual concept documented there.

## Reproducible reconstruction

A dedicated Candidate 01-only Flutter reconstruction was created on the sealed comparison branch.
It restores Candidate 01 itself from the historical spec plus the owner-authoritative image and does not use Candidates 02–12 as design input.

Files:
- `lib/home_candidate_01_reference.dart`
- `test/candidate01_render_test.dart`
- `.github/workflows/render-candidate01-reference.yml`

Calibrated source commit:
- `2437227c43010d6bc99deaac07cbcad6131c5224`

Successful deterministic GitHub Actions render:
- workflow: `Render Candidate 01 Reference`
- run ID: `35547338379`
- artifact ID: `10616044354`
- artifact: `candidate01-reconstruction-390x844`
- render SHA-256: `28b25d8d5b5a0f46279ca6c835d34f2a4ce0422acd9fa22e76b4fd47d466dfd2`

## Direct visual / geometry comparison

Both the owner reference resample and the final reconstructed PNG were actually opened and visually inspected.

Structural rule positions at 390 x 844:
- header rule: owner 66 / reconstruction 66
- Current Period rule: 231 / 231
- Recent top rule: 380 / 380
- Recent header rule: 408 / 408
- Recent row rules: 441, 473, 507 / 441, 473, 507
- Activity baseline: 593 / 593
- Totals rule: owner 725–726 / reconstruction 726

Image-level diagnostics:
- mean absolute RGB error: 8.328 / 255
- normalized mean absolute similarity: 96.734%
- SSIM: 0.818146

Interpretation:
- composition, fixtures, section order, rule geometry, information axes, selected Activity state, and overall visual identity match the owner reference;
- the reconstruction is **not pixel-identical** because the historical original raster/font source was not committed, the owner image contains its own antialiasing/background raster characteristics, and the reconstruction uses deterministic Linux review fonts;
- therefore the reconstruction is valid as reproducible Candidate 01 evidence, but must not be misrepresented as the original historical source render.

## Preservation decision

Candidate 01 is now preserved by:
1. exact owner-reference PNG in persistent file storage;
2. historical canonical lineage;
3. sealed GitHub reference branch and provenance record;
4. reproducible deterministic Flutter reconstruction;
5. successful render run and inspected artifact.

Candidate 01 remains:
**SEALED COMPARISON REFERENCE / NOT GENERATION INPUT**.

# Candidate 20 — Independent Vector

Status: **BLOCKED-REJECTED**

Source baseline: `79fd5c43ca6b09ea5b773c77319709139f1b8089`
Review authority: `yhappcom/design-studio@main`.

Candidate 20 was opened independently from the required baseline after Candidate 19's repeated blocker was rejected. Before visual authorship, the same canonical-input deficiency is present at the source: the baseline freezes exact Home data fixtures but does not enumerate their values in the allowed canonical generation material. The product MASTER describes the Home data as mock/presentation shell without supplying the deterministic candidate fixture.

Using Candidate 01, rejected 02–11, or rejected 17–19 to reconstruct those values is prohibited. Inventing values violates frozen fixture semantics and No Guessing. This is therefore a genuine source-contract blocker, not a visual-design issue that can be revised inside Candidate 20.

Verdict: **BLOCKED-REJECTED** before implementation/review/render. No candidate visual source was authored and no KEEP/render claim is made. Candidate 20 must not become generation/reference input.

Required upstream repair: publish the exact frozen Home fixture (or an allowed canonical fixture file/ref) on the structural baseline/source-of-truth, without deriving it from excluded candidates. Once that exists, the next candidate can start independently from the repaired canonical baseline.

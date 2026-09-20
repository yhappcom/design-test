# Logbook Visual Structure Analysis

Authority: **EVIDENCE ONLY**
Inspection date: 2026-09-09
Product decisions: [MASTER.md](../../MASTER.md)

## Scope and method

This is a visual-structure inventory of the actual image samples under
`reference/logbook-formats/paper-samples/`. It does not define a LogMate
renderer, page-size policy, grouping policy, or branded-form reproduction.

Only a directly viewed image page is marked **HIGH** confidence. Row counts
refer to visible usable flight-entry bands and exclude page-total bands. A
file name alone is not used to infer a product edition or a visual rule.
Spreadsheet files were not rendered in this inspection and are not used for
visual claims.

## Inventory and visual-verification status

| Format / sample family | Repository material | Visual status | Confidence | Boundary |
| --- | --- | --- | --- | --- |
| EASA / European | `easa sample 1 of 4.png` through `4 of 4.png`, `easa example.png`, `easa.pdf` | Four PNG pages directly viewed; PDF was not rendered in this environment | HIGH for PNG pages | The four PNGs show cover/address and a left/right entry spread. |
| Jeppesen / European | `jeppesen-european-pilot-logbook-1.webp`, `...-1-2.webp` | Directly viewed; files are byte-identical | HIGH | One left-style entry page is visible, not a verified full spread. |
| Jeppesen Professional (US) | `Jeppesen-Logbook-Left-Page.jpg`, `...Right-Page.jpg` | Directly viewed | HIGH for each page image | File names say left/right, but their grid counts do not align; this inspection does not treat them as a verified matching spread. |
| ASA expanded | `asa1.jpg`, `asa2.jpg`, `asa logbook sample.jpg`, `...sample2.jpg` | Directly viewed | HIGH | Existing reference note identifies both pairs as SP-57-like expanded structures, but the observed row counts differ. |
| ASA compact / simplified | `asa3.png`, `asa4.png`, `asa logbook sample3.png` | First two directly viewed; third is a header-only crop | HIGH for visible geometry; not enough to identify edition | Existing reference note says these are a simplified family and explicitly does not identify the product number from filenames alone. |
| Alpha-K | `alpha-k logbook sample.xlsx` plus CSV exports | Workbook exists but was not rendered | VISUAL VERIFICATION UNAVAILABLE | Field/pagination text is not visual evidence. |
| General Aviation | `gerneral aviation logbook sample.xlsx` plus CSV exports | Workbook exists but was not rendered | VISUAL VERIFICATION UNAVAILABLE | General Aviation is import/reference, not an output profile. |
| Compact airline / Custom | No actual paper page/image sample identified | Sample absent | N/A | `Flight Logbook.jpeg` is an application/offline diagnostic screenshot, not a logbook page. |

## Direct visual comparison

| Format / sample | Evidence file | Edition | Page / spread basis | Flight rows | Strong separator | Shading | Header | Totals area | Density / notes |
| --- | --- | --- | --- | ---:| --- | --- | --- | --- | --- |
| EASA / European, left | `easa sample 3 of 4.png` | `ED Decision 2020/005/R` is printed only on the cover image | One left page of a visually matching two-page spread | 11 | None inside entry grid; strong boundary before totals | None | 3-tier: numbered groups, group labels, leaf labels; deep | Bottom 3-row block: `TOTAL THIS PAGE`, `TOTAL FROM PREVIOUS PAGES`, `TOTAL TIME` | Very dense: 14 visible leaf columns; narrow time/count columns. |
| EASA / European, right | `easa sample 4 of 4.png` | Not separately printed | One right page of the same visible spread | 11 | None inside entry grid; strong boundary before signature area | None | 3-tier; deep | No page-total block; bottom Remarks/signature area | Very dense: operational condition, function, FSTD, and Remarks columns. |
| Jeppesen / European | `jeppesen-european-pilot-logbook-1.webp` | Not visible | Single visible entry page | 15 | None inside entry grid; strong boundary before totals | No alternating row shading visible | 3-tier: numbered groups, group labels, leaf labels; deep | Bottom 3-row block: `TOTAL THIS PAGE`, `TOTAL FROM PREVIOUS PAGES`, `TOTAL TIME` | Very dense. The second WebP is byte-identical and adds no independent page evidence. |
| Jeppesen Professional (US), left | `Jeppesen-Logbook-Left-Page.jpg` | Not visible | One page image labelled left | 13 | None inside entry grid; strong boundary before totals | None; green paper stock is a page surface, not row shading | 2-tier grouped header with some subordinate labels; medium/deep | Bottom 3-row block: `TOTALS THIS PAGE`, `AMT. FORWARDED`, `TOTALS TO DATE` | Dense: route, aircraft category/class, and landing columns. |
| Jeppesen Professional (US), right | `Jeppesen-Logbook-Right-Page.jpg` | Not visible | One page image labelled right; pairing with left is unverified | 16 visible grid bands | No periodic strong separator; strong line only around signature portion | None | 2-tier grouped header; medium | No page-total block visible; bottom Remarks/signature area | Dense, with a wide Remarks column. Count differs from left image; see conflict. |
| ASA expanded, large left | `asa1.jpg` | Not visible | One left page of a visually matching pair with `asa2.jpg` | 14 | None inside entry grid; strong boundary before totals | None | Multi-tier grouped header; deep | Bottom 3-row block: `PAGE TOTAL`, `AMOUNT FORWARD`, `TOTAL TO DATE` | Very dense: many category/class and pilot-time columns. |
| ASA expanded, large right | `asa2.jpg` | Not visible | One right page of the visible pair | 14 | No periodic strong separator; signature boundary only | None | Multi-tier grouped header; medium/deep | No page-total block visible; bottom Remarks/signature area | Dense, wide Remarks column. |
| ASA expanded, small left | `asa logbook sample.jpg` | Not visible | One left-style page image | 12 | None inside entry grid; strong boundary before totals | **Column shading only:** several pilot-time columns have a gray fill; no alternating rows | Multi-tier grouped header; deep | Bottom 3-row block: `PAGE TOTAL`, `AMOUNT FORWARD`, `TOTAL TO DATE` | Dense, same broad field family as large expanded sample. |
| ASA expanded, small right | `asa logbook sample2.jpg` | Not visible | One right-style page image | 12 | No periodic strong separator; signature boundary only | **Column shading only:** condition columns have a gray fill; no alternating rows | Multi-tier grouped header; medium/deep | No page-total block visible; bottom Remarks/signature area | Dense. |
| ASA simplified, left crop | `asa3.png` | Not visible | Visible table area; full paper page boundary is not established | 7 visible bands | None inside visible grid; strong boundary before totals | None visible | Multi-tier grouped header; deep | Bottom 3-row total block visible | This is a crop/sample, so 7 is not accepted as a page-size preset. |
| ASA simplified, right crop | `asa4.png` | Not visible | Visible table area; full paper page boundary is not established | 7 visible bands | Signature boundary only | None visible | 2-tier grouped header; medium | No page-total block visible; signature area | This is a crop/sample, so 7 is not accepted as a page-size preset. |

## Findings from visual evidence

### Rows, grouping, and shading

- No directly inspected full entry grid uses an every-3, every-4, or every-5
  flight-row separator. The observed grids are uniform within their entry
  region; stronger rules instead mark the transition to totals or signature.
- Alternating row shading was not visible in the inspected samples.
- The only deliberate fill differentiation observed is **column shading** in
  the smaller ASA expanded pair. It groups/marks columns, not records.
- Usable-row count is not a universal property of a paper-logbook category:
  the visually inspected samples range from 11 (EASA) to 15 (Jeppesen
  European), with 12 and 14 in ASA expanded samples. The 7-band simplified
  crops cannot establish a full-page count.

### Headers and totals

- Entry-heavy pages consistently spend substantial vertical space on grouped,
  multi-tier headers. EASA and Jeppesen European visibly use three tiers;
  ASA and US Jeppesen examples use grouped headers with two or more visible
  tiers.
- A left/right spread pattern is visible for EASA and the ASA pairs: the
  left page carries the page/previous/cumulative total block, while the
  right page gives space to extended fields and a signature/remarks area.
- The totals vocabulary differs by sample but the observed structures are
  equivalent in shape: three stacked total rows at the bottom of the left
  page. Totals are not part of the flight-entry-row count.

## Evidence conflicts and limits

### EVIDENCE CONFLICT — US Jeppesen page count

- Active format contract: 13 is the Jeppesen Professional (US) default
  preset ([logbook-format-plan.md](../specs/logbook-format-plan.md)).
- Direct image inspection: the supplied left image has 13 entry bands, but
  the supplied right image has 16 visible grid bands.
- Resolution: **unresolved**. The two images are not treated as a verified
  matching spread for page-count evidence. No contract is changed.

### EVIDENCE CONFLICT — ASA expanded page count

- `asa1.jpg` / `asa2.jpg` show 14 entry bands; `asa logbook sample.jpg` /
  `asa logbook sample2.jpg` show 12.
- Existing source note groups both pairs as SP-57-like expanded reference.
- Resolution: **unresolved**. Edition, reproduction scale, or source
  relationship is not established by visual inspection alone. Neither count
  is converted into a LogMate default.

### Unavailable visual evidence

- `easa.pdf` was present but could not be rendered by the available local
  PDF tools. Its content was not used for visual conclusions; the directly
  viewed PNG pages supply the EASA findings.
- Alpha-K and GA spreadsheet samples were not rendered. Their CSV/workbook
  structure is not used to infer separators, shading, header height, or row
  count.
- No actual Compact airline or Custom paper-page sample was found.

## Implications for a future LogMate ledger (not a product decision)

### Evidence

- `Rows per page` and visual row grouping are distinct observations:
  inspected formats use different row capacities without periodic in-grid
  grouping rules.
- The stable paper pattern is fixed column geometry, uniform entry rows,
  dense multi-tier headers, and a clearly separated bottom total/signature
  boundary—not recurring heavy separators.
- A cumulative total needs different width planning from a per-flight
  duration. The task-provided `99,999+59` display-capacity direction is
  therefore a relevant future layout constraint, but no active SOT numeric
  display contract was changed by this evidence document.

### Product-design recommendation

- Keep rows-per-page and any visual row-grouping choice separate in future
  configuration work.
- Leave the default grouping, allowed grouping values, separator weight,
  alternating shading, header height, and exact total-row layout **OPEN**.
- For a phone landscape ledger, preserve fixed column allocation and
  numeric/time alignment as in the Home Recent-row approach, but do not use
  ellipsis for ledger values where it can conceal a value needed for paper
  transcription. Use explicit width/scroll/alternative presentation design
  when the renderer is defined.

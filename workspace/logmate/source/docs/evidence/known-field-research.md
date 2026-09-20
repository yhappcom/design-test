# Known Field Research

Authority: EVIDENCE ONLY

Snapshot: 2026-09-13

이 문서는 2026-09-13 consistency pass에서 repository 안의 추적 자료와 current code를 다시 확인한 결과다. 제품 결정을 새로 만들지 않으며, 충돌 시 [MASTER.md](../../MASTER.md)와 active domain spec이 우선한다.

## 1. Source / regulatory evidence re-verified in this pass

### Company Excel sample

추적된 [Jeju Air sample workbook](<../../reference/source-materials/import-source/jejuair flightHistory sample.xlsx>)의 header와 matched sample rows를 local inspection했다.

- header는 fltTime, at, bt, ntTme, instTme, dutyCode, personal toCnt/ldCnt 등을 포함한다.
- matched Maint Log sample legs에서 fltTime은 Maint R/O와, bt는 Maint B/T와 일치했다.
- at는 source Actual, ntTme은 source Night, instTme은 source Instrument Flight Time 역할이다.
- Ramp In source column은 없다. 따라서 Ramp Out + Block으로 얻은 Ramp In은 calculated provenance이며 company-imported Ramp In이 아니다.
- sample 관찰만으로 회사가 “계산 가능해서 Ramp In을 의도적으로 생략했다”는 동기까지 확정할 수 없다.
- Actual duration 하나로 Takeoff/Landing endpoint clocks 두 개를 복원할 수 없다.

이 검증은 tracked sample 관계에 한정되며 company-wide format/version 보장을 뜻하지 않는다.

### Flight & Maintenance Log

[Maint Log manual](<../../reference/source-materials/maint-log/flightmaint log manual - jejuair.pdf>)의 printed page 4/14와 tracked [sample 1](<../../reference/source-materials/maint-log/flightmaint log sample 1.jpeg>)·[sample 2](<../../reference/source-materials/maint-log/flightmaint log sample 2.jpeg>)를 확인했다.

Pilot/crew record portion에는 Duty Code, personal T/O/L/D, R/O·R/I·B/T, T/O·L/D·A/T, NIGHT FLIGHT TIME, INSTRUMENT FLIGHT TIME, LDT와 Auto Land detail이 기록된다. 이어지는 form 영역에는 Malfunction, Corrective Action, MEL/defer, fuel/oil, maintenance release/status 등 technical content가 있다.

따라서 Flight & Maintenance Log는 mixed document다.

- pilot-entered 여부는 personal logbook candidate의 필요조건이지만, 그 자체로 built-in Known Field가 되는 충분조건은 아니다.
- OOOI event layer는 OUT/Ramp Out, OFF/Takeoff, ON/Landing, IN/Ramp In이다.
- deterministic relationship은 Block = IN − OUT, Actual = ON − OFF다.
- recorded Night와 Instrument Flight Time은 form에 기록된 별도 duration이다. OOOI relationship이 이 둘을 machine-generated 값으로 바꾸지 않는다.
- maintenance/technical content는 personal Pilot Logbook domain 밖이다.
- Auto Land detail은 source form에 존재하지만 personal built-in semantic으로 자동 승격된다는 근거는 아니다.

### FOM SP.5.1 / SP.5.2

Tracked [FOM REV.77](<../../reference/logbook-formats/regulations/FOM REV.77_20260212.pdf>)의 printed SP-23/SP-24, sections SP.5.1 and SP.5.2를 확인했다.

SP.5.1 table에서 직접 확인되는 credited PIC/FO relationships:

| Duty Code | Table relationship, required context 포함 |
| --- | --- |
| C | PIC time |
| L, INSTRUCTOR AS A PIC | PIC time |
| F | FO time |
| 2C | PIC time |
| 2F | FO time |
| 2NC / 2NF | credited flight-experience time 없음 |
| C1 / C2 | 1/2 PIC time |
| F1 / F2 | 1/2 FO time |
| PC | PIC time |
| NC | FO time |
| 3PC | 2/3 PIC time |
| 3NC | 1/3 PIC + 1/3 FO |
| 3F | 2/3 FO time |
| K / Y / O | flight-experience time not credited |

H에는 captain periodic/ad hoc check의 C/H pairing을 다루는 footnote가 있다. 이 문맥 없이 H를 generic PIC rule로 만들 수 없다. EX/R/S/M은 table에 dash로 나타나며, dash만으로 generic Total Time 또는 다른 credited-duration rule을 발명할 수 없다.

SP.5.2와 인접 footnote는 2-set/3-pilot operational context와 1/2, 1/3, 2/3 fractions을 뒷받침한다. 확인한 text는 per-record sub-minute result를 반드시 버리라는 rounding/truncation policy를 정하지 않는다.

FOM은 PF와 PM을 PIC/SIC credit와 별도로 정의한다. 확인한 table은 Duty Code→PF/PM mapping, generic credited Block/Airborne, Night proration, Instrument Flight Time proration을 뒷받침하지 않는다.

### Tracked EASA Part-FCL reference

[Tracked EASA reference PDF](<../../reference/logbook-formats/paper-samples/easa.pdf>)의 physical PDF pages 10–17에서 FCL.050/AMC1 FCL.050와 pilot-logbook table/instructions를 local inspection했다. 파일 header는 November 2025 revision을 표시하지만, 이번 pass에서 연결된 external EASA URL의 최신성은 재검증하지 않았다.

Local snapshot의 FCL.050 section은 pilot가 모든 flight detail의 reliable record를 유지해야 한다는 방향과, 각 flight의 date, PIC name, departure/arrival place·time, aircraft type/registration, total flight time, takeoffs/landings, pilot-function time, Night/IFR operational-condition time, FSTD session 및 remarks 구조를 제시한다. 또한 commercial air transport flight details가 operator-maintained electronic format일 수 있고 다른 logbook도 electronic form일 수 있음을 다룬다.

이 local regulatory reference는 Night와 IFR, 여러 pilot-function/FSTD field를 구분하고 electronic record를 허용하는 evidence다. Jeju Air Instrument Flight Time을 EASA IFR로 mapping하거나 모든 profile Total Time을 Block으로 정의하는 근거는 아니다.

### Paper-logbook and digital-logbook reference observations

[Tracked visual structure analysis](logbook-visual-structure-analysis.md)은 paper samples에서 page row counts, total rows, dense multi-level headers, two-page spread와 같은 presentation evidence를 기록한다. 이는 field가 보인다는 사실과 semantic/source mapping을 구분해야 한다는 근거다. 특히 US Professional left/right와 ASA left/right row-count observation에는 불일치가 남아 있다.

[US reference source memo](<../../reference/logbook-formats/paper-samples/us-professional-reference-sources.md>)는 이전에 조사한 FAA/retailer/product reference lead를 repository에 보존한다. 이번 Codex pass에서 외부 URL 내용과 최신성을 다시 검증하지 않았으므로 fresh regulatory finding으로 제시하지 않는다.

Tracked LogTen screenshots under [reference/ui/external-apps/logten](../../reference/ui/external-apps/logten/)에서 Total Time, Night, SIC/PICUS, Cross Country, Actual Instrument, IFR, Simulator 등이 별도 label/slot으로 보이는 것을 local visual observation했다. 이는 distinct presentation semantics를 지지하지만 법적 정의, source equivalence, calculation formula를 확정하지 않는다.

## 2. Product-owner pilot-practice observations

다음은 primary source rule이 아니라 product-owner가 제공한 pilot-practice/context observation이다.

- Instrument Flight Time 기록 방식은 조종사 practice에 따라 5-minute rounding/down 또는 일부 Actual value 복사처럼 달라질 수 있다.
- 이 practice는 LogMate가 Instrument Flight Time을 Actual에서 계산해야 한다는 formula가 아니다.
- manual entry만 사용하는 사용자, import를 먼저/나중/반복/한 번/전혀 하지 않는 사용자가 모두 가능해야 한다.
- Maint/e-paper/company 자료를 대조하는 실제 업무 맥락은 있을 수 있지만, tracked screenshots/samples만으로 모든 회사 workflow나 system-of-record precedence를 일반화할 수 없다.

## 3. Product policy adopted in MASTER/specs

아래는 evidence 자체의 결론이 아니라 [MASTER.md](../../MASTER.md)와 active specs가 채택한 product policy다.

- Manual-first: personal Pilot Logbook은 manual flight entry만으로 완전히 사용할 수 있어야 한다.
- Import-optional: import는 어느 시점에도 가능하고 필수가 아니다.
- Local-first / Cloud-minimal: normal data operations, parsing, matching, reconciliation, search, calculation, aggregation, projection은 on-device 방향이다. Firebase는 Auth/owner Sync와 genuinely cloud-dependent persistence infrastructure의 connectivity layer다.
- Native + tablet/EFB PWA는 first-class target이며 same input의 semantic/calculation/projection parity를 요구한다.
- official taxonomy는 Known Field와 Custom Field다.
- user-confirmed current values는 silently overwritten되지 않는다. company operational source와 CrewConnex roster source는 field-specific roles를 가지며 서로 바꿔 쓸 수 없다.
- Standard Inst semantic은 Instrument Flight Time이다. IFR Time, Actual Instrument, Simulated Instrument, Instrument Ground Time은 별도 Known Fields다.
- Night은 independent recorded source/current value다. `0 < Night < Block`은 partial-night leg임만 나타내며 endpoint states가 반대임을 증명하지 않는다. future solar/coordinate helper는 sufficient event-time/location input으로 각 endpoint를 독립 평가해야 하고, 다른 endpoint로부터 state를 파생하거나 Night duration을 계산·대체하지 않는다. exact inputs, algorithm/boundary, coordinate architecture는 OPEN이다.
- Cross-Country는 source-provided/user-entered이며 route inequality로 추정하지 않는다.
- Auto Land count/RWY/RVR·VIS/S·U는 built-in Known Field에서 제외한다. 사용자는 필요하면 Custom Field로 추적할 수 있다.
- Known Field는 LogMate가 의미를 소유하고 personal Pilot Logbook에 적합한 semantic이다. 한 source form에 등장하거나 pilot가 기록했다는 사실만으로 자동 확정되지 않는다.

## 4. Bounded gaps / unresolved questions

- DATA-001 exact canonical schema/codec/migration
- DATA-002 PF/PM input/source/derivation UX
- generic personal Total Time / generic credited Block or Airborne semantic for augmented crew
- exact astronomical/regulatory Night boundary
- future local airport-coordinate reference architecture
- generic import source-signature and remembered-mapping persistence schema
- AUTH-001 signed-out local entry and owner binding/recovery UX
- seven profile dedicated-renderer versus optional-preset role
- configuration Sync conflict policy
- fractional FOM credit sub-minute rounding/truncation policy
- Duty Code H contextual handling
- exact paper-profile pagination where tracked sides conflict
- broader regulator/digital-logbook field definitions not locally revalidated in this pass

## 5. Evidence limitations

- Local source inspection establishes only the reviewed file/version/row/page relationships.
- No external web citation was fabricated or reconstructed from prior ChatGPT research in this pass.
- Reference appearance does not itself establish a canonical field, jurisdictional formula, or product requirement.
- The companion [known-field-catalog.csv](known-field-catalog.csv) is a diff-friendly candidate/evidence matrix, not a frozen canonical schema.

# Synthetic Fixture Specification

> Authority: FIXTURE EXPECTATIONS ONLY
> Status: CURRENT — documentation-level synthetic contract; future implementation tests are separate
> Source of Truth: [MASTER.md](../../MASTER.md)

최종 갱신: 2026-09-13
데이터: [m0-synthetic-fixtures.json](fixtures/m0-synthetic-fixtures.json)
관련 계약: [data-schema-spec.md](data-schema-spec.md) · [import-contract.md](import-contract.md) · [logbook-format-plan.md](logbook-format-plan.md)

## 1. 목적과 한계

fixture는 실제 직원·운항·편조·회사 파일을 재현하지 않는다. 가상 관계로 source 값 보존, import reconciliation, FOM PIC/FO credit, Night 분류-helper 후보, page projection 등 future domain behavior의 기대값을 표현한다.

현재 repository에 canonical FlightRecord repository, local persistence, Calculation/Aggregation Engine, production import parser, product Sync는 없다. 따라서 fixture 존재는 대응 production code/test 구현이나 PASS를 뜻하지 않는다.

개인정보 차단 규칙:

1. 실제 이름, 사번, registration, flight number, route, 운항일, PDF 문구를 넣지 않는다.
2. 가상 항공사는 ZZ, crew는 Pilot Alpha 같은 가명을 쓴다.
3. 실제 source row/page 값을 복사하지 않고 synthetic locator만 사용한다.
4. 새 fixture는 실제 자료를 복사하지 말고 필요한 관계만 가명화한다.

## 2. 공통 표현

- company at/bt/ntTme/instTme은 H+MM source text다.
- expected raw values는 source를 그대로 보존한다.
- verified FOM fraction은 초 단위 exact result로 표현할 수 있다.
- FOM은 PIC/FO credited experience만 검증한다. Duty Code ratio로 Block, Actual, Night, Instrument Flight Time을 새 credited duration으로 만들지 않는다.
- FOM 자료가 per-record sub-minute truncation을 확정하지 않으므로 minute-resolution rounding/truncation policy는 OPEN이다.
- Duty Code는 PF/PM을 뜻하지 않는다.
- import scenario 순서는 가능한 사용 방식 중 하나일 뿐 required lifecycle이 아니다.

## 3. Fixture 묶음

| ID | 검증 범위 |
| --- | --- |
| FOM-* | raw duration 보존, 문맥이 충분한 PIC/FO credit, fractional exact result, unsupported rule 금지 |
| NIGHT-* | recorded Night을 바꾸지 않는 Day/Night T/O/L/D candidate, unresolved boundary, user authority |
| TIME-* | raw row 표현과 합계 표현 분리 |
| IMPORT-* | manual/company reconciliation, ambiguous staging, calculated Ramp In provenance |
| CREW-* | optional existing-record-only CrewConnex enrichment |
| AIRPORT-* | source code/alias 보존; lightweight runtime Airport와 canonical model을 결합하지 않음 |
| SIM-* | SimulatorRecord와 actual flight total 분리 |
| PAGE-* | 명시적 Alpha-K B/T(Block), PIC, FO page/previous/new totals |
| SYNC-*, MIG-*, EXPORT-* | future contract examples; current implementation/PASS 아님 |

## 4. FOM PIC/FO expected matrix

fixture의 기본 experience duration은 source Block 6+15와 같은 22,500초를 명시적으로 제공한다. 이 fixture choice가 모든 personal Total Time 또는 augmented-crew generic credited Block semantic을 확정하지 않는다.

| Duty Code | 문맥이 충족된 fixture expectation |
| --- | --- |
| C, L, 2C, PC | PIC full credit |
| F, 2F, NC | FO full credit |
| 2NC, 2NF | table상 credited flight-experience time 없음 |
| C1, C2 | PIC 1/2 |
| F1, F2 | FO 1/2 |
| 3PC | PIC 2/3 |
| 3NC | PIC 1/3 + FO 1/3 |
| 3F | FO 2/3 |
| K, Y, O | flight-experience time not credited |
| H | C/H captain-check pairing footnote context가 필요하므로 generic expectation OPEN |
| EX, R, S, M | table의 dash만으로 replacement credit rule을 만들지 않음 |

FOM-3F-fraction은 1+23의 2/3인 3,320초(0:55:20)를 exact result로 검증한다. 이를 0+55로 자르는 universal rule은 없다.

각 FOM fixture는 다음을 함께 확인한다.

- source Block, Actual, Night, Instrument Flight Time이 변하지 않는다.
- credited PIC/FO만 별도 결과가 된다.
- credited Night/Instrument와 generic credited Block을 기대하지 않는다.
- PF/PM expectation이 없다.

## 5. Night classification-helper fixture

Night은 independent source/current duration이며 helper의 출력이 아니다. 개인 T/O/L/D count가 있을 때도 partial Night만으로 endpoint state를 만들지 않는다.

| ID | 입력 | 기대 |
| --- | --- | --- |
| NIGHT-zero | Night = 0 | Day T/O/L/D candidate |
| NIGHT-full | Night = Block | Night T/O/L/D candidate |
| NIGHT-partial-independent-* | 0 < Night < Block + independently sufficient synthetic classification input for both endpoints | supplied departure/arrival states를 그대로 preserve/project; 한 endpoint에서 다른 endpoint를 파생하지 않음 |
| NIGHT-null | Night null | unresolved/user-editable; Day fallback 없음 |
| NIGHT-partial-insufficient-endpoints | partial Night + 한 endpoint input만 충분 | unresolved/user-editable; opposite-state inference와 Day fallback 없음 |
| NIGHT-user-edit-authoritative | user-confirmed split + later source/helper | user split 유지 |

`0 < Night < Block`은 partial-night leg임만 나타내며 departure/arrival이 서로 반대 state임을 증명하지 않는다. future helper는 finally approved astronomical/regulatory boundary 아래 sufficient event-time/location input으로 각 relevant endpoint를 독립 평가해야 한다. exact clock inputs, solar algorithm/boundary, future local coordinate architecture는 OPEN이며 fixture가 sunrise/sunset policy를 계산하지 않는다.

## 6. import/reconciliation fixture

IMPORT-manual-company-retain은 manual record 뒤에 matching company row가 온 가능한 scenario다. 사용자가 수기 Block을 유지하면 company Block은 evidence로 남고 current value를 이후 import가 침묵 속에 덮지 않는다. 이는 import가 manual entry 뒤에 반드시 와야 한다는 lifecycle이 아니다.

IMPORT-company-crewconnex-mismatch는 company Block과 CrewConnex BLH 차이를 review로 노출하면서 company/current value, Remark, manual participant를 보존하고 crew snapshot만 보강한다. CrewConnex는 독립 FlightRecord를 만들지 않는다.

IMPORT-ambiguous는 자동 attach/create/overwrite 없이 review/staging으로 간다.

IMPORT-company-derived-ramp-in은 company source가 Ramp Out과 Block을 제공하고 Ramp In은 제공하지 않았을 때 Ramp In = Ramp Out + Block을 계산한다. 기대 provenance는 calculated이며 company-imported Ramp In으로 표시하지 않는다. Actual 하나만으로 Takeoff/Landing 두 clock을 재구성하는 fixture는 없다.

## 7. page-total fixture

PAGE-alpha-3은 explicit Alpha-K B/T(Block), PIC, FO 열을 사용한다.

| row | B/T (Block) | PIC | FO |
| --- | ---: | ---: | ---: |
| 1 | 2+30 | 2+30 | — |
| 2 | 2+00 | — | 2+00 |
| 3 | 1+45 | — | 1+45 |
| Page Total | 6+15 | 2+30 | 3+45 |
| Previous Total | 100+00 | 40+00 | 60+00 |
| New Total | 106+15 | 42+30 | 63+45 |

이 fixture는 Alpha-K B/T의 Block semantic만 검증한다. 모든 profile의 Total Time이 Block이라는 보편 규칙을 만들지 않는다.

## 8. 변경 규칙

새 구현이 fixture와 다르면 fixture를 기계적으로 맞추기 전에 MASTER, domain spec, verified source를 다시 확인한다. unresolved policy를 test expectation으로 굳히지 않는다. 역사적 실행 evidence는 [validation-results.md](../evidence/validation-results.md)에 별도로 남는다.

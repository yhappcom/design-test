# Logbook Output / Projection Contract

> Authority: OUTPUT / PROJECTION DOMAIN CONTRACT ONLY
> Status: CURRENT — supported profile semantics and layout evidence; unresolved mappings remain OPEN
> Source of Truth: [MASTER.md](../../MASTER.md)

최종 갱신: 2026-09-13

## 1. 목적과 소유 경계

이 문서는 하나의 개인 Pilot Logbook 원장을 화면·Excel·PDF/print의 행, 열, 페이지, 합계로 투영하는 계약만 소유한다. 특정 종이 양식이나 회사 문서가 canonical 원장이 되지 않으며, 양식 전환은 원장 값·출처·현재값을 바꾸지 않는다.

이 문서가 소유하지 않는 항목:

- import 선택성, parser, source matching/reconciliation: [import-contract.md](import-contract.md)
- canonical schema와 provenance: [data-schema-spec.md](data-schema-spec.md)
- OOOI/Block/Actual 계산: [calculation-engine-spec.md](calculation-engine-spec.md)
- Duty Code와 PIC/FO credit: 회사/FOM 전용 data contract 및 fixture
- Known Field/Custom Field 선택과 현재 Customize 동작: [logbook-configuration-spec.md](logbook-configuration-spec.md)
- local persistence, Sync, Backup/Export 구현

현재 production에는 canonical FlightRecord repository, local persistence, Calculation/Aggregation Engine, production import parser, product Sync, Backup/Export가 없다. 아래 내용은 현재 출력 구현 완료 주장이 아니라 제품 projection contract다.

## 2. 공통 투영 원칙

- 입력은 이미 의미와 provenance가 구분된 local record/current value다. 출력 renderer가 source를 재해석하거나 import reconciliation을 수행하지 않는다.
- user-confirmed current value는 외부 source 재투영으로 침묵 속에 대체하지 않는다.
- Block, Actual, recorded Night, Instrument Flight Time은 서로 다른 의미다.
- Standard의 Inst는 Instrument Flight Time이다. IFR Time, Actual Instrument, Simulated Instrument, Instrument Ground Time은 각각 별도 Known Field다.
- Jeju Air instTme는 Instrument Flight Time에만 대응한다. EASA IFR 또는 US Actual Instrument로 대체하지 않는다.
- profile slot이 요구하는 semantic을 matching source가 제공하지 않으면 blank/user-entered로 남기거나 정확한 mapping을 OPEN으로 둔다. 비슷한 필드로 대체하지 않는다.
- Cross-Country는 source-provided 또는 user-entered다. Departure와 Arrival이 다르다는 이유로 Block·Actual·credited time을 넣지 않는다.
- Night는 기록된 duration이다. solar/coordinate helper는 향후 개인 Day/Night T/O/L/D 분류만 보조하며 Night duration을 계산·대체·불일치 판정하지 않는다. missing Night는 Day가 아니다.
- Auto Land count/RWY/RVR·VIS/S·U는 built-in personal-logbook Known Field가 아니다. 자동 population하지 않는다. 사용자가 원하면 Custom Field로 기록할 수 있다.
- Alpha-K의 A/L presentation slot은 blank이거나 향후 user-selected/custom mapping을 사용할 수 있으나 canonical Auto Land semantic을 강제하지 않는다.
- verified FOM credit는 필요한 문맥이 갖춰진 PIC/FO time에만 적용한다. Duty Code만으로 PF/PM을 정하지 않고 Night·Instrument를 비례 배분하지 않는다.
- explicit B/T slot은 Block을 뜻한다. 다른 profile의 Total Time 또는 Total Duration of Flight가 raw Block이나 generic FOM-prorated Block과 같다는 보편 mapping은 OPEN이다.
- 개별 source duration의 raw 표기와 canonical duration을 구분하고, 합계 표시는 projection policy에 따라 일관되게 렌더링한다. fractional FOM credit의 sub-minute rounding/truncation policy는 OPEN이다.

## 3. profile 범위와 역할

| Profile | 보존할 presentation/layout evidence | 의미 경계 |
| --- | --- | --- |
| Compact airline | 날짜, 기종·등록, 편명, 구간, Block/Actual, Night/Inst, 개인 T/O·L/D, 역할, 비고 | Inst는 Instrument Flight Time. raw time과 verified PIC/FO credit를 구분한다. |
| EASA/European | date, departure/arrival place·time, aircraft/reg, single/multi-pilot, total, PIC name, day/night landing, totals | IFR는 matching IFR semantic이 있을 때만 표시. generic Total/multi-pilot mapping은 OPEN. |
| Jeppesen/European | 유럽형 field family와 page-total structure | unsupported semantic은 EASA와 마찬가지로 blank/user-entered/OPEN. |
| Alpha-K | route, flight no, day/night/A/L slots, Night, Actual Inst, approach, B/T, PIC/F/O, totals | B/T는 Block. Actual Inst와 Cross-Country는 matching source/user value만 사용. A/L은 built-in Auto Land를 만들지 않는다. |
| Jeppesen Professional (US) | route, category/class, conditions, pilot time, day/night landing, totals | Actual Instrument와 Cross-Country는 matching source/user value만 사용. Total Duration mapping은 OPEN. |
| ASA-SP-57 | route, category/class, conditions, pilot time, day/night landing, totals | Actual Instrument와 Cross-Country는 matching source/user value만 사용. Total Duration mapping은 OPEN. |
| Custom | Known Field와 Custom Field의 선택·순서, LogMate-owned compact header/system group, page/total presentation | V1 Known Field free rename, 임의 계산식, semantic 대체를 만들지 않는다. Custom Field name은 사용자 정의/rename 가능하다. |

General Aviation 자료는 import/reference 용도이며 별도 output profile로 확정하지 않는다. Flight & Maintenance Log는 개인 pilot 입력 후보를 확인하는 mixed source document이지 output profile이 아니다.

일곱 reference profile을 최종 전용 renderer로 유지할지, 일부를 optional starting preset으로 제공할지는 LOGBOOK-001 OPEN이다. 이 표는 외부 브랜드·로고·고유 디자인·공식 승인 문구의 복제를 허용하지 않는다.

## 4. profile별 지원되는 semantic 경계

### 4.1 Compact airline

지원되는 semantic은 operational date, aircraft type, registration, flight number, departure, arrival, raw Block, raw Actual, recorded Night, Instrument Flight Time, personal T/O·L/D count, raw Duty Code, verified/manual PIC·FO time, Remark다.

Block/Actual/Night/Instrument Flight Time의 source 값은 그대로 보존한다. PIC/FO credit는 FOM 문맥과 rule evidence가 있는 경우에만 별도 값으로 투영한다. generic credited Block·Night·Instrument Flight Time을 만들지 않는다. PF/PM은 Duty Code 또는 personal T/O/L/D 존재만으로 추정하지 않는다.

### 4.2 EASA/European과 Jeppesen/European

추적 reference에서 확인된 field/layout family는 date, departure/arrival place·time, aircraft/reg, single/multi-pilot, total, PIC name, day/night landing, Night, IFR, pilot-function time, Remark와 page totals다.

- company Ramp Out은 matching operational clock으로 사용할 수 있고 Ramp In은 계산된 값이면 calculated provenance를 유지한다.
- Instrument Flight Time을 IFR로 투영하지 않는다.
- single/multi-pilot, Total Time, IFR, dual, instructor, FSTD가 matching source에 없으면 blank/user-entered다.
- tracked visual evidence에서 Jeppesen/European은 15-row reference 구조가 확인되지만, rows-per-page의 최종 product policy는 Logbook Configuration을 따른다.

### 4.3 Alpha-K

추적 reference의 field/layout evidence는 date, aircraft, route, flight number, personal Day/Night T/O·L/D slots, A/L slot, Night, Actual Instrument, approach, simulator, instructor, Cross-Country, B/T, PIC, F/O, Remark와 totals다.

- B/T에는 Block semantic을 사용한다.
- Night에는 recorded Night를 사용한다.
- Actual Inst에는 Actual Instrument source/user value만 사용한다. Instrument Flight Time을 대체 입력하지 않는다.
- Cross-Country는 source/user value만 사용한다.
- A/L은 자동 채우지 않는다. blank 또는 향후 user-selected/custom mapping이다.
- simulator, instructor, approach는 matching source가 없으면 blank/user-entered다.

추적 spreadsheet가 제시하는 15-row layout은 reference evidence다. 이것이 모든 출력에서 고정 page size임을 뜻하지 않는다.

### 4.4 Jeppesen Professional (US)

추적 좌·우 page 이미지에서 route, aircraft make/model·ident, category/class, conditions, pilot time, day/night landings, approach, remarks와 page-total structure를 확인했다.

- Actual Instrument, Simulated Instrument, Cross-Country, Solo, Dual Received, Flight Instructor는 각각 matching source/user value만 투영한다.
- company Instrument Flight Time을 Actual Instrument로 넣지 않는다.
- generic Total Duration of Flight mapping은 OPEN이다.
- tracked visual structure는 left-page 13-row 관찰을 포함하지만 right-page row 수와의 불일치가 남아 있어 최종 pagination을 확정하지 않는다.

### 4.5 ASA-SP-57

추적 reference는 route, category/class, conditions, pilot time, day/night landings, approach, remarks와 page-total family를 보여 준다.

- Actual Instrument와 Cross-Country는 matching source/user value만 사용한다.
- Instrument Flight Time을 Actual Instrument로 넣지 않는다.
- generic Total Duration of Flight mapping은 OPEN이다.
- 추적 visual analysis에서 왼쪽 12행/오른쪽 14행 불일치가 남아 있어 page capacity는 확정하지 않는다.

### 4.6 Custom

Custom projection은 Known Field 또는 사용자가 정의한 Custom Field를 선택하고 visible order를 바꿀 수 있다. V1 Known Field의 full semantic name과 compact ledger header는 LogMate가 소유하며 사용자가 자유 rename하지 않는다. Future preset/dedicated renderer의 system-owned output label은 이 금지와 충돌하지 않는다. Custom Field name은 사용자 정의/rename 가능하지만 Custom Field를 Known Field로 해석하지 않으며 임의 formula/source substitution은 이 계약의 범위가 아니다. V1의 fixed system Field Group과 selectable catalog는 [configuration contract](logbook-configuration-spec.md)가 소유한다.

## 5. page와 total projection

Paper-ledger projection의 공통 관계는 다음과 같다.

PAGE TOTAL + PREVIOUS TOTAL = NEW TOTAL

- Page Total은 현재 page의 실제 record만 합산한다.
- Previous Total은 그 page 전까지의 누계이며 Opening Balance와 중복 합산하지 않는다.
- New Total은 다음 page의 Previous Total로 이어진다.
- blank presentation row는 record가 아니며 합계·검색·통계에 포함하지 않는다.
- page start anchor는 stable record identity를 사용해야 한다. exact schema/UI는 DATA-001 및 configuration OPEN이다.
- profile마다 total-eligible semantic을 명시해야 한다. 한 profile에서 duration/count가 보인다는 이유만으로 모든 profile에서 합계 대상이 되지 않는다.
- generic personal Total Time과 augmented-crew generic credited Block/Airborne mapping은 OPEN이다. explicit Alpha-K B/T만 Block semantic으로 확정한다.

현재 View Logbook mock은 이전 Standard의 아홉 leaf 열 show/hide/reorder/reset presentation shell만 구현한다. Remark가 추가된 열 개 leaf Standard와 Route/system groups는 아직 구현되지 않았다. real record projection, page engine, totals calculation, export renderer도 구현되지 않았다.

## 6. Maint Log와 개인 Pilot Logbook 경계

Flight & Maintenance Log는 mixed document다. pilot-entered는 개인 원장 candidate가 되기 위한 필요조건이지만 충분조건이 아니다.

개인 Pilot Logbook candidate:

- Duty Code와 crew/role evidence
- personal T/O/L/D
- OOOI: OUT/Ramp Out, OFF/Takeoff, ON/Landing, IN/Ramp In
- recorded Block/Actual, Night, Instrument Flight Time
- 개인 의미와 matching evidence가 있는 LDT/landing detail

개인 원장 built-in 범위 밖:

- malfunction, corrective action, MEL/defer
- fuel/oil technical management
- maintenance release, aircraft technical status
- Auto Land count/RWY/RVR·VIS/S·U

LDT/landing detail과 approach-count source evidence는 그대로 보존하지만 evidence presence가 Customize V1 selectable membership을 뜻하지 않는다. V1에는 separate Landing Detail과 Approach Count가 없고, presentation selection은 free-Text Approach와 optional free-Text Runway system group으로 표현한다.

Maint Log 전체를 machine-generated source라고 기술하지 않는다. 위 pilot section의 값은 pilot-recorded values이며, OOOI로 Block = IN − OUT, Actual = ON − OFF를 계산·검증할 수 있다는 사실이 Night/Instrument를 machine-derived로 바꾸지 않는다.

## 7. reference와 검증 한계

- EASA/FAA 자료는 field/source-version 연구 근거일 뿐 이 contract가 공식 양식 승인이나 관할 적합성을 주장하지 않는다.
- Jeppesen/ASA/Alpha-K 자료는 field·visual/page 구조의 reference다. 자체 export는 외부 로고·고유 디자인·공식 문구를 복제하지 않는다.
- tracked paper visual analysis는 [logbook-visual-structure-analysis.md](../evidence/logbook-visual-structure-analysis.md)에 있다.
- 과거 실행 결과는 [validation-results.md](../evidence/validation-results.md)에 역사적 evidence로 남는다. 해당 PASS를 현재 local ledger/Sync/export product PASS로 승격하지 않는다.

## 8. OPEN

- LOGBOOK-001: 일곱 profile의 dedicated renderer 대 optional preset 역할
- generic personal Total Time / generic credited Block·Airborne semantic
- fractional FOM credit의 minute-resolution rounding/truncation policy
- PF/PM input/source/derivation UX (DATA-002)
- exact profile pagination conflicts와 output fixture acceptance
- configuration persistence/schema/Sync conflict policy
- output renderer, Excel/PDF/print 구현과 external-form legal/product review

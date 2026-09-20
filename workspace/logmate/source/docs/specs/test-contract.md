# Test Contract and Acceptance Boundaries

> Authority: TEST CONTRACT ONLY
> Status: CURRENT — future requirements separated from current implementation and historical evidence
> Source of Truth: [MASTER.md](../../MASTER.md)

최종 갱신: 2026-09-13
정답 fixture: [fixture-spec.md](fixture-spec.md) · [m0-synthetic-fixtures.json](fixtures/m0-synthetic-fixtures.json)

## 1. 현재 구현 사실

현재 production에는 canonical FlightRecord repository, local persistence engine, Calculation/Aggregation Engine, production import parser, product server Sync, Backup/Export 구현이 없다. 따라서 아래 future test requirement는 현재 test file이나 PASS를 뜻하지 않는다.

현재 repository Makefile의 유일한 target은 make build-pwa다. 이 target은 CDN-free Flutter web build와 generated-resource precache tooling을 실행한다. 다른 Make target을 현재 command로 문서화하지 않는다.

Flutter UI/auth/input-helper/mock 관련 test와 PWA tooling은 존재하지만, 과거 POC 실행 결과는 [validation-results.md](../evidence/validation-results.md)의 당시 build/device/scenario 범위에만 유효하다. 그 결과를 현재 local ledger, persistence, Sync, import, calculation, export 또는 signed-out entry PASS로 승격하지 않는다.

## 2. 공통 future test 원칙

1. synthetic fixture만 사용하고 실제 직원·운항·crew·production Firebase data를 사용하지 않는다.
2. test는 exact duration/count/current value/provenance/review state를 비교한다.
3. network/current clock에 의존하지 않는 domain test에는 fixture time과 source context를 주입한다.
4. unresolved policy는 expected value로 고정하지 않는다. 특히 generic Total Time, PF/PM derivation, Night legal boundary, FOM fractional rounding은 OPEN 상태를 검증한다.
5. source raw values와 user-confirmed current values가 silent overwrite되지 않는지 검증한다.
6. native와 tablet/EFB PWA에 같은 domain input을 넣으면 semantic/calculation/projection result가 같아야 한다. platform adapter와 responsive composition 차이는 허용한다.
7. background/closed-app immediate Sync는 별도 검증 없이는 PASS 조건으로 삼지 않는다.

## 3. Fixture-to-future-test mapping

| Fixture ID / group | Future test requirement | PASS condition |
| --- | --- | --- |
| FOM-C, FOM-F, FOM-C1, FOM-3PC, FOM-3NC, FOM-3F-fraction | company/FOM-specific PIC/FO credit unit test | raw Block/Actual/Night/Instrument Flight Time 유지; PIC/FO exact fraction만 계산; PF/PM 및 Night/Instrument Flight Time 자동 credit 없음 |
| fomDutyCodeCoverage direct labels | context-aware duty coverage test | applicable SP.5.1/SP.5.2 context와 footnote를 fixture에 명시한 경우에만 code별 PIC/FO/no-credit relationship을 적용 |
| FOM-H | contextual rule test | required C/H captain-check pairing context 없이는 generic PIC expectation 생성 안 함 |
| FOM-R, FOM-EX 및 dash coverage | unsupported-rule test | dash를 generic duration credit rule로 변환하지 않음 |
| NIGHT-* | classification-helper unit test | explicit zero/full candidate가 fixture와 일치; partial은 두 endpoint의 independently sufficient synthetic input을 preserve/project할 때만 resolved; 한 endpoint input만 있으면 unresolved; recorded Night 불변; user edit authoritative |
| TIME-* | duration presentation unit test | raw row basis를 보존하고 canonical seconds/total presentation이 fixture와 일치 |
| IMPORT-manual-company-retain | reconciliation transaction test | manual current 유지, company evidence 보존, later import silent overwrite 없음 |
| IMPORT-company-crewconnex-mismatch | field-role reconciliation test | company/current Block 유지, mismatch review, Crew snapshot 보강, manual values 유지 |
| IMPORT-ambiguous | matching test | auto attach/create/update 없음; review/staging |
| IMPORT-company-derived-ramp-in | calculation/provenance test | Ramp In = Ramp Out + Block; calculated provenance; company-imported Ramp In으로 표시하지 않음 |
| CREW-* | CrewConnex enrichment test | existing record만 optional 보강; 독립 record 생성 없음; date offset은 candidate 비교일 뿐 company date 수정 없음 |
| AIRPORT-* | future canonical airport-reference test | source code 유지, verified unique alias만 연결; lightweight autocomplete model과 schema 결합 요구 없음 |
| SIM-basic | simulator separation test | Simulator session이 actual-flight totals/FOM/crew에 혼입되지 않음 |
| PAGE-alpha-3 | projection test | explicit B/T(Block), PIC, FO의 Page/Previous/New Total이 fixture와 일치; universal Total Time rule을 만들지 않음 |
| SYNC-*, MIG-*, EXPORT-* | future adapter/integration contract | 각 fixture가 implementationStatus=future-contract인 동안 current PASS로 보고하지 않음 |

## 4. Future test layers

### Local domain unit

향후 OOOI relationship, parser normalization, matching, PIC/FO credit, Night classification candidate, duration formatting, page projection을 memory-only로 검증한다.

필수 negative assertions:

- Actual 하나로 Takeoff/Landing clock 두 개를 복원하지 않는다.
- Night 또는 Instrument Flight Time을 Block/Actual 계산식으로 만들지 않는다.
- partial Night 또는 한 endpoint의 Day/Night state에서 다른 endpoint state를 파생하지 않는다.
- Jeju Air Instrument Flight Time을 IFR/Actual Instrument로 mapping하지 않는다.
- Departure와 Arrival이 다르다는 이유로 Cross-Country를 만들지 않는다.
- Duty Code나 personal T/O/L/D만으로 PF/PM을 만들지 않는다.
- Auto Land operational detail을 built-in personal field로 자동 채우지 않는다.

### Local persistence transaction

local canonical persistence가 구현된 뒤에만 record/current value, evidence, revision, pending operation, tombstone/restore, migration atomicity와 restart durability를 검증한다. 현재 해당 engine과 test suite는 없다.

### Product Sync integration

product Sync가 구현된 뒤 owner isolation, idempotency, conflict/retry, tombstone propagation, reconnect convergence를 emulator 또는 equivalent test environment에서 검증한다. 현재 Functions는 account lookup뿐이며 이를 core server calculation/search/import precedent로 사용하지 않는다.

### Renderer/export integration

real record projection과 export renderer가 구현된 뒤 같은 projection input이 app ledger와 supported export formats에서 같은 semantic row와 totals를 내는지 검증한다. current View Logbook은 mock presentation shell이며 export implementation은 없다.

## 5. Current executable checks versus future commands

현재 확인 가능한 repository-level commands:

- make build-pwa — current Makefile target; web build + offline resource precache generation
- flutter analyze — current Flutter static analysis entry
- flutter test — 현재 존재하는 Flutter tests 실행

이 목록은 모든 command를 이 consistency pass에서 실행했다는 뜻이 아니다. 이 작업의 최소 validation은 Markdown/JSON/git diff 검사이며 결과는 완료 보고에 기록한다.

Future engine/persistence/Sync/import/export test command names은 구현과 build tooling이 생긴 뒤 정한다. 존재하지 않는 path나 Make target을 현재 command로 제시하지 않는다.

## 6. Real tablet/EFB PWA acceptance

future core acceptance는 실제 iPad/tablet Safari PWA에서 다음을 별도로 검증해야 한다.

- online install/first load 뒤 Firebase availability가 없어도 app shell 재진입
- local canonical ledger가 구현된 이후 offline create/edit/search/restart durability
- reconnect 후 owner Sync convergence와 user-confirmed value 보존
- native와 같은 input의 semantic/calculation/projection parity

현재 첫 Flutter frame이 Firebase session initialization을 기다리지는 않지만 signed-out code path는 Opening으로 들어간다. signed-out local Home/ledger entry와 local ledger 자체는 구현되지 않았으므로 acceptance PASS가 아니다.

세부 시나리오는 [offline-acceptance.md](offline-acceptance.md)가 소유한다. 과거 실행 ID와 결과는 [validation-results.md](../evidence/validation-results.md)에 역사적 evidence로만 둔다.

## 7. PASS 기록 규칙

- PASS에는 build identifier, command, device/browser, scenario, actual result, unverified boundary를 함께 기록한다.
- automated test PASS와 real-device acceptance PASS를 서로 대체하지 않는다.
- historical POC PASS를 current product PASS로 복사하지 않는다.
- fixture JSON parse 성공은 fixture syntax validation일 뿐 product behavior PASS가 아니다.

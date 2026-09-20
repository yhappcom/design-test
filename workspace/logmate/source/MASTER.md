# LogMate Master

Authority: **CURRENT PRODUCT STATE**
기준일: 2026-09-13 · 대상: `66ca2982443646aa062b5dc5486d5c7f487f7ada` 및 현재 `logmate` 작업 트리 · View Logbook Customize V1 SOT

현재 제품 상태의 유일한 기준은 이 문서다. 기존 문서의 전체 제품 권한 선언은 이 문서로 대체한다. 상세 계약의 미해결 충돌까지 승인한 것은 아니다. 원본은 현재 위치에 보존하며, 채택하지 않은 상세 내용도 20절에서 추적한다.

## 1. 현재 상태 한눈에

- 현재 초점: **View Logbook / Customize V1 제품 계약 확정**. 이번 pass는 문서/SOT 갱신이며 production UI 구현이나 schema freeze 단계가 아니다.
- 구현 존재: Opening/Auth UI, Firebase Auth adapter, Home, Recent/Activity/Totals/Customize 상세 진입, Settings, 날짜 locale 처리.
- Home 비행·시간·Activity·Totals는 **mock / presentation shell**이다. 화면 존재는 기록·계산·저장 기능 완료를 뜻하지 않는다.
- 현재 제품에는 canonical ledger, persistence repository, Calculation/Aggregation Engine, production importer, backup, server Sync 연결이 없다.
- 바로 다음 방향: 확정된 **View Logbook Customize V1 single-catalog / Field Group / Custom Field 계약**을 production UI에 연결한다. DATA-001/002와 generic Total Time 의미를 추정해 닫지 않는다.
- 구현 판정은 2026-09-13 코드 열람 기준이다. 이번 pass는 문서 계약 작업이며 앱 빌드·실기기·외부 Firebase 상태를 새로 검증하지 않았다.
- 과거 검증의 범위와 원문은 [Validation Results](docs/evidence/validation-results.md)에 있다. 과거 POC PASS를 현재 제품 PASS로 사용하지 않는다.

### 상태 읽는 법

| 축 | 상태 | 의미 |
| --- | --- | --- |
| Decision | CONFIRMED | 현재 제품 결정으로 확정 |
| Decision | OPEN | 아직 결정되지 않음 |
| Decision | DEFERRED | 현재 단계 이후 검토 |
| Decision | OUT OF SCOPE | 현재 제품 범위에서 제외 |
| Decision | SUPERSEDED | 새 결정에 의해 대체된 과거 결정 |
| Implementation / Evidence | IMPLEMENTED | 현재 제품 코드에 구현 존재. shell/기능 범위를 함께 표시 |
| Implementation / Evidence | NOT IMPLEMENTED | 현재 제품 코드에 해당 기능 없음 |
| Implementation / Evidence | POC VERIFIED | 과거 POC의 명시된 대상·범위에서 검증 기록 존재 |
| Implementation / Evidence | POC FAILED | 특정 POC 실행의 실패 기록 존재 |
| Implementation / Evidence | POC INCONCLUSIVE | 원인·결론을 확정할 수 없음 |

`USER DECISION REQUIRED`는 결정권자 확인이 필요한 OPEN 항목에 붙인다. 한 기능에 현재 구현 상태와 과거 evidence를 동시에 기록할 수 있다.

## 2. 제품 정의 및 주요 사용자

Decision: CONFIRMED

MintTap의 **LogMate - Pilot Logbook**은 조종사가 자신의 비행기록을 정리·계산·검색하고 종이 로그북에 옮겨 적도록 돕는 **개인 Pilot Logbook**이다. 제주항공 조종사부터 시작하되 영어를 사용하는 조종사도 고려한다. 종이 로그북과 공존하며 항공사의 공식 운항 시스템이나 법적 경력증명을 대체하지 않는다.

역사적 원문: [제품철학](archive/planning/product-philosophy.md), [제품 요약](archive/planning/project-summary.md).

## 3. 제품 철학

Decision: CONFIRMED

- **Simple is Best:** 기록·검토·검색·종이 전사에 직접 도움이 되는 기능을 우선한다.
- **Paper Logbook First:** LogMate is a reference/companion tool for recording, calculation, lookup, import, search, statistics, and paper-logbook transcription support; it does not replace the paper logbook with an app-managed finalized ledger. Flight changes recalculate from app data, while correction of already written paper remains the user's responsibility. Finalized/locked pages, paper-correction reconciliation, posted-paper snapshots, and calculated-versus-posted workflows are out of current scope.
- **Manual-first:** 직접 비행 입력만으로 제품 핵심을 완전히 사용할 수 있어야 한다.
- **Import-optional:** import는 수기 record 전·후, 1회·반복 또는 전혀 하지 않는 모든 경로를 지원한다. `initial import → monthly verification → CrewConnex refresh`를 필수 user lifecycle로 두지 않는다.
- **Local-first:** 핵심 data operation, 계산, 검색, 집계, import parsing·reconciliation은 기기에서 수행하는 방향이다. 기록은 네트워크보다 먼저 local에 저장하며 Auth/Sync 실패가 local 사용을 막지 않도록 설계한다.
- **Cloud-minimal:** Firebase는 Auth, owner Sync, 진짜 cloud-dependent인 persistence 인프라에 한정한다. 정상 화면·계산·검색·집계·import parsing/reconciliation을 Firebase-backed runtime query로 정의하지 않고 불필요한 read/write를 최소화한다. 현재 Function의 account lookup은 core app logic의 server-side 선례가 아니다.
- **Native + Tablet/EFB PWA:** iOS/Android native와 tablet/EFB PWA는 동등한 1차 타겟이다. 같은 domain input은 같은 semantic·calculation·projection 결과를 내야 하며 adapter와 responsive UI만 platform별로 다를 수 있다. background/종료 상태의 즉시 Sync는 별도 검증 없이 보장하지 않는다.
- **Canonical semantics / customizable presentation:** 공식 field taxonomy는 `Known Field`와 `Custom Field`다. Known Field의 semantic identity·full semantic name·compact ledger header는 LogMate가 소유하며 V1에서 사용자가 자유 rename하지 않는다. column order와 system Field Group projection은 canonical data와 분리한다.
- **사용자 확정값 우선:** user-confirmed current value는 외부 source가 조용히 덮지 않는다. 회사 operational source와 CrewConnex roster source는 field별 evidence 역할이 다르며 서로 대체하지 않는다.
- **provenance 보존:** current value와 source raw value, locator, parser/rule version, 수정 이력을 구별한다.
- **No Guessing:** 없는 사실을 만들어 확정하지 않는다. FOM Duty Code는 검증된 PIC/FO 경력시간 범위에서만 사용하고 PF/PM, Night, Instrument Flight Time, generic Total Time으로 확장하지 않는다. 미해결 PF/PM·solar helper·generic Total Time 경계는 17절에 남긴다.
- roster·crew management·복잡한 tag taxonomy를 개인 로그북에 끌어오지 않는다.

이는 제품 원칙이며 현재 local ledger 구현 완료 선언이 아니다. [원본 제품철학](archive/planning/product-philosophy.md)은 historical evidence로 보존한다.

## 4. V1 Scope

다음은 CONFIRMED인 제품 범위다. 구현 여부는 16절을 따른다.

| 영역 | 범위 |
| --- | --- |
| 기록 | 하나의 canonical 원장, 실제 FlightRecord와 별도 SimulatorRecord, 직접 입력·수정·삭제·복원 |
| 일상 사용 | offline 조회·사람/crew·공항/route·편명·기종·기간·Remark 검색, 시간·횟수 집계 |
| 종이 전사 | page/previous/new total, page policy, 과거 누계 baseline |
| 출력 | Compact airline, EASA/European, Jeppesen/European, Alpha-K, Jeppesen Professional (US), ASA-SP-57, Custom의 7개 tracked profile family에서 지원되는 field/layout evidence를 보존한다. matching semantic만 mapping하며 전용 renderer 대 optional preset의 최종 역할은 LOGBOOK-001 OPEN이다. |
| View Logbook configuration | **CONFIRMED / mock-session projection IMPLEMENTED:** 최초 View Logbook는 branded format 선택을 요구하지 않고 Date \| Type \| Reg \| Flight \| DEP \| ARR \| Block \| Night \| Inst \| Remark 순서의 LogMate Standard 10-leaf projection을 즉시 사용한다. DEP/ARR은 별도 Known Field지만 Customize에서는 하나의 system Route Field Group이다. V1의 visible/ON 위·hidden/OFF 아래 35-item catalog, visible reorder, stable hidden order, system Field Group, fixed Known Field naming, disabled `+ Custom Field` entry point는 presentation-only session shell에 구현됐다. Custom Field UI와 configuration persistence/Sync는 NOT IMPLEMENTED다. Clock은 `HH:mm`, duration/cumulative duration은 `H+MM`이며 cumulative UI는 최소 `99,999+59`을 표시할 수 있어야 한다. exact configuration schema·persistence·Sync conflict, exact pixel widths, total eligibility, 기존 7 profile의 renderer/preset 역할은 OPEN |
| 입력·이관 | 수기 입력이 기본이며 import는 선택. 회사 Excel, CrewConnex PDF/검증된 TSV 보강, 범용 CSV/XLS/XLSX advanced mapping, current-field data Excel 및 양식형 Excel/PDF/print |
| 보존 | 구조화 backup·사용자 데이터 복구 지원 방향, revision/provenance 보존 |
| 계정·연동 | email/password 및 verification, owner 기반 기기간 Sync, 복구·계정 삭제 흐름 |

7개 profile의 범위와 관찰된 field/layout requirement는 유지하되, **source가 공급하지 않는 semantic mapping은 OPEN 또는 blank/user-entered**다. [양식 계약](docs/specs/logbook-format-plan.md)은 output/projection만 소유하고 import·schema·FOM 계산을 중복 소유하지 않는다. General Aviation은 import/reference 형식이며 별도 output profile이 아니다. renderer 구현, UI 완성, 실제 Excel/PDF/print acceptance는 별개이며 현재 NOT IMPLEMENTED 또는 NOT VERIFIED다.

### View Logbook Flight presentation

Decision: CONFIRMED — LogMate Standard의 `Flight` column은 IATA-style commercial flight identifier를 표시한다: 2-character IATA carrier designator + 1–4 digit flight number + optional 1-character operational suffix, 최대 7 characters. 이는 공식 IATA AIDM Carrier / Flight Number Text / Operational Suffix 및 AIDX commercial-flight LegIdentifier의 constituent 구분에 근거한 presentation semantic이다. ICAO 3-letter operator designator를 이 column에 혼합하지 않는다. canonical persistence의 `carrierDesignator`/`flightNumber`/`operationalSuffix`/raw source/provenance 분해 방식은 DATA-001 OPEN이며, combined source string을 자동 분해하지 않는다. leading-zero normalization도 OPEN이다. Standard의 compact ledger는 선택된 semantic column width의 합으로 표시하며 viewport를 채우도록 column을 늘리지 않는다.

View Logbook compact ledger는 content 영역의 LEFT/START에 고정하고, 남는 viewport space는 오른쪽에 future selectable column 여유로 남긴다. Registration semantic field의 compact header는 `Reg`이며 field semantics는 바뀌지 않는다. View Logbook는 landscape-only screen으로 `landscapeLeft`와 `landscapeRight`를 지원하며, screen dispose 시 Android `fullSensor` 및 iOS four-orientation declarations로 구성된 기존 앱 orientation policy를 복원한다. Zoom은 OPEN / NOT IMPLEMENTED다.

View Logbook header, body, and all total rows share the theme's base ledger text size and a 36px row-height rhythm. Body remains regular monospace/code at `w400`. Header, Page Total, and Previous Total use the same UI/presentation weight at `w500`; New Total uses `w600`. All totals use the same neutral background, including no special mint/green fill for New Total. Separator lines and this weight hierarchy—not font-size changes or color fill—express the hierarchy.

The View Logbook column header is sticky during vertical ledger scrolling. Flight rows and non-sticky totals scroll below it. Header, body, and totals share one horizontal offset and the same semantic column boundaries; this applies to the current mock shell and remains the contract for future configurable columns.

The mock ledger's vertical reading position snaps to complete 36px Flight rows after scrolling settles. `Page Total`, `Previous Total`, and `New Total` are individual final reading stops rather than one combined totals stop; the last stop is the maximum vertical offset so the entire `New Total` row is visible. The snap is presentation-only and does not alter page, record, or calculation semantics.

View Logbook uses a minimal iOS-style left-side vertical scroll position indicator.

### View Logbook page, row, and total policy

Decision: **CONFIRMED / NOT IMPLEMENTED.** Pages are a continuous whole-logbook record stream, never reset by year; default entry opens the latest page in the current data projection. Year is context/navigation, not a page-number reset or statistics filter. The default capacity is 15 Flight rows per page, configurable from 3–100. A user may end a page early or designate a Flight as a new-page start; those actions serve paper-logbook alignment, not automatic monthly/quarterly/half-year/year breaks. A page ending early renders its unused capacity as presentation-only blank rows, which are not records and never affect search, count, statistics, or totals.

`Page Total` is the sum of actual FlightRecords on the page; `Previous Total` is the cumulative total before it; `New Total` is their sum and becomes the next page's Previous Total. The chain does not reset by year. A manual initial Previous Total may provide a starting cumulative value before the data known to LogMate; it does not recreate older flights. `PreviousTotalBaseline` and `OpeningBalance` remain distinct and must not be double counted. Record insert/edit/delete re-projects affected later pages and cumulative totals; a manual page-start anchor is preserved. Exact anchoring schema, invalidation algorithm, detailed baseline setup, Volume model/UI, and Page UI controls remain OPEN/DEFERRED. Page boundaries support paper transcription/alignment only; period statistics remain date-based FlightRecord calculations.

For import from company sources and other supported sources, configurable rows per page, manual early page break, and manual page-start anchors are core paper-alignment capabilities, not merely visual customization. A future configuration/rows-per-page change may be anchored after a particular Flight, but it must not reset cumulative totals; Volume management UI and canonical model remain DEFERRED.

### View Logbook completion roadmap and Customize

Decision: **CONFIRMED — current roadmap order:** (1) Customize / Column options, (2) Page / Row structure, (3) Additional columns + Totals projection, (4) View Logbook states, (5) Phone / Tablet adaptive UI, (6) View Logbook UI freeze. Pinch Zoom is final polish after these steps. Only step 1 is confirmed here; steps 2–6 remain follow-up work.

The default experience requires **zero configuration**. LogMate Standard has nine default-ON Customize items—Date, Aircraft Type, Registration, Flight Number, Route, Block, Night, Instrument Flight Time, Remark—and exactly ten visible leaf columns in this order: `Date | Type | Reg | Flight | DEP | ARR | Block | Night | Inst | Remark`. Remark is the only newly default-ON item beyond the previous Standard membership. Departure and Arrival remain separate Known Field semantics; Route is a system-defined presentation group, not a stored/canonical value, and moves as one reorder unit.

**Customize V1 interaction — CONFIRMED / IMPLEMENTED in the temporary mock/session shell:** View Logbook → `Customize` uses one catalog on the existing immediate-setting surface. Visible/ON items are above hidden/OFF items; only visible items reorder. OFF→ON moves an item into the visible area, while ON→OFF returns it to its stable catalog-order position in the hidden area. Changes apply immediately; Back does not roll them back, and there is no Done, Apply, Save, or Cancel. The disabled `+ Custom Field` entry point remains between the active and inactive catalog areas; Custom Field creation/rename/value UI is NOT IMPLEMENTED. Reset restores the LogMate Standard default projection and does not delete record values. No separate Add Column/Common/More Fields navigation is required.

The current code remains **presentation-only / in-memory**, but now implements the V1 projection shell: the nine default-ON top-level items produce the ten-leaf Standard ledger including Remark; all 35 Known Field/system-group catalog items are selectable; visible items reorder; hidden items retain stable catalog order; and Route, Takeoff/Landing, Approach, and Simulator/FSTD expand through renderer-controlled group options. At least one top-level item remains visible. Mock values are explicit presentation fixtures, and only Block/Night/Instrument Flight Time retain the current Page/Previous/New Total fixtures. Custom Field creation/rename/values, configuration persistence, FlightRecord projection, calculations, local ledger, Firebase Sync, and Backup/Export remain NOT IMPLEMENTED.

Known Field rename and arbitrary display-label editing are not supported in V1. LogMate owns each Known Field's semantic identity, full semantic name, and compact ledger header. Customize shows the full name only when it equals the compact header; otherwise it shows `Compact (Full Name)`, such as `Type (Aircraft Type)`, `Inst (Instrument Flight Time)`, and `SIC/FO (SIC / FO Time)`. Future presets/renderers may use different output labels, but that is not user free-rename functionality. Custom Field names remain user-defined and renameable.

The V1 selectable catalog is CONFIRMED. Independent items are Date, Aircraft Type, Registration, SE / ME, Category / Class, Flight Number, Ramp Out, Takeoff Time, Landing Time, Ramp In, Block, Actual, Night, Instrument Flight Time, IFR Time, Actual Instrument, Simulated Instrument, Instrument Ground Time, PIC Time, SIC / FO Time, PICUS, SPIC, Multi-Pilot, Cross-Country, Solo, Dual, Instructor, Examiner / Check Pilot, Duty Code, PF / PM, and Remark. System Field Groups are Route; Takeoff / Landing with the conditional `Split by Day / Night` child; Approach with the conditional `Show Runway` child; and Simulator / FSTD, whose parent ON state always projects Simulator/FSTD Time while optional Type, Device / Qualification, and Instruction Type children are independently selectable and default OFF. Time is not a separate child option. Each system group moves as one unit; V1 has no group split/reassembly UI. Exact labels, stable OFF order, child projection, and behavior are in [logbook-configuration-spec](docs/specs/logbook-configuration-spec.md).

Takeoff/Landing totals never imply a Day/Night split, and one endpoint never determines the other. Approach and optional Runway are uninterpreted free Text; company/user codes are not enum-interpreted. Approach Count and a separate selectable Landing Detail are not in the V1 catalog. Simulator/FSTD grouping is presentation-only and does not change the canonical data relationship defined by [data-schema-spec](docs/specs/data-schema-spec.md).

V1 does not select Distance, Holds, generic Total Time, generic credited Block/Airborne, generic Crew, or built-in Auto Land count/RWY/RVR-VIS/S-U. It also excludes free Known Field rename, free column resize, a free Header Group editor, group split/reassembly, arbitrary cell merge, and formula/custom calculated fields. Auto Land may be tracked only through a user Custom Field.

Known Field and system Field Group widths are LogMate-controlled renderer metadata; V1 has no user resize UI and this pass does not freeze new pixel widths. Existing Standard dimensions remain implementation evidence. A Custom Field keeps the same body font size and receives automatic width based on the larger of its name width and its Text/Duration/Count data-type minimum; text is not shrunk to fit. One-line overflow remains presentation-only ellipsis with full-value inspection, never stored-value truncation.

Users may create Custom Fields. Custom Field v1 types are Text, Duration, and Count; Clock is excluded. Definitions and record values are distinct from presentation configuration. They are intended for manual entry, owner data, owner Sync, Excel export, and re-import; canonical schema/path/migration and stable ID format remain DATA-001/configuration OPEN. V1 is manual-input-centred; formula builders and custom calculated fields are excluded.

Excel round-trip is a confirmed direction: export preserves built-in Known Fields and Custom Fields for user editing and re-import, with blank values allowed and no guessed values. Workbook direction is `Logbook`, `Field Definitions`, and `Instructions`. An exported matching Record ID is strong update identity; without it, duplicate candidates require Import Preview review rather than automatic overwrite. Custom Fields require stable identity, with unique-name fallback only when the field ID is absent and unambiguous. Detailed import/export behavior remains in [import-contract](docs/specs/import-contract.md).

## 5. Out of Scope / Deferred

### OUT OF SCOPE — V1

- roster/예정 비행 planning, crew portal 자동 로그인, 회사 실시간 API, OCR 자동 입력.
- 공식 경력증명·법정 비행시간 제한/FTL/rest 판단, 외부 브랜드 양식 복제.
- 회사 import 원본, maint/e-paper 원본의 앱 내 영구 보관·backup·Sync.
- crew employee ID·인사상 직급 저장/검색/Sync, 다중 원장 membership, 계정 변경 시 자동 원장 재귀속.
- 개별 record 영구 삭제 UI.
- social 로그인·community·chat·wearable·복잡한 tag taxonomy.
- V1 앱 차원의 E2E encryption과 Cloud Storage server `.lbk` snapshot.
- 공통 LAN 없는 PWA 자동 P2P, PWA background/종료 중 즉시 전송 보장.

### DEFERRED — 현재 UI 단계 이후의 작업

release 운영 점검·Store 제출·실제 비용 관측·플랫폼 최종 acceptance는 해당 구현 후 진행한다. 이는 V1 기능을 다음 버전으로 미루는 결정이 아니다. 사용자의 개인 비행경력 증명서와 향후 사진/PDF document attachment의 저장·공유는 회사 import 원본 보관과 다른 범주이며 DEFERRED다. 필요 data model, privacy, retention, Sync/backup 범위와 플랫폼 feasibility를 별도로 결정·검증한다.

P2P 보조 기능의 향후 채택, 광고 적용 시점·운영 정책은 **OPEN**이다. 임의로 DEFERRED 또는 CONFIRMED로 바꾸지 않는다. 공식 API/예정 비행 재검토도 V1 범위 승인으로 해석하지 않는다.

## 6. 현재 개발 단계

Current development focus: View Logbook / Customize V1 implementation pass A is complete in the temporary mock/session shell; review it before page/row and real-data work.

[과거 plan](archive/planning/plan.md)의 UI-first 방향을 이어가지만 P0 전체 완료는 아니다. Opening/Auth UI와 Firebase Auth adapter는 계획 순서보다 먼저 존재한다. 과거 master의 “M1~M6 통과 후 polished UI” 실행 순서는 SUPERSEDED다. 그 문서의 데이터·보안 acceptance까지 폐기한 것은 아니다.

과거 POC의 domain/persistence/Sync 구현을 현재 제품과 혼동하지 않는다. 현재 제품의 [lib](lib/)에는 canonical FlightRecord repository, local persistence engine, Calculation/Aggregation Engine, product Sync가 없다. 현재 [Makefile](Makefile)에 존재하는 target은 `build-pwa`뿐이며 과거 POC command를 현재 command로 사용하지 않는다.

## 7. UI / Navigation

근거: [UI contract](docs/specs/ui-contract.md)의 2026-09-05~07 결정 및 [Home 코드](lib/screens/home_screen.dart).

| 항목 | Decision | 현재 구현 범위 |
| --- | --- | --- |
| Home 주요 행동 | CONFIRMED | IMPLEMENTED — 상단 Add flight / View logbook 버튼. Add flight는 entry UI shell, raw editing 후 completion normalization(Clock `HH:mm` / variable-hour Duration `H+MM`), optional operational-time label, offline IATA/ICAO interactive airport search (`ICAO / IATA` display)를 제공하며 저장·원장 연결은 없음. View logbook은 mock presentation-only LogMate Standard landscape ledger shell로 진입하며 실제 record·calculation·configuration 연결은 없음 |
| Home Current Period | **CONFIRMED — metric semantic = Block Time** | 현재 Home candidate의 `This month` / `This year` duration 값은 Block Time 집계다. 정확한 raw/credited·opening balance 반영·기간 경계는 TOTAL-002/003 OPEN이며 mock 수치는 계산 결과가 아님 |
| Recent | CONFIRMED | IMPLEMENTED — mock 행, Chevron 및 별도 detail shell 진입 |
| Activity | CONFIRMED | IMPLEMENTED — Legs / Block / TO/LD, 선택 항목 강조, mock 수치 |
| quick periods | CONFIRMED — D009: Last 7 days / Last 28 days / Last 90 days / Custom | DESIGN PROTOTYPE UPDATED; legacy Home implementation still contains 30-day state and must be migrated when this Home lineage is promoted |
| Custom Period | CONFIRMED — 화면 구성 | IMPLEMENTED — CUSTOM PERIOD, Month / Year / Date range, 기본 Date range |
| Custom 데이터·완료 | OPEN — NAV-002 | NOT IMPLEMENTED — 원장 월 공급 및 Home 결과 반환 |
| Totals Home 3-slot | CONFIRMED | IMPLEMENTED — TotalsSummary를 받는 presentation shell |
| Totals / Customize | CONFIRMED — 독립 진입 | IMPLEMENTED — detail/현재 slot 표시만. category·선택·저장은 OPEN |
| Settings | CONFIRMED | IMPLEMENTED — Import 메뉴와 Sign out. Import 기능 없음 |
| 전체 IA | OPEN — NAV-001 | 현재 push route만으로 sidebar/bottom tabs 폐기를 확정하지 않음 |

Month/Year는 기록이 존재하는 월/연도를 중복 없이 최신순으로 보여 주는 계약이다. 현재 Home이 `availableMonths`를 전달하지 않아 목록이 비며, Custom의 내부 선택은 `ActivityRangeSelection`으로 반환되지 않는다. `Apply`가 없다는 결정은 유지하되 완료 방식은 OPEN이다.

명시적 뒤로가기·iOS edge swipe·Android system back을 제공하는 원칙은 CONFIRMED다. Home detail은 플랫폼 route로 진입하지만 Auth의 NoTransition route와 전역 transition 설정은 추가 대조가 필요하다(NAV-003). 실제 gesture 통과를 주장하지 않는다.

월간 카드와 responsive 배치는 현재 구현 증거다. 모든 visual 수치가 최종 승인되었다는 뜻은 아니다. 과거 Latest flights / Last N days / Logbook snapshot, 이전 preset·Monthly/Period UI는 최신 결정으로 SUPERSEDED다.

## 8. Language / Locale

Decision: CONFIRMED

- **CONFIRMED — English-only product UI:** 제품 UI text·요일·항공 용어·버튼·메뉴·helper/error copy는 영어만 사용한다. 한국어 UI 및 기타 번역 UI는 제공하지 않으며, 기기 언어에 따라 제품 UI 문자열을 번역하지 않는다. 날짜의 numeric locale ordering은 언어 번역과 별개의 presentation policy다.
- 날짜 값은 번역 대상이 아닌 locale-aware numeric value다. 지역 설정은 숫자 날짜의 순서·표기에만 반영한다. 화면 맥락에 따라 `monthYear` (`2026.09` / `09/2026`), `month` (`09`), `shortDate` (`09.02`), `date` (`2026.09.02`) formatter를 구분한다. Date picker의 year/month/day도 locale 순서의 numeric value로 표시하며, 한국 locale의 month는 `September`나 `9월`이 아닌 `09`다.
- 날짜 raw value·UTC timestamp·source 운항일·duration과 presentation formatter를 분리한다. 사용자 crew name·Remark·source Unicode 원문은 번역하지 않는다.
- 영어 인증 이메일이 최신 제품 의도다. Firebase Support는 2026-09-07에 Action URL과 세 English template 적용을 확인했고, 2026-09-08 read-only Firebase 구성 조회도 이를 확인했다. custom sender domain과 delivered-email smoke test는 별도 미완료 항목이며 [운영 문서](docs/operations/domains-and-auth-email.md)가 현재 상태를 소유한다.

Implementation: IMPLEMENTED — [DateFormats / DateLocaleScope](lib/localization/date_formats.dart), [영어 MaterialApp](lib/main.dart), [영어 action handler](web/auth/action/index.html), [FirebaseAuthEngine의 `setLanguageCode('en')`](lib/auth/auth_engine.dart). 이 설정은 동일 adapter 경로를 사용하는 Authentication action email에만 적용한다. 날짜 [테스트 소스](test/date_formats_test.dart)는 존재하며 이번 Migration에서 실행하지 않았다. 원문 데이터 보존의 domain 구현은 NOT IMPLEMENTED다.

formatter API·keyboard·typography 상세는 foundation-contract에 남긴다. 운영 메일의 실제 언어·sender·URL은 별도 확인 대상이다.

## 9. Architecture / Platforms

| 영역 | Decision | Implementation / Evidence |
| --- | --- | --- |
| UI → presentation → domain/calculation → local repository → Sync adapter | CONFIRMED — 책임 분리 방향 | presentation 일부 IMPLEMENTED, domain/repository/Sync NOT IMPLEMENTED |
| local 변경 + revision + immutable outbox 단일 transaction | CONFIRMED | 현재 NOT IMPLEMENTED / 과거 POC VERIFIED — 한정 transaction·restart |
| Firebase Auth + Firebase server-based owner Sync | CONFIRMED — local-first를 보완하는 identity·기기간 수렴 경로 | Auth 일부 IMPLEMENTED; owner ledger binding·server Sync·full recovery NOT IMPLEMENTED; 과거 POC 검증은 한정 범위 |
| tablet/EFB Safari PWA 및 iOS/Android native | CONFIRMED — 동등한 1차 타겟, 같은 semantic/calculation/projection 결과 | 현재 Flutter shell. 과거 기기별 evidence를 현재 release PASS로 승격하지 않음 |
| iPad 작성·표 검토, iPhone 빠른 확인·입력 | CONFIRMED — UI 우선순위 | 기능·권한 차등을 뜻하지 않음 |
| local storage adapter | OPEN — DATA-003 | Sembast는 과거 POC VERIFIED 후보. 현재 dependency/repository 없음 |
| desktop 공개 지원 범위 | OPEN — PLATFORM-001 | scaffold 폴더 존재만으로 출시 지원을 확정하지 않음 |

PWA는 CDN-free renderer·local fonts·전체 generated resource precache 및 fresh-origin offline readable UI acceptance를 요구한다. [UI contract](docs/specs/ui-contract.md), [offline acceptance](docs/specs/offline-acceptance.md) 참조. 현재 `runApp()`은 Firebase 초기화를 선행 await하지 않지만 이 사실만으로 EFB offline PASS는 아니다.

핵심 운영은 local/on-device이며 Firebase는 Auth·owner Sync·cloud-dependent persistence infrastructure에 한정한다. 현재 signed-out `SessionGate`는 Home이 아닌 Opening을 보여 주므로 signed-out local ledger 진입은 NOT IMPLEMENTED / AUTH-001 OPEN이다.

## 10. Data Model Status

Decision: canonical 원장·Flight/Simulator 분리·provenance 방향과 supported profile field/layout evidence는 CONFIRMED. **matching source semantic이 없는 profile mapping은 blank/user-entered 또는 OPEN이며, 전체 canonical internal schema freeze는 OPEN(DATA-001)**. Implementation: NOT IMPLEMENTED.

- FlightRecord는 실제 leg, SimulatorRecord는 별도 session이다. Simulator를 실제 비행 block/FOM 합계에 혼입하지 않는 방향을 유지한다.
- SourceEvidence, FieldResolution, RevisionHistory로 원본과 개인 확정을 분리한다.
- `OpeningBalance`는 과거 경력 category별 기준값이고 `PreviousTotalBaseline`은 종이 페이지 누계다. 서로 다른 개념이며 record 합계와 중복시키지 않는다.
- `Initial Total`을 임의의 새 entity 또는 두 baseline의 동의어로 만들지 않는다. Home에 무엇을 어떻게 반영할지는 TOTAL-002가 OPEN이다.
- UTC timestamp와 `durationSeconds`가 canonical 표현이다. 표시 문자열이 저장 모델이 아니다.
- Add Flight 입력 UI는 Ramp out/Ramp in/Takeoff/Landing을 Clock `HH:mm`, Block/Actual/Night/Instrument Flight Time을 variable-hour Duration `H+MM`으로 구분한다. compact UI label은 `Instrument time`을 유지한다. time field placeholder는 없으며, typing 중 digits/`:`/`+` raw text를 유지하고 focus completion에서 field semantic에 맞춰 normalize한다. Duration numeric completion은 1~2 digit minute shorthand(`5` → `0+05`, `11` → `0+11`)와 3+ digit hour/minute split을 사용한다. Ramp out, Ramp in, Takeoff, Landing, Actual time은 `(Optional)` operational field로 Expanded Time에서 visible이고 Compact Time에서는 hidden이며 controller/current value는 유지된다. 입력값은 현 단계에서 자동 계산·추정하지 않는다. TIME IN SERVICE의 GMT 사용 방향은 유지하지만 device local time·airport timezone 변환은 구현하지 않았다.
- Add Flight의 offline airport input은 IATA와 ICAO code를 case-insensitive interactive search로 찾고, 선택 뒤 ICAO / IATA combined display(한 code만 있으면 그 code)를 사용한다. 전체 prefix candidate가 유일할 때만 자동 resolve하며, exact code가 있어도 다른 prefix candidate가 있으면 사용자 선택을 요구한다. 이는 lookup UI 요구사항이며 `AirportRef`의 canonical field/type/codec freeze는 DATA-001 OPEN이다.
- 현재 airport runtime asset/model은 offline IATA, explicit ICAO, airport name 자료의 autocomplete/input-assistance subset이며 좌표 부재는 결함이 아니다. richer reference의 좌표를 향후 그 asset에 확장할지 별도 local geographic reference로 둘지는 AIRPORT-GEO-001 OPEN이다. 좌표·solar helper는 Day/Night T/O/L/D classification에만 사용할 수 있고 recorded Night duration을 계산·교체하지 않는다.
- profile별로 관찰된 field/layout requirement는 보존된다. dual/instructor/hood/solo 등 matching source가 없는 semantic은 blank/user-entered 또는 exact mapping OPEN이며, final renderer/preset 역할도 LOGBOOK-001 OPEN이다. 상세 경계는 [format](docs/specs/logbook-format-plan.md), [schema](docs/specs/data-schema-spec.md), [fixture](docs/specs/fixture-spec.md)에 보존된다.
- OPEN인 것은 확정된 요구사항을 canonical internal schema의 어떤 entity·field name·type·codec·version·migration 구조로 고정할지다. 새 편명 분리 field와 version/migration 적용도 이 internal representation 정리의 일부다.

### Recorded duration and personal-logbook boundary

- OOOI는 foundational event-time layer다: OUT/Ramp Out, OFF/Takeoff, ON/Landing, IN/Ramp In. `Block = IN - OUT`, `Actual = ON - OFF`는 deterministic relationship이다.
- Night와 Instrument Flight Time은 source/user가 기록한 독립 duration이다. Instrument Flight Time을 Actual에서 도출하지 않고, Jeju Air `instTme`를 IFR Time이나 Actual Instrument로 바꾸지 않는다. Instrument Flight Time, IFR Time, Actual Instrument, Simulated Instrument, Instrument Ground Time은 서로 다른 Known Field semantic이다.
- Recorded Night remains an independent source/current value. A user-confirmed current value is not replaced by astronomy or a later external source without review. personal T/O/L/D가 있을 때 explicit Night `0`은 Day candidate, `Night = Block`은 Night candidate를 지원할 수 있다. `0 < Night < Block`은 partial-night leg임만 나타내며 departure/arrival state가 서로 반대임을 증명하지 않는다. 한 endpoint state로 다른 endpoint를 파생하지 않는다. future solar classification은 최종 승인된 astronomical/regulatory Night boundary 아래 충분한 event-time/location input으로 각 relevant endpoint를 독립 평가해야 한다. exact clock inputs, solar algorithm/boundary, coordinate architecture는 OPEN이며 입력이 충분하지 않으면 unresolved/user-editable이다.
- Flight & Maintenance Log는 mixed document다. pilot-entered crew/flight/time section에서도 개인 Pilot Logbook에 의미 있는 값만 Known Field 후보로 사용한다. malfunction, corrective action, MEL/defer, fuel/oil technical management, maintenance release, aircraft technical status는 정비/기술 domain이며 personal logbook 범위 밖이다. Auto Land count/RWY/RVR·VIS/S·U도 built-in Known Field가 아니며 자동 populate하지 않는다.

[data-schema-spec](docs/specs/data-schema-spec.md)은 profile data requirement와 internal schema freeze를 분리한다. field 전문은 그곳에 보존하되 DATA-001이 닫히기 전 “완전 확정”으로 인용하지 않는다.

## 11. Calculation / Aggregation

Implementation: **NOT IMPLEMENTED — 현재 제품 Calculation/Aggregation Engine 없음**.

### Record Calculation — CONFIRMED

FlightRecord 한 건 안의 Block/Actual은 multi-record total이 아니라 3-variable relationship이다. 상세 계약은 [Record Calculation Engine spec](docs/specs/calculation-engine-spec.md)에 있다.

- Block: `Ramp out + Ramp in ↔ Block time`; Actual: `Takeoff + Landing ↔ Actual time`. 각 관계는 두 값이 있으면 누락된 셋째 값을 도출하고, 세 값이 있으면 자동 overwrite 대신 consistency를 검사한다.
- clock difference에서 end가 start보다 이르면 다음 날(`+24h`)로 보며 rollover는 최대 한 번이다. 역계산도 같은 원칙을 쓴다.
- 사용자가 직접 입력한 manual 값은 계산값보다 항상 우선하고 자동으로 덮어쓰지 않는다. imported/manual/calculated value의 provenance는 구분 가능해야 한다.
- 비교 가능한 세 값이 모두 있고 manual/imported target과 계산값이 다르면 저장 전 경고한다. 경고는 hard validation error가 아니므로 사용자는 manual 값을 유지해 저장할 수 있다.
- 회사 import에 Ramp out과 Block time만 있어 Ramp in이 없으면 공통 relationship이 Ramp in을 calculated derived value로 도출한다. import parser에 별도 전용 계산식을 두는 방향이 아니다.
- Actual duration 하나만으로 Takeoff·Landing 두 endpoint clock을 복원하지 않는다. `Actual = Landing - Takeoff`는 비교 가능한 clock input이 있을 때의 도출·검증 relationship이다.
- Night와 Instrument Flight Time은 pilot/company-recorded duration이며 이 engine에서 Actual로부터 계산하지 않는다. Night의 solar 비교는 duration mismatch가 아니라 Day/Night T/O/L/D helper의 미해결 범위이다.
- FOM SP.5.1의 Duty Code는 검증된 context에서 credited PIC/FO를 다루며 Block/Actual relationship, PF/PM, automatic credited Night/Instrument Flight Time을 정의하지 않는다. raw/source Block·Actual·Night·Instrument Flight Time은 그대로 보존한다. generic Total Time/generic credited Block/Airborne 영역과 분수 결과의 sub-minute rounding은 OPEN이다.

Record Calculation은 source values에서 derived/validation/presentation state를 제공하고 UI가 식을 직접 소유하지 않는 방향이다. Block/Actual record calculation과 여러 record의 Block/PIC/SIC/month/year total은 별도 Aggregation 책임이다.

### NOT IMPLEMENTED

Calculation Engine, auto-fill UI, mismatch visual state, 저장 전 warning UI, persistence 및 import parser 연동은 모두 NOT IMPLEMENTED다. 현재 Add Flight의 time input은 자동 계산·추정을 하지 않는다.

### OPEN

provenance의 정확한 enum/field명, calculated value의 canonical storage 여부와 persistence strategy, manual 삭제 뒤 calculated mode 복귀, warning UI/저장 재확인의 정확한 component·문구, tolerance·seconds comparison·invalid range 정책, canonical clock/day-offset representation은 OPEN이다. 이 relationship 계약은 DATA-001 schema freeze를 닫지 않으며, 기존 UTC timestamp/durationSeconds 방향을 어떤 field/type/codec로 구현할지도 여기서 확정하지 않는다.

CONFIRMED인 방향은 raw/current/credited의 구별, versioned rule·provenance, 개인 override 보존, canonical 수치 기반 합산, page/previous/new total 및 baseline 중복 방지다. [format](docs/specs/logbook-format-plan.md)·[schema](docs/specs/data-schema-spec.md)·[fixture](docs/specs/fixture-spec.md)는 관련 field/projection 계약을 보존한다. 이는 전체 계산 설계를 freeze한 뜻이 아니다.

OPEN: Home metric의 raw/credited 선택, category·기종·role 분류, opening balance 반영, 운항일/UTC 기간 경계, 상세 duration 표시, PF/PM 파생·출력 관계(TOTAL-001~004, DATA-002). `Total / B737 / SIC`와 숫자는 mock이며 규칙의 근거가 아니다.

엔진은 숫자·근거·상태를 계산하고 UI-facing adapter가 표시 데이터를 공급하는 방향이다. 현재 문자열 기반 TotalsSummary를 domain schema로 승격하지 않는다.

## 12. Import / Export

Decision: source 역할과 No Guessing CONFIRMED. Implementation: NOT IMPLEMENTED — production parser/import/export 없음.

- import는 선택이며 언제든 하거나 반복하거나 전혀 하지 않아도 된다. 수기 FlightRecord는 SourceEvidence 없이도 존재할 수 있다.
- 회사 Flight History Excel은 optional external operational source다. 검증된 sample의 `fltTime`은 Maint R/O, `bt`는 source Block, `at`는 Actual, `ntTme`는 recorded Night, `instTme`는 Instrument Flight Time에 매핑되며 Ramp In column은 없다. Ramp In은 `Ramp Out + Block`으로 calculated할 수 있지만 imported value로 표시하지 않는다.
- CrewConnex printer PDF 및 검증된 선택 TSV는 **기존 actual record의 crew snapshot·BLH evidence 보강**에만 사용한다. 미래·미매칭·non-flight activity로 record를 만들지 않는다.
- 날짜 ±1일은 매칭 후보 비교이며 자동 운항일 보정이 아니다. unsupported layout은 추정 파싱하지 않는다.
- `7C` 편명의 raw/source/display 분리와 선행 0 표시 제거는 [import-contract](docs/specs/import-contract.md)의 범위다. 다른 항공사로 확대하지 않는다.
- source 원본은 처리 뒤 앱에 보관하지 않는다. locator·fingerprint·normalized evidence는 구분해 보존하는 방향이다.
- 파일 선택·parser·normalized source record·local matching·duplicate/conflict detection·preview/review·local update는 on-device target이다. parsing/reconciliation만을 위해 source file을 Firebase에 upload하지 않는다.
- blind arbitrary Excel 자동 이해는 범위 밖이다. 사용자가 CSV/XLS/XLSX source column을 Known/Custom Field에 확정 mapping하고 재사용하는 advanced direction은 허용하되 source signature/profile persistence schema는 OPEN이다.
- data Excel은 활성 current fields 이관용, 양식형 Excel/PDF/print는 profile projection, `.lbk`는 구조화 원장 backup이다.

상세 일반 계약은 [import contract](docs/specs/import-contract.md), CrewConnex profile은 [parser](docs/specs/crewconnex-parser-plan.md), output은 [format](docs/specs/logbook-format-plan.md)이 각각 소유한다. exact solar/regulatory boundary·BLH 선택·fixture/carrier·mapping persistence는 IMPORT-001~004가 OPEN이다. sample 비교는 production parser PASS가 아니다.

## 13. Backup / Restore / Deletion

Decision: 구조화 backup·사용자 데이터 복구를 지원하고, 데이터 변경 뒤 backup을 최신 상태로 유지할 수 있는 자동 또는 지속적 backup 구조를 제공하는 방향 CONFIRMED. Current implementation: NOT IMPLEMENTED.

- `.lbk`는 사용자 주도 구조화 backup의 한 경로다. 과거 POC의 특정 build에서 검증된 restore는 empty ledger 범위다.
- non-empty ledger의 merge / replace / reset 지원 여부는 **OPEN — BACKUP-001**이다. 과거 POC의 empty-ledger restore 결과만으로 영구 OUT OF SCOPE 또는 확정 제약으로 확대하지 않는다.
- 자동/지속적 backup의 platform별 저장 위치·권한·주기·복구 UX·iPhone Files 등의 실제 가능성은 OPEN — BACKUP-002이며 구현·검증되지 않았다.
- 삭제는 일반 목록·검색·집계에서 즉시 제외하고, 30일 payload와 같은 ID 복원, 이후 최소 tombstone 보존을 구별한다.
- account deletion은 재인증·최종 확인 뒤 Auth/server data 및 실행 기기 local wipe를 목표로 한다. 다른 기기 local copy나 사용자 export의 원격 삭제를 약속하지 않는다.
- Safari origin 전체 삭제 뒤 offline 복구를 약속하지 않는다. 기대 local data가 없을 때 빈 원장으로 위장하지 않고 복구 필요 상태를 설계한다.

과거 `.lbk`·restart PASS는 [evidence](docs/evidence/validation-results.md)의 해당 build 범위다. retention/compaction·계정 삭제 운영 검증은 완료되지 않았다. 상세 계약은 [schema](docs/specs/data-schema-spec.md), historical policy 원문은 [master-plan](archive/planning/master-plan.md)에 보존한다.

## 14. Authentication / Sync

### Authentication

Product decision: **CONFIRMED — Firebase Auth + Firebase server-based owner Sync**. email/password·verification과 verified owner의 server data 접근을 사용한다. Implementation: [FirebaseAuthEngine](lib/auth/auth_engine.dart), [Auth UI](lib/auth/email_auth_screen.dart), [lookupEmailAccount](functions/index.js) 존재. 현재 제품 owner ledger binding과 Rules/Sync 연결은 NOT IMPLEMENTED다.

[SessionGate](lib/main.dart)는 `currentUser` 존재로 Home 진입을 판단하며 local binding을 확인하지 않는다. 로그인 전 local 진입 UX는 AUTH-001이 OPEN이다. 현재 Home 진입을 verified owner data 접근 검증으로 해석하지 않는다. lookup의 보안·출시 점검은 [Functions README](functions/README.md)에 남아 있다.

### Firebase server Sync

- Decision: **CONFIRMED — 기본 연동 방향**.
- Current LogMate implementation: **NOT IMPLEMENTED**. 현재 Function은 account lookup이며 `syncBatch` 구현이 아니다.
- Evidence: **POC VERIFIED — 과거 SYNC-3 양방향 create 수렴 한정**.
- 사용자 요구: Firebase server가 기본 기기간 Sync 경로다. 최초 계정/기기 설정 이후 반복 QR pairing이나 Wi-Fi 수동 선택을 일상적인 Sync 조건으로 요구하지 않는다. online/foreground에서 가능한 범위의 자동 Sync를 시도하고, 사용자는 필요할 때 명시적으로 Sync를 재시도할 수 있다.
- 수렴 요구: 양쪽 기기에 신규 데이터가 있으면 수렴해야 한다. 충돌 또는 불일치를 자동으로 안전하게 결정할 수 없으면 사용자 확인이 필요한 구조로 남긴다. background/앱 종료 상태 Sync, offline 상태 즉시 전송은 구현 완료 또는 보장된 기능이 아니다.
- 방향: local transaction 후 online/foreground best-effort push/pull, 명시적 Sync 재시도, receipt와 cursor 이후 pull 완료 뒤 성공 표시.
- 서버는 Firestore current-state baseline + changes/receipts/cursor replica다. client 직접 record write나 단일 전체 원장 document를 기준으로 삼지 않는다.
- 기존 결정의 server 승인 operation 순서를 보존한다. stale baseRevision만으로 정상 pending 수정을 자동 거부하는 정책으로 바꾸지 않는다. 나중 승인된 update가 delete를 복원할 수 있는 의미와 history 보존은 [historical policy 원문](archive/planning/master-plan.md)에 있다. 현재 구현·fault acceptance 완료는 아니다.

### 운영 상태와의 경계

도메인·sender verification·Hosting ownership·action URL/template 적용 상태는 [운영 문서](docs/operations/domains-and-auth-email.md)의 영역이다. 2026-09-08 read-only 외부 조회에서 Hosting, Action URL, 세 English template, default locale과 authorized domains는 확인했다. custom sender domain은 `NOT_STARTED`이고 delivered-email smoke test는 아직 수행하지 않았다. 운영 기록은 `Target`, `Observed state`, `Last verified`, `Verification method / evidence`, `Pending action`, `Owner`로 구분한다.

## 15. POC / Validation Conclusions

**POC 원문 → evidence 해석 → 제품 결정**의 순서를 지킨다. 원문은 당시 실험, [Validation Results](docs/evidence/validation-results.md)는 범위 해석, 이 문서는 채택 결론을 소유한다.

| 묶음 | 채택 결론·현재 영향 | 실패·제한 및 재검증 |
| --- | --- | --- |
| P2P / WebRTC | 동일 LAN의 기술 가능성은 기록됨. 반복 QR 경로를 기본 Sync에서 제외 | 기기 EFB/개인 iPad 충돌, WAN 차단·전체 fault·자동 재연결 미검증. 보조 기능 채택은 OPEN |
| Persistence | local transaction·outbox·빈 원장 backup과 플랫폼 restart 계약을 재사용 | 과거 Sembast 후보 검증. 현재 repository·migration·파일 UX 연결 후 검증 필요 |
| Firebase Auth / Server Sync | owner 기반 서버 Sync 방향, SYNC-3 양방향 create 수렴 증거 | delete/timeout/restart/baseline/scale Sync까지 PASS 아님. 후속 PWA 백지 회귀 미해결 |

PWA 백지는 해당 POC 실행의 POC FAILED, 원인은 POC INCONCLUSIVE다. 초기화 대기 가설을 확정 원인 또는 해결 PASS로 기록하지 않는다. 원문 링크·날짜·build는 evidence에서 확인한다.

## 16. Current Implementation Status

2026-09-13 코드 열람 기준. IMPLEMENTED는 아래 범위의 source 존재를 뜻하며 테스트 실행 PASS를 뜻하지 않는다.

| 기능 | Implementation | 근거 |
| --- | --- | --- |
| Opening / session | IMPLEMENTED — 첫 UI와 비동기 Firebase session 확인 | [main](lib/main.dart) |
| Auth | IMPLEMENTED — email UI·실제 adapter·lookup; owner binding NOT IMPLEMENTED | [Auth](lib/auth/auth_engine.dart), [email UI](lib/auth/email_auth_screen.dart) |
| Home | IMPLEMENTED — responsive shell, 하드코딩 월/연/최근 행·Activity mock | [Home](lib/screens/home_screen.dart) |
| Recent | IMPLEMENTED — navigation 및 placeholder 본문 | [Recent](lib/screens/recent_flights_screen.dart) |
| Activity Detail | IMPLEMENTED — navigation 및 placeholder 본문 | [Activity](lib/screens/activity_detail_screen.dart) |
| Custom Period | IMPLEMENTED — 내부 선택 UI; NOT IMPLEMENTED — 월 데이터 공급·Home 반환 | [Custom](lib/screens/custom_activity_range_screen.dart) |
| Totals | IMPLEMENTED — 3-slot presentation·detail shell; NOT IMPLEMENTED — 계산 | [model](lib/presentation/totals_summary.dart), [detail](lib/screens/totals_detail_screen.dart) |
| Customize | IMPLEMENTED — 현재 slot 표시; NOT IMPLEMENTED — category 선택·저장 | [Customize](lib/screens/customize_totals_screen.dart) |
| Settings | IMPLEMENTED — 화면·sign-out callback | [Settings](lib/screens/settings_screen.dart) |
| Add flight | IMPLEMENTED — legacy Home-style section-card entry UI, current-session Time Compact/Expanded presentation, optional operational-time label과 숫자 우선 time format, offline IATA/ICAO autocomplete; **VISUAL TREATMENT SUPERSEDED by owner decision: stock Flutter/Material box/card presentation is not the target UI and must be replaced while preserving confirmed semantics/grouping**; NOT IMPLEMENTED — semantic validation·저장·원장 연결·Time preference persistence | [Home](lib/screens/home_screen.dart), [entry](lib/screens/add_flight_screen.dart), [lookup](lib/airport/airport_lookup.dart) |
| Aircraft Type reference | IMPLEMENTED — FAA JO 7360.1K Appendix A snapshot의 bundled offline designator/manufacturer-model lookup foundation; NOT IMPLEMENTED — Add Flight/Registration UI, selection/auto-resolve, unknown policy, canonical schema·Sync | [lookup](lib/aircraft/aircraft_type_lookup.dart), [contract](docs/specs/aircraft-type-reference-spec.md) |
| View logbook | IMPLEMENTED — Home 진입, presentation-only 10-leaf Standard landscape mock, 35-item Known/system catalog, stable hidden order·visible reorder, Route/T&O-LDG/Approach/FSTD session groups, uniform grid 및 Block/Night/Instrument Page/Previous/New totals shell; NOT IMPLEMENTED — Custom Field create/rename/value UI, configuration persistence, FlightRecord/Calculation 연결, page-policy UI, local ledger·Sync | [Home](lib/screens/home_screen.dart), [shell](lib/screens/view_logbook_screen.dart) |
| Import | IMPLEMENTED — 메뉴만; NOT IMPLEMENTED — 파일 처리 | [Settings](lib/screens/settings_screen.dart) |
| Search | IMPLEMENTED — 입력/포커스 처리; NOT IMPLEMENTED — query·결과. offline/local-first 검색 범위는 사람/crew·공항/route·편명·기종·기간·Remark를 포함한다. Home Search autocomplete/suggestion 구조는 SEARCH-001 OPEN이며 Add Flight airport autocomplete와 구분한다. | [Home](lib/screens/home_screen.dart), [search contract](docs/specs/search-interaction-spec.md) |
| Local Ledger / Persistence | NOT IMPLEMENTED — 제품 domain/repository/outbox 없음 | [lib](lib/), [dependencies](pubspec.yaml) |
| Calculation / Aggregation | NOT IMPLEMENTED — mock 문자열은 계산 결과 아님 | [presentation](lib/presentation/) |
| Backup / Export / Sync | NOT IMPLEMENTED — 제품 연결 없음 | [lib](lib/), [Functions](functions/index.js) |

[widget tests](test/widget_test.dart)·[date tests](test/date_formats_test.dart)는 UI 구성·일부 navigation·locale를 다룬다. 실제 ledger 계산, Custom 반환, production Sync와 EFB acceptance를 대신하지 않는다. Home 안의 옛 Custom 구현은 현재 연결 화면의 근거로 사용하지 않는다.

## 17. Open Decisions

모든 행의 Decision은 OPEN이다. 사용자 선택이 필요한 행은 USER DECISION REQUIRED이며, 기술 점검 행도 이번 Migration에서 임의로 닫지 않았다.

| ID | 질문·결정 필요 이유 | 결정 시점 / 담당 |
| --- | --- | --- |
| NAV-001 | sidebar/bottom tabs/현재 push 중 전체 IA를 어떻게 구성할 것인가? 기존 reference는 초안 | 다음 navigation 구현 전 · USER DECISION REQUIRED |
| NAV-002 | Apply 없이 Custom 선택을 언제 확정·반환할 것인가? 현재 반환 경로 없음 | 기간 연결 전 · USER DECISION REQUIRED |
| NAV-003 | Auth 무전환 route와 모든 독립 화면 back 원칙을 어떻게 일치시킬 것인가? | Auth/navigation 정리 전 · USER DECISION REQUIRED |
| SEARCH-001 | Home Search의 입력 중 suggestion/autocomplete를 제공할지, 어떤 source(실제 local match / 최근 검색 / 이전 기록)를 어떤 순서·category로 노출할지, suggestion 선택과 전체 결과 진입의 관계를 어떻게 정의할 것인가? 초기 기획의 자동완성·이전 기록 추천은 빠른 입력 문맥이므로 Home Search 확정 근거로 확대하지 않는다. | Search query/results 구현 전 · USER DECISION REQUIRED |
| TOTAL-001 | Totals category 후보·3-slot 선택·중복 허용·저장 범위는 무엇인가? mock은 정답 아님 | Customize 기능 전 · USER DECISION REQUIRED |
| TOTAL-002 | **Home Current Period의 metric semantic은 Block Time으로 확정.** 이 Block Time 집계에 raw/credited 중 무엇을 쓰고 opening balance를 어떻게 반영할 것인가? baseline 개념 구별은 유지 | 집계 API 전 · USER DECISION REQUIRED |
| TOTAL-003 | 기간은 운항일/UTC 중 무엇을 기준으로 하고 Simulator는 어떤 집계에 포함하는가? | filter/engine 전 · USER DECISION REQUIRED |
| TOTAL-004 | Home/detail/profile의 duration·날짜 출력 형식과 사용자 선택 범위는 무엇인가? | formatter/output 연결 전 · USER DECISION REQUIRED |
| TOTAL-005 | augmented-crew context의 generic personal Total Time / generic credited Block·Airborne는 정확히 어떤 semantic인가? profile이 명시한 B/T=Block 이외의 보편 mapping은 미확정 | aggregation/output mapping 전 · USER DECISION REQUIRED |
| LOGBOOK-001 | 기존 7 profile을 optional preset으로 둘지 dedicated renderer로 유지할지, 그리고 profile별/generic projection의 total eligibility를 어떻게 확정할 것인가? V1 selectable catalog, system Field Groups, LogMate-owned Known Field labels, 10-leaf Standard default, single Customize surface는 확정됐다. | renderer/preset·totals projection 구현 전 · USER DECISION REQUIRED |
| AIRPORT-GEO-001 | Day/Night T/O/L/D helper에 필요한 좌표를 현재 autocomplete reference에 확장할지 별도 local geographic reference로 둘지, update/version을 어떻게 할지? | solar helper 설계 전 · USER DECISION REQUIRED |
| AIRCRAFT-REF-001 | **닫힘:** FAA JO 7360.1K Appendix A public snapshot, PDF→Appendix A extraction, deterministic bundled asset, designator prefix 및 explicit manufacturer/model search foundation. **OPEN:** current ICAO Doc 8643 parity/update verification, active FAA notice merge 판단, unknown/free-text·selection/auto-resolve·result UI, update automation, canonical representation/provenance. | Add Flight Type lookup / future dataset refresh 전 · USER DECISION REQUIRED |
| VIEW-LOGBOOK-001 | 새 optional/group/Custom column의 exact pixel width와 renderer tuning, horizontal scroll·fixed column, page navigation, record tap behavior를 어떻게 정할 것인가? 기존 36px row/header rhythm과 V1의 no-user-resize 정책은 확정됐다. | View Logbook real-data renderer 전 · USER DECISION REQUIRED |
| CONFIG-SYNC-001 | offline Phone/iPad에서 서로 다른 Logbook Configuration을 변경한 뒤 Sync할 때의 conflict resolution, version/merge/updated-at 정책은 무엇인가? | configuration persistence / Sync 구현 전 · USER DECISION REQUIRED |
| DATA-001 | 확정된 logbook/profile 데이터 요구사항을 기준으로 canonical schema의 entity / field naming / type / version / migration 구조를 어떤 형태로 최종 freeze할 것인가? 로그북별 필요 데이터가 미정이라는 뜻은 아니다. | domain codec 전 · USER DECISION REQUIRED |
| DATA-002 | PF/PM 파생·사용자 입력·출력의 관계는 무엇인가? 기존 문구 충돌 | domain 계산 전 · USER DECISION REQUIRED |
| DATA-003 | Sembast 후보를 현재 제품 adapter로 채택할 조건·version은 무엇인가? | repository 구현 전 · 기술 검토 |
| IMPORT-001 | partial recorded Night의 각 relevant endpoint를 독립 분류하려면 어떤 event clock/location input이 필요하고, exact astronomical/regulatory boundary(예: sunset vs civil twilight), solar algorithm, helper state/provenance, review UX를 어떻게 정할 것인가? Partial Night 또는 한 endpoint state로 다른 endpoint를 추정하지 않으며, Night duration 계산·덮어쓰기와 missing Night→Day fallback은 제외 | helper/import UI 전 · USER DECISION REQUIRED |
| IMPORT-002 | BLH mismatch에서 PDF 값 직접 선택도 제공할 것인가? 회사 유지/수기 수정과 충돌 | review UI 전 · USER DECISION REQUIRED |
| IMPORT-003 | ZZ domain fixture와 7C 전용 parser fixture를 어떻게 분리할 것인가? | parser test 전 · 기술 검토 |
| IMPORT-004 | user-confirmed generic CSV/XLS/XLSX mapping의 source signature, profile, remembered-mapping persistence schema와 conflict UX는 무엇인가? | advanced mapping 구현 전 · USER DECISION REQUIRED |
| CREDIT-001 | FOM Duty Code H의 C/H captain-check pairing 각주 context를 record/source에서 어떻게 확인·표현할 것인가? | FOM importer 전 · USER DECISION REQUIRED |
| CREDIT-002 | 1/2·1/3·2/3 PIC/FO credit의 sub-minute 결과를 minute-resolution storage/display에서 어떻게 rounding할 것인가? FOM은 per-record truncation을 확정하지 않음 | credit engine/formatter 전 · USER DECISION REQUIRED |
| BACKUP-001 | non-empty ledger에서 merge / replace / reset을 지원할 것인가? empty-ledger POC 결과와 제품 정책을 구분해야 한다. | backup UX 전 · USER DECISION REQUIRED |
| BACKUP-002 | 자동/지속적 backup의 플랫폼별 저장 방식·권한·복구 UX는 무엇인가? iPhone Files 등의 feasibility 검증이 필요하다. | backup implementation 전 · USER DECISION REQUIRED |
| AUTH-001 | signed-out 사용자의 local 진입·기존 owner 복구를 어떻게 제공할 것인가? 현재 Opening에 경로 없음 | ledger 진입 전 · USER DECISION REQUIRED |
| POC-001 | P2P 전송 시험 기기가 EFB인가 개인 iPad인가? 원문 표기 충돌 | 회사 EFB 검증 주장 전 · USER DECISION REQUIRED |
| SYNC-001 | P2P를 향후 보조 기능으로 남길 것인가? 기본 Sync 제외 결정은 유지 | 추가 transport 착수 전 · USER DECISION REQUIRED |
| OPS-002 | 광고 제외와 광고 수익 기반 운영중단 정책의 적용 시점은 무엇인가? | 수익/운영 설계 전 · USER DECISION REQUIRED |
| PLATFORM-001 | desktop 및 플랫폼별 공개 출시·acceptance 범위는 무엇인가? | release 계획 전 · USER DECISION REQUIRED |
| DOC-001 | `reference/`는 private development repository에서 의도적으로 추적 가능하지만 REFERENCE ONLY이다. repository 외부 공개·공유·배포 정책은 어떻게 정할 것인가? | public-sharing 정책 변경 전 · USER DECISION REQUIRED |

## 18. Known Conflicts / Superseded Decisions

A = 현재 근거로 SUPERSEDED 판정 가능, B = OPEN(기술/계약 대조), C = USER DECISION REQUIRED, D = Operational state verification required.

| 충돌 | 분류 | 근거와 처리 |
| --- | --- | --- |
| 과거 Home·period presets·Settings 즉시 로그아웃 | A | [historical prompts](archive/planning/)보다 최신 [UI contract](docs/specs/ui-contract.md)의 Recent/Activity/Totals, 7/30/90+Custom, Settings 화면이 대체 |
| 초기 no-server / no-login / serverless-only 기기 동기화 방향 | A | 초기 기획은 local 기기 중심 운영을 검토했으나, 다기기 연동·EFB ↔ mobile 수렴·owner identification 요구와 POC 결과를 거쳐 **Firebase Auth + Firebase server Sync를 사용하는 local-first 구조**로 SUPERSEDED. local-first는 유지하며 P2P는 기본 transport가 아니다. 보조 transport 채택은 SYNC-001 OPEN |
| Totals mock을 domain category로 취급 | A | foundation이 preview label/value를 명시적으로 mock 처리. 실제 category는 TOTAL-001 |
| UI 미구현/Auth 미연결 및 engine-first 작업 순서 | A | [historical plan](archive/planning/plan.md)의 UI-first 및 현재 source가 오래된 상태 설명 대체 |
| navigation IA 초안·Custom 완료·Auth back | C | NAV-001~003. 구현 존재만으로 초안 폐기/최종 UX 확정하지 않음 |
| 한국어 인증 이메일 우선 | A | [historical email record](archive/planning/brand-auth-email-history.md)의 9월 7일 영어 최종 의도가 한국어 초안을 명시적으로 대체. 적용 상태는 D |
| duration format·raw/credited·baseline·기간 기준 | C | schema/format의 H+MM·선택형 total과 Home mock의 콜론 표기. TOTAL-002~004 |
| 사번 저장·검색 허용 잔존 문구 | A | format 내부에도 제외 문구 존재. [historical master-plan](archive/planning/master-plan.md)·[schema](docs/specs/data-schema-spec.md)의 명시적 제외와 일치하도록 과거 허용 문구는 SUPERSEDED |
| planned/actual/cancelled lifecycle 잔존 | A | actual-only·roster 제외와 충돌하는 [format](docs/specs/logbook-format-plan.md)의 historical 구조는 SUPERSEDED |
| PF/PM·partial night·BLH mismatch | C | DATA-002, IMPORT-001~002. 허용되는 계산과 사실 추정을 혼합하지 않음 |
| schema freeze·internal field coverage | C | DATA-001. supported profile field/layout evidence와 matching semantic mapping만 유지한다. canonical entity/field/type/codec/version/migration freeze 전 internal schema 완결 주장 금지 |
| flightNumber vs rawFltNo/carrierCode/sourceFlightNumber/displayFlightNumber | B | [import-contract](docs/specs/import-contract.md)은 유지. schema 통합·migration 상태는 OPEN |
| ZZ fixture vs 7C parser | B | IMPORT-003. synthetic domain 정답을 지원 항공사 확대 근거로 사용하지 않음 |
| POC EFB/개인 iPad·중간 판정표와 후속 결과 | C / B | 기기 POC-001은 미해결. 시점이 있는 후속 실행은 evidence에서 개별 범위로 정리 |
| domain ownership·sender·action URL/template | D | OPS-001: 2026-09-08 외부 조회로 Hosting, Action URL, 세 English template, default locale은 확인. custom sender domain은 `NOT_STARTED`, delivered-email smoke test는 미수행. 상세는 [운영 문서](docs/operations/domains-and-auth-email.md) |
| 광고 SDK 제외 vs 광고 수익 기반 중단 | C | OPS-002. 출시 수익 정책을 추정하지 않음 |

현재용 navigation은 20절의 실제 경로와 evidence 링크를 사용한다. historical 원문 안의 당시 경로 표기는 evidence 자체로 보존할 수 있으며 현재 문서 경로로 해석하지 않는다.

## 19. 다음 개발 방향

아래는 현재 상태에 따른 진행 방향이며 OPEN 질문의 답이나 기능 구현 승인을 대신하지 않는다.

1. 구현된 View Logbook Customize V1 mock/session projection—single catalog, stable OFF order, system Field Groups, Known Field naming, 10-leaf Standard default—을 review하고 회귀를 고정한다.
2. 확인된 geometry·typography·scroll behavior와 V1 projection을 보존하며 Page / Row structure 후속 작업을 진행한다. Custom Field create/rename/value UI와 persistence는 별도 구현이며 mock label/value를 engine rule로 사용하지 않는다.
3. DATA-001/002, TOTAL-005, CREDIT-001/002, IMPORT-001/004를 추정해 닫지 않고, 구현 전에 필요한 product-owner decision을 받는다.
4. 그 다음 local ledger create/edit/delete/restore + revision/outbox vertical slice를 연결하고 native/tablet PWA restart·offline을 검증한다.
5. Calculation/Aggregation·검색·logbook projection을 같은 local 원장에 연결하고 정확한 fixture 결과로 검증한다.
6. optional production import/export·backup·owner binding·server Sync를 연결하며 각 기능의 오류·복구 범위를 검증한다.
7. 플랫폼·운영·release acceptance를 실제 build별로 남긴다. 과거 POC 결과를 재사용하되 현재 통합 검증은 생략하지 않는다.

## 20. Detailed Documentation Index

상세 spec은 현재 domain contract만 담당하며, 제품 상태와 OPEN은 이 Master가 우선한다.

| 경로 | 역할 / Authority | 현재 상태 |
| --- | --- | --- |
| [ui-contract](docs/specs/ui-contract.md) | UI IMPLEMENTATION CONTRACT ONLY | 최신 Home/locale/route 상세; Current Period = Block Time; OPEN 항목 존재 |
| [Home current snapshot](design/HOME_CURRENT_SNAPSHOT.md) | CURRENT DESIGN SNAPSHOT ONLY | 현재 v0.11 owner-review candidate의 구현·시각 상태만 요약. 과거 실험값보다 이 문서를 우선 참조하며 final baseline은 아님 |
| [search-interaction-spec](docs/specs/search-interaction-spec.md) | SEARCH INTERACTION CONTRACT ONLY | local-first searchable scope 확인; Home suggestion/autocomplete·matching detail·result interaction은 SEARCH-001 OPEN |
| [startup-and-auth-entry-spec](docs/specs/startup-and-auth-entry-spec.md) | STARTUP / AUTH UI CONTRACT ONLY | UI 세부 계약; AUTH/NAV OPEN 존재 |
| [data-schema-spec](docs/specs/data-schema-spec.md) | DATA DOMAIN CONTRACT ONLY | source/current/provenance와 candidate semantics; DATA-001 OPEN |
| [calculation-engine-spec](docs/specs/calculation-engine-spec.md) | RECORD-LEVEL CALCULATION DOMAIN CONTRACT ONLY | Block/Actual relationship CONFIRMED; engine/UI/persistence NOT IMPLEMENTED; representation details OPEN |
| [logbook-format-plan](docs/specs/logbook-format-plan.md) | OUTPUT / PROJECTION DOMAIN CONTRACT ONLY | 7개 profile field/layout evidence와 supported mappings; renderer/preset·generic Total Time OPEN |
| [logbook-configuration-spec](docs/specs/logbook-configuration-spec.md) | LOGBOOK PRESENTATION / CONFIGURATION CONTRACT ONLY | Standard 10-leaf default·35-item V1 catalog/groups/naming/session interaction IMPLEMENTED in mock shell; Custom Fields·persistence/Sync NOT IMPLEMENTED |
| [aircraft-type-reference-spec](docs/specs/aircraft-type-reference-spec.md) | AIRCRAFT TYPE REFERENCE / LOOKUP CONTRACT ONLY | FAA snapshot dataset/generator/lookup foundation IMPLEMENTED; UI/canonical/ICAO parity-update details OPEN |
| [import-contract](docs/specs/import-contract.md) | IMPORT DOMAIN CONTRACT ONLY | optional local import/matching/reconciliation·7C 편명 계약; production parser 미구현 |
| [crewconnex-parser-plan](docs/specs/crewconnex-parser-plan.md) | PARSER DOMAIN CONTRACT ONLY | parser profile/실패 계약; production 미검증 |
| [fixture-spec](docs/specs/fixture-spec.md), [fixture JSON](docs/specs/fixtures/m0-synthetic-fixtures.json) | FIXTURE EXPECTATIONS ONLY | raw/source·PIC/FO·Night helper synthetic contract; current test PASS 아님 |
| [test-contract](docs/specs/test-contract.md) | TEST CONTRACT ONLY | future requirements와 current commands/implementation을 구분 |
| [offline-acceptance](docs/specs/offline-acceptance.md) | OFFLINE ACCEPTANCE CONTRACT ONLY | real tablet/EFB Safari intent; current local-ledger PASS 아님 |
| [domains-and-auth-email](docs/operations/domains-and-auth-email.md) | OPERATIONAL TARGET / OBSERVED STATE / RUNBOOK | 외부 운영 상태 미확인 |
| [Validation Results](docs/evidence/validation-results.md) | VALIDATION EVIDENCE ONLY | 제품 결정 권한 없음 |
| [Known Field Research](docs/evidence/known-field-research.md), [candidate catalog CSV](docs/evidence/known-field-catalog.csv) | EVIDENCE ONLY | 2026-09-13 local source re-audit; canonical schema가 아님 |
| [Functions README](functions/README.md) | ACCOUNT LOOKUP RUNBOOK ONLY | lookup 운영·보안 점검; Sync spec 아님 |
| [archive](archive/) | HISTORICAL EVIDENCE ONLY | plan, POC, research 원문 |
| [reference](reference/) | REFERENCE ONLY | private development repository에서 추적 가능한 회사 원본·외부 자료·MintTap UI source; LogMate 요구사항 아님; public-sharing 정책은 DOC-001 OPEN |

Historical planning 원문은 [archive/planning/](archive/planning/)에, POC 원문은 [archive/poc/](archive/poc/)에 보존한다. `implementation-source-map.md`의 source/output mapping은 data schema·format·fixture spec에 배분되어 있으며 원문은 historical planning으로만 남긴다.

## 21. Source of Truth Rules

| 위치 | Authority |
| --- | --- |
| MASTER.md | CURRENT PRODUCT STATE |
| 상세 spec | 해당 DOMAIN CONTRACT ONLY |
| operations | OPERATIONAL TARGET/STATE/RUNBOOK |
| evidence | VALIDATION EVIDENCE |
| codex/prompt.md | CURRENT TASK ONLY |
| archive | HISTORICAL EVIDENCE ONLY |
| reference | EXTERNAL/REFERENCE MATERIAL ONLY |
| code/test | IMPLEMENTATION EVIDENCE |

1. 과거 prompt와 plan/summary의 전체 제품 권한 선언은 이 Master로 대체한다. 원문은 archive에 보존한다. README와 AGENTS.md는 발견·작업 안내이며 별도 제품 기준이 아니다.
2. 세부 변경은 담당 spec에 기록하고 제품 상태·범위·OPEN에 영향이 있으면 Master 요약도 함께 갱신한다. 충돌을 문서 수정 시각만으로 해결하지 않는다.
3. code/test 존재는 승인 증거가 아니다. POC PASS는 해당 기기·build·시나리오를 넘어 확대하지 않는다. 이후 evidence에는 날짜·대상 저장소/build·절차·관찰·판정·미검증 범위·원문을 함께 남긴다.
4. 운영 목표값·실제 관찰·지원 회신 초안을 분리한다. `Last verified` 없는 과거 상태를 현재 상태로 복사하지 않는다.
5. active product documentation은 Git 추적 가능해야 한다. `reference/`는 현재 private development repository에서 의도적으로 추적할 수 있지만 권한은 REFERENCE ONLY이며 SOT가 아니다. 외부 공개·공유·배포 정책은 DOC-001에서 별도로 결정한다.
6. 현재 task는 `codex/prompt.md`에만 기록한다. archive/reference를 현재 제품 사양으로 승격하지 않는다.

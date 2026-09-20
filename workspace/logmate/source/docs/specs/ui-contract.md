# LogMate foundation contract

> Authority: UI IMPLEMENTATION CONTRACT ONLY
> Status: CURRENT — OPEN ITEMS EXIST
> Source of Truth: [MASTER.md](../../MASTER.md)

## 제품 경계

LogMate는 조종사가 개인 비행 기록을 정리·계산·검색하고 종이 로그북에 옮겨 적도록 돕는 도구다. 항공사의 공식 운항 시스템이나 법적 경력증명서를 대체하지 않는다.

## 지켜야 할 규칙

- simple is the best: POC 진단 화면이나 임시 테스트 조작을 제품 UI에 가져오지 않는다.
- 하나의 canonical 원장만 둔다. 변경은 local ledger와 pending outbox에 하나의 transaction으로 먼저 쓴다.
- user-confirmed current value는 import나 Sync가 침묵 속에 덮지 않는다. 외부 source는 field별 evidence role을 가지며, 회사 operational source와 CrewConnex roster source는 상호 대체 가능한 전역 우선순위 source가 아니다. CrewConnex는 actual record를 만들지 않는다.
- 시간의 canonical 값은 UTC timestamp와 duration seconds다.
- 삭제는 즉시 목록에서 숨기되 tombstone과 복원 계약을 유지한다.
- empty-ledger `.lbk` restore는 과거 POC evidence다. non-empty merge/replace/reset 제품 정책은 MASTER의 BACKUP-001 OPEN을 따른다.

위 local ledger/outbox는 제품 계약이다. 현재 production에는 canonical ledger, local persistence, product Sync가 없고 signed-out local Home entry도 구현되지 않았다.

## PWA offline delivery gate

native와 tablet/EFB PWA는 first-class target이다. 같은 domain input은 같은 semantic/calculation/projection result를 내야 하며, platform-specific adapter와 responsive UI는 달라도 된다. PWA는 온라인 Firebase 초기화나 네트워크 요청 때문에 첫 Flutter frame이 막히면 안 된다. 배포물은 `--no-web-resources-cdn`, 생성된 Flutter resource 전체 precache, local font를 사용한다. 실기기 판정은 fresh preview origin에서 online full load → wait → refresh → full URL bookmark → tab close → airplane/Wi-Fi off → bookmark/new tab 순서로 실제 Flutter UI와, local ledger 구현 뒤에는 기존 local data가 표시될 때만 PASS다. 현재 signed-out path는 Opening이며 local-ledger acceptance PASS가 아니다.

## 검증 원칙

자동 테스트, preview smoke, EFB Safari PWA, iPhone native restart는 서로 대체하지 않는다. 각 기능은 가능한 자동 테스트를 먼저 통과시키고, 실기기에서는 최종 시나리오만 짧고 명확하게 확인한다.

## 언어

LogMate V1의 제품 UI와 aviation terminology는 영어를 기본값으로 사용한다. 기기 언어로 자동 전환하지 않는다. 한국어·영어 localization 기반은 한국 사용자용 인증 이메일과 action 화면을 먼저 지원하고, 향후 명시적으로 승인한 UI 범위에만 사용한다. 지원하지 않는 UI 언어의 fallback은 영어다.

Crew name, remark, source text 같은 사용자 데이터는 번역 대상이 아니다. 한국어를 포함한 원문 Unicode 값을 그대로 저장·검색·출력한다. 향후 사용자가 선택하는 UI 언어도 원장 데이터나 Sync 대상이 아닌 기기별 UI 설정이다.

## 날짜 표시 로케일 (2026-09-08)

- **CONFIRMED — English-only UI:** 제품 UI text·요일·달력 문구·메뉴·버튼·helper/error copy·항공 용어는 영어만 사용한다. 한국어 또는 기타 번역 UI를 제공하지 않으며 device language가 product strings를 번역하지 않는다. 날짜 값은 번역하지 않고 numeric presentation으로 유지하며, 기존 numeric locale ordering policy는 언어 번역과 별개로 유지한다(`ko_KR`: `2026.09`, `2026.09.07`, Year→Month→Day; `en_US`: Month→Day→Year; `en_GB`: Day→Month→Year). 즉 한국 locale에서도 product copy는 영어이고 month/date 값은 numeric이다.
- 새 화면은 `lib/localization/date_formats.dart`의 `DateFormats.of(context)`와 `monthYear`, `month`, `shortDate`, `date`를 사용한다. 영어 UI의 `Localizations.localeOf(context)`를 날짜에 사용하거나 화면별 형식을 복제하지 않는다.
- 날짜 선택기는 `DateFormats.picker`를 사용한다. 이 선택기는 year/month/day의 numeric value를 지역별 순서로 보장하며, month는 `September`나 `9월`이 아닌 `09`처럼 표시한다. `Cancel`/`Done`은 영어로 유지한다.
- `DateLocaleScope`는 실행 중 기기 로케일 변경을 반영한다. UTC·운항일·duration·저장 값·인증 이메일 언어는 이 표시 정책과 별개다.
- 새 날짜 UI는 한국어·미국/영국 영어와 좁은 화면에서의 잘림을 검증한다.

## View Logbook ledger data typography

이 절의 monospace 계약은 **View Logbook의 dense ledger body**에 한정한다. Home, Activity Detail, Add Flight 또는 앱 전체의 일반 data typography로 자동 확장하지 않는다.

View Logbook에서 날짜, 편명, 출발지·도착지 IATA 코드, Block/Night/Instrument 등 반복 원장 데이터 값은 UI 제목·라벨과 구분되는 regular monospace/code body를 사용한다. body 기본 weight는 w400이며, 행의 중요도를 이유로 임의로 굵게 바꾸지 않는다. Flight의 내부 carrier + number/suffix zoning, duration의 end alignment, 각 semantic column geometry는 아래 View Logbook 계약이 우선한다.

구간의 화살표는 데이터 값이 아니라 출발지와 도착지의 관계를 나타내는 구조 표식이다. 그 표현은 ledger row rhythm과 정렬을 유지하되 데이터 glyph와 같은 monospace family를 반드시 강제하는 전역 규칙으로 해석하지 않는다.

Home의 현재 Date/DEP/ARR selective-monospace 실험은 별도 current design candidate이며 [Home current snapshot](../../design/HOME_CURRENT_SNAPSHOT.md)을 따른다. Activity Detail과 앱 전체 적용 여부는 아직 확정하지 않았다.

이 규칙은 원본 import 데이터의 추적 가능성과 별개다. 저장·표시 변환은 [import-contract.md](import-contract.md)의 항공사별 계약을 따르고, 이 절은 그 결과를 View Logbook에서 어떻게 조판하는지를 정의한다.

## 키보드 해제

키보드 입력이 가능한 모든 화면은 입력 필드 바깥을 터치하면 포커스와 키보드를 해제해야 한다. 화면 body에는 `GestureDetector`를 `HitTestBehavior.translucent`로 적용하고 `FocusScope.of(context).unfocus()`를 호출한다. 각 `TextField`에도 동일한 동작의 `onTapOutside`를 지정해 다른 위젯의 제스처가 있는 영역에서도 해제가 보장되도록 한다.

새 `TextField` 또는 동등한 텍스트 입력 위젯을 추가할 때 이 두 처리를 함께 적용한다. 입력 필드가 오버레이·팝업·스크롤 영역 안에 있어 body 제스처가 전달되지 않을 수 있는 경우에도 `onTapOutside`를 생략하지 않는다.

## 독립 화면 뒤로가기

뒤로가기가 필요한 모든 독립 화면은 다음 세 가지 경로를 함께 제공한다.

- 화면 내부의 명시적 뒤로가기 버튼
- iOS의 화면 가장자리 뒤로 밀기
- Android의 시스템 뒤로가기 및 gesture/predictive back

화면 타이틀은 뒤로가기 버튼과 독립적으로 중앙 정렬할 수 있지만, 뒤로가기 버튼의 터치 영역과 접근성 label은 유지한다. iOS 화면 진입은 `CupertinoPageRoute`, Android와 Web은 `MaterialPageRoute`를 사용해 플랫폼의 기본 전환과 뒤로가기 동작을 따른다. 화면에서 pop을 임의로 차단하거나 `WillPopScope`로 제스처를 대체하지 않는다. 확인·저장 차단이 필요한 경우에만 별도 제품 계약과 `PopScope` 상태를 먼저 정의한다.

## 기간 선택 UI (2026-09-05)

홈의 빠른 기간 선택은 `Last 7 days`, `Last 28 days`, `Last 90 days`를 제공한다. `Custom` 진입은 유지하되, 기간 선택 화면은 별도 Dart 화면에서 관리한다.

Custom 화면은 빠른 기간, 달력 월, 임의 날짜 범위의 역할을 중복하지 않는다.

- 홈 빠른 기간: `Last 7 days`, `Last 28 days`, `Last 90 days`, `Custom`
- Custom 화면 제목: `CUSTOM PERIOD`
- Custom 탭: `Month / Year / Date range`
- `Month`: 원장에 기록이 존재하는 모든 월을 최신순으로 표시한다. 같은 월은 하나로 합치고, 기록이 없는 월은 표시하지 않는다.
- `Year`: 원장에 기록이 존재하는 모든 달력 연도를 최신순으로 표시한다. 같은 연도는 하나로 합친다.
- `Date range`: 시작일과 종료일만 표시하는 날짜 범위 카드와 하단 날짜 선택 시트를 제공한다.
- 홈에서 `Custom`으로 진입하면 `Date range`를 기본 선택한다.
- `1 month / 3 months / 6 months`, `1 year`, `Apply` 버튼은 제공하지 않는다.

이 화면은 먼저 UI와 선택 상태를 고정하고, 실제 비행기록 합계 계산 연결은 이후 단계에서 진행한다.

## 홈 요약 및 상세 진입 UI (2026-09-06)

- 홈의 주요 섹션 제목은 `Recent`, `Activity`, `Totals`를 사용한다.
- `Recent`와 `Activity` 제목 옆에 Chevron을 표시하고, 각각 별도 상세 화면으로 진입한다.
- 상세 화면은 먼저 제목, 명시적 뒤로가기 버튼, route pop만 제공한다. 실제 원장·집계 엔진 연결은 후속 단계다.
- 상세 화면 파일은 `recent_flights_screen.dart`와 `activity_detail_screen.dart`로 분리해 유지보수한다.
- 홈 Activity 선택은 `Last 7 days / Last 28 days / Last 90 days / Custom`이며, 선택 줄은 Activity 제목 아래에 둔다.
- Activity 요약 카드는 `Legs`, `Block`, `TO/LD` 세 열을 사용한다. `TO/LD` 값은 `takeoffs/landings` 형식으로 표시한다.
- Activity의 선택 상태는 선택된 항목에만 primary 색상과 bold를 적용한다. 공통 고정 라벨과 비선택 항목은 중립 색상으로 표시한다.

## 홈 주요 행동과 Settings (2026-09-07)

- Home의 최상단에는 `Add flight`와 `View logbook`을 primary action으로 둔다. Home 본문에는 중복 행동을 두지 않는다.
- `Import`는 Settings에서 제공한다. Settings 화면은 독립 Dart 화면이며 명시적 뒤로가기와 플랫폼 route pop을 제공한다.
- 초기 Settings에는 `Import`와 `Sign out`만 둔다. Sign out은 기존 Firebase sign-out과 session clear 흐름을 사용한다.

## Add flight entry UI shell (2026-09-08)

- Home의 `Add flight`는 독립 화면 `Add flight`로 진입한다. 명시적 back 버튼과 플랫폼 route pop을 함께 제공한다.
- 이 화면은 현재 수기 FlightRecord 입력의 UI shell이다. 저장·validation·canonical ledger·계산 연결은 아직 제공하지 않는다.
- **SUPERSEDED VISUAL TREATMENT / SEMANTICS RETAINED:** `Flight`, `Time`, `Landing`, `Crew`, `Remark`의 section identity와 ordering은 유지하지만, rounded low-contrast outline section card를 canonical visual treatment로 사용하지 않는다. Owner decision 2026-09-19에 따라 stock Flutter/Material box/card grammar(`Card`, repeated rounded outline/fill containers, generic filled field surfaces)를 제품 UI의 기본 시각 언어에서 배제한다. grouping은 typography, alignment, spacing, rules/dividers와 필요 최소한의 authored control boundary로 표현한다. 기존 section-card 구현은 migration evidence일 뿐 target UI가 아니다.
- **CONFIRMED / IMPLEMENTED:** 일반 Add Flight input의 visual height는 Home Search와 같은 40 logical px다. Takeoffs/Landings counter는 48 logical px를 유지하며, `Show/Hide details`와 `Add crew member` action은 minimum 44 logical px touch target을 유지한다.
- 기본 입력은 Date, Flight number, Departure, Arrival, Block time이다. Ramp out, Ramp in, Takeoff, Landing, Actual time은 Add Flight에서 사용할 수 있는 `(Optional)` operational field이며 Expanded Time에서 visible이고 Compact Time에서는 hidden이다. visibility는 data 존재와 분리된다. Night time/Instrument time의 profile-aware required policy는 이 UI 표기에서 새로 결정하지 않는다. 현재 compact label `Instrument time`의 semantic identity는 Instrument Flight Time이며 IFR Time·Actual Instrument와 다르고 Actual에서 자동 계산하지 않는다.
- Takeoffs와 Landings는 각각 0 이상 정수 count로 입력한다. 일반 airline leg의 0/1 입력과 GA의 복수 이착륙을 같은 control로 지원한다.
- Crew는 선택적인 수기 participant 이름 목록이며, `Add crew member`로 행을 추가한다. Remark는 선택적인 자유 텍스트다.
- `Actual time`은 Flight & Maintenance Log의 A/T (Actual Time) 명칭을 유지한다. `Flight time`이나 `Air time`으로 바꾸지 않는다.
- TIME은 Compact에서 Block time / Night time / Instrument time을, Expanded에서 Ramp out (Optional) / Takeoff (Optional), Ramp in (Optional) / Landing (Optional), Block time / Actual time (Optional), Night time / Instrument time 순서로 표시한다. Block time은 주요 entry로 typography를 더 강하게 둔다. Compact/Expanded는 Show/Hide presentation control이며 hidden operational field의 controller/current value를 삭제하거나 초기화하지 않는다.
- `(Optional)`은 placeholder가 아닌 field label의 일부다. Optional은 이 generic UI 흐름을 계속할 수 있다는 뜻이며, 모든 output profile의 regulatory requirement를 일반화하지 않는다.
- Add Flight time field에는 placeholder/example hint가 없다. mobile keyboard는 digits-first path를 제공한다. 기존 `HHMM` placeholder 결정은 SUPERSEDED다.
- Clock과 Duration 모두 typing 중에는 digits, `:`, `+` raw editing text를 유지하며 separator를 자동 삽입하지 않는다. focus loss, Next, Done 같은 editing completion에서만 normalize한다. 기존 live separator insertion 결정은 SUPERSEDED다.
- Clock time은 Ramp out, Ramp in, Takeoff, Landing에 적용한다. `HHMM`, `HH:mm`, `HH+MM`을 받아 completion 뒤 `HH:mm`으로 표시한다. 3-digit clock shorthand는 확정하지 않았으므로 1~3 digit raw input은 그대로 둔다.
- Duration은 Block time, Actual time, Night time, Instrument time에 적용한다. variable-hour digits 또는 `H+MM`/`H:MM`을 받아 completion 뒤 `H+MM`으로 표시한다. 1 digit은 `0+0M`, 2 digits는 `0+MM` minute shorthand로 normalize한다(`5` → `0+05`, `11` → `0+11`, `35` → `0+35`). 3자리 이상은 마지막 두 자리를 minute로 해석한다(`135` → `1+35`, `1035` → `10+35`, `1350` → `13+50`). leading-zero hour는 강제하지 않는다.
- parser는 `:`와 `+`를 모두 허용한다. 어떤 separator를 입력했는지가 아니라 field semantic이 completion presentation을 결정한다(Clock `09+30` → `09:30`, Duration `13:50` → `13+50`). formatter는 selection, replacement, backspace, formatted paste를 보존하고 duplicate separator를 만들지 않는다.
- 이 formatter는 presentation/input convenience만 다룬다. clock/duration range, midnight/day rollover, GMT/local conversion, Block/Actual/Night/Instrument Flight Time automatic calculation, manual/calculated precedence는 별도 contract다.
- TIME IN SERVICE의 GMT 사용 방향은 유지하지만, 이 UI는 device local time conversion, airport timezone lookup, Block/Actual/Night/Instrument Flight Time 자동 계산·추정을 수행하지 않는다. 모든 시간 field는 현재 사용자 입력값이다.
- **CONFIRMED / IMPLEMENTED:** Time은 user presentation control로 Compact/Expanded를 전환한다. output profile이 visibility를 강제하지 않는다. Compact는 `Block time | Night time | Instrument time`의 같은 3-column row를, Expanded는 `Ramp out | Takeoff`, `Ramp in | Landing`, `Block time | Actual time`, `Night time | Instrument time`의 2-column × 4-row mobile layout을 제공한다. `Show details` / `Hide details`는 section heading과 같은 row의 secondary action이다.
- Compact로 숨겨도 operational field controller와 현재 값은 유지하며, visibility가 data 존재를 바꾸지 않는다. Show/Hide preference persistence는 **NOT IMPLEMENTED**다. 이 control은 Calculation Engine, automatic Block/Actual, mismatch UI, profile-based visibility를 구현하지 않는다. 향후 Add Flight tablet/iPad presentation은 width-based wider adaptive layout을 사용할 수 있으나 exact breakpoint와 tablet composition은 **OPEN / NOT IMPLEMENTED**다.
- **CONFIRMED / NOT IMPLEMENTED:** 향후 Record Calculation Engine이 제공한 derived Block/Actual은 표시할 수 있어야 한다. 비교 가능한 세 값의 manual/imported target과 calculation result가 다르면 해당 field에 명확한 warning presentation(예: red state, helper text)을 제공하고 저장 전 다시 알린다. mismatch는 저장 차단이 아니며, 정확한 component·문구·버튼은 OPEN이다. 현재 Add Flight에는 auto-fill, mismatch visual, save warning이 구현되어 있지 않다. 상세 계산 계약은 [Record Calculation Engine spec](calculation-engine-spec.md)을 따른다.
- Departure와 Arrival은 2-column layout을 유지하는 read-only display field다. field를 tap하면 dedicated airport search sheet가 즉시 열리고, sheet의 search field는 autofocus되어 software keyboard 입력을 바로 받는다. 선택하지 않고 Cancel, swipe down, system back으로 닫으면 기존 field value를 유지한다.
- search는 bundled offline dataset의 IATA/ICAO code를 같은 candidate 공간에서 case-insensitive prefix match한다. 첫 글자부터 결과를 갱신하며 name full-text search는 제공하지 않는다. code 입력은 uppercase로 표시하되, uppercase conversion 자체를 airport resolve로 취급하지 않는다.
- IATA와 ICAO를 합친 prefix candidate 전체가 하나일 때만 즉시 resolve한다. exact code가 있어도 다른 prefix candidate가 있으면 자동 resolve하지 않고 모든 candidate를 보여 주며 사용자 tap을 요구한다.
- suggestion과 선택 뒤 field는 `ICAO / IATA` 순서와 airport name을 사용한다. IATA 또는 ICAO 하나만 있으면 그 code만 표시한다. match가 없으면 `No matching airport code.`를 보이며, 유사 code 추정·자동 교정·임의 airport 생성은 하지 않는다.

## Home Totals presentation shell (2026-09-07)

- Home Totals는 `Totals >` detail link와 `Customize` action을 갖는다. 카드에는 동일한 label/value hierarchy의 세 항목만 표시한다.
- `HomeTotalItem`과 `TotalsSummary`는 calculation engine output을 받기 위한 UI-facing presentation model이다. preview 값과 label은 mock이며 domain model·aggregation·role·aircraft 규칙을 뜻하지 않는다.
- Totals Detail과 Customize는 각각 독립 navigation shell이다. Customize는 현재 Home slot만 표시하며 candidate category·선택 규칙·저장 범위는 확정하지 않는다.

## View Logbook landscape shell (2026-09-13)

- **CONFIRMED:** Clock time is displayed as `HH:mm`. Duration and cumulative duration are displayed as `H+MM`; cumulative duration must have a minimum readable UI capacity of `99,999+59`. This is a presentation capacity, not a Calculation Engine or storage maximum.
- **CONFIRMED / IMPLEMENTED — temporary mock/session shell only:** Home `View logbook` opens the ten-leaf LogMate Standard ledger with exact compact headers `Date | Type | Reg | Flight | DEP | ARR | Block | Night | Inst | Remark`. Customize presents the distinct Departure/Arrival Known Fields as one non-stored Route system Field Group that toggles and reorders as one unit.
- The shell gives each selected semantic column a compact stable width determined by display capacity, never by a record string or viewport surplus. Ledger width is the sum of selected column widths: it stays left-aligned without stretch-to-fill when it fits, and horizontally scrolls only when that sum exceeds available content width. It uses fixed header/record row heights, centered headers, centered Date/Type/Registration/Departure/Arrival values, an internally zoned Flight value, and end-aligned Block/Night/Instrument Flight Time values. Ungrouped and Route leaves use the compact one-level header treatment; renderer-controlled Takeoff/Landing splits, Approach with Runway, and multi-child Simulator/FSTD projections compose two header levels inside the same 36px header rhythm. The grid remains uniform and low contrast; periodic row grouping and alternating row shading are not implemented.
- **CONFIRMED:** `Flight` is an IATA-style commercial identifier: 2-character IATA carrier designator + 1–4 digit flight number + optional 1-character operational suffix, with 7-character presentation capacity. Its carrier zone and number/suffix zone have fixed starts matching Home Recent's `19px + 2px + remaining` layout; it is not a whole combined string centered in the column. Mock fixtures provide those constituents explicitly and never parse a combined source string. Canonical persistence decomposition and leading-zero normalization remain OPEN.
- **CONFIRMED:** Compact ledger is LEFT/START anchored immediately after outer content padding. When its selected-width sum is smaller than the viewport, unused width remains on the RIGHT for future selectable columns; the ledger is not centered. The Registration semantic field uses compact header copy `Reg` without changing registration data or field semantics.
- **CONFIRMED / IMPLEMENTED — View Logbook only:** entering the screen requests `landscapeLeft` and `landscapeRight`; dispose restores the existing app policy (Android `fullSensor`, iOS all four declared interface orientations). Home and all other screens retain that existing policy. Pinch zoom / `InteractiveViewer` remains OPEN / NOT IMPLEMENTED.
- **CONFIRMED / IMPLEMENTED — mock shell only:** a distinct bottom totals presentation has Page Total, Previous Total, and New Total rows for Block, Night, and Instrument Flight Time. Each cumulative value uses exactly the same visual column left/right boundaries as the corresponding per-flight semantic duration column; the leading Date-through-To area is one total-label area. Each duration column has minimum readable capacity for `99,999+59` for cumulative values while also rendering per-flight `H+MM` values. It is not connected to Calculation/Aggregation, FlightRecord storage, or page-policy calculation.
- **CONFIRMED:** Header, flight body, and Page/Previous/New Total rows use one shared theme base text size and 36px row-height rhythm. Body remains monospace/code at `FontWeight.w400`. Header, Page Total, and Previous Total share `FontWeight.w500`; New Total alone uses `FontWeight.w600`. Totals share one neutral background, including no special green/mint fill for New Total. Separator lines and weight—not font-size changes or color fill—express hierarchy.
- **CONFIRMED / IMPLEMENTED — mock shell only:** The column header remains sticky while flight rows and the non-sticky totals scroll vertically below it. Header, body, and totals use one shared horizontal scroll offset and retain matching semantic column boundaries. The existing neutral header background remains opaque enough that scrolling content is not visible through it.
- **CONFIRMED / IMPLEMENTED — mock shell only:** After vertical scrolling settles, the ledger snaps to its 36px Flight-row rhythm. `Page Total`, `Previous Total`, and `New Total` each have an individual final reading stop; the final `New Total` stop uses the maximum vertical offset, so it is wholly visible rather than left as a partial row. This is presentation-only and does not define page or calculation behavior.
- **CONFIRMED / IMPLEMENTED — mock shell only:** View Logbook uses a minimal iOS-style left-side vertical scroll position indicator. It tracks only vertical ledger position and stays independent of horizontal ledger movement.
- **CONFIRMED / NOT IMPLEMENTED:** Page numbering is continuous across the whole Logbook and does not reset by year. View Logbook opens at the latest page in the current data projection. Default page capacity is 15 Flight rows, configurable from 3–100; an early-ended page fills remaining capacity with presentation-only blank rows that are not records or totals input. A user may manually start the next page or set a Flight as a page start for paper alignment; exact action wording is OPEN. Page change resets vertical position to page top. Future zoom resets to 100% on page change; whether horizontal offset resets remains OPEN.
- **CONFIRMED / PARTIALLY IMPLEMENTED:** The static `View Logbook` title is removed; Back and the provisional Customize action remain. The future top control/context area includes Year context, previous/current-next page controls, and Customize; exact layout, typography, spacing, and Year interaction are OPEN. Year is context/navigation only, not a page-numbering reset or filter. No separate View Logbook Settings button is required. Period statistics remain date-based rather than page-boundary-based.
- The shell currently renders 12 mock rows for UI inspection only; it does not implement the confirmed rows-per-page or page-policy contract.
- Future total-eligible duration columns require the same minimum cumulative display capacity (`99,999+59`) as Block/Night/Instrument Flight Time. V1 provides no user width-resize UI. Known Field/system-group widths are LogMate-controlled renderer metadata; exact new pixel widths remain **OPEN / NOT IMPLEMENTED**. Existing 96px-class duration dimensions remain mock implementation evidence rather than a shared optional/custom policy. Custom Field automatic width uses the larger of its name width and data-type minimum while retaining the same body font size.
- **CONFIRMED / IMPLEMENTED — temporary mock/session shell only:** View Logbook `Customize` opens one dedicated immediate-setting 35-item Known Field/system-group catalog rather than editing the ledger in place. Visible/ON rows appear above hidden/OFF rows, only visible rows have trailing reorder handles, ON→OFF returns an item to stable hidden catalog order, and OFF→ON appends it to visible order. Switch/group-option changes, visible reorder drops, and Reset immediately update the current session; Back does not roll back, there is no Done/Apply/Save/Cancel, and at least one top-level item stays visible. Route, Takeoff/Landing, Approach, and Simulator/FSTD use the fixed renderer-controlled group behaviors in [logbook-configuration-spec](logbook-configuration-spec.md); Simulator/FSTD parent ON always includes its Time leaf, while only Type, Device / Qualification, and Instruction Type appear as optional child switches. The disabled `+ Custom Field` entry point is present, but Custom Field creation/rename/value UI is NOT IMPLEMENTED. The surface does not persist configuration or connect to record/calculation data. Known Field rename/resize, free Header Group editing, group split/reassembly, arbitrary merge, and formula fields remain excluded.


## Visual primitive policy — owner decision 2026-09-19

- **CONFIRMED:** LogMate는 Flutter/Material이 기본 제공하는 box/card look을 제품의 시각 언어로 사용하지 않는다.
- 배제 대상에는 반복적인 `Card`, card-like `Container + BoxDecoration`, rounded outline/fill section panel, generic Material filled-field surface, equal-card dashboard가 포함된다.
- 이 결정은 semantic grouping이나 touch-target requirement를 제거하지 않는다. 필요한 grouping은 typography, shared datum, whitespace, low-contrast rules/dividers와 custom-authored interaction primitive로 해결한다.
- 버튼·입력·선택 control은 상호작용 affordance가 필요한 경우 명확한 boundary를 가질 수 있지만, stock Material card/box aesthetic를 그대로 노출하지 않는다.
- 기존 `LogMateTheme.inputDecorationTheme`, Home `_sectionCard`, Add Flight section-card source는 current implementation evidence이며 visual target이 아니다.
- View Logbook의 grid/rule geometry는 card UI가 아니므로 이 배제 결정과 충돌하지 않는다.

### 28-day replacement rationale — 2026-09-19

- **OWNER CONFIRMED:** Home Activity quick period `Last 30 days` is superseded by `Last 28 days`.
- Rationale: aviation recency/limitation research across ICAO/EASA/FAA/Korea repeatedly uses 28-day, 90-day, 6-month and annual/365-day windows, while fixed 30-day is not the common aviation regulatory window recovered for the targeted pilot domain.
- This does **not** make the Home Activity selector a regulatory-compliance engine. It remains an activity-analysis filter.
- `This Month` / calendar month context remains separate from rolling `Last 28 days`.
- **OWNER CONFIRMED:** Home Current Period의 `This month` / `This year` duration 값은 **Block Time** 집계다. 이 결정은 metric identity만 확정하며 raw/credited 선택, opening balance 반영, 운항일/UTC 기간 경계는 TOTAL-002/003 OPEN으로 유지한다.
- `Custom` remains available for Month / Year / Date range.

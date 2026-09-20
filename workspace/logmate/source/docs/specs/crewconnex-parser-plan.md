# CrewConnex TSV/PDF parser 변경 대응 계획

> Authority: PARSER DOMAIN CONTRACT ONLY
> Status: CURRENT — OPEN ITEMS EXIST
> Source of Truth: [MASTER.md](../../MASTER.md)

최종 갱신: 2026-09-13
범위: 제주항공 사용자가 제공하는 CrewConnex **clipboard tab-separated text(TSV) 및 printer PDF/print 파일**의 local import. CrewConnex 계정 접근, 앱 화면 OCR, API 연동, 업로드 원본 파일 보관은 범위에서 제외한다.

## 1. 원칙

CrewConnex import는 선택적이며 필수 사용 주기가 없다. 수기로 만든 기존 record 또는 다른 operational source에서 생성된 기존 record에 crew snapshot/BLH evidence를 enrichment·cross-check하는 용도일 뿐, 독립 FlightRecord를 만들지 않는다. parsing/reconciliation만을 위해 Firebase나 다른 cloud에 원본을 upload하지 않는다.

여러 사용자를 위한 표준 입력은 CrewConnex **printer PDF의 local file selection/import**다. 사용자가 선택 범위를 다르게 복사하거나 모바일/브라우저가 표 순서를 바꿀 수 있는 clipboard TSV는 선택적 보조 입력이다. TSV는 열 header와 cell 경계가 보존되면 PDF보다 쉽게 읽을 수 있지만, 그것이 모든 사용자에게 같은 결과를 보장하지는 않는다. 출력 양식이 바뀔 수 있다는 사실은 parser가 자동으로 새 양식을 이해한다는 뜻이 아니다. 알지 못하는 양식을 조용히 읽어 잘못된 비행·편조를 만드는 것이 가장 위험하다.

따라서 앱은 다음 중 하나만 수행한다.

1. 검증된 양식 profile을 감지하고 필수 필드 검증을 통과한 후보를 staging으로 제시한다.
2. 양식을 감지하지 못했거나 검증에 실패하면 import를 멈추고 `지원되지 않는 CrewConnex 양식`으로 명확히 표시한다.

두 번째 경우 사용자는 회사 Excel import·직접 입력을 계속 사용할 수 있다. 새 PDF/TSV 형식에 대응하려면 실제 입력의 개인정보를 제거한 fixture를 확보하고 parser profile을 수정한 뒤 앱을 배포해야 한다. PWA는 다음 온라인 배포 뒤, native는 Store release 설치 뒤 새 profile을 사용할 수 있다. 오프라인 기기가 새 parser를 즉시 받는 기능은 약속하지 않는다.

## 2. ParserProfile 계약

각 TSV/PDF 출력 layout에는 immutable `ParserProfile`을 둔다.

| 항목 | 내용 |
| --- | --- |
| `profileId`, `profileVersion` | 회사/출력 양식/유효 기간을 구분하는 식별자 |
| detector | 문서 text-layer의 제목·column header·반복 section·page 구조 anchor |
| required fields | duty 날짜, activity/flight, route 또는 leg 식별자, block/BLH 등 layout별 최소 필드 |
| extraction map | anchor와 table/line 위치에서 intermediate roster model로 옮기는 규칙 |
| validation | 시간 형식·날짜 범위·중복 leg·필수 anchor·page continuation 검증 |
| provenance | profile version, source page/line locator, raw text, review reason |

`rawCode`와 원본 label은 보존·detail 표시하되, V1은 CrewConnex participant duty code의 의미 mapping이나 선택 목록을 제공하지 않는다. 다른 항공사의 약어를 제주항공 code로 해석하지 않으며, 수기 보충은 `Remark`로 입력한다. 개인 회사 비행기록의 본인 raw duty code에 FOM credit rule을 적용하는 것은 별도 importer 규칙이며, CrewConnex participant code에서 PIC/FO 인정시간을 산출하지 않는다.

TSV profile은 다음을 추가로 검증한다.

* header가 `Date`, `Activity`, `From`, `To`, `BLH`, `Emp.#`, `CC`, `Pos.` 등 알려진 열 이름과 정확히 매칭되는지
* 실제 clipboard의 탭 구분 열 수가 header와 일관되는지
* 한 duty의 첫 행 뒤에 date/crew가 비어 있는 continuation leg가 올 때, 앞 duty와 연결 가능한지
* `Emp.#`·`CC`·`Pos.`의 줄바꿈 목록이 같은 행 수인지. `|`는 반복 생략 표기로 **검증된 profile에서만** 직전 crew snapshot을 재사용하며, 그 외에는 새 crew를 만들거나 추정하지 않고 review로 보내는지
* `+1` 날짜 rollover, `LAYOV`, `OFF`, `-`, `DH`, `SB2MAX`, `RSV_F` 같은 non-flight activity를 actual FlightRecord로 만들지 않는지
* 모바일 clipboard처럼 `Sum`, `Crew Notes`, `Report Notes`, `Accounts`가 본문보다 **앞·뒤 또는 중간 어느 위치**에 와도, 날짜·Activity를 갖지 않는 summary/notes row를 flight row로 읽지 않는지

## 3. 변경 감지와 안전한 실패

* 기존 profile detector가 일치하지 않으면 import를 중단한다.
* detector는 맞더라도 필수 anchor, 필수 필드, 날짜/시간 형식, expected section 수가 다르면 중단한다.
* 일부 leg만 읽힌 경우에도 자동 확정하지 않는다. staging에 failure 이유와 source row locator를 표시한다.
* 사용자가 `계속`을 눌러 parser 검증을 우회하는 기능은 제공하지 않는다.
* existing actual record는 parse 실패나 재import 때문에 삭제·침묵 변경되지 않는다.

## 4. 유지보수 절차

1. 사용자가 변경된 clipboard TSV 또는 print/PDF를 제공한다.
2. 개인정보·사번·실제 운항 정보를 제거한 fixture와 이전 profile fixture를 만든다.
3. 새 `ParserProfile`을 추가하고 기존 profile regression test를 함께 실행한다.
4. expected candidate, source locator, unknown code, extraction failure fixture를 검토한다.
5. `flutter analyze` 및 parser test 통과 뒤 PWA/native를 배포한다.
6. 실제 기기에서 staging preview와 기존 양식 재import를 확인하기 전 PASS로 기록하지 않는다.

원본 PDF는 import 처리 뒤 앱에 보관하지 않는다. 테스트 fixture도 redacted synthetic 자료만 repository/CI에 둔다.

## 5. 검증 gate

* 현재 확보한 sample은 parser 가능성을 검토한 자료일 뿐 production parser PASS가 아니다.
* 동일 profile의 여러 월·여러 페이지·2개월 파일, 과거/오늘/미래 local-date 혼합, crew 변경, unknown code를 각각 fixture로 둔다.
* 지원되지 않는 layout은 잘못된 candidate 0건과 명확한 오류 안내를 확인한다.
* 새 profile 배포 뒤 이전 profile import가 깨지지 않는지 regression한다.

## 6. duty/activity code와 revision 관찰 기록

CrewConnex는 employer licence/activation이 필요한 roster 제품이므로, 다른 항공사의 약어 의미를 제주항공 code에 자동 적용하지 않는다. V1은 `rawCode`, 원본 label, source page/locator, source date, parser version을 보존·detail 표시하고 의미를 해석하지 않는다.

| 화면/자료에서 관찰한 표기 | 현재 처리 |
| --- | --- |
| `OFF` | 비행 leg가 아닌 활동으로 판별 후 앱·서버에 저장하지 않음; 휴가·법정 rest로 추가 추정하지 않음 |
| `LAYOV (DPS)` | 비행 leg가 아닌 활동으로 판별 후 저장하지 않음 |
| `Pickup to Hotel/Airport` | 비행 leg가 아닌 활동으로 판별 후 저장하지 않음 |
| `Deadhead … AIR` | 독립 활동이면 저장하지 않음. 다만 실제 비행 leg의 crew snapshot에 있으면 participant row로만 보존 |
| `REV`, `RT_G2` | 비행 leg가 아닌 활동으로 판별 후 저장하지 않음; reserve·훈련 의미를 추가 추정하지 않음 |
| `RSV_F`, 그 밖의 unknown | 비행 leg가 아니면 저장하지 않음. flight-leg participant에 연결된 raw code만 evidence·detail 표시용으로 보존하며 의미를 추정하지 않음 |

2026-08 clipboard TSV와 저장소 PDF의 대조에서는 같은 월이라도 시간·BLH·기번·crew 또는 전체 편성이 달라지는 roster revision을 확인했다. 따라서 TSV/PDF는 각각 revision 후보이며, 다르다는 이유만으로 actual FlightRecord를 자동 수정하지 않는다. 2026-06~08 sample의 PDF BLH와 회사 Excel `bt`는 집계상 일치했지만, Excel과 roster 날짜가 다른 leg도 관찰됐다. 이는 parser PASS가 아니라 source comparison evidence이며 날짜를 자동 보정하지 않는 근거다.

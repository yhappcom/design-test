# Flight Logbook V1 Data Schema Specification

> Authority: DATA DOMAIN CONTRACT ONLY
> Status: CURRENT — DATA-001 OPEN
> Source of Truth: [MASTER.md](../../MASTER.md)

상태: **확정된 logbook/profile data requirement를 internal representation으로 고정하기 위한 검토 계약**
최종 갱신: 2026-09-13
상위 기준: [MASTER.md](../../MASTER.md) · [양식/운항 계약](logbook-format-plan.md)

## 1. 목적과 범위

이 문서는 향후 on-device domain, local repository, Sync adapter, Excel/PDF renderer가 공유할 V1 data requirement을 정의한다. 회사 Excel의 source column을 그대로 앱 record에 복제하는 문서가 아니며 현재 canonical repository/persistence/Sync는 구현되지 않았다. 한 비행의 현재 개인 기록, optional external evidence, revision, paper-logbook projection 개념을 구별한다.

* 실제 운항: `FlightRecord`
* FSTD/simulator session: `SimulatorRecord`
* 앱 목록과 logbook profile: 두 entity를 날짜순 하나의 timeline으로 투영
* 수기 FlightRecord: external `SourceEvidence` 없이도 존재 가능한 기본 제품 경로
* 회사 Excel: 선택적 external operational source
* CrewConnex: 기존 record의 최신 편조 snapshot 및 BLH 비교 source. 독립 FlightRecord 생성 source가 아님
* 개인 수정/수기값: current value의 최종 결정

용어: `?`는 null/빈값 허용, `durationSeconds`는 정수 초, `UtcInstant`는 `Z`가 있는 UTC timestamp, `LocalDate`는 `YYYY-MM-DD`다. UI의 `HH:mm`, `H+MM`, decimal, `HH|MM`은 저장 타입이 아니라 formatter다.

## 2. 전체 관계

```text
FlightRecord ──┬── FieldResolution (field별 개인 확정 여부)
               ├── SourceEvidence (company / CrewConnex 최신 근거)
               ├── RevisionHistory (확정 변경 이력)
               └── Operation → Receipt (offline outbox와 server 승인)

SimulatorRecord ── FieldResolution / RevisionHistory / Operation

DeletedEntity (tombstone + 30일 복원 payload)

Page policy/baseline concepts (DATA-001 representation OPEN)
```

`SourceEvidence`는 비행을 별도로 복제하지 않는다. Page policy/baseline concepts도 특정 비행의 속성이 아니다.

## 3. 공통 식별/시간 표현

| 항목 | V1 계약 |
| --- | --- |
| entity ID | UUID 문자열. 기기/서버/backup/import에서 변경하지 않음 |
| owner | 인증 완료 뒤 owner UID. 로그인 전 local record는 owner 미연결 상태 가능 |
| device ID | install별 UUID. 사용자에게는 기기 표시명만 노출 가능 |
| UTC timestamp | R/O·R/I·T/O·L/D 및 revision/operation/receipt time에 사용 |
| source operational date | 회사/CrewConnex가 준 운항일을 `LocalDate`로 별도 보존. UTC timestamp와 혼합하지 않음 |
| duration | canonical 방향은 `durationSeconds`. FOM 분수 credit의 sub-minute 결과에 대한 minute-resolution rounding/truncation policy는 OPEN이며 per-record 절삭을 확정 규칙으로 두지 않음 |
| time display basis | `clock_h_mm`, `decimal_hours`, `split_decimal_hours`, `split_hh_mm`. row는 source basis를 보존하고 total은 항상 `H+MM` |

## 4. FlightRecord

View Logbook `Flight` presentation is confirmed as an IATA-style commercial identifier (2-character carrier designator + 1–4 digit flight number + optional 1-character operational suffix, maximum 7 displayed characters). This does not freeze canonical `FlightRecord` fields such as `carrierDesignator`, `flightNumber`, `operationalSuffix`, raw/source value, or provenance. DATA-001 remains OPEN, combined strings must not be automatically decomposed, and leading-zero normalization remains OPEN.

`FlightRecord`는 실제 항공기 운항 한 leg의 **현재값**이다. 삭제된 record는 일반 목록에서 제외하며 tombstone entity가 삭제 상태를 관리한다.

### 4.1 identity / current state

| Field | Type | 규칙 |
| --- | --- | --- |
| `id` | UUID | immutable |
| `schemaVersion` | int | entity codec version |
| `ownerUid` | string? | 로그인 전 null 가능, 연결 뒤 immutable owner |
| `operationalDate` | LocalDate | required. source 운항일 또는 직접 입력일 |
| `timelineSortAtUtc` | UtcInstant? | R/O가 있으면 그 값, 없으면 null. 같은 날짜의 fallback order는 생성순 |
| `currentRevision` | int | local/server 승인 revision. sync 규칙에 따라 증가 |
| `createdAtUtc` / `updatedAtUtc` | UtcInstant | local 생성/현재값 변경 시각 |

### 4.2 기본 운항 정보

| Field | Type | source / 수정 규칙 |
| --- | --- | --- |
| `flightNumber` | string? | 회사 `fltNo` 또는 수기 |
| `aircraftType` | string? | ICAO Aircraft Type Designator semantic value 방향. FAA JO 7360.1K Appendix A snapshot 기반 lookup reference는 구현됐지만, 회사 `acType` 또는 수기 source의 canonical representation·unknown 입력·provenance는 [aircraft-type-reference-spec.md](aircraft-type-reference-spec.md) 및 DATA-001/AIRCRAFT-REF-001 OPEN을 따른다. |
| `aircraftRegistration` | string? | 회사 `fltAcNo` 또는 수기. `aircraftType`과 별도 semantic field이며 type reference로 추론하지 않는다. |
| `departure` / `arrival` | `AirportRef?` | 회사 `stFr` / `stTo` 또는 수기. 원문 code와 해석된 IATA/ICAO alias를 함께 보존 |
| `rawDutyCode` | string? | 회사 본인 duty code 또는 수기. Crew participant code에는 FOM rule 미적용 |

### 4.3 실제 시각과 raw duration

| Field | Type | 규칙 |
| --- | --- | --- |
| `rampOutAtUtc` | UtcInstant? | OUT/Ramp Out. 검증된 Jeju Air sample의 `fltDat + fltTime` 또는 수기 |
| `rampInAtUtc` | UtcInstant? | IN/Ramp In. 수기/source 또는 `Ramp Out + Block`에서 계산된 derived value; 회사 Excel imported Ramp In으로 표시하지 않음 |
| `takeoffAtUtc` / `landingAtUtc` | UtcInstant? | 수기/maint 근거. 날짜 포함 UTC로 저장 |
| `rawAirborne` | TimeValue? | candidate identifier; semantic은 recorded Actual time. 검증된 Jeju Air `at` 또는 수기. DATA-001에서 최종 field 이름을 결정 |
| `rawBlock` | TimeValue? | 회사 `bt` 또는 수기 |
| `rawNight` | TimeValue? | pilot/company-recorded Night duration. 회사 `ntTme` 또는 수기; solar 계산으로 생성·교체하지 않음 |
| `rawInstrument` | TimeValue? | candidate identifier; semantic은 **Instrument Flight Time**. Maint Log 명칭과 회사 `instTme` 또는 수기. IFR Time/Actual Instrument로 변환하지 않음 |

`TimeValue`는 `{ durationSeconds, displayBasis, rawText? }`다. `rawText`는 import 시 원문 표현을 보존할 필요가 있을 때만 둔다. duration은 source가 decimal이면 정확히 초로 환산하며, `H+MM`를 decimal로 자동 변환해 표시하지 않는다.

### 4.3.1 Record calculation conceptual requirement — CONFIRMED / DATA-001 OPEN

Block (`Ramp out`, `Ramp in`, `Block time`) 및 Actual (`Takeoff`, `Landing`, `Actual time`)은 각각 세 값 관계다. 두 값이 있으면 공통 Record Calculation Engine이 누락된 하나를 derived value로 만들 수 있고, 세 값이 있으면 consistency validation을 수행한다. manual 값은 calculated value보다 우선하며, calculated value는 imported/manual source와 개념적으로 구분 가능해야 한다. clock rollover 정보가 필요한 계산은 잃지 않아야 한다.

이는 data requirement일 뿐 `manual`/`imported`/`calculated`의 enum명, provenance field, derived value 저장 여부, canonical clock/day-offset field/type/codec를 확정하지 않는다. `Block = IN - OUT`, `Actual = ON - OFF`이며 Actual duration 하나로 Takeoff/Landing 두 clock을 복원하지 않는다. Night와 Instrument Flight Time은 이 relationship의 derived target이 아니다. 기존 표의 field들은 schema 후보 계약이며 이 requirement로 DATA-001을 close하거나 persistence/migration을 결정하지 않는다. 상세 behavior는 [Record Calculation Engine spec](calculation-engine-spec.md)을 따른다.

`AirportRef`는 canonical requirement의 candidate이며 `{ sourceCode, sourceCodeKind, iataCode?, icaoCode?, airportDataVersion? }` 형태는 DATA-001 OPEN이다. source code는 절대 교체하지 않는다. 공항 reference에서 **유일하게** 해석되는 경우에만 반대 code를 alias로 채운다. IATA 도시코드, 다중 후보, 미등록 code는 alias를 추정하지 않고 source code만 보존한다. 공항·route 검색은 source code와 IATA/ICAO alias를 모두 대상으로 하되 같은 record는 한 번만 반환한다.

Add Flight의 offline lookup UI는 IATA/ICAO 양방향 code 입력과 `ICAO / IATA` presentation(한 code만 있으면 그 code)을 제공한다. 현재 lightweight `Airport` class/runtime asset은 IATA, explicit ICAO, airport name의 autocomplete subset일 뿐 canonical `AirportRef`가 아니며 좌표 부재는 결함이 아니다. future solar helper의 local coordinate reference architecture는 OPEN이며 current autocomplete model에 강제로 결합하지 않는다.

### 4.4 credited PIC / FO and FOM boundary

FOM REV.77 SP.5.1이 직접 지원하는 personal credit semantic은 context에 따른 PIC 또는 FO 경력시간이다. 그 표를 generic credited Block/Airborne, Night, Instrument Flight Time, PF/PM으로 확장하지 않는다.

| Field candidate | Type | 규칙 |
| --- | --- | --- |
| `creditedPic` / `creditedFo` | CreditedValue? | 수기 또는 preserved raw Duty Code와 필요 context가 있는 verified company/FOM-specific rule에서만 생성 |
| `creditRuleVersion` | string? | 예: FOM REV.77 SP.5.1 |
| `creditRuleEffectiveDate` | LocalDate? | 적용 규칙의 시행일 |
| `creditRuleSourceLocator` | string? | FOM 조항/근거 locator |
| `creditContext` | structured? | 2-set/3-pilot, PIC/non-PIC, H pairing 등 해당 rule에 필요한 context; exact schema는 DATA-001 OPEN |

`CreditedValue` candidate는 numeric duration, origin, ratio/source context를 구별해야 한다. 사용자가 확정한 PIC/FO 값은 raw Duty Code 변경이나 재import가 조용히 덮지 않는다.

- Required SP.5.1/SP.5.2 context and footnotes represented in the fixture: `C`, `L`, `2C`, `PC` → PIC; `F`, `2F`, `NC` → FO; `C1`/`C2` → 1/2 PIC; `F1`/`F2` → 1/2 FO; `3PC` → 2/3 PIC; `3NC` → 1/3 PIC + 1/3 FO; `3F` → 2/3 FO.
- `2NC`/`2NF`, `K`/`Y`/`O`는 표의 비행경력시간 인정 없음을 그대로 반영한다.
- `H`는 C/H captain-check pairing 각주 context 없이 무조건 PIC로 계산하지 않는다.
- `EX`, `R`, `S`, `M`의 `-`를 generic total-only 또는 다른 credited-time rule로 해석하지 않는다.
- 1/2·1/3·2/3 비율은 확인되었지만 sub-minute 결과의 storage/display rounding 정책은 OPEN이다.
- generic personal Total Time / generic credited Block·Airborne mapping은 OPEN이다. profile slot이 `B/T`를 명시하면 Block semantic을 사용할 수 있다.

### 4.5 개인 기록 / output 확장 field

| Field | Type | 규칙 |
| --- | --- | --- |
| `personalTakeoffCount` / `personalLandingCount` | int? | 회사 `toCnt`/`ldCnt=Y`는 1. 직접 입력 GA는 1 이상 가능 |
| `dayTakeoffCount` / `nightTakeoffCount` | int? | 개인 결정/수정값 |
| `dayLandingCount` / `nightLandingCount` | int? | 개인 결정/수정값 |
| `pilotActivity` | `pf` / `pm` / null | verified structured source 또는 user-entered value. T/O/L/D presence로 PF/PM을 추정하지 않음 |
| `crossCountry` | TimeValue? | import source 또는 user-entered value. 출·도착지 차이로 자동 판정하거나 초깃값을 만들지 않음 |
| `ifrTime` / `actualInstrument` / `simulatedInstrument` / `instrumentGroundTime` | TimeValue? | Instrument Flight Time과 각각 다른 semantic. matching source 또는 user entry가 없으면 null; Jeju Air `instTme`를 이 field들로 복사하지 않음 |
| `approachCount` | int? | 수기값 |
| `approachType` | string? | 단일 수기 자유 text. LDT처럼 통계/필수 review 대상 아님 |
| `landingType` | string? | 단일 수기 자유 text |
| `aircraftCategoryClass` | string? | matching source 또는 user-entered value. aircraft type/registration만으로 category/class를 자동 추정하지 않음 |
| `tachometer` | TimeValue? | GA import/reference용. actual/block과 독립, decimal 한 자리·빈값 보존 |
| `remarks` | string? | 수기 text. CrewConnex full snapshot을 중복 입력하지 않음 |

Auto Land count/RWY/RVR·VIS/S·U는 Flight & Maintenance Log의 aircraft operational detail이며 built-in personal-logbook Known Field requirement가 아니다. 이 table에 canonical field를 강제하지 않고 자동 populate하지 않는다. 필요한 사용자는 Custom Field로 추적할 수 있다.

### 4.5.1 Custom Field direction — CONFIRMED / DATA-001 OPEN

User Custom Fields are confirmed product direction, but this table does not freeze their canonical representation. V1 supports manual Text, Duration, and Count values; Clock and formula-derived values are excluded. A Custom Field definition requires stable identity distinct from its display name, and its record value must remain distinct from View Logbook presentation configuration. Owner persistence/Sync, Excel export, and re-import are intended directions; field names, IDs, paths, codec, migration, and conflict flow remain DATA-001 OPEN.

### 4.6 crew

| Field | Type | 규칙 |
| --- | --- | --- |
| `crewSnapshot` | `CrewParticipant[]` | 최신 CrewConnex cockpit/cabin/deadhead snapshot. 본인 포함, employee ID 제외 |
| `manualCrewParticipants` | `CrewParticipant[]` | 사용자가 수기 추가한 participant. CrewConnex 재import가 삭제하지 않음 |

`CrewParticipant`는 `{ name, rawRoleOrPosition?, rawDutyCode?, operatingOrDeadhead? }`다. 직급/employee ID/duty-code 선택 목록은 V1 범위 밖이다.

## 5. SimulatorRecord

FSTD session은 실제 비행·FOM credit·CrewConnex·landing·실제 비행 block 집계와 분리한다.

| Field | Type | 규칙 |
| --- | --- | --- |
| `id`, `schemaVersion`, `ownerUid`, `currentRevision` | 공통 | FlightRecord와 동일 |
| `sessionDate` | LocalDate | required |
| `sessionStartAtUtc` | UtcInstant? | 있으면 timeline sort에 사용 |
| `sessionDuration` | TimeValue? | 수기 입력 |
| `personalTakeoffCount` / `personalLandingCount` | int? | 개인 수기값 |

SimulatorRecord는 simulator 탑승 여부, 날짜, session 시간, 개인 이착륙 횟수만 기록한다. 실제 flight total에 혼입하지 않는다.

## 6. SourceEvidence와 field 확정

### 6.1 SourceEvidence

`SourceEvidence`는 현재 record에 연결된 source snapshot이다. 회사 Excel과 CrewConnex는 역할이 다르므로 같은 record에 각각 하나의 최신 snapshot을 둘 수 있다.

직접 생성한 FlightRecord는 external evidence가 없을 수 있다. manual origin/provenance를 표현하더라도 가상의 외부 source document를 요구하지 않는다.

| Field | Type | 규칙 |
| --- | --- | --- |
| `id`, `schemaVersion`, `recordId` | 식별 | immutable |
| `sourceType` | `company_excel` / `crewconnex_pdf` / `manual` | source 구분 |
| `sourceFingerprint` | string? | 원본 파일은 보관하지 않고 fingerprint만 보관 |
| `sourceLocator` | string? | Excel row / PDF page+leg 등 |
| `parserVersion` | string? | import parser/profile version |
| `importedAtUtc` | UtcInstant | snapshot import time |
| `rawFields` | key/value | 해당 source가 제공한 원문 정규화 field 값 |
| `sourceOperationalDate` | LocalDate? | source date 보존 |

CrewConnex는 기존 `FlightRecord`와 하나로 매칭될 때만 `crewconnex_pdf` evidence와 최신 snapshot을 연결하며, 독립 `FlightRecord`를 만들지 않는다. matching은 편명·구간·기번·block 관계를 우선하고, 날짜는 회사 operational date와 CrewConnex local date의 `-1/0/+1일` 후보로 비교한다. 날짜 차이만으로 자동 보정·오류 판정을 하지 않는다. 재import는 최신 snapshot만 detail 기본값으로 갱신하며 이전 snapshot을 사용자 UI에 표시하지 않는다. user-confirmed current value는 어떤 external source도 조용히 덮지 않는다. 회사 operational source와 CrewConnex roster source는 field-specific evidence role이 다르며, CrewConnex BLH/편조는 current operational field를 조용히 덮지 않는다.

### 6.2 FieldResolution

값이 달랐을 때의 사용자 선택을 별도 entity로 둔다. value 자체는 `FlightRecord`에 있으며, 이 entity는 해당 value를 이후 source가 자동 바꾸지 못하도록 하는 근거다.

| Field | Type | 규칙 |
| --- | --- | --- |
| `recordId` / `fieldKey` | 식별 | field별 하나의 current resolution |
| `mode` | `source_auto` / `manual_edit` / `manual_retain` | 현재값의 결정 방식 |
| `confirmedRevision` | int | 개인 확정이 만든 revision |
| `confirmedAtUtc` | UtcInstant | 개인 확정 시각 |
| `comparedEvidenceId` | UUID? | `manual_retain`이면 비교한 회사 source evidence |

`manual_retain`은 수기값과 회사값이 달라 사용자가 **수기값 유지**를 눌렀을 때 값 변화가 없어도 생성한다. 이후 재import는 source evidence만 갱신하며 해당 field를 자동 변경하지 않는다.

## 7. 동기화 entity

| Entity | 필수 field | 역할 |
| --- | --- | --- |
| `Operation` | `operationId`, `schemaVersion`, `ownerUid`, `deviceId`, `entityType`, `entityId`, `kind`, `payloadPatch`, `baseRevision?`, `createdAtUtc`, `status` | local 변경과 동시에 durable outbox에 기록. `kind`는 create/update/delete/restore/resolution |
| `Receipt` | `operationId`, `ownerUid`, `serverRevision`, `serverCommitAtUtc`, `cursor` | server가 operation을 승인한 결과 |
| `RevisionHistory` | `entityId`, `revision`, `operationId`, `deviceId`, `commitAtUtc`, `kind`, `changedFieldKeys` | immutable history. 평소 UI 표시는 필수 아님 |
| `SyncState` | `ownerUid`, `deviceId`, `lastAppliedCursor`, `lastSyncAtUtc`, `lastError?` | device별 pull/push 상태 |

local의 entity update와 `Operation` enqueue는 하나의 transaction이다. pending operation이 없는 오래된 local 사본은 sync할 때 server 변경을 받기만 하며, 자체적으로 server에 upload하지 않는다.

## 8. 삭제와 복원

| Entity | Field / 규칙 |
| --- | --- |
| `Tombstone` | `entityType`, `entityId`, `schemaVersion`, `deletionRevision`, `deletionOperationId`, `deletedAtUtc`, `ownerUid`. active 목록에서 제외하기 위한 최소 marker |
| `DeletedPayload` | 복원 UI용 30일 payload. tombstone과 연결하며 만료 뒤 제거 |

삭제는 tombstone operation이며, 일반 목록·검색·집계에서 즉시 숨기고 30일간 휴지통 payload를 보관한다. 휴지통 복원은 같은 entity ID의 새 restore operation이다. V1에는 record별 `영구 삭제` UI를 제공하지 않는다. 30일 뒤에는 payload만 제거하고 최소 tombstone은 계정 유지 중 남긴다. 삭제된 뒤 오래 offline인 기기가 수정 없이 sync하면 tombstone을 받아 local에서 삭제한다. offline 기기에서 실제 update operation을 만든 뒤 sync하면, server가 나중에 승인한 update가 restore revision이 될 수 있다.

## 9. 종이 로그북 page policy / baseline direction — CONFIRMED requirements, DATA-001 OPEN

The future representation needs a manual page-start anchor tied to stable `FlightRecord.id`, never a mutable row index. It may also need rows-per-page configuration and a simple manual initial Previous Total for cumulative totals before LogMate-known records. Exact entity names, field names, types, segment representation, baseline linkage, codec, migration, and persistence are not frozen.

`PreviousTotalBaseline` and `OpeningBalance` remain distinct concepts and must not be double counted in output. The former is the page-chain cumulative starting point; the latter denotes prior career balance. This direction does not add a detailed opening-baseline wizard or per-aircraft/role breakdown schema.

## 10. schema version과 migration

### 10.1 version 위치

각 sync/backup codec entity에 `schemaVersion`을 둔다. `.lbk`에는 전체 `manifestSchemaVersion`과 포함 entity version 목록을 둔다. data Excel은 활성 FlightRecord/SimulatorRecord의 current field만 export하며 별도 metadata sheet, source evidence, revision history, tombstone, 휴지통 payload를 포함하지 않는다.

### 10.2 V1 이후 migration 규칙

1. optional field 추가는 이전 record에 null을 넣고 의미를 추정하지 않는다.
2. field 이름·형식·의미 변경은 새 entity version으로 변환한다. 기존 raw value·개인 확정값·source evidence는 삭제하지 않는다.
3. migration은 local transaction으로 수행한다. 앱 종료·저장 공간 실패 때는 변환 전 상태 또는 완전 변환 상태만 남아야 한다.
4. migration은 사용자에게 보이는 자동 `.lbk` backup을 새로 만들지 않으며, 기존 local data를 임의 overwrite하지 않는다. 변환은 transaction의 임시 상태를 통해 원자적으로 끝낸다. `.lbk` import도 같은 migration을 거친다. 과거 POC의 empty-ledger restore와 non-empty merge/replace/reset 제품 정책은 구분하며, 후자는 BACKUP-001 OPEN이다.
5. 변환할 수 없는 값은 자동 보정하지 않는다. 해당 entity를 `복구 필요`로 표시하고 원문/오류를 보존한다.
6. future product Sync를 구현할 때 server는 지원 가능한 entity version만 승인해야 한다. 현재 Functions에는 account lookup만 있고 product Sync는 구현되지 않았다. endpoint 이름과 version negotiation은 DATA-001/Sync design OPEN이다.
7. migration fixture는 변환 전후의 current field, page total, opening balance, tombstone, revision/order를 비교한다.

## 11. V1 schema 상태

지원되는 logbook/profile field-layout evidence와 matching source semantic만 현재 계약에 반영한다. source가 공급하지 않는 profile semantic은 blank/user-entered 또는 OPEN이다. 이 문서는 internal representation 후보를 보존하지만 entity/field name, type, codec, version, migration의 최종 freeze는 DATA-001 OPEN이다.

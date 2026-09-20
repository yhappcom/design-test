# LogMate Validation Results

Authority: **VALIDATION EVIDENCE ONLY**
정리 기준일: 2026-09-07 · Migration 2 경로 정리 · 제품 결정: [MASTER.md](../../MASTER.md)

## 문서 역할

이 문서는 제품 사양이 아니라 현재 해석된 검증 결과와 그 범위를 보존하는 evidence ledger다. 이번 작성에서는 기존 기록과 현재 source를 읽었으며 앱 테스트·빌드·실기기 시험·Firebase/DNS 조회를 실행하지 않았다. 아래 POC VERIFIED는 **과거 실행 기록에 근거한 판정**이며 독립적인 재현 결과가 아니다.

관계: **POC 원문(당시 실험) → 이 문서(관찰·범위·한계 해석) → MASTER(채택된 제품 결정)**. 원문의 계획·중간 상태·최종 결과를 구별하고, 실패 기록을 후속 PASS로 지우지 않는다. 미실행은 실패가 아니며 원인 후보는 확정 원인이 아니다.

과거 저장소 `flight_logbook`과 현재 제품 `logmate`를 구별한다. [legacy POC ledger](../../archive/poc/legacy-poc-ledger.md)의 “현재 foundation”은 당시 prototype을 의미할 수 있으며 현재 제품 구현 증거로 사용하지 않는다.

## P2P / WebRTC

### 목적·원본

Safari PWA offline 사용, local 보존·파일 복구, 서버 없는 기기간 전송과 일부 무결성을 확인한 2026-08-22~28 실험이다.

- [계획 원문](../../archive/poc/p2p-webrtc/poc-p2p-webRTC-plan.md): C0~D3 조건, 「POC 완료 후 남길 결과 기록」.
- [결과 원문](../../archive/poc/p2p-webrtc/poc-p2p-webRTC-results.md): B0~B3 최종 판정, 「P2P transport 결정 기록」, 「2026-08-23 작업 종료 시점」, 「2026-08-28 재개」.
- [보존 source](../../archive/poc/p2p-webrtc/source/README.md).

### 검증 범위 / PASS

| ID | 당시 범위 | Evidence |
| --- | --- | --- |
| P2P-B0 | CDN-free·full precache·local font 반영 후 Safari bookmark/new-tab offline readable UI | POC VERIFIED — 기록된 B0 최종 build 한정 |
| P2P-B1-B3 | IndexedDB record, 다중 revision/tombstone digest, Files `.lbk` offline export/import | POC VERIFIED — 당시 진단 dataset·절차 한정 |
| P2P-C1 | 양방향 QR 식별자·offer/answer 교환 | POC VERIFIED — 카메라/교환 흐름만. 보안 pairing 전체 PASS 아님 |
| P2P-C2 | 동일 LAN host-only DataChannel에서 양방향 HELLO→ACK 각 10회 | POC VERIFIED — 동일 LAN 한정, WAN 차단 미검증 |
| P2P-C3-C4 | 양방향 fake record payload/ACK, 단일 record 영속 수신·receipt·중복 ACK, iPhone 재시작 | POC VERIFIED — 단일 record 계약 범위 |
| P2P-D0 | A/B/C와 A/B/D를 초기 record 포함 5건으로 수렴, 재동기화 전송 0건 | POC VERIFIED — 기본 집합 비교·누락 전송만 |
| P2P-C4.1 | 일부 pending 재전송·acknowledged 보존 | POC VERIFIED — 해당 수동 재연결 관찰만 |

### FAIL / INCONCLUSIVE / limitation

- POC FAILED: 초기 B0 offline 흰 화면, B0.6 runtime/card 도달 후 텍스트가 읽히지 않음. local renderer/font·precache와 fresh origin을 적용한 후속 B0 결과와 구별한다.
- B0.2~B0.4의 일부 원인 분리 결론은 pre-`runApp()` JavaScript bridge 예외로 원문에서 무효화됐다. 유효한 cache 원인 증거로 재사용하지 않는다.
- POC INCONCLUSIVE: EFB 홈 화면 추가에서 아이콘이 생성되지 않은 원인은 미확정이다. 설치 경로는 당시 BLOCKED이며 Safari 탭 PASS를 Home Screen 설치 PASS로 확대하지 않는다.
- C1 nonce/만료/일치 코드·trusted pairing, N2 WAN 차단, 실제 회사 Wi-Fi/N4의 적용 범위, native 무망 transport, 전체 D1 충돌 해결·D2 삭제·D3 자동 재연결은 통과하지 않았다.
- D0 outbox 보강의 IndexedDB version 결함은 수정본 실기기 재시험이 남았다. 2026-08-28 새 preview B0/D0도 RETEST 대기다. 이전 성공을 그 build로 승격하지 않는다.
- QR scanner의 외부 CDN 의존 관찰은 해당 B0/D0 재시험 범위 밖 기록이다. 이 관찰만으로 C1 전체 PASS/FAIL을 뒤집지 않는다.

### Evidence Conflict — POC-001

**USER DECISION REQUIRED:** results는 전송 상대를 EFB/iPhone으로, plan의 누적 결과표는 개인 iPad/iPhone으로 기록한다. 실제 전송 시험 기기·build를 확정할 추가 기록이 필요하다. 동일 LAN 전송의 제한적 결과는 보존하되 **회사 EFB 전체 환경에서 검증됨**이라고 쓰지 않는다.

### 현재 제품 반영·추가 검증

기본 Sync는 Firebase 방향이며 반복 QR P2P는 기본 경로에서 제외했다. local-first·receipt/outbox·offline delivery의 실패 방지 원칙을 참고한다. 향후 P2P 보조 기능 채택은 Master SYNC-001이 OPEN이다. 재채택 전 기기 식별, 회사망, 보안 pairing, 삭제·단절·재연결 검증이 필요하며 현재 제품에는 P2P가 구현되어 있지 않다.

## Persistence

### 목적·원본

Sembast 후보로 record와 outbox의 원자성·재시작 지속성을 검증하고 실제 원장·backup·scale로 확장한 실험이다.

- [Persistence 원문](../../archive/poc/persistence/persistence-poc.md): 실제 작성/검증일 2026-08-30. 기존 archive 폴더 날짜 2026-09-02와 구별한다.
- [후속 실행 원문](../../archive/poc/legacy-poc-ledger.md): 「현 제품 foundation 판정」 뒤 2026-08-31의 Files·A0~A2·scale 기록. 중간 판정표보다 뒤의 해당 실행 결과를 함께 읽는다.

### 검증 범위 / PASS

| ID | 날짜·대상/build | Evidence |
| --- | --- | --- |
| LOCAL-TX | 2026-08-30 memory 및 Chrome IndexedDB | POC VERIFIED — record/outbox reopen, 고의 오류 rollback |
| LOCAL-PROBE | 2026-08-30 EFB v4 / iPhone signed Release | POC VERIFIED — record/outbox 1/1 저장 후 종료·재시작; EFB offline |
| LOCAL-LEDGER | 2026-08-30 EFB v5 / iPhone Release | POC VERIFIED — create/update/delete/same-ID restore/search/page-total 재시작 기록 |
| LOCAL-FILES | 2026-08-31 EFB m1lbksafariio-20260831 / iPhone Release | POC VERIFIED — `.lbk` 선택·summary·빈 원장 restore·재시작 보존, non-empty 차단의 기록된 범위 |
| LOCAL-A0-A2 | 2026-08-31 EFB m1accepta02sim-20260831 / 후속 iPhone Release | POC VERIFIED — fixture offline 재시작, 생성·수정, 삭제·복원·재시작 |
| LOCAL-SCALE | 2026-08-31 EFB m1scalebulk-20260831 / 후속 iPhone Release | POC VERIFIED — 3,300 record + outbox 생성, SCL 3,300/무관 검색 0, offline 재시작 |
| LOCAL-PAGE | 과거 domain/Sembast 자동 기록 | POC VERIFIED — PAGE-alpha-3 및 resolver의 명시된 fixture. 7개 출력 renderer 전체 PASS 아님 |

### FAIL / INCONCLUSIVE / limitation

- POC FAILED: 후속 page-policy/simulator build의 full-precache 누락에 따른 offline 진입 실패. 수정 후 새 origin shell PASS와 구분한다.
- POC FAILED: `m1lbkpickfix-20260831`의 Safari Files spinner/선택 미완료. window-focus 옵션만 바꾼 수정은 충분하지 않았다.
- 후속 `m1lbksafariio-20260831`에서는 input 유지·change handler 즉시 FileReader 경로로 Files 선택/복원/재시작 PASS가 기록됐다. 과거 generic picker 전체를 모든 환경에서 불가능하다고 판단하지 않는다.
- 개별 transaction seed의 지연 뒤 bulk transaction과 진행률을 적용했다. scale PASS는 정량 latency benchmark나 모든 검색 조합 검증이 아니다.
- Sembast는 당시 SDK/package 조합의 후보 검증이다. Drift는 선택하지 않은 대안이며 POC FAILED가 아니다.
- 원문의 초기 “미검증” 설명과 후속 실제 원장 결과가 공존한다. full migration·모든 fault·장기 browser 보존까지 검증됐다는 결론은 POC INCONCLUSIVE다. 미실행 조건은 PASS로 채우지 않는다.
- origin 삭제/eviction 뒤 offline 복구, 전체 export renderer, 현재 LogMate repository의 안전성을 증명하지 않는다. A0~A2와 Sync 관련 A3를 구별한다.

### 현재 제품 반영·추가 검증

local transaction/outbox·빈 원장 restore·기기별 restart acceptance를 제품 방향에 반영한다. 현재 LogMate persistence는 NOT IMPLEMENTED다. adapter 선택·schema/migration 정리 후 현재 코드에서 transaction, restart, corrupt backup, 파일 UX, 복구 상태를 검증해야 한다.

## Firebase Auth / Server Sync

### 목적·원본

verified owner의 여러 기기가 같은 원장을 서로 다른 시점에 서버로 전달하는 경로를 검증했다. [legacy POC ledger](../../archive/poc/legacy-poc-ledger.md)의 2026-09-01 M2 및 M3 재착수, 2026-09-02 SYNC-3·PWA 회귀 기록이 근거다.

[report-source.md](../../archive/research/report-source.md)는 연구 보고서다. encrypted snapshot 권고와 current-state baseline 결정이 혼재하며 실행 PASS 증거가 아니다.

### 검증 범위 / PASS

| ID | 날짜·대상 | Evidence |
| --- | --- | --- |
| SERVER-OWNER | 2026-09-01 과거 M2, EFB Safari / iPhone signed Release / Rules Emulator | POC VERIFIED — EFB 가입·메일 인증·명시적 binding, iPhone 동일 verified UID binding은 실기기 기록. 다른 UID read/write 거부는 Rules 자동 기록. 현재 제품의 owner binding PASS 아님 |
| SERVER-AUTO | 2026-09-01 M3 재착수 emulator | POC VERIFIED — A create·duplicate receipt·B create/cursor pull·A pull, 명시된 cursor 결과 |
| SERVER-SYNC3 | 2026-09-02 EFB PWA / iPhone, m3sync3-20260901 delivery 뒤 사용자 확인 | POC VERIFIED — 같은 verified owner, device-unique create 양방향 전달, 각 반대 기기 1회 표시, pending 0 |

SERVER-SYNC3는 최소 create/push/receipt/pull 수렴이다. timeout/restart/legacy/delete/baseline recovery·scale Sync는 범위 밖이다. 9월 1일 delivery smoke나 signed installation 자체를 실기기 수렴 PASS로 사용하지 않는다.

### FAIL / INCONCLUSIVE / limitation

- POC FAILED: web callable codec `Int64 accessor not supported by dart2js`. 후속 JSON-safe direct HTTPS transport 기록을 보존한다.
- legacy operation payload/entity ID mismatch는 validation 오류 기록이다. 실제 사용자 원장 삭제·reset을 해결책으로 일반화하지 않는다.
- offline Sync 실패 후 online retry 성공 관찰이 있으나 모든 기기의 failure→force-close→restart 보존 PASS는 아니다.
- POC FAILED: 2026-09-02 M3 PWA offline 새 탭의 백지. fresh preview에서도 HTML/runtime/controller/cache는 보였지만 읽을 수 있는 Flutter UI가 없었다.
- POC INCONCLUSIVE: 해당 회귀의 최종 원인. local Roboto 누락 보완 뒤에도 백지가 계속됐다는 종료 기록이 있다. pre-`runApp()` Firebase await는 유력 후보이며 수정·재검증 완료가 아니다.
- POC 종료는 조사 종료다. 마지막 prototype의 offline gate, M4 fault/recovery, 비용·계정 삭제 운영까지 모두 PASS라는 뜻이 아니다.

### 현재 제품 반영·추가 검증

Firebase server Sync 기본 방향과 immutable operation/receipt/cursor 경계를 채택한다. 현재 LogMate는 Auth adapter·account lookup만 존재하고 ledger binding·syncBatch·baseline 복원은 NOT IMPLEMENTED다. 제품 통합 후 Rules, revision/delete ordering, timeout/retry/restart, baseline 복구, fresh-origin EFB readable UI를 각각 검증한다.

## 현재 LogMate 검증 기록

| 날짜·대상 | 수행한 확인 | 결과와 한계 |
| --- | --- | --- |
| 2026-09-07 Migration 1, 현재 작업 트리 | Home/detail/Custom/Totals/Settings/Auth/date formatter·tests source 열람 | UI shell·mock 및 빈 콜백/미연결 경계를 확인. 현재 기능·실기기 PASS 판정 아님 |
| 같은 작업 | 기존 POC 원문과 후속 결과 대조 | 위 범위로 재구성. POC-001 기기 충돌은 미해결 |

현재 앱의 [widget tests](../../test/widget_test.dart)와 [date tests](../../test/date_formats_test.dart)는 존재하지만 이번 작업에서 실행하지 않았다. 테스트가 mock injection/화면 구조를 확인한다는 사실과 실제 계산·persistence·Sync 검증은 구별한다. Firebase/DNS·sender/template는 외부 조회하지 않았다.

## 향후 기록 규칙

각 결과는 `ID`, 실행 날짜, 대상 저장소·commit 또는 작업 트리/build ID, 기기/OS·origin·네트워크, 입력/절차, 실제 관찰, 판정, 미검증 범위, 원본 링크를 함께 기록한다. 모르는 값은 미확인으로 남긴다. 재시험 결과는 이전 실패를 삭제하지 않고 대체되는 **동일 범위**를 명시한다.

자동 테스트, browser smoke, readable UI, 실제 기기 저장·복원, 서버 수렴, 운영 설정 확인은 별개의 증거다. 새로운 제품 결정을 이 ledger에서 만들지 않고 Master의 Decision 항목으로 연결한다.

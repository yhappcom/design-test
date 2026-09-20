# Tablet/EFB PWA Offline Acceptance Contract

> Authority: OFFLINE ACCEPTANCE CONTRACT ONLY
> Status: CURRENT PRODUCT ACCEPTANCE DIRECTION — current local-ledger acceptance NOT RUN / NOT PASS
> Source of Truth: [MASTER.md](../../MASTER.md)

최종 갱신: 2026-09-13
관련: [fixture-spec.md](fixture-spec.md) · [test-contract.md](test-contract.md)

## 1. 목적과 현재 경계

이 문서는 real tablet/EFB Safari PWA가 Firebase availability 없이도 core personal Pilot Logbook을 사용할 수 있어야 한다는 future acceptance를 정의한다. native와 tablet/EFB PWA는 모두 first-class target이며 같은 domain input은 같은 semantic/calculation/projection result를 내야 한다.

현재 확인된 범위:

- first Flutter frame은 Firebase session initialization 완료를 기다리지 않는다.
- PWA build에는 CDN-free 옵션과 full generated-resource precache tooling이 있다.
- current signed-out path는 Home이 아니라 Opening으로 들어간다.
- local canonical ledger/persistence와 product Sync는 구현되지 않았다.

따라서 signed-out local entry, offline ledger create/edit/search/restart, delayed Sync는 현재 PASS가 아니다. 과거 POC PASS는 [validation-results.md](../evidence/validation-results.md)의 해당 build/device/scenario에만 유효하다.

## 2. 공통 real-device 준비

| 항목 | Future acceptance 기준 |
| --- | --- |
| 기기 | 실제 iPad/tablet Safari PWA 또는 실제 managed EFB 진입 경로. Simulator/desktop만으로 대체하지 않음 |
| build | 고유 build identifier와 clean preview/production-equivalent origin |
| data | synthetic test owner와 synthetic records만 사용 |
| install/cache | online 완전 진입, service-worker control과 generated resources 준비를 확인한 뒤 종료 |
| network isolation | airplane mode 또는 Wi-Fi/cellular 차단. Firebase만 mock 처리한 desktop test로 대체하지 않음 |
| evidence | OS/browser/build/time, step 결과, error text, non-sensitive screenshot/recording |

Safari storage eviction이나 사용자의 website-data 삭제는 일반 offline persistence와 별도 recovery scenario다. origin data가 사라졌는데 기존 ledger가 있는 것처럼 표시해서는 안 된다.

## 3. Core acceptance scenarios

아래 A/B ID는 과거 milestone ownership이 아니라 재사용 가능한 scenario identifier다. 구현 시점의 current build에 대해 다시 실행·기록해야 한다.

### A0 — Firebase unavailable app-shell re-entry

1. online에서 target PWA를 완전히 준비하고 종료한다.
2. Firebase/network availability를 제거한다.
3. 실제 EFB/Safari 진입 경로에서 PWA를 다시 연다.

Future PASS:

- app shell이 열린다.
- Auth/network failure를 local core data loss나 false Sync success로 표시하지 않는다.
- local owner-bound data가 있으면 읽을 수 있고, owner binding이 불명확하면 AUTH-001의 recovery boundary를 안전하게 표시한다.

현재 signed-out local Home path가 없으므로 이 scenario의 full product PASS를 주장하지 않는다.

### A1 — Offline manual create/edit/search/restart

local canonical ledger가 구현된 뒤 synthetic FlightRecord를 manual로 만들고 기존 record를 수정하며 route/airport/crew/Remark를 local search한다. 종료 후 network 없이 재실행한다.

Future PASS:

- create/edit/search 결과가 restart 뒤에도 durable local state로 남는다.
- normal calculation/search/aggregation은 Firebase query 없이 동작한다.
- pending Sync가 있으면 명시하고 성공 receipt 없이 synchronized 상태를 표시하지 않는다.
- same input의 native/PWA semantic 및 projection 결과가 같다.

### A2 — Offline delete/restore and totals

synthetic record를 삭제해 active list/search/totals에서 제외하고, local recycle-bin policy로 같은 record를 복원한 뒤 page projection과 totals를 확인한다.

Future PASS:

- delete/restore가 restart 뒤에도 일관된다.
- blank presentation rows나 deleted records가 totals에 섞이지 않는다.
- exact retention/tombstone policy는 해당 data/Sync contract와 test fixture가 구현된 범위에서만 판정한다.

### A3 — Offline Sync failure presentation

pending local operation이 있는 상태에서 explicit Sync를 시도하고 종료·재실행한다.

Future PASS:

- local data와 pending operation이 유지된다.
- failure/pending을 success로 표시하지 않는다.
- background/closed-app immediate Sync를 보장하지 않는다.

### B — Foreground reconnect and owner Sync

product Sync가 구현된 뒤 foreground reconnect 또는 explicit Sync로 A scenarios의 pending operation을 전송하고 second device에서 convergence를 확인한다.

Future PASS:

- server acknowledgement 전에는 synchronized로 표시하지 않는다.
- user-confirmed current value가 external source나 conflict merge로 침묵 속에 덮이지 않는다.
- retry/duplicate에도 duplicate record와 silent loss가 없다.
- two-device convergence와 owner isolation이 current protocol contract와 일치한다.

## 4. Firebase-unavailable core gate

future local-first acceptance는 실제 Safari PWA에서 Firebase endpoint가 이용 불가능한 동안 다음 core behavior를 검증해야 한다.

- manual flight entry
- local record read/update
- local deterministic OOOI/Block/Actual calculation
- local search and aggregation
- View Logbook projection
- local import parsing/matching/reconciliation when file access is available on the platform

Firebase Auth/owner Sync는 connectivity layer이며 위 normal operations의 runtime query backend가 아니다. platform-specific file/persistence/Sync adapters와 responsive UI 차이는 허용하지만 semantic 결과는 같아야 한다.

## 5. Delivery and cache acceptance

make build-pwa는 현재 repository의 web build target이다. build tooling 존재만으로 real-device offline acceptance가 PASS하지 않는다.

새 build의 delivery check는 고유 origin에서 online 완전 진입, service-worker control, reload, full URL bookmark, network isolation, new-tab/relaunch 순서를 기록한다. 기존 origin cache가 새 code를 가릴 수 있으므로 build identity와 service-worker state를 evidence에 포함한다.

## 6. 판정과 evidence

- automated unit/integration PASS는 real iPad/EFB acceptance를 대체하지 않는다.
- A scenario 중 data loss, false Sync success, Firebase 의존 core failure가 있으면 FAIL이다.
- local data가 기대되는데 Safari storage가 사라진 경우는 offline PASS가 아니라 별도 recovery result다.
- B는 product Sync가 구현되고 acknowledged/converged behavior가 확인된 뒤에만 PASS다.
- 모든 실행 결과는 build/device/scenario 한계를 명시한다. [validation-results.md](../evidence/validation-results.md)는 historical evidence이며 과거 문구를 현재 정책에 맞춰 다시 쓰지 않는다.

# LogMate Startup and Authentication Entry Spec

> Authority: STARTUP / AUTH UI CONTRACT ONLY
> Status: CURRENT — OPEN ITEMS EXIST
> Source of Truth: [MASTER.md](../../MASTER.md)

최종 갱신: 2026-09-13
적용 단계: UI/UX structure and navigation
상위 기준: [MASTER.md](../../MASTER.md)

## 1. 화면을 둘로 나눈다

| 단계 | 소유자 | 목적 | 포함하지 않는 것 |
| --- | --- | --- | --- |
| Native launch surface | iOS / Android system | 첫 Flutter frame 전 색 전환 없이 빠르게 보이기 | 로그인 버튼, network wait, 가변 문구, 별도 onboarding |
| Opening screen | Flutter/LogMate | 제품 이름과 이메일 진입점을 사용자에게 명확히 제시 | roster 기능, 실제 로그북 data, provider 로그인 |

native splash는 앱 화면이 아니다. Android 12+는 system SplashScreen이 icon과 단색 window background를 표시하고, iOS/iPadOS launch screen은 정적이며 텍스트를 현지화할 수 없다. 따라서 제품 이름과 버튼은 **Opening screen**에만 둔다. native surface는 현재 appearance에 맞는 단색 background로 하여 opening screen과 flash 없이 이어진다. 별도의 1–2초 branded splash나 timer delay는 만들지 않는다.

공식 기준: [Android SplashScreen](https://developer.android.com/develop/ui/views/launch/splash-screen), [Apple launch screen guidance](https://developer.apple.com/design/human-interface-guidelines/launching).

## 2. Native launch surface

- light: warm-neutral/light surface 한 색.
- dark: near-black/navy-neutral surface 한 색.
- orientation과 appearance mode에 맞는 resource를 제공한다.
- 별도 logo asset은 만들지 않는다. Android system icon은 출시용 app icon으로만 사용한다.
- Flutter/Firebase/Auth initialization이 느려도 splash를 인위적으로 연장하지 않는다. local-first app은 첫 frame을 먼저 그리고, 이후 state를 비동기로 갱신한다.

## 3. Flutter Opening screen

### Layout

```text
safe area

            LogMate
          Pilot Logbook
              (upper-middle)

            flexible space

       [ Continue with email ]

    Your logbook stays available offline.
```

- title group은 portrait/landscape 모두 화면 세로의 약 28–34% 위치에 둔다. absolute pixel 값이 아니라 safe-area와 available height를 기준으로 정렬한다.
- `LogMate`는 system default typeface의 large bold wordmark다. `Log`와 `Mate`는 `TextSpan`으로 분리한다.
- `Pilot Logbook`은 둘째 줄의 smaller medium weight subtitle이다.
- email button은 bottom safe-area 바로 위가 아니라, 충분한 breathing room을 둔 lower content 영역에 둔다. 52–56 dp 높이, full available width, 약 12 dp corner radius를 사용한다.
- 버튼 아래 한 줄은 local-first의 핵심만 설명한다. 계정이 없거나 network가 없어도 product가 local 사용을 시작할 수 있다는 약속과 모순되지 않아야 한다.
- iPad/EFB landscape에서는 title은 upper-middle, button container는 readable max width(예: 360–420 dp)로 중앙 정렬한다. iPhone에서는 horizontal padding을 유지하고 full width를 쓴다.

### Theme and type

- custom font를 사용하지 않는다. iOS는 SF 계열, Android는 Roboto 등 platform system default가 나온다.
- light/dark는 OS setting을 기본으로 따르며 Settings에서 사용자 선택 override를 제공할 수 있게 token으로 정의한다.
- title의 `Log`는 light에서 near-black, dark에서 near-white다.
- title의 `Mate`는 light/dark에서 서로 다른 semantic mint token을 쓴다.
- title의 decorative color만으로 의미를 전달하지 않는다. `LogMate` 전체 text와 subtitle이 항상 충분히 읽혀야 한다.

## 4. MintTap color token 결정 필요

제안에 포함된 값은 서로 다른 색이다.

| 이름 | hex | 제안 역할 |
| --- | --- | --- |
| `brandMintLight` | `#A8F0E9` | dark surface 위의 soft accent/surface. light mode body text에는 사용하지 않음 |
| `brandMint` | `#00A693` | dark mode title/action accent, light mode icon/fill accent |
| `brandMintOnLight` | 별도 확정 필요 | light background 위 작은 text/outline에 쓸 접근성 있는 더 진한 mint/teal |

`#A8F0E9`와 `#00A693`을 같은 `Color`에 동시에 지정할 수 없다. 구현 전 MintTap의 canonical primary token과 light-surface accessible variant를 확정한다. 그 전에는 `Mate` wordmark를 dark mode `#A8F0E9`, light mode `#00A693`으로 시연하되, light mode 작은 텍스트·button label에는 사용하지 않는다.

## 5. Current implementation boundary

현재 `main.dart`는 `runApp()`으로 첫 Flutter frame을 요청한 뒤 Firebase session initialization을 비동기로 시작한다. Firebase initialization 자체를 native splash에서 기다리지 않는다.

그러나 현재 `SessionGate`의 signed-out path는 항상 Opening screen으로 들어가며 signed-out local Home/ledger entry는 구현되지 않았다. canonical local ledger, owner binding/recovery, product Sync도 구현되지 않았다. 아래 local-first entry/rebinding은 제품 requirement이며 exact behavior는 AUTH-001 OPEN이다.

## 6. Email entry flow

Opening screen의 button label은 **Continue with email**이다. 버튼을 누르면 다음 Flutter screen으로 이동한다.

```text
Opening
  → Email entry
      → Sign in (existing account)
      → Create account (new account)
      → Verify email status
  → future local-ledger binding / Sync-ready state (AUTH-001 OPEN)
```

- opening 화면은 email/password field를 직접 노출하지 않는다.
- 다음 화면에서 Sign in과 Create account를 명확히 분리한다. Firebase의 provider가 email/password 하나이므로 Apple/Google/social button은 넣지 않는다.
- 제품 requirement로서 Auth/network failure는 향후 local ledger 사용을 파괴하거나 차단하지 않아야 한다. signed-out 상태에서 product UI로 돌아가는 exact entry/rebinding/recovery UX는 AUTH-001 OPEN이며 현재 구현되지 않았다.
- 계정은 여러 기기의 하나의 개인 원장을 연결하는 수단이며, onboarding의 주인공이 아니다.

### Returning launch behavior — product requirement, not current implementation

- signed-out 또는 아직 local ledger를 owner에 연결하지 않은 사용자는 Opening screen에서 시작한다.
- 이미 local ledger와 owner binding이 있는 사용자는 native launch 뒤 **Opening을 거치지 않고** Home 또는 복원 가능한 마지막 product location으로 바로 들어간다.
- network/Auth refresh가 늦어도 local Home·Timeline·Logbook을 가리는 loading splash를 만들지 않는다. Sync/Auth status는 해당 제품 화면에서 비차단 상태로 갱신한다.

## 7. P0 sample states

1. native launch light/dark → Flutter opening 전환
2. opening portrait / landscape / iPad split width
3. opening → email entry navigation
4. email entry signed-out, Sign in, Create account, verification-needed, network-error
5. back to local-first product flow

## 8. 구현 전 확정할 항목

1. `#A8F0E9`와 `#00A693` 중 MintTap의 canonical brand token 및 light-mode text variant
2. Opening button 하단의 one-line local-first copy
3. AUTH-001 signed-out local entry와 owner binding/recovery UX

첫 두 항목은 opening presentation의 남은 결정이고, AUTH-001은 local ledger가 구현될 때 별도 제품 결정을 요구한다. 현재 구현된 Opening/Email entry 범위를 이 문장이 미구현으로 되돌리지 않는다.

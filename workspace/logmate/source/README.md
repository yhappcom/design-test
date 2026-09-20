# LogMate - Pilot Logbook

프로젝트 작업 안내: [AGENTS.md](AGENTS.md)

현재 제품 상태·확정 결정·구현 범위·미정사항의 단일 기준: [MASTER.md](MASTER.md).

MintTap이 만드는 조종사용 개인 Pilot Logbook이다. 수기 입력만으로 제품을 사용할 수 있고 import는 선택이다. 핵심 작업은 local/on-device에서 수행하며 Firebase Auth와 owner Sync는 local operation 위의 cloud-minimal connectivity layer다. iOS/Android native와 tablet/EFB PWA를 동등한 1차 타겟으로 두고, 같은 입력은 플랫폼과 무관하게 같은 semantic·calculation·projection 결과를 내야 한다. 현재 구현 상태는 MASTER.md를 따른다.

## 제품 기준

- 운영·개발 회사: MintTap
- 제품명: LogMate
- App Store / Google Play 출시명: `LogMate - Pilot Logbook`
- Android / iOS 식별자: `app.minttap.logmate`
- Firebase 프로젝트: `logmate-pilot-logbook`

## 구현 순서

1. 현재 temporary View Logbook mock shell와 active domain contract의 경계를 유지하며 confirmed Customize V1 single catalog, system Field Groups, Known/Custom Field presentation을 구현한다.
2. local ledger와 on-device domain/calculation/search/aggregation을 구현하고 native와 tablet/EFB PWA에서 같은 결과를 검증한다.
3. 선택적 import/export·backup과 owner binding·Firebase Sync를 독립 기능으로 연결한다. 이 순서는 개발 순서이며 사용자에게 import lifecycle을 강제하지 않는다.

POC 원문은 [archive/poc/](archive/poc/)에 보존한다. 그 구현을 UI째 복사하지 않고, 범위가 확인된 validation 결론만 MASTER와 evidence를 통해 참고한다.

도메인과 Firebase 인증 이메일의 운영 target/runbook은 [domains-and-auth-email.md](docs/operations/domains-and-auth-email.md)를 참고한다. 현재 외부 운영 상태는 이 README가 선언하지 않는다.

회사 비행 파일의 제주항공(`7C`) 편명 정규화와 향후 임포트 구현 조건은 [import-contract.md](docs/specs/import-contract.md)를 기준으로 한다.

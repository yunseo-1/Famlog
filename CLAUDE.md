# FamLog 공통 규칙 (famlog/ 문서 레포)

응답과 주석은 한국어로 쓴다.

## 저장소 구조
- `famlog/` — 문서 레포 (이 레포). 사양서 원본, API 계약, 디자인 맵, 진행 현황
- 백엔드 저장소 `yunseo-1/Famlog-BE` — 별도 git 레포 (Spring 서버 + Python 워커 + 인프라, IntelliJ). 로컬에서는 이 폴더 안에 clone
- 모바일 저장소 `yunseo-1/Famlog-moblie` — 별도 git 레포 (Android 앱, Android Studio). 로컬에서는 이 폴더 안에 clone
- 두 하위 레포는 이 레포의 `.gitignore`로 제외한다.

## 사양서
- 기준 문서: `docs/spec/` (통합 사양서 v2.0). 색인은 `docs/spec/README.md`
- 사양 변경 순서: Notion 통합 사양서 → `docs/spec/` 수정 → `scripts/sync-spec.sh` 실행 → 각 하위 레포에서 커밋
- 하위 레포의 `docs/spec/`은 사본이다. 거기서 직접 고치지 않는다.

@docs/spec/README.md

## 공통 규칙
- API 계약은 `docs/api/openapi.yaml`. 계약을 바꾸면 backend에서 재생성해 커밋한다.
- 기능 ID 단위로 작업하고, 커밋 메시지는 `feat(ID): 요약` (레포가 달라도 같은 ID)
- AI 결과는 `registration_candidates`(PENDING)에만 저장하고, 실제 항목은 승인 API에서만 만든다.
- 메시지 본문·토큰·좌표·출생연도월을 로그에 남기지 않는다.
- 비밀 값을 코드·문서에 쓰지 않는다 (.env, GitHub Secrets 사용).
- 날짜 예시는 실제 요일을 확인한다.
- 진행 현황은 `docs/handoff/HANDOFF.md`에 기록한다.

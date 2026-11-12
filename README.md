# FamLog (팸로그) — 문서 저장소

가족 단체 채팅 · 구성원별 일정 · 맛집/장소 · 월간 스토리와 영상 · 채팅 기반 자동 등록을 하나로 묶은 Android 가족 앱의 공통 문서 저장소.

| 저장소 | 내용 | IDE |
| --- | --- | --- |
| [Famlog](https://github.com/yunseo-1/Famlog) (이 저장소) | 통합 사양서 원본, API 계약, 공통 규칙 | - |
| [Famlog-BE](https://github.com/yunseo-1/Famlog-BE) | Spring 서버 + Python 워커 + 인프라 | IntelliJ |
| [Famlog-moblie](https://github.com/yunseo-1/Famlog-moblie) | Android 앱 | Android Studio |

## 폴더 구성

| 경로 | 설명 |
| --- | --- |
| `docs/spec/` | **통합 사양서 v2.0 원본** (장별 Markdown, 색인 `README.md`, Word 원본) |
| `docs/api/` | API 계약 `openapi.yaml` (백엔드에서 생성) |
| `scripts/sync-spec.sh` | 사양서를 백엔드·모바일 저장소의 `docs/spec/`으로 복사 |
| `CLAUDE.md` | Claude Code 공통 규칙 |

## 로컬 배치 (권장)

```
famlog/                 ← 이 저장소
├ Famlog-BE/            ← 백엔드 저장소 clone (.gitignore로 제외)
└ Famlog-moblie/        ← 모바일 저장소 clone (.gitignore로 제외)
```

## 사양이 바뀌면

1. Notion 통합 사양서 수정
2. 이 저장소 `docs/spec/` 해당 파일 수정, `VERSION` 갱신, 커밋
3. `./scripts/sync-spec.sh` 실행 → 백엔드·모바일 저장소에서 각각 커밋

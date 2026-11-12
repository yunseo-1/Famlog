#!/usr/bin/env bash
# famlog 문서 레포의 docs/spec(원본)을 백엔드·모바일 저장소의 docs/spec으로 복사한다.
# 사용: 문서 레포 루트에서  ./scripts/sync-spec.sh
# 하위 저장소는 문서 레포 폴더 안에 있다고 가정한다 (폴더 이름은 아래 후보 중 하나).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/docs/spec/"
VERSION="$(head -n 1 "$SRC/VERSION" 2>/dev/null || echo 'unknown')"
CANDIDATES=(famlog-backend Famlog-BE famlog-be famlog-mobile Famlog-moblie Famlog-mobile famlog-moblie)

synced=0
for repo in "${CANDIDATES[@]}"; do
  [ -d "$ROOT/$repo/.git" ] || continue
  DEST="$ROOT/$repo/docs/spec"
  if command -v rsync >/dev/null 2>&1; then
    mkdir -p "$DEST"
    rsync -a --delete --exclude '*.docx' "$SRC" "$DEST/"
  else
    rm -rf "$DEST" && mkdir -p "$DEST" && cp -R "$SRC". "$DEST/" && rm -f "$DEST"/*.docx
  fi
  echo "동기화 완료: $repo/docs/spec  ($VERSION)"
  echo "  커밋: (cd $repo && git add docs/spec && git commit -m 'docs(spec): 사양서 동기화 $VERSION')"
  synced=$((synced + 1))
done

[ "$synced" -gt 0 ] || echo "하위 저장소를 찾지 못했습니다. 문서 레포 폴더 안에 백엔드·모바일 저장소를 clone 하세요."

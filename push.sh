#!/bin/bash
# 깃허브 푸시 헬퍼 스크립트
# 사용법: ./push.sh

echo "🚀 [Spelling Galaga] 깃허브 원격 푸시를 시작합니다..."

# 환경변수에 잘못된 GITHUB_TOKEN이 있다면 임시 해제
unset GITHUB_TOKEN

# 원격 저장소가 없으면 생성 시도
if ! git ls-remote origin &>/dev/null; then
    echo "📦 GitHub에 'spelling_galaga' 저장소가 없습니다. GitHub CLI로 생성을 시도합니다..."
    gh repo create waurimal/spelling_galaga --public --source=. --push
else
    echo "📤 기존 원격 저장소로 push 진행 중..."
    git push -u origin main
fi

echo "✅ 작업 완료!"

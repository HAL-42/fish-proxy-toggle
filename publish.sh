#!/usr/bin/env bash
set -euo pipefail

repo="HAL-42/fish-proxy-toggle"
description="Tiny Fisher plugin to toggle HTTP/HTTPS/SOCKS5 proxy variables in Fish shell"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI 'gh' is required. Install it and run: gh auth login" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI is not authenticated. Run: gh auth login" >&2
  exit 1
fi

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add README.md .gitignore functions/proxy.fish completions/proxy.fish publish.sh
git commit -m "Initial Fisher proxy plugin" || true

gh repo create "$repo" \
  --public \
  --description "$description" \
  --source=. \
  --remote=origin \
  --push

gh repo edit "$repo" \
  --add-topic fish \
  --add-topic fish-shell \
  --add-topic fish-plugin \
  --add-topic fisher \
  --add-topic proxy

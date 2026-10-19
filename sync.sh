#!/bin/bash
# Back up the latest setup to GitHub.
# Copies the global rules and agents from ~/.claude into this repo, then commits and pushes.
set -e
cd "$(dirname "$0")"

cp ~/.claude/CLAUDE.md global/CLAUDE-global.md
mkdir -p global/agents
cp ~/.claude/agents/*.md global/agents/

git add -A
if git diff --cached --quiet; then
  echo "Nothing changed. GitHub is already up to date."
  exit 0
fi

git commit -m "Update setup ($(date +%Y-%m-%d))"
git push
echo "Done. Your setup is backed up on GitHub."

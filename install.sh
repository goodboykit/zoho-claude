#!/bin/bash
# Restore the setup on a new computer (run it after cloning this repo).
# Copies the global rules and agents into ~/.claude. Backs up anything it replaces.
set -e
REPO="$(cd "$(dirname "$0")" && pwd)"
OLD_PATH="/Users/goodboykit/zoho-claude"
STAMP="$(date +%Y%m%d-%H%M%S)"

mkdir -p ~/.claude/agents

if [ -f ~/.claude/CLAUDE.md ]; then
  cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup-"$STAMP"
  echo "Backed up your old ~/.claude/CLAUDE.md"
fi

cp "$REPO/global/CLAUDE-global.md" ~/.claude/CLAUDE.md
cp "$REPO"/global/agents/*.md ~/.claude/agents/

# The files point to /Users/goodboykit/zoho-claude. Fix the path if the repo lives somewhere else.
if [ "$REPO" != "$OLD_PATH" ]; then
  sed -i '' "s#$OLD_PATH#$REPO#g" ~/.claude/CLAUDE.md ~/.claude/agents/*.md "$REPO/CLAUDE.md"
  echo "Updated file paths to $REPO"
fi

echo "Done. Open a new Claude chat and ask: List my subagents."

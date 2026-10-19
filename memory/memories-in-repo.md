---
name: memories-in-repo
description: Where Claude saves memories for this setup — the repo's memory/ folder
metadata:
  type: feedback
---

Save every memory (facts about the user, feedback, project notes, links) in this repo's `memory/` folder, one fact per file, with a line added to `memory/MEMORY.md`. Don't keep them only in Claude's private `~/.claude/projects/.../memory/` folder.

**Why:** the user wants everything backed up to GitHub with the rest of the setup, so it survives a new computer and stays in one place.

**How to apply:**
- New memory → new file here + one index line. Update an existing file instead of adding a duplicate.
- Same safety rules as the rest of the repo: no passwords, API keys, tokens, or real customer/payout data.
- Real company facts (app names, bases, modules) still go in the right `knowledge/` file's "Fill in later" section; a memory can point to it.
- Changes reach GitHub only when committed and pushed (see [[github-repo]]).

---
name: windows-pc
description: The user now works on a Windows 11 PC; the repo's Mac-only scripts and paths don't work there
metadata:
  type: project
---

As of 2026-10-19 the user works on a Windows 11 PC (user folder `C:\Users\CC3 User`, PowerShell). The repo is cloned to `C:\Users\CC3 User\zoho-claude`. Git for Windows was installed that day; the GitHub CLI (`gh`) is not installed.

The setup was written on a Mac:
- `install.sh` and `sync.sh` are bash scripts (and `install.sh` uses Mac-only `sed -i ''`), so they don't run as-is on Windows.
- `CLAUDE.md`, `global/CLAUDE-global.md` and the agents point to `/Users/goodboykit/zoho-claude/...`, which doesn't exist on this PC.

**Why:** explains why commands or file paths from the docs fail here.

**How to apply:** on this PC, use the Windows paths above and PowerShell commands. A Windows version of install/sync has been offered but not made yet. Related: [[github-repo]].

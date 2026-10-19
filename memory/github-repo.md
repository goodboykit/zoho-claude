---
name: github-repo
description: The setup's GitHub repo and how access works on the Windows PC
metadata:
  type: reference
---

Repo: https://github.com/goodboykit/zoho-claude (private, branch `main`). GitHub shows "Page not found" to anyone not signed in.

On the Windows PC, Git signs in through the browser (Git Credential Manager) the first time; Claude's own commands can't show that sign-in prompt, so the user does the first clone/push in a terminal. The Claude app's GitHub account connection doesn't give a local session GitHub tools.

Related: [[windows-pc]], [[memories-in-repo]].

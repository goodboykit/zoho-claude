# zoho-claude

My Claude setup for low-code systems work: Zoho CRM / Creator / Flow / Analytics, Deluge, SQL, REST APIs, Airtable, Varicent, commissions and customer portals.

It turns every Claude chat into a senior low-code developer who explains things step by step, and it works with or without MCP connectors.

## What's inside

| Path | What it is | Lives on the Mac at |
|---|---|---|
| `global/CLAUDE-global.md` | Global rules: persona and how to explain | `~/.claude/CLAUDE.md` |
| `global/agents/` | The 10 subagents | `~/.claude/agents/` |
| `CLAUDE.md` | The hub: routing table and subagent rules | `~/zoho-claude/CLAUDE.md` |
| `STANDARDS.md` | How every subagent works and reports | `~/zoho-claude/` |
| `knowledge/` | One file per tool, plus click paths, UI components, best practices and error fixes | `~/zoho-claude/knowledge/` |
| `memory/` | Claude's long-term memories (index: `memory/MEMORY.md`) | `~/zoho-claude/memory/` |
| `EXAMPLES.md` | Sample chats for each type of question | `~/zoho-claude/` |
| `PROMPTS.md` | Copy-paste prompts | `~/zoho-claude/` |
| `SETUP.md` | Full setup guide | `~/zoho-claude/` |

`You ask → global rules → hub picks the knowledge file / subagent → answer in the right format`

## Back up changes to GitHub

After editing any file (or after Claude updates the notes), run:

```bash
~/zoho-claude/sync.sh
```

It copies the latest global rules and agents into this repo, then commits and pushes.

## Restore on a new computer

```bash
git clone https://github.com/<account>/zoho-claude.git ~/zoho-claude
```

```bash
~/zoho-claude/install.sh
```

It backs up any existing `~/.claude/CLAUDE.md`, then installs the global rules and agents. Open a new chat and ask "List my subagents" to check.

## Safety

- No passwords, API keys or tokens in this repo. Code uses placeholders like `<secret>` and Zoho Connections.
- No real customer or payout data. Examples use fake data (Alex, Acme Corp, example.com).
- Company-specific facts go in the "Fill in later" sections.

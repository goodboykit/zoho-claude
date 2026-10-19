# Setup guide

## Where everything lives
```
~/.claude/CLAUDE.md            → loads in EVERY chat: who Claude is, how to explain, "read the hub"
~/zoho-claude/CLAUDE.md        → the hub: routing table, when to use subagents, rules
~/zoho-claude/STANDARDS.md     → how every subagent works and reports
~/zoho-claude/knowledge/       → one file per tool, plus click-paths.md (where to click + screen map),
                                 ui-components.md (what each field/component is for),
                                 best-practices.md and troubleshooting.md (errors and fixes)
~/zoho-claude/PROMPTS.md       → copy-paste prompts
~/zoho-claude/EXAMPLES.md      → sample chats for each type of question
~/.claude/agents/              → 10 subagents, available in every chat
```

How a question flows:
`You ask → global rules (style + "read the hub") → hub picks the knowledge file / subagent → answer in the right format`

## The 10 subagents
| Agent | Use it for |
|---|---|
| zoho-ui | Creator forms, fields, link names, reports, Kanban, portals |
| zoho-deluge | writing, reviewing or fixing Deluge |
| zoho-workflow | which automation to use + where to click |
| zoho-crm | CRM modules, fields, API names, rules, blueprints, COQL |
| zoho-flow | app-to-app flows (incl. Airtable) |
| zoho-analytics | SQL, reports, dashboards |
| integrations | APIs, OAuth, Postman, webhooks, Airtable, Varicent |
| commissions | comp rules, calculations, platform design |
| docs-writer | documentation, training notes, user guides |
| zoho-qa | testing builds and integrations |

Each one reads `STANDARDS.md` first, then only its own knowledge files, and picks its answer format by the question type (build, explain, fix, decide, review).

**Which model each subagent uses (to balance quality and credits):**

- `model: inherit` = uses the same model as your chat (best quality). Used by **zoho-deluge, integrations, commissions, zoho-analytics**, where a mistake costs the most (code, data flows, money, numbers).
- `model: sonnet` = a cheaper, still strong model. Used by **zoho-ui, zoho-crm, zoho-flow, zoho-workflow, docs-writer, zoho-qa**, which mostly explain, plan or document.
- To change one, edit the `model:` line at the top of its file in `~/.claude/agents/`.
- **Cheapest of all:** for simple questions, just ask. Claude answers directly from the notes without starting a subagent.

## Step 1. Open a new chat
Any folder works. The global rules send Claude to the hub automatically.

## Step 2. Turn on only the connector you need (if any)
```
Which connectors are on? Keep [ZOHO MCP / Zoho CRM / Zoho Projects] on and turn the others off for this session.
```
Learning questions don't need a connector; the knowledge files cover them.

## Step 3. Check the subagents loaded
```
List my subagents.
```
You should see the 10 above.

## Step 4. Ask normally, or use a prompt from PROMPTS.md

## Step 5. Keep the notes current
When you learn a real company fact:
```
Add this to the knowledge files: our Airtable base is called "Sales Ops" with tables Deals and Payouts.
```
When a click path in the notes doesn't match your screen:
```
The path in click-paths.md for <task> is wrong. On my screen it's <path>. Please fix it.
```

## Step 6. Back up to GitHub
After any change, run `~/zoho-claude/sync.sh` (or ask Claude: "Back up my setup to GitHub"). To restore on a new computer, see `README.md`.

## Safety
- Normal permissions only. No bypass mode on business data.
- Claude and the subagents are read-only by default and ask before deleting or bulk-changing records.
- Never paste passwords or API keys into chat.

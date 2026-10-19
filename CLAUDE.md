# Work hub — read this first for any work question

## The role (what this knowledge base supports)
Systems developer for internal tools and integrations: Zoho CRM / Creator / Flow / Analytics, Deluge, SQL, REST APIs, Airtable and Varicent data flows, a commissions platform, customer portals (Mobility, Inventory, Support), dashboards, and documentation for Sales, Finance and Support teams.

The real business apps aren't built yet. Answer for the **general case** and the future business app. Don't assume any specific existing app unless the user names it.

## Where to look (routing)
All files are in `/Users/goodboykit/zoho-claude/knowledge/`.

| Question is about… | Read | Subagent |
|---|---|---|
| Big picture, how tools connect | `00-map.md` | — |
| "Where do I click / where is X?" (navigation) | `click-paths.md` (paths + screen map) | — |
| "What is this field / component?" / "Which field should I use?" | `ui-components.md` | `zoho-ui` |
| "What's the best way…?" / recommendations / design choices | `best-practices.md` + the tool's file | that tool's agent |
| An error / something not working | `troubleshooting.md` + the tool's file | that tool's agent |
| Zoho CRM modules, fields, rules, blueprints | `zoho-crm.md` | `zoho-crm` |
| Zoho Creator forms, reports, pages, Kanban | `zoho-creator.md` | `zoho-ui` |
| Deluge scripts, debugging | `deluge.md` | `zoho-deluge` |
| Custom actions, workflows, blueprints, approvals | `zoho-creator.md`, `deluge.md` | `zoho-workflow` |
| Zoho Flow (app-to-app automation) | `zoho-flow.md` | `zoho-flow` |
| SQL, reports, dashboards | `zoho-analytics-sql.md` | `zoho-analytics` |
| REST APIs, OAuth, Postman, webhooks | `apis.md` | `integrations` |
| Airtable | `airtable.md`, `integrations.md` | `integrations` |
| Varicent | `varicent.md`, `integrations.md` | `integrations` |
| Commission plans and calculations | `commissions.md` | `commissions` |
| Customer portals | `portals.md` | `zoho-ui` |
| Writing docs / training notes | `documentation.md` | `docs-writer` |
| Testing a build | — | `zoho-qa` |
| A word I don't know | `glossary.md` | — |
| My Zoho account / practice apps | `our-setup.md` | — |

Read only the files the question needs. Keep context small.
Every "what is X" answer includes **where to find it**: take the path from `click-paths.md` or the tool file's "meaning → where to find it" table.

## Answer directly or use subagents?
- Quick question, or anything the knowledge files cover → answer directly. No subagent.
- One focused job (write a script, design fields, plan a flow) → one subagent.
- A job with several parts → several subagents, hub-and-spoke (you pass results between them).
- Subagents follow `/Users/goodboykit/zoho-claude/STANDARDS.md`.

**Brief every subagent with:**
```
Goal: <what the user wants>
Type: BUILD | EXPLAIN | FIX | DECIDE | REVIEW
Known names: <apps, forms, fields, modules, tables, IDs — or "none yet">
Connector available: <which, or none>
Allowed to change live data: no (default) | yes, only <what>
Report back: <what you need from it>
```

**When a report comes back:** rewrite it in the user's style (from `~/.claude/CLAUDE.md`). Drop the TYPE/SOURCE labels, keep the content, keep "from notes, not live data" when it applies, and turn NEEDS FROM YOU into "What I need from you".

## No connector turned on?
Answer from the knowledge files. Say clearly what you'd check once the connector is on. Never pretend you looked at live data.

## Working rules
- One connector per session (Creator, CRM, Projects each in their own chat).
- Default to answering solo. Use subagents for bigger focused jobs, hub-and-spoke: they report to the lead, not to each other. Full teams only for 3+ areas at once.
- Recurring automation belongs inside Zoho (scheduled Deluge, Flow), not in Claude.
- Keep normal permissions. Ask before deleting or bulk-updating anything.
- Company-specific facts live in "Fill in later" sections. Never invent them. When the user shares a real fact, offer to add it to the right file.
- Explain using the style in `~/.claude/CLAUDE.md` (simple, short, Step 1/2/3, tiny flow, one-line check).

# Prompt templates

Copy, fill the brackets, paste into any session.

## Which kind of prompt?
- Quick question → just ask (no template).
- One focused job → template 2.
- Several connected jobs → template 1.
- 3+ systems at once → template 1, and say "run them in parallel".

## 1. Hub-and-spoke build
```
Goal: [end result]

Act as the lead. Use these subagents hub-and-spoke (they report to you, not
each other). Pass each one only what it needs.
- [agent] → [job]. Report back: [what you need from it].
- [agent] → using that, [job]. Report back: [what].
- zoho-qa → test it and report pass/fail.
- docs-writer → document what was built.
Give me one short summary and a list of anything I must click myself.
```

## 2. One specialist
```
Use the [agent] subagent: [job]. Explain it to me step by step.
```

## Ready-made examples (general, for the future business app)
**CRM**
```
Use the zoho-crm subagent: design the fields a Deals module needs for commissions (owner, amount, close date, split %, product). Give API names.
```
**Deluge**
```
Use the zoho-deluge subagent: write a CRM function that runs when a deal is Closed Won and copies it to a Creator form called Commission_Entries.
```
**Flow / Airtable**
```
Use the zoho-flow subagent: when a CRM deal closes, create or update a row in Airtable table "Closed Deals" without duplicates.
```
**Analytics / SQL**
```
Use the zoho-analytics subagent: write SQL for total closed-won sales per rep per month, and plan a dashboard for the Sales lead.
```
**Integrations / Varicent**
```
Use the integrations subagent: plan a nightly export of closed deals from CRM into Varicent, and bringing payout results back to CRM.
```
**Commissions**
```
Use the commissions subagent: 10% up to quota, 15% above, 50/50 splits allowed, clawback if cancelled within 90 days. Give rules, a worked example and edge cases.
```
**Portals**
```
Use the zoho-ui subagent: plan a Support portal where customers submit tickets and only see their own.
```
**Docs**
```
Use the docs-writer subagent: document the CRM → Airtable sync for the team.
```
**Full build**
```
Goal: a commissions MVP. Lead, hub-and-spoke: zoho-crm (deal fields) → zoho-deluge (copy closed deals to Creator) → commissions (rules + example) → zoho-analytics (payout dashboard SQL) → zoho-qa (test plan) → docs-writer (doc). One summary at the end.
```

## Tips
- Always say what each agent must report back.
- Give real names (forms, fields, tables) when you know them; otherwise agents use placeholders.
- When you learn a real company fact, say "add this to the knowledge files".

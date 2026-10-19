# Best practices (the senior developer's playbook)

Use this when giving recommendations. Each rule says **what** to do and **why**.

## 1. Know the source of truth

- **What:** for every piece of data, decide which system owns it (e.g. deals live in CRM, payouts in Creator/Varicent).
- **Why:** if two systems can both edit the same field, they overwrite each other and nobody trusts the numbers.

## 2. Name things so anyone can understand them

- Forms / modules: plural nouns, e.g. `Commission_Entries`, `Support_Tickets`.
- Fields: clear words, e.g. `Due_Date`, `CRM_Deal_ID`. Never `Field_3`.
- Workflows / rules / flows: `[Where] – [When] – [What]`, e.g. "Deals – Closed Won – Copy to Creator".
- Functions: verb + noun, e.g. `syncDealToAirtable`.
- **Why:** six months later, you or a teammate can find and fix things fast.

## 3. Build safely: development → stage → production

- Build and break things in **Development**, test with real-looking data in **Stage**, then publish to **Production**.
- Never test on live customer data. Use records labeled "TEST -".
- **Why:** a mistake in production affects real customers and real money.

## 4. Never create duplicates (idempotency)

- Store the other system's ID on every synced record (`CRM_Deal_ID`, `Airtable_Record_ID`).
- Search first, then update if found, otherwise create ("upsert").
- **Why:** automations often run more than once (edits, retries). Without a matching ID, each run adds another copy.

## 5. Prevent loops

- If an automation updates a record that has its own automation, add a guard: a checkbox like `Synced`, or a condition that skips records the automation just changed.
- **Why:** rule A updates the record → rule A fires again → forever, burning API limits.

## 6. Plan for failure

- Wrap outside calls in `try/catch` and check response codes (`detailed: true`).
- Log failures to an **Error Log** form: source, message, record ID, time.
- Alert a person (email) when something important fails.
- **Why:** silent failures mean lost data that nobody notices until payday.

## 7. Respect limits and performance

- Fetch with criteria; never loop through every record.
- Batch API calls (Airtable: 10 records per call), and page through big lists.
- Move heavy jobs to schedules that run off-hours.
- Every platform has daily API and script limits. Check the current numbers in your plan.
- **Why:** hitting a limit stops all automations for the rest of the day.

## 8. Security

- Use Zoho **Connections** for all logins. Never put tokens or passwords in code, docs or chat.
- Give users and portal users the smallest permissions that work (least privilege).
- Test permissions by logging in as that user, not as admin.
- **Why:** leaked keys and over-wide access are the most common causes of data leaks.

## 9. Keep logic in the right place

| Logic | Best home |
|---|---|
| Inside one Zoho app | that app's workflow + Deluge |
| Simple app-to-app copy | Zoho Flow |
| Complex app-to-app logic | Deluge with `invokeurl` / Zoho tasks |
| Numbers and trends | Zoho Analytics |
| Commission calculations at scale | Analytics query tables or Varicent |

**Why:** each tool is easiest to maintain when it does what it's good at.

## 10. Change management

- Before changing a live tool: write down what changes and why, test in Development/Stage, tell the people who use it, then publish.
- Keep a change log in the tool's document (`documentation.md`).
- **Why:** surprise changes break other people's work and erode trust.

## 11. Document as you build

- One doc per tool, written the same day you build or change it.
- **Why:** you can take leave without the business stopping (redundancy), and new teammates learn faster.

## 12. Talk to non-technical users simply

- Start with what it does for them, not how it works.
- Show, don't tell: screenshots or a 2-minute walkthrough.
- Confirm in writing what they asked for before building.
- **Why:** most failed tools solve the wrong problem.

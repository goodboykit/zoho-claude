# Zoho CRM

**What it is:** where Sales keeps customers and deals. Each type of record lives in a **module** (think: one tab of a spreadsheet).

**Where to find settings:** **⚙️ (top-right) → Setup**. Exact paths are in `click-paths.md`.

## Key parts (meaning → where to find it)
| Part | Meaning | Where to find it |
|---|---|---|
| Standard modules | Leads (not qualified yet), Contacts (people), Accounts (companies), Deals (sales in progress), plus Tasks, Calls, Meetings, Products, Quotes | top menu tabs |
| Custom module | your own table, e.g. "Commission Statements" | **Setup → Customization → Modules and Fields → + New Module** |
| Field | one piece of info (a column) | **Setup → Customization → Modules and Fields → [module] → Layouts** |
| API name | the name code uses (label "Deal Name" → `Deal_Name`) | **Setup → Developer Hub → APIs and SDKs → API Names** ⚠️ |
| Layout | how the record page looks; one module can have several | **Modules and Fields → [module] → Layouts** |
| Lookup field | links one record to another (Deal → Account) | **New Fields → Lookup** in the layout editor |
| Workflow rule | "when a record is created/edited and matches X, do Y" | **Setup → Automation → Workflow Rules** |
| Blueprint | a required step-by-step process (stages with rules) | **Setup → Process Management → Blueprint** |
| Approval process | a record waits for someone to approve | **Setup → Process Management → Approval Processes** |
| Function | Deluge code attached to workflows, buttons or schedules | **Setup → Developer Hub → Functions** ⚠️ |
| Assignment rule | auto-assigns owners | **Setup → Automation → Assignment Rules** |
| Webhook | sends record data to another system's URL | **Setup → Automation → Actions → Webhooks** |
| COQL | SQL-like way to query CRM data | used in API / Deluge / the Claude CRM connector |

## Task 1: Add a field to a module
- **Step 1.** **⚙️ → Setup → Customization → Modules and Fields**.
- **Step 2.** Click the module (e.g. **Deals**) → **Layouts** → click the layout (usually **Standard**).
- **Step 3.** From **New Fields** (left side), drag the field type onto the layout (e.g. **Pick List** for a status, **Currency** for money, **Lookup** for a link).
- **Step 4.** Type the field label → set options (e.g. picklist values) → **Done**.
- **Step 5.** Click **Save and Close**.

You should now see the new field on every record of that module.

Then get its API name for code: **Setup → Developer Hub → APIs and SDKs → API Names → Deals** ⚠️.

Watch out: renaming a label doesn't change the API name. Code keeps using the API name.

## Task 2: Run Deluge when a deal closes (workflow rule + function)
`Deal edited → Stage becomes Closed Won → workflow rule → function runs`

- **Step 1.** **Setup → Automation → Workflow Rules → Create Rule**.
- **Step 2.** Module: **Deals**. Rule name: "Closed Won handler" → **Next**.
- **Step 3.** **When**: choose **Record action → Edit** → **Specific field(s) gets modified** → **Stage** ⚠️.
- **Step 4.** **Condition**: **Stage is Closed Won** → **Next**.
- **Step 5.** **Instant Actions → Function → New Function → Write your own**.
- **Step 6.** Give it a name → **Create** → the code editor opens. Write the code (see `deluge.md`, CRM snippets).
- **Step 7.** Click **Edit Arguments** → add `dealId` → set the value by typing `#` and picking **Deals → Deal Id** ⚠️ → **Save**.
- **Step 8.** **Save and Associate** → **Save** the rule.
- **Step 9.** Test: open a test deal → change Stage to **Closed Won** → save.

You should now see whatever the function does (e.g. a field updated, a record created elsewhere).

Watch out: if the function updates the same deal, add a condition so it doesn't re-trigger itself (see `troubleshooting.md` → loop).

## Task 3: Add a custom button that runs code
- **Step 1.** **Setup → Customization → Modules and Fields → [module] → Links and Buttons → New Button** ⚠️.
- **Step 2.** Name it, choose where it shows (record page / list view).
- **Step 3.** Action: **Writing Function** → write Deluge → map arguments like in Task 2.
- **Step 4.** Save. Open a record and click the button to test.

## Task 4: Query data (COQL)
```
select Deal_Name, Amount, Owner from Deals where Stage = 'Closed Won' limit 200
```
- Uses **API names**, not labels.
- Text values in single quotes.

## Good habits (from experience)
- Keep a "processed" checkbox (e.g. `Synced_To_Airtable`) on records that automations touch. It prevents loops and duplicates.
- Name rules clearly: "[Module] – [Trigger] – [What it does]".
- Test with test records before turning a rule on for everyone.
- CRM API and function calls count against daily limits. Avoid looping thousands of calls.

## Fill in later: our company
- Custom modules:
- Key custom fields (API names):
- Existing workflow rules / blueprints:

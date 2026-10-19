# Airtable

**What it is:** a spreadsheet that works like a database. Teams like it because it's easy to use.

**Where to find it:** airtable.com → your workspace → a **base**. Exact paths are in `click-paths.md` → Airtable.

## Building blocks (meaning → where to find it)
| Part | Meaning | Where to find it |
|---|---|---|
| Base | one database (like a whole spreadsheet file) | Airtable home |
| Table | one sheet inside the base | tabs across the top of the base |
| Field | a column (text, number, single select, linked record…) | column headers; **+** at the end to add one |
| Record | a row | each row |
| View | a saved filter/sort/layout (grid, kanban, calendar) | left sidebar of the table |
| Linked record | links a row to a row in another table (like a Zoho lookup) | field type **Link to another record** |
| Automation | Airtable's own "when X, do Y" (can run small scripts) | **Automations** (top bar) |
| Base ID / table ID | IDs the API needs: `app…` / `tbl…` | browser address bar when the base is open |

## API basics
- URL: `https://api.airtable.com/v0/{baseId}/{tableNameOrId}`
- Login header: `Authorization: Bearer <personal_access_token>`
- Limits: about **5 requests per second per base**; create/update **up to 10 records per request**. After a `429`, wait **30 seconds**.
- Big lists come in pages: use the `offset` value from the response to get the next page.
- Filter: `?filterByFormula={Status}='Closed'`

**Create (or update if it exists) in one call (upsert):**
```
PATCH https://api.airtable.com/v0/<baseId>/Closed%20Deals
{
  "performUpsert": { "fieldsToMergeOn": ["Zoho ID"] },
  "records": [
    { "fields": { "Zoho ID": "4953...", "Name": "Big Deal", "Amount": 5000 } }
  ]
}
```
If a row with that Zoho ID exists, it's updated. Otherwise it's created. No duplicates.

## Get a token
- **Step 1.** **airtable.com/create/tokens → Create token**.
- **Step 2.** Name it (e.g. "Zoho sync").
- **Step 3.** Scopes: `data.records:read`, `data.records:write`, `schema.bases:read`.
- **Step 4.** Access: pick only the base(s) it needs.
- **Step 5.** **Create token** → copy it right away (it's shown once) → store it safely (Zoho Connection or a password manager).

## Zoho ↔ Airtable: two ways
**A. Zoho Flow (easiest, no code)**

`Zoho event → Flow → Airtable action (create / update record)` → see `zoho-flow.md`.

**B. Deluge `invokeurl` (more control)**

- **Step 1.** Get a token (above) and save it in a Zoho **Connection** (custom service with API key / Bearer auth) ⚠️.
- **Step 2.** Write Deluge that sends the upsert call above (see `deluge.md` → Calling an outside API).
- **Step 3.** Use `detailed: true` and log failures.
- **Step 4.** Test with one test record, then check the row in Airtable.

## Good habits (from experience)
- Store the **matching ID** on both sides (Zoho ID in Airtable, Airtable record ID in Zoho).
- Field names must match exactly (spaces and capital letters matter).
- Batch in groups of 10 and pause between batches.
- Decide which system "owns" each field so syncs don't overwrite each other.

## Fill in later: our company
- Bases and tables:
- What lives in Airtable vs Zoho:
- Existing sync method:

# Zoho Analytics + SQL

**What it is:** Zoho's reporting tool. It pulls data from CRM, Creator and other sources so you can build charts and dashboards. **SQL** is the language for asking questions of that data.

**Where to find it:** analytics.zoho.com. Exact paths are in `click-paths.md` → Zoho Analytics.

## Building blocks (meaning → where to find it)
| Part | Meaning | Where to find it |
|---|---|---|
| Workspace | a project holding tables and reports | Analytics home |
| Data source / sync | scheduled import from CRM/Creator (e.g. every few hours) | **Data Sources** (left menu) ⚠️ |
| Table | imported data | left list inside the workspace |
| Query table | a table you create with SQL | **Create (+) → Query Table** |
| Formula column | a calculated column | table → **Add → Formula Column** ⚠️ |
| Chart / pivot | one report | **Create (+) → Chart View / Pivot View** |
| Dashboard | several reports on one screen | **Create (+) → Dashboard** |

## SQL: the parts you'll use most
```sql
SELECT "Deal Owner", SUM("Amount") AS "Total Sales"
FROM "Deals"
WHERE "Stage" = 'Closed Won'
  AND "Closing Date" >= '2026-01-01'
GROUP BY "Deal Owner"
ORDER BY "Total Sales" DESC
```
Line by line:
- `SELECT`: which columns to show (`AS` renames the result).
- `FROM`: which table.
- `WHERE`: keep only matching rows. Text goes in single quotes.
- `GROUP BY`: one row per owner. `SUM`, `COUNT`, `AVG` do the math per group.
- `ORDER BY … DESC`: biggest first.
- Column names with spaces go in **double quotes**.

**Joining two tables**
```sql
SELECT d."Deal Name", a."Account Name", d."Amount"
FROM "Deals" d
LEFT JOIN "Accounts" a ON d."Account Id" = a."Id"
```
`LEFT JOIN` keeps every deal, even ones with no account. Join on IDs, not names.

## Task: sales-by-rep dashboard
`CRM → sync → query table → chart → dashboard`

- **Step 1.** **Create → New Workspace → Zoho CRM** ⚠️ → pick modules (Deals, Accounts, Users) → set the sync schedule.
- **Step 2.** **Create (+) → Query Table** → paste the first SQL above → **Save** as "Sales by Rep".
- **Step 3.** Open it → **Create (+) → Chart View** → bar chart: X = Deal Owner, Y = Total Sales.
- **Step 4.** **Create (+) → Dashboard** → add the chart → **Share** with the Sales team.

You should now see one bar per rep.

Watch out: the dashboard is only as fresh as the last sync.

## Good habits (from experience)
- Check row counts after every join. If the count jumps, you're double counting.
- Build one query table per question; reuse them across charts.
- Write the business meaning next to each report ("Closed-won sales, by close date").

## Fill in later: our company
- Workspaces and key dashboards:
- Sync schedule:

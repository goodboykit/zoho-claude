# Varicent

**What it is:** an **ICM** tool (Incentive Compensation Management). It takes sales data and calculates commissions using the company's pay rules, then shows each salesperson their statement.

Written from general product knowledge. Check your Varicent version's docs for exact screens and API details.

**Where to find things:** menus differ a lot between Varicent versions and company setups. Before giving click steps, ask for a screenshot or the company's Varicent guide.

## Key ideas
- **Payee:** a person who gets paid (sales rep, manager).
- **Plan:** the pay rules for a role (rates, tiers, quotas).
- **Component:** one piece of a plan (e.g. "new business commission", "bonus").
- **Crediting:** deciding who gets credit for a sale (one rep, a split, the manager too).
- **Quota & attainment:** target vs what they actually sold.
- **Period:** the time window (month, quarter).
- **Data import:** loading sales data in (files or connectors/API).
- **Calculation:** Varicent runs the rules over the data.
- **Statement:** the report each payee sees. **Inquiry/dispute:** a payee questions a number.

## How it fits with CRM
```
CRM closed deals → export / API → Varicent import
   → crediting + calculation → statements
   → results (payout, attainment) → back to CRM / Analytics dashboards
```

## Typical integration steps
- **Step 1.** Agree which CRM fields Varicent needs (deal ID, owner, amount, close date, product, splits).
- **Step 2.** Build the export (scheduled report, Analytics query, or API job).
- **Step 3.** Load it into Varicent on a schedule; check row counts match.
- **Step 4.** Bring results back (payouts, attainment %) for dashboards.

## Watch out
- Use stable IDs (deal ID, employee ID), not names.
- Lock data at period close; late changes need a defined adjustment process.
- Always reconcile: CRM total = Varicent import total.

## Fill in later: our company
- Plans and components:
- Import schedule and method:
- Who approves payouts:

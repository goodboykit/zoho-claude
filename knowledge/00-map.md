# The big map: how everything connects

## The tools in one line each
- **Zoho CRM**: where Sales tracks customers and deals.
- **Zoho Creator**: a low-code app builder for custom internal tools and portals.
- **Deluge**: Zoho's scripting language. It's the "brain" inside CRM, Creator and Flow.
- **Zoho Flow**: connects apps ("when X happens in app A, do Y in app B").
- **Zoho Analytics**: reports and dashboards, with SQL for custom queries.
- **Airtable**: a spreadsheet-like database some teams use.
- **Varicent**: a commissions system (ICM = Incentive Compensation Management). It calculates what salespeople get paid.
- **REST API**: the standard way two systems talk over the internet.

## How data usually moves
```
Sales closes a deal in CRM
   → Deluge / Flow sends it out
   → Varicent calculates the commission  (and/or Airtable stores a copy)
   → results come back to CRM / Creator
   → Analytics shows dashboards to Sales & Finance
```

## Job duties → tools
| Duty | Main tools |
|---|---|
| Internal tools (CRM workflows, portals, automation) | CRM, Creator, Deluge |
| Backend workflows | Deluge, SQL, Flow, API triggers |
| Commissions platform | Creator + Analytics + CRM (+ Varicent) |
| Customer portals (Mobility, Inventory, Support) | Creator portals |
| Integrations (Zoho ↔ Airtable, Varicent ↔ CRM) | APIs, Flow, Deluge `invokeurl` |
| Dashboards | Analytics + SQL |
| Documentation | `documentation.md` template |
| Working with Sales/Finance/Support | Plain-language specs, feedback loops |

## Picking the right tool (quick rule)
1. Change inside one Zoho app? → that app's own workflow + Deluge.
2. Two Zoho apps talking? → Deluge (`zoho.crm.*`) or Flow.
3. Zoho ↔ outside system (Airtable, Varicent)? → Flow if it has a ready connector, else Deluge `invokeurl` / REST API.
4. Need numbers and charts? → Analytics.

## Fill in later: our company
- Which systems are the "source of truth" for customers, deals, payouts:
- Current integrations already running:
- Team contacts (Sales, Finance, Support leads):

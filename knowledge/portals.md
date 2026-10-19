# Customer portals (Zoho Creator)

**What it is:** a login area where outside people (customers, partners) see and submit only their own data.

**Where to find it:** Creator home → **Customer Portal** ⚠️ (older versions: app **Settings → Customer Portal**).

## Key parts (meaning → where to find it)
| Part | Meaning | Where to find it |
|---|---|---|
| Portal user | an outside person with a login | Customer Portal → **Users** ⚠️ |
| Profile | what a group of portal users can see and do (view, add, edit) | Customer Portal → **Profiles** ⚠️ |
| Record filter | shows each user only their records, e.g. `Email == zoho.loginuserid` | profile/report permission settings ⚠️ |
| Branding / domain | logo, colors, your own web address | Customer Portal settings ⚠️ |

## The three portals in the job
| Portal | Typical forms and reports |
|---|---|
| Mobility | device or line requests, plan changes, request status |
| Inventory | stock levels, orders, shipments, reorder requests |
| Support | submit a ticket, ticket status, help articles |

## Build a portal (simple version)
`Customer logs in → sees only their records → submits a request → team gets notified`

- **Step 1.** Build the forms and reports in Creator first (e.g. **Tickets** form with a **Customer Email** field).
- **Step 2.** Open **Customer Portal** ⚠️ → enable it for the app.
- **Step 3.** Create a profile, e.g. "Customer": allow **Add** on the Tickets form, **View** on "My Tickets" report.
- **Step 4.** Filter the report so each person sees only their rows: `Customer_Email == zoho.loginuserid`.
- **Step 5.** Add a form workflow (**Successful form submission**) that emails the support team.
- **Step 6.** Invite yourself as a test portal user (a different email) and log in as them.

You should now see only the test user's tickets, and the team gets the email.

Watch out: always test as a portal user. Admins see everything, so admin tests won't catch data leaks.

## Good habits
- Give portal users the smallest permissions that work.
- Store the customer's email on every record they own; it powers the filter.
- Check your plan's portal user limits before inviting many users.

## Fill in later: our company
- Which portals exist or are planned:
- Who the users are and how many:

# Zoho Flow

**What it is:** a tool that connects apps with little or no code: "When something happens in App A, do something in App B." It has ready-made connectors for hundreds of apps, including Airtable.

**Where to find it:** flow.zoho.com. Exact paths are in `click-paths.md` → Zoho Flow.

## Building blocks (meaning → where to find it)
| Part | Meaning | Where to find it |
|---|---|---|
| Trigger | what starts the flow (new CRM deal, form submitted, schedule, webhook) | first step when you **Create Flow** |
| Action | what the flow does (create Airtable record, send email, update CRM) | **+** between steps → pick an app |
| Decision | an if/else branch | **Logic → Decision** ⚠️ |
| Delay | wait before the next step | **Logic → Delay** ⚠️ |
| Custom function | Deluge for anything the ready actions can't do | **Logic → Custom function** ⚠️ |
| Webhook trigger | a URL other systems call to start the flow | trigger type **Webhook** |
| Variables | values from earlier steps you insert into later ones | the variable picker in each field |
| History | every run, each step's input/output and errors | left menu **History** |

## Example: CRM deal closes → Airtable row (no duplicates)
`Deal updated → Decision: Closed Won? → Airtable: find by Zoho ID → update or create`

- **Step 1.** **Create Flow** → name it "CRM Closed Won → Airtable" → trigger **App → Zoho CRM → Deal updated** ⚠️ → connect your CRM account.
- **Step 2.** Add **Logic → Decision**: Stage **equals** "Closed Won".
- **Step 3.** On the "Yes" path, add **Airtable → Search records** (or find record) ⚠️ where **Zoho ID** = the deal's ID.
- **Step 4.** Add a Decision: record found?
   - Yes → **Airtable → Update record**.
   - No → **Airtable → Create record**.
- **Step 5.** Map fields with the variable picker: Deal Name → Name, Amount → Amount, Deal ID → Zoho ID.
- **Step 6.** Turn the flow **On**. Close a test deal.
- **Step 7.** Open **History** → check every step is green.

You should now see one row in Airtable, and editing the deal again updates that same row.

Watch out: action names differ slightly per connector. Pick the closest "search/find" and "update" actions the Airtable connector offers.

## Flow or Deluge?
| Use Flow when… | Use Deluge when… |
|---|---|
| a ready connector exists for both apps | there's complex logic, loops or calculations |
| it's simple mapping | it all happens inside one Zoho app |
| non-developers will maintain it | you need full control of the API call |

## Good habits (from experience)
- Name flows "[Source] → [Target]: [what]".
- Always protect two-way syncs from loops (e.g. skip records updated by the sync itself).
- Check **History** weekly for failures. Flow plans have monthly task limits.

## Fill in later: our company
- Existing flows:
- Connected accounts:

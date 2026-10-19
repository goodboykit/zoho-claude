# Deluge reference

**What it is:** Zoho's scripting language. It runs inside Zoho (CRM functions, Creator workflows, Flow custom functions) on Zoho's servers, so it keeps working without Claude.

**Where you write it:**
- CRM: **Setup → Automation → Workflow Rules → [rule] → Function**, or **Setup → Developer Hub → Functions** ⚠️
- Creator: **Workflow → Form Workflows / Schedules → Add New Action → Deluge script**, or report **Actions**
- Flow: **Logic → Custom function** ⚠️

## 1. Basics
```
name = "Alex";                       // text
total = 10 + 5;                      // number
isDone = false;                      // true/false
info "Total is " + total;            // debug message (test runs / logs only)

if (total > 10)
{
    info "big";
}
else if (total > 5)
{
    info "medium";
}
else
{
    info "small";
}
```

## 2. Text, numbers, dates
```
fullName = "Alex" + " " + "Rivera";
upper = fullName.toUpperCase();
hasAlex = fullName.contains("Alex");     // true
amount = "1500".toDecimal();             // text → number
today = zoho.currentdate;                // today
nextWeek = today.addDay(7);
label = today.toString("dd-MMM-yyyy");   // e.g. 19-Oct-2026
gap = daysBetween(today, nextWeek);      // 7
```

## 3. Lists and maps
```
names = List();
names.add("Alex");
names.add("Ana");
first = names.get(0);          // "Alex"
count = names.size();          // 2

person = Map();                // key → value pairs
person.put("name", "Alex");
person.put("amount", 500);
who = person.get("name");      // "Alex"

for each n in names
{
    info n;
}
```

## 4. JSON (data from APIs)
```
text = "{\"name\":\"Alex\",\"amount\":500}";
data = text.toMap();           // JSON text → map
info data.get("amount");       // 500
// if an API call returned {"records":[...]} into `response`:
rows = response.get("records"); // a list inside a map
for each r in rows
{
    info r.get("id");
}
```

## 5. Creator data
```
// the record being saved (inside a form workflow)
input.Status = "Done";

// fetch records with criteria
openItems = Tasks[Status != "Done"];
for each t in openItems
{
    info t.Task_Name;
}
howMany = Tasks[Status != "Done"].count();

// update one record
rec = Tasks[ID == input.ID];
rec.Status = "In Progress";

// add a record to another form
insert into Audit_Log
[
    Added_User = zoho.loginuser
    Note = "Task updated"
];

// stop a bad submission (Validations event only)
if (input.Amount < 0)
{
    alert "Amount can't be negative";
    cancel submit;
}
```
`Tasks`, `Audit_Log` and the fields are examples. Use your real form and field link names.

## 6. CRM data
**Inside a CRM function:**
```
deal = zoho.crm.getRecordById("Deals", dealId);
amount = deal.get("Amount");
found = zoho.crm.searchRecords("Deals", "(Stage:equals:Closed Won)");
changes = Map();
changes.put("Commission_Status", "Sent");
zoho.crm.updateRecord("Deals", dealId, changes);
lead = Map();
lead.put("Last_Name", "Rivera");
lead.put("Company", "Acme Corp");
zoho.crm.createRecord("Leads", lead);
```

**From Creator (needs a CRM connection, name it last):**
```
zoho.crm.createRecord("Leads", lead, Map(), "<crm_connection>");
```

## 7. Calling an outside API
```
headers = Map();
headers.put("Content-Type", "application/json");
body = Map();
body.put("name", "Alex");
response = invokeurl
[
    url: "https://api.example.com/items"
    type: POST
    parameters: body.toString()
    headers: headers
    connection: "<connection_name>"
    detailed: true
];
if (response.get("responseCode") == 200 || response.get("responseCode") == 201)
{
    info "Sent OK";
}
else
{
    info "Failed: " + response.get("responseText");
}
```
- `detailed: true` returns the status code and text so you can handle errors.
- Use a **Connection** (a saved login) instead of pasting tokens in code.

## 8. Sending email
```
sendmail
[
    from: zoho.adminuserid
    to: "someone@example.com"
    subject: "Weekly update"
    message: "Hello,<br>Here is your update."
]
```

## 9. Error handling
```
try
{
    result = 100 / 0;
}
catch (e)
{
    info "Something went wrong: " + e;
}
```

## 10. Showing messages
- `info`: for debugging. Shows in test runs and logs, not reliably to users.
- `alert "text";`: a pop-up, only in **Load of the form**, **Validations** and **User input** events.

## Good habits (from experience)
- Test with `info` on a test record before going live.
- Check for empty values before using them: `if (x != null && x != "")`.
- Fetch with criteria; don't loop through every record.
- Keep one script per job, with a clear name.
- Errors and fixes: see `troubleshooting.md` → Deluge.

## 11. Advanced patterns (production-ready)

### Null-safe helpers
```
name = ifnull(deal.get("Deal_Name"), "No name");   // use a default when empty
if (isNull(deal.get("Amount")))
{
    info "Amount missing";
}
if (myList.isEmpty())
{
    info "Nothing to process";
}
```

### Text and collection helpers
```
tags = "a,b,c".toList(",");          // text → list
unique = tags.distinct();            // remove repeats
fieldNames = person.keys();          // all keys of a map
domain = "alex@example.com".getSuffix("@");   // "example.com"
first3 = "Commission".subString(0, 3);    // "Com"
```

### Reusable functions (write once, call anywhere)
- **Creator:** **Workflow → Functions** ⚠️ → create `logError(string source, string message)` → call it with `thisapp.logError("Sync", "Failed");` (if you put it in a custom namespace, include the namespace).
- **CRM:** **Setup → Developer Hub → Functions → + New Function** → category **Standalone** ⚠️ → call it from other functions as `standalone.<function_name>(<args>)` ⚠️.
- **Why:** one fix updates every place that uses it.

### Error log pattern
Create a Creator form **Error_Log** with fields `Source`, `Message`, `Record_ID`.
```
try
{
    // risky work here, e.g. an invokeurl call
}
catch (e)
{
    insert into Error_Log
    [
        Added_User = zoho.loginuser
        Source = "Deal sync"
        Message = e.toString()
        Record_ID = input.ID.toString()   // in a form workflow; elsewhere use the record's ID variable
    ];
}
```
**Why:** failures become visible in one report instead of disappearing.

### Paging through many CRM records
Deluge has no `while` loop, so loop over a list of page numbers and stop when a page comes back short.
```
pages = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
for each p in pages
{
    batch = zoho.crm.getRecords("Deals", p, 200);
    for each d in batch
    {
        // process d
    }
    if (batch.size() < 200)
    {
        break;
    }
}
```
**Why:** one call returns at most 200 records. Add more page numbers if you expect more than 2,000.

### COQL from Deluge (filter on the server)
```
query = Map();
query.put("select_query", "select Deal_Name, Amount from Deals where Stage = 'Closed Won' limit 200");
resp = invokeurl
[
    url: "https://www.zohoapis.com/crm/v7/coql"
    type: POST
    parameters: query.toString()
    connection: "<crm_connection>"
];
rows = resp.get("data");
```
**Why:** fetches only matching records instead of everything. (Check the current API version in Zoho's docs.)

### Example: copy a closed CRM deal to Creator, with no duplicates
**Simple version** (CRM function, argument `dealId`):
```
deal = zoho.crm.getRecordById("Deals", dealId);
row = Map();
row.put("CRM_Deal_ID", dealId.toString());
row.put("Deal_Name", deal.get("Deal_Name"));
row.put("Amount", deal.get("Amount"));
zoho.creator.createRecord("<owner>", "<app_link_name>", "<Form_Link_Name>", row, Map(), "<creator_connection>");
```
Problem: every time the rule fires, it creates another row.

**Production-ready version:**
```
try
{
    deal = zoho.crm.getRecordById("Deals", dealId);
    row = Map();
    row.put("CRM_Deal_ID", dealId.toString());
    row.put("Deal_Name", ifnull(deal.get("Deal_Name"), ""));
    row.put("Amount", ifnull(deal.get("Amount"), 0));
    // 1. look for an existing row with this deal ID
    found = zoho.creator.getRecords("<owner>", "<app_link_name>", "<Report_Link_Name>", "CRM_Deal_ID == \"" + dealId.toString() + "\"", 1, 1, "<creator_connection>");
    existing = found.get("data");
    if (existing != null && existing.size() > 0)
    {
        // 2a. update it
        rowId = existing.get(0).get("ID");
        zoho.creator.updateRecord("<owner>", "<app_link_name>", "<Report_Link_Name>", rowId, row, Map(), "<creator_connection>");
    }
    else
    {
        // 2b. create it
        zoho.creator.createRecord("<owner>", "<app_link_name>", "<Form_Link_Name>", row, Map(), "<creator_connection>");
    }
}
catch (e)
{
    sendmail
    [
        from: zoho.adminuserid
        to: zoho.adminuserid
        subject: "Deal sync failed: " + dealId
        message: e.toString()
    ]
}
```
**Why each part:**
- `getRecords` first → no duplicates, even if the rule fires twice.
- `ifnull` → no crash when a field is empty.
- `try/catch` + email → you hear about failures instead of missing data.
- Placeholders `<…>` → replace with your real owner, app, form, report and connection names.

## 12. Deluge code review checklist
- [ ] Field names are link/API names, not labels.
- [ ] Every value from a record or API is checked for empty before use.
- [ ] No duplicates possible (matching ID + search-then-update).
- [ ] No loops that re-trigger the same workflow.
- [ ] Outside calls use a Connection and `detailed: true`, and failures are logged.
- [ ] No fetching of everything: criteria, paging or COQL.
- [ ] No secrets in code.
- [ ] Tested on a test record, with the expected result written down.

## Fill in later: our company
- Connection names:
- Reusable functions:

# UI components guide (what each field and screen element is for)

Use this when someone asks "what is this field?", "which field should I use?" or "what does this look like?".

Each component says:

- **What it does**
- **What you see** (on the form, as a user)
- **Use it for / Don't use it for**
- **Where to find it**

**Where fields live in Zoho Creator:** open a form in the builder. The left side has **Basic Fields** (top) and **Advanced Fields** (below). Drag a field onto the form, then click it to set its options in the **properties panel on the right**.

---

## 1. Fields that pick from a list

These are the ones beginners mix up most. Quick view:

| Field | What you see | How many can you pick? | Where the choices come from |
|---|---|---|---|
| **Drop Down** | a closed box; click it and a list opens | one | a fixed list you type in |
| **Radio** | all choices shown as round buttons | one | a fixed list you type in |
| **Multi Select** | a box where you can pick several items | many | a fixed list you type in |
| **Checkbox** | all choices shown as square tick boxes | many | a fixed list you type in |
| **Decision Box** | one single tick box (yes / no) | yes or no | — |
| **Lookup** | a dropdown **with a search box** | one or many | **records from another form** |

### Drop Down

- **What it does:** lets the user pick **one** option from a fixed list.
- **What you see:** a closed box. Click it and the list opens.
- **Use it for:** status (Not Started / In Progress / Done), priority, category. Lists longer than about 5 items.
- **Don't use it for:** lists that change often or come from other data (use a **Lookup**).
- **Where to find it:** **Basic Fields → Drop Down**. Type the choices in the properties panel.
- **Bonus:** Kanban reports can group by it.

### Radio

- **What it does:** same as Drop Down (pick **one**), but every choice is visible.
- **What you see:** round buttons, one per choice.
- **Use it for:** 2–5 choices you want people to see at a glance (Yes / No / Maybe, Small / Medium / Large).
- **Don't use it for:** long lists (they take up the whole screen).
- **Where to find it:** **Basic Fields → Radio**.

### Multi Select and Checkbox

- **What they do:** let the user pick **several** options.
- **What you see:** Multi Select = a box where you add several items. Checkbox = a tick box next to every choice.
- **Use them for:** skills, product interests, departments involved.
- **Pick Checkbox** when there are only a few choices to show. **Pick Multi Select** for longer lists.
- **Where to find them:** **Basic Fields → Multi Select / Checkbox**.

### Decision Box

- **What it does:** one yes/no tick box.
- **What you see:** a single square you tick or untick.
- **Use it for:** "Approved?", "Synced to Airtable?", "I agree to the terms".
- **Where to find it:** **Advanced Fields → Decision Box** ⚠️ (may sit with the basic fields in some versions).

### Lookup ⭐

- **What it does:** picks a **record from another form** (another table) instead of typing it. It searches that table as you type.
- **What you see:** a dropdown with a **search box**. Type "Al…" and it shows matching records like "Alex Rivera".
- **Use it for:** anything that already exists elsewhere: a customer on an order, an employee on a task, a product on an invoice.
- **Don't use it for:** a short fixed list like High / Medium / Low (use a **Drop Down**).
- **Why it's powerful:**
  - No typos or duplicates: you pick the real record.
  - If the record changes (new phone number), every place that links to it stays correct.
  - Reports can group by it ("all orders per customer"), and Kanban can group by it.
- **Options (in the properties panel):**
  - **Single** or **multiple** selection (one customer vs several products).
  - **Display as:** dropdown or radio for single; multi-select or checkbox for multiple.
  - **Which field to show:** e.g. show the customer's name, or "name – city".
- **Where to find it:**
  - Creator: **Advanced Fields → Lookup** → drag it onto the form → choose the form it links to.
  - CRM: **⚙️ → Setup → Customization → Modules and Fields → [module] → Layouts → [layout]** → drag **Lookup** from **New Fields** → choose the module.
- **Example:** Tasks form → "Assigned To" lookup → linked to the Employees form → the user searches and picks an employee.

`Task form → "Assigned To" lookup → searches the Employees form → picks one record`

---

## 2. Fields for text

| Field | What it's for | What you see | Where |
|---|---|---|---|
| **Single Line** | short text: a title, a code, a name of a thing | one-line box | Basic Fields |
| **Multi Line** | longer plain text: notes, descriptions | a tall box | Basic Fields |
| **Rich Text** | text with formatting (bold, lists, links) | a box with a formatting toolbar | Advanced Fields |
| **Name** | a person's name, split into first and last | two boxes (prefix/suffix optional) | Basic Fields |
| **Email** | an email address; checks the format | one-line box | Basic Fields |
| **Phone** | a phone number with country code | box with a country picker | Basic Fields |
| **Address** | full address in parts | street, city, state, postal code, country boxes | Basic Fields |
| **URL** | a web link | box that turns into a clickable link | Advanced Fields |

**Tip:** use **Email**, **Phone** and **Address** instead of Single Line for those, because they check the format and keep the parts separate (better for filters and reports).

---

## 3. Fields for numbers, money and dates

| Field | What it's for | Example |
|---|---|---|
| **Number** | whole numbers | quantity: 3 |
| **Decimal** | numbers with decimals | hours: 7.5 |
| **Currency** | money (shows the currency symbol) | amount: $5,000.00 |
| **Percent** | percentages | split: 50% |
| **Date** | a day | due date: 26-Oct-2026 |
| **Time** | a time of day | start: 09:00 |
| **Date-Time** | a day and a time | meeting: 26-Oct-2026 09:00 |
| **Auto Number** | a number Zoho fills in automatically, counting up | ticket no.: 1001, 1002… |

**Where:** Number, Date and Time are in **Basic Fields**. The rest are in **Advanced Fields**.

**Tip:** always use **Currency** for money and **Number/Decimal** for counts. Never store numbers in Single Line, or math and sorting break.

---

## 4. Files and media

| Field | What it's for | What you see |
|---|---|---|
| **File Upload** | attach a document (PDF, Excel…) | an "upload" button |
| **Image** | attach a picture | an upload button with a preview |
| **Signature** | someone signs with mouse or finger | a signing pad |
| **Audio / Video** | attach a recording | an upload button |
| **QR / Bar Code** | turns a field's value into a scannable code | a code image on the record |

**Where:** all in **Advanced Fields**. Multi versions (several files/images) exist too.

---

## 5. Fields that do work for you

### Formula

- **What it does:** calculates a value from other fields automatically. The user can't type in it.
- **What you see:** a read-only value, e.g. "Total: $150".
- **Use it for:** total = quantity × price, days until due date, full name from first + last.
- **Where to find it:** **Advanced Fields → Formula** → type the expression in the properties panel, e.g. `Quantity * Unit_Price`.

### Users

- **What it does:** picks a **person who uses the app** (an app user), not a record.
- **What you see:** a dropdown of app users.
- **Use it for:** "Approver", "Assigned to" when the person must log in to the app.
- **Lookup vs Users:** a **Users** field lists app users; a **Lookup** lists records from a form (e.g. an Employees form, including people with no login).
- **Where to find it:** **Advanced Fields → Users**.

### Subform

- **What it does:** a small table **inside** a form, so one record holds many rows.
- **What you see:** a table with columns and an **Add New** link that adds rows.
- **Use it for:** order items, invoice lines, expense lines: things that only exist inside their parent record.
- **Don't use it for:** things that need their own reports or are shared by many records (use a separate form + **Lookup**).
- **Where to find it:** **Advanced Fields → Subform** → choose a blank subform or an existing form.

`One Order record → Subform rows: item 1, item 2, item 3`

---

## 6. Layout helpers (organize the form)

| Element | What it does | Where |
|---|---|---|
| **Section** | a heading that groups fields into blocks ("Customer details", "Payment") | Advanced Fields → Section |
| **Add Notes** | shows read-only text or instructions on the form | Advanced Fields → Add Notes |
| **Columns** | put up to 3 fields side by side | drag a field to the right edge of another until a vertical guide line appears |

---

## 7. Report types (how records are displayed)

| Report type | What you see | Use it for |
|---|---|---|
| **List** | rows of records, like a table | the default view of any data |
| **Spreadsheet** | an editable grid, like Excel | quick bulk edits |
| **Kanban** | cards in columns by status | tracking work stages (groups by Drop Down, Radio or Lookup) |
| **Calendar** | records on a calendar by date | due dates, bookings, events |
| **Timeline** | records along a time line | project schedules |
| **Pivot** | totals by row and column | sums and counts (e.g. sales per rep per month) |
| **Map** | records as pins on a map | addresses, site visits |

**Where:** **Design → +** (next to the app name) → **Report** → pick the form → pick the type ⚠️.

---

## 8. Zoho CRM field types (in the layout editor)

**Where:** **⚙️ → Setup → Customization → Modules and Fields → [module] → Layouts → [layout]** → drag from **New Fields** (left).

| CRM field | What it's for | Creator equivalent |
|---|---|---|
| **Single Line / Multi-Line** | text | Single Line / Multi Line |
| **Pick List** | pick one from a fixed list | Drop Down |
| **Multi-Select** | pick several from a fixed list | Multi Select |
| **Lookup** | link to a record in another module | Lookup |
| **Multi-Select Lookup** | link to several records | multi-select Lookup |
| **User** | pick a CRM user | Users |
| **Currency / Number / Decimal / Percent** | numbers | same names |
| **Date / Date/Time** | dates | Date / Date-Time |
| **Checkbox** | yes/no | Decision Box |
| **Formula** | calculated value | Formula |
| **Rollup Summary** | totals from related records (e.g. sum of all deals for an account) | (done with Deluge or reports in Creator) |
| **Auto-Number** | counting ID | Auto Number |
| **File Upload / Image Upload** | attachments | File Upload / Image |

---

## 9. Choosing the right field (quick decision)

`Is it picked from records that exist elsewhere? → Lookup`

`Is it a short fixed list? → one choice: Drop Down (long list) or Radio (2–5 items) · several choices: Multi Select or Checkbox`

`Is it yes/no? → Decision Box`

`Is it money? → Currency · a count? → Number · a calculation? → Formula`

`Is it a list of items inside one record? → Subform`

`Is it a person who logs in? → Users · a person in a list (employees, contacts)? → Lookup`

# Zoho Creator

**What it is:** a low-code builder for custom apps. Low-code means you build mostly by dragging and clicking, plus a little code (Deluge).

**Where to find things:** the builder has three tabs at the top: **Design** (forms, reports, pages), **Workflow** (automation), **Settings**. Exact paths are in `click-paths.md`.

## Building blocks (meaning → where to find it)
| Part | Meaning | Where to find it |
|---|---|---|
| Application | the whole app | Creator home |
| Form | where data is entered (like a sign-up sheet). Each saved entry is a **record** | **Design → + → Form** |
| Basic fields | Name, Email, Address, Phone, Single Line, Multi Line, Number, Date, Time, Drop Down, Radio, Multi Select, Checkbox | form editor → **Basic Fields** (left) |
| Advanced fields | Lookup, Subform, File Upload, Image, Formula, Users, and more | form editor → **Advanced Fields** (left, below Basic) |
| Link name | the name code uses for a field (e.g. `Due_Date`) | click the field → right panel → **Field Link Name** ⚠️ |
| Lookup | picks a record from another form (Task → Employee) | **Advanced Fields → Lookup** |
| Subform | a repeating table inside a form (one order → many items) | **Advanced Fields → Subform** |
| Report | a view of records: List, Kanban, Calendar, Spreadsheet, Pivot, Map, Timeline | **Design → + → Report** |
| Kanban | cards in columns by status; groups only by Drop Down, Radio or Lookup | report type **Kanban** |
| Page | a custom screen (dashboards, HTML/CSS). Text size and styling live here | **Design → + → Page** |
| Form workflow | code that runs on load, on validate, on save, on field change | **Workflow → Form Workflows** ⚠️ |
| Custom action | a button on a report that runs Deluge | report → **Report Customization → Actions** |
| Schedule | code that runs at a set time (daily, weekly) | **Workflow → Schedules** ⚠️ |
| Approval / Blueprint | approval steps / required stage process | **Workflow → Approvals / Blueprints** ⚠️ |
| Environments | Development → Stage → Production copies of the app | top of the builder ⚠️ |
| Portal | login area for outside users (see `portals.md`) | Creator home → **Customer Portal** ⚠️ |

## Task 1: Create a form with fields
- **Step 1.** In the builder, **Design → +** (next to the app name) → **Form** → start from scratch → name it.
- **Step 2.** Drag fields from **Basic Fields** / **Advanced Fields** onto the form.
- **Step 3.** Click each field → in the right panel set the label, **mandatory** (required) if needed, and check its **Field Link Name** ⚠️.
- **Step 4.** To place fields side by side, drag one to the **right edge** of another until a vertical guide line appears (max 3 per row).
- **Step 5.** Changes save automatically; click **Access this application** to try it live.

You should now see your form with the fields in order.

Watch out: choose field types carefully. Many types can't be changed later.

## Task 2: Kanban by status
- **Step 1.** Add a **Drop Down** field named "Status" with values like Not Started / In Progress / Done.
- **Step 2.** **Design → + → Report** → pick the form → type **Kanban** ⚠️ → group by **Status**.
- **Step 3.** Open it live and drag cards between columns.

You should now see one column per status.

## Task 3: Code that runs when a record is saved (form workflow)
`User submits form → "Successful form submission" workflow → Deluge runs`

- **Step 1.** **Workflow → Form Workflows → + New Workflow** ⚠️.
- **Step 2.** Pick the form. Choose when: **Created** (or Edited / Created or Edited / Deleted).
- **Step 3.** Choose the event: **Successful form submission** (others: Load of the form, Validations on form submission, User input of a field).
- **Step 4.** Name it → **Create Workflow** → **Add New Action → Deluge script**.
- **Step 5.** Write the code (use `input.Field_Link_Name`, see `deluge.md`) → **Save**.
- **Step 6.** Submit a test record in the live app.

You should now see the result (field updated, email sent, record added).

**Which event to pick:**

- **Load of the form**: pre-fill or hide fields when the form opens.
- **Validations on form submission**: stop bad data (`alert` + `cancel submit;`).
- **Successful form submission**: do things after saving (emails, create related records).
- **User input of a field**: react when a field changes (fill another field).

## Task 4: A button on a report (custom action)
- **Step 1.** Open the report → **Report Customization** panel (right) → choose **Quick View** or **Detail View**.
- **Step 2.** **Actions** → click **+** next to a section (e.g. **For Single Record**).
- **Step 3.** **Name your action item** → **Enable**: Always → **Execute**: At once (or **After confirmation** for risky actions) → **Name the workflow** → **Create Workflow**.
- **Step 4.** **Add New Action → Deluge script** → write the code → **Save** → **Create**.

You should now see the button on each record.

## Task 5: Run something every day (schedule)
- **Step 1.** **Workflow → Schedules → + New Schedule** ⚠️.
- **Step 2.** Choose a custom schedule → start date/time → repeat (daily / weekly).
- **Step 3.** Add a Deluge script (fetch records with criteria, loop, act).
- **Step 4.** Save. Check the next run happened.

## Good habits (from experience)
- Plan forms on paper first: one form per "thing" (Customers, Orders, Tickets), and link them with lookups.
- Name link names clearly (`Due_Date`, not `Field_3`).
- Build in Development, test in Stage, publish to Production when the app uses environments.
- The Claude connector can read structure and records, and can create fields/forms **only in a development environment**. It can't create workflows, custom actions, schedules, approvals or pages; Claude writes the Deluge and you paste it.

## Fill in later: our company
- Business app name and forms:
- Roles / permissions:

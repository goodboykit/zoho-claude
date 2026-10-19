# Where to click (navigation cheat sheet)

**How to read it:** **A → B → C** means click A, then B, then C.
**✅** = stable for years. **⚠️** = Zoho sometimes renames or moves this; look for the bold word, or ask the user for a screenshot.

**Can't find something?**
1. CRM: use the **search box at the top of the Setup page**.
2. Creator / Flow / Analytics: check the left menu and the top tabs. The feature is usually one level away.
3. Search Zoho's help docs for the feature name.
4. Send a screenshot so the steps can match the real screen.

---

## Screen map: where things are on each screen

Use these to tell the user **where on the screen** to look.

**Zoho Creator builder (edit mode)**

- **Top bar, center:** tabs **Design · Workflow · Settings**.
- **Top bar, left:** the app name, with a **+** next to it (add form / report / page).
- **Top bar, right:** **Access this application** (blue button) opens the live app.
- **Left side (when a form is open):** **Basic Fields**, and below them **Advanced Fields**.
- **Middle:** the form or report you're editing.
- **Right side:** the properties panel for whatever you clicked (field settings, **Field Link Name**). In a report: the **Report Customization** panel with **Quick View / Detail View** and **Layout / Actions**.

**Zoho Creator live app (use mode)**

- **Top:** the app's menu with its forms and reports.
- **Report screen:** search, **+** (add record) and **⋯** (more options) at the top-right of the report.

**Zoho CRM**

- **Top bar:** module tabs (Leads, Contacts, Accounts, Deals…).
- **Top-right:** **⚙️** gear opens **Setup**.
- **Setup page:** a **search box** at the top, and sections such as **General, Users and Control, Customization, Automation, Process Management, Developer Hub** ⚠️.

**Zoho Flow**

- **Left menu:** your flows, **History**, **Settings** ⚠️.
- **Flow builder:** the trigger at the top, steps below it, and a **+** between steps to add actions or logic.

**Zoho Analytics**

- **Left side:** the workspace's tables, query tables and reports.
- **Top / left:** **Create (+)** to add a query table, chart or dashboard.

---

## Zoho CRM  (the ⚙️ gear icon, top-right, opens Setup)
| Task | Path | |
|---|---|---|
| Open Setup | **⚙️ (top-right) → Setup** | ✅ |
| Add / edit fields | **Setup → Customization → Modules and Fields → [module] → Layouts → [layout name]** → drag from **New Fields** (left side) → **Save and Close** | ✅ |
| Add a lookup field | same as above → drag **Lookup** from **New Fields** → pick the module to link to | ✅ |
| See field API names | **Setup → Developer Hub → APIs and SDKs → API Names → [module]** (older accounts: **Developer Space → APIs**) | ⚠️ |
| Workflow rule | **Setup → Automation → Workflow Rules → Create Rule** | ✅ |
| Webhook | **Setup → Automation → Actions → Webhooks** | ✅ |
| Assignment rule | **Setup → Automation → Assignment Rules** | ✅ |
| Scheduled function | **Setup → Automation → Schedules** | ⚠️ |
| Blueprint | **Setup → Process Management → Blueprint** | ✅ |
| Approval process | **Setup → Process Management → Approval Processes** | ✅ |
| Functions list / logs | **Setup → Developer Hub → Functions** (older: **Developer Space → Functions**) | ⚠️ |
| Connections | **Setup → Developer Hub → Connections** | ⚠️ |
| Custom button | **Setup → Customization → Modules and Fields → [module] → Links and Buttons → New Button** | ⚠️ |
| Users | **Setup → Users and Control → Users** | ✅ |
| Profiles / roles | **Setup → Users and Control → Security Control → Profiles** / **Roles and Sharing** | ✅ |

## Zoho Creator  (builder tabs at the top: **Design · Workflow · Settings**)
| Task | Path | |
|---|---|---|
| Go from live app to builder | in the live app → **Edit this application** (pencil icon, top area) | ⚠️ |
| Go from builder to live app | **Access this application** (top-right, blue button) | ✅ |
| New form / report / page | **Design → +** (next to the app name, top-left) → **Form / Report / Page** | ✅ |
| Add a basic field | open the form → drag from **Basic Fields** (left): Name, Email, Address, Phone, Single Line, Multi Line, Number, Date, Time, Drop Down, Radio, Multi Select, Checkbox | ✅ |
| Add a lookup / subform / file upload | open the form → **Advanced Fields** (left, below Basic Fields) → drag **Lookup** / **Subform** / **File Upload** | ✅ |
| Find a field's link name | click the field on the form → right-side properties panel → **Field Link Name** | ⚠️ |
| Put fields side by side | drag a field to the **right edge** of another field until a vertical guide line appears (max 3 columns) | ✅ |
| Report layout | open the report → **Report Customization** panel (right) → **Quick View** or **Detail View** → **Layout** | ✅ |
| Report buttons (custom actions) | same panel → **Actions** → **+** next to a section (e.g. **For Single Record**) | ✅ |
| Kanban report | **Design → + → Report** → pick the form → type **Kanban** → group by a Drop Down / Radio / Lookup field | ⚠️ |
| Form workflow (on save, on load…) | **Workflow → Form Workflows → + New Workflow** → pick form → when (Created / Edited / Created or Edited / Deleted) → event (Load of the form / Validations on form submission / Successful form submission / User input of a field) → **Create Workflow** → **Add New Action → Deluge script** | ⚠️ |
| Schedule (daily / weekly job) | **Workflow → Schedules → + New Schedule** | ⚠️ |
| Approvals / Blueprints | **Workflow → Approvals** / **Workflow → Blueprints** | ⚠️ |
| Users & permissions | **Settings → Users and Control** (users, permissions, profiles) | ⚠️ |
| Customer portal | Creator home → **Customer Portal** (older: app **Settings → Customer Portal**) | ⚠️ |
| Environments / publish | environment switch and **Publish** at the top of the builder (Development → Stage → Production) | ⚠️ |

## Zoho Flow  (flow.zoho.com)
| Task | Path | |
|---|---|---|
| New flow | **Create Flow** → name it → pick a trigger: **App** / **Webhook** / **Schedule** | ✅ |
| Add an if/else | in the flow builder → left panel **Logic → Decision** | ⚠️ |
| Add a wait | **Logic → Delay** | ⚠️ |
| Add custom code | **Logic → Custom function** (Deluge) | ⚠️ |
| See runs and errors | left menu **History** → click a run → see each step's input/output | ✅ |
| Manage connected accounts | **Settings → Connections** | ⚠️ |

## Zoho Analytics  (analytics.zoho.com)
| Task | Path | |
|---|---|---|
| Bring in CRM data | **Create → New Workspace → Zoho CRM** (or **Import Your Data → Zoho CRM**) | ⚠️ |
| SQL query table | inside the workspace → **Create (+) → Query Table** | ✅ |
| Chart | **Create (+) → Chart View** | ✅ |
| Dashboard | **Create (+) → Dashboard** | ✅ |
| Sync schedule | **Data Sources** (left menu) → your source → **Sync settings** | ⚠️ |

## Zoho API Console  (api-console.zoho.com)
| Task | Path | |
|---|---|---|
| Create a Self Client | **Add Client → Self Client → Create** → copy **Client ID** and **Client Secret** | ✅ |
| Get a grant code | open the Self Client → **Generate Code** tab → scopes, time duration, description → **Create** → copy the code (it expires in minutes) | ✅ |

## Airtable
| Task | Path | |
|---|---|---|
| Personal access token | **airtable.com/create/tokens → Create token** → name, scopes (`data.records:read`, `data.records:write`, `schema.bases:read`), access (pick the base) → **Create token** → copy it (shown only once) | ✅ |
| Base ID / table ID | open the base → in the browser address bar, the part starting `app…` is the base ID, `tbl…` is the table ID | ✅ |
| Automations | open the base → **Automations** (top bar) → **Create automation** | ✅ |
| API reference | airtable.com/developers/web/api/introduction | ✅ |

## Postman
| Task | Path | |
|---|---|---|
| New request | **New → HTTP** (or **+** tab) → pick method → paste URL | ✅ |
| Add a token | **Authorization** tab → type (Bearer Token for Airtable; for Zoho add a header instead, see `apis.md`) | ✅ |
| Send JSON | **Body → raw → JSON** → type the data → **Send** | ✅ |
| Save for the team | **Save → choose / create a Collection** | ✅ |

## Varicent
Screens differ a lot by version and setup. Ask for a screenshot or the user's Varicent docs before giving clicks.

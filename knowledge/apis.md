# APIs (REST, OAuth, Postman, webhooks)

**What an API is:** a door that lets one system ask another system for data, or tell it to do something, over the internet.

**Where you work with them:** Postman (testing by hand), Deluge `invokeurl` (inside Zoho), Zoho Flow (no code), and each product's API docs.

## REST: the 5 parts of every call
| Part | Meaning | Example |
|---|---|---|
| Endpoint | the URL you call | `https://www.zohoapis.com/crm/v7/Deals` |
| Method | the verb | `GET` read · `POST` create · `PUT`/`PATCH` update · `DELETE` remove |
| Headers | extra info, like your login | `Authorization: Zoho-oauthtoken <access_token>` |
| Body | the data you send, usually JSON | `{"data":[{"Deal_Name":"Big Deal"}]}` |
| Status code | the answer | 200 OK · 201 created · 4xx your side · 5xx their side (see `troubleshooting.md`) |

`Your system → request (method + URL + headers + body) → their system → response (status + JSON)`

## Login styles you'll meet
| System | Header |
|---|---|
| Zoho (CRM, Creator, Analytics…) | `Authorization: Zoho-oauthtoken <access_token>` (not "Bearer") |
| Airtable | `Authorization: Bearer <personal_access_token>` |
| Others | check their docs (API key, Bearer, Basic) |

## Zoho OAuth: getting tokens for your own scripts
`Self Client → grant code → refresh token (keep) → access token (1 hour) → call the API`

- **Step 1.** **api-console.zoho.com → Add Client → Self Client → Create**. Copy the **Client ID** and **Client Secret**.
- **Step 2.** Open the client → **Generate Code** tab → enter scopes (e.g. `ZohoCRM.modules.ALL`), pick a duration (a few minutes), add a description → **Create** → copy the code.
- **Step 3.** Quickly exchange it (in Postman, `POST`):
```
https://accounts.zoho.com/oauth/v2/token?grant_type=authorization_code&client_id=<id>&client_secret=<secret>&code=<grant_code>
```
You get an `access_token` and a `refresh_token`. Store the refresh token safely.

- **Step 4.** When the access token expires (about 1 hour), get a new one:
```
https://accounts.zoho.com/oauth/v2/token?grant_type=refresh_token&client_id=<id>&client_secret=<secret>&refresh_token=<refresh_token>
```

Watch out: use your account's data center. If your Zoho URL ends in `.eu`, use `accounts.zoho.eu` and `zohoapis.eu`, and the same for `.in` and `.com.au`.

Inside Zoho (Deluge), skip all of this and use a **Connection**: it handles tokens for you.

## Postman: test a call by hand
- **Step 1.** **New → HTTP** → pick the method → paste the URL.
- **Step 2.** **Headers** tab → add `Authorization` = `Zoho-oauthtoken <access_token>` (for Airtable: **Authorization** tab → **Bearer Token**).
- **Step 3.** For POST/PATCH: **Body → raw → JSON** → paste the data.
- **Step 4.** **Send** → read the status code and the response.
- **Step 5.** **Save** into a **Collection** so the team can reuse it.

You should now see a 200/201 status and JSON data.

**Example (read 5 CRM deals):**
```
GET https://www.zohoapis.com/crm/v7/Deals?fields=Deal_Name,Amount,Stage&per_page=5
```
(The API version number changes over time. Check Zoho's CRM API docs for the current one.)

## Webhooks
A webhook is the reverse of calling an API: the other system calls **your** URL when something happens.

`Deal closes → CRM webhook → your URL (Flow / Creator / server) → you act on it`

Where: **Setup → Automation → Actions → Webhooks** (CRM), or a **Webhook** trigger in Zoho Flow.

## Good habits (from experience)
- Never paste tokens or keys into chat, docs or shared code. Use Connections / secret storage.
- Test in Postman before writing code; then the code only has to copy what works.
- Respect rate limits (`429`): slow down, batch, retry.
- Log every failed call with the status code and response text.

## Fill in later: our company
- APIs we call and their docs links:
- Where credentials are stored:

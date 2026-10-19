# Troubleshooting: common errors and fixes

Format: **Symptom → Why → Fix**. Always ask for the **exact error text** and **where it happened** if it isn't given.

## Deluge
| Symptom | Why | Fix |
|---|---|---|
| "Variable 'x' is not defined" | Used before it got a value, a typo, or (in CRM functions) the argument isn't set up | Give it a value first; check spelling; in CRM, open the function → **Edit Arguments** and map it (e.g. `dealId` = Deals – Deal Id) |
| Syntax / "Improper statement" error at line N | Missing `;`, bracket `]` `}` or quote | Look at line N and the line above it; count brackets |
| Field not found / wrong value saved | Used the label instead of the link/API name | Get the real name (`click-paths.md` → "Find a field's link name" / "See field API names") |
| Something is null / empty | The record or field has no value, or the search found nothing | Check first: `if (x != null && x != "")` |
| `zoho.crm.*` fails inside Creator | Creator needs a connection to talk to CRM | Add the connection name as the last parameter: `zoho.crm.createRecord("Leads", data, Map(), "<crm_connection>")` |
| Script stops / times out | Too many loops or API calls in one run | Fetch with criteria instead of looping everything, process in batches, or move it to a schedule |
| `info` message not shown to the user | `info` is for debugging (test runs and logs) | Use `alert` in Load / Validation / User input events, or show the result in a field |

## Zoho CRM
| Symptom | Why | Fix |
|---|---|---|
| Workflow rule didn't run | Rule inactive, condition didn't match, or "Edit" set to a specific field that didn't change | Check the rule is **active**; re-read the condition; test by changing the exact field |
| Rule runs again and again | A field update re-triggers the same rule (loop) | Add a condition that excludes already-processed records (e.g. `Synced` is not checked), and set it at the end |
| Function failed | Code error or bad argument | **Setup → Developer Hub → Functions** → open the function → check its failures/logs ⚠️ |

## Zoho Creator
| Symptom | Why | Fix |
|---|---|---|
| "Supported only in the development environment" (Claude connector) | The app has no development environment | Add the field in the builder UI, or work in an app that has environments |
| Kanban won't group by my field | Kanban groups only by Drop Down, Radio or Lookup | Add a Drop Down field (e.g. Status) and group by it |
| Can't change a field's type | Many types can't be converted | Add a new field of the right type, move the data, delete the old field (back up first) |
| Portal user sees other people's records | Report has no record filter | Add a filter like `Email == zoho.loginuserid` on the portal report / permission |
| Button does nothing | Action not saved, wrong section, or a script error | Re-open **Report Customization → Actions**, check the action and its script; test in the live app |

## Zoho Flow
| Symptom | Why | Fix |
|---|---|---|
| Flow didn't run | Flow is off, or the trigger condition didn't match | Turn it on; check **History** for skipped runs |
| Step failed | Expired connection, missing required field, or wrong data type | **History → the run → the red step** shows input and error; reconnect or fix the mapping |
| Duplicates in the other app | Using "create" every time | Search first, then update if found (or use upsert); store the other system's ID |

## APIs (any system)
| Code | Means | Fix |
|---|---|---|
| 400 | Bad request (wrong body or format) | Check the JSON shape and field names against the docs |
| 401 | Not logged in / token expired | Refresh the token or re-authorize the connection |
| 403 | Logged in but not allowed | Add the right scope / permission |
| 404 | Wrong URL or record ID | Check the URL, base/table/module names and the ID |
| 422 | Data rejected (e.g. Airtable unknown field or wrong type) | Field names must match exactly; check value types |
| 429 | Too many requests | Slow down and retry (Airtable: wait 30 seconds) |
| 500 / 502 / 503 | Their server problem | Retry later; log it |

**Zoho OAuth errors**
- `invalid_code`: the grant code expired (it lasts only minutes). Generate a new one.
- `invalid_client`: wrong client ID/secret, or wrong data center domain (`.com` vs `.eu` vs `.in`).
- `INVALID_TOKEN` / `INVALID_OAUTHTOKEN`: access token expired (about 1 hour). Use the refresh token.

## Zoho Analytics
| Symptom | Why | Fix |
|---|---|---|
| Numbers look doubled | Join on a column with repeats | Join on a unique ID; check row counts before and after the join |
| Data is old | Sync hasn't run yet | Check the sync schedule; run a manual sync |
| SQL error on a column | Column name has spaces | Wrap it in double quotes: `"Deal Owner"` |

## When nothing here matches
1. Get the exact error text and a screenshot.
2. Find the step where it breaks (logs, Flow History, API response).
3. Test that one step alone with a test record.
4. Fix it, retest, and write it down here if it's likely to happen again.

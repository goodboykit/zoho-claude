# Documentation template

Why: so anyone on the team can understand, run and fix a tool if you're away ("redundancy"), and to train new people.

Copy this for each process, function or integration:

```
# <Name>
**Owner:** <person>   **Last updated:** <date>

## What it does (1–2 sentences, plain English)

## Who uses it
<team / role>

## How it works
<Trigger> → <step> → <step> → <result>

## Where it lives
- App / module / flow name:
- Script or function name:
- Connections / credentials used (names only, never secrets):

## How to run or use it
- **Step 1.** …
- **Step 2.** …

## If it breaks
- Where to look (logs, Flow history, error emails):
- Common errors and fixes:
- Who to contact:

## Change log
| Date | Change | By |
```

Tips:
- Write for a non-technical reader first; put code details at the bottom.
- One doc per thing. Link related docs.
- Update the doc in the same day you change the tool.

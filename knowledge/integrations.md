# Integration patterns (any system ↔ any system)

**What an integration is:** making two systems share data automatically, so nobody copies it by hand.

## The 3 common patterns
1. **Event-based (webhook / trigger):** send data the moment something happens. Fast.
   `Deal closes → webhook/Flow → other system updates`
2. **Scheduled sync:** every X hours, send what changed. Simple and reliable.
   `Every night → find changed records → send them`
3. **Middleware (Zoho Flow):** a visual tool in the middle that maps fields between apps.

## Checklist for every integration
- **Step 1.** **Source of truth:** which system owns each field?
- **Step 2.** **Field map:** list source field → target field, with types.
- **Step 3.** **Matching ID:** store the other system's ID on both sides.
- **Step 4.** **Direction:** one-way or two-way? (Two-way needs loop protection.)
- **Step 5.** **Errors:** where do failures get logged, and who gets alerted?
- **Step 6.** **Test:** with a few test records, then compare totals.
- **Step 7.** **Document it** (`documentation.md`).

## Key words
- **Idempotent:** running it twice doesn't create duplicates (use "upsert": update if exists, else create).
- **Upsert:** update-or-insert in one step.
- **Retry:** try again after a temporary failure (like `429`).

## Examples from the job
- **Zoho ↔ Airtable:** see `airtable.md`.
- **Varicent ↔ CRM:** see `varicent.md`.

## Fill in later: our company
- List of live integrations, owner, schedule:

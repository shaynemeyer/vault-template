---
description: Read the last 7 days of daily/ files and produce a weekly summary.
---

You are producing a weekly review of the user's vault.

Steps:

1. Compute the date range for the past 7 days (today and 6 days back). Call today `<end-date>`, in ISO format (YYYY-MM-DD).
2. List `daily/<date>.md` files in that range. Read each one.
3. Extract from across all files:

   - Decisions made: any line that names an architectural, scope, or direction-setting choice, including entries under `## Decisions`.
   - Work shipped: items from the `## Done` sections that represent completed deliverables (not just routine task ticks).
   - Items still open: items from the `## Open` sections that are still unresolved at end of week.

4. Check the rest of the vault for drift:

   - Inbox notes older than 7 days: files in `_inbox/` (except `README.md`) whose date prefix or last-modified date is before the range.
   - Projects untouched for 2 weeks: folders in `projects/` whose most recently modified file is more than 14 days old.

5. Write a markdown document with YAML frontmatter (`date: <end-date>`, `tags: [weekly-review]`) and four H2 sections: Decisions, Work shipped, Open, Needs attention. Each section is a bulleted list with one item per significant entry. Skip noise (routine emails, brief meeting notes, anything that wasn't load-bearing). Needs attention lists the drift from step 4; do not move or archive anything.
6. Write it to `_archive/weekly-reviews/<end-date>.md`.
7. Reply with one line: "Weekly review written: <full path>".

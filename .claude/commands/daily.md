---
description: Open or create today's daily/<date>.md file with template.
---

You are creating or completing today's daily note in the user's vault.

Steps:

1. Compute today's date in ISO format (YYYY-MM-DD).
2. If `daily/<today>.md` does not exist, create it with this template:

   ```markdown
   ---
   date: <today>
   tags: [daily]
   ---

   # <today>

   ## Intent

   - (one bullet: what's the priority for today)

   ## Done

   - (filled in throughout the day; one line per shipped item)

   ## Open

   - (filled in at end-of-day; questions or items rolling forward)
   ```

   Then reply with one line: "Daily note created: <full path>".

3. If the file already exists (for example, created by the activity-logging hook), do not rewrite or reorder anything in it. Append only the `## Intent`, `## Done` and `## Open` sections that are missing, using the placeholder bullets above. Reply with one line: "Daily note updated: <full path>" if you added sections, or "Daily note exists: <full path>" if none were missing.

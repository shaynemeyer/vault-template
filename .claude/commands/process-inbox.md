---
description: Read _inbox/ and route each note to projects/, daily/, people/, or _archive/.
---

You are processing the inbox in the user's vault.

Steps:

1. List every file in `_inbox/` except `README.md`. For each file:

   - Read its contents.
   - Determine where it belongs: `projects/<project>/`, `people/<name>/`, today's daily note, or `_archive/`.
   - Only today's daily note (`daily/<today>.md`) is a valid daily destination. Never route a note into an earlier daily file.
   - Recommend a renamed filename if appropriate (lowercase kebab-case, e.g. add a project prefix).

2. Output a markdown table with columns: current path, recommended destination path, one-line reason.

3. Do NOT move the files yet. Wait for the user to review the table.

If you are unsure about a file's destination, mark the row "needs review" and explain in one line. Do not invent a destination. The user will handle the ambiguous ones manually.

After the user approves (all rows or a subset):

- Move each approved file with `mv`. Create destination folders in lowercase kebab-case if needed. Never delete a note.
- For a note routed to today's daily note, append its content under a heading at the end of `daily/<today>.md`, then move the original file to `_archive/`.
- Reply with one line per moved file: "<old path> -> <new path>".

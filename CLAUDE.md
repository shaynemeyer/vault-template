# Personal Vault

Personal Obsidian vault. Plain Markdown files; Obsidian is the editor, Claude is
an assistant that reads, files, and summarizes notes.

## Structure

- `_inbox/` - Unclassified quick captures. Temporary. Anything older than 7 days
  is drift: move it to its real folder or archive it.
- `daily/` - One file per day, named `YYYY-MM-DD.md`. Append-only during the
  day. Action items may be extracted back into `_inbox/` at end of day.
- `projects/<project>/` - Active work only. Each project has `README.md`, a
  decision log, and working notes. Untouched for 2 weeks means archive it.
  The active list should fit on one screen.
- `people/<name>/` - One folder per regular contact: a profile note, a
  `meetings/` folder, and an open-asks note. Read this folder before 1:1 prep.
- `_archive/` - Dormant projects and processed daily notes. Archive is not
  delete.

## Rules for Claude

- Never delete notes. Move them to `_archive/` instead.
- Do not rewrite existing note content; append or ask first.
- In `daily/`, only append to today's file.
- Use ISO dates (`YYYY-MM-DD`) in filenames and text.
- Link notes with Obsidian wikilinks: `[[note-name]]`.
- Use YAML frontmatter (Obsidian properties) for metadata such as `tags`,
  `date`, `status`.
- Use lowercase kebab-case for new file and folder names
  (e.g. `people/jane-doe/`).
- Do not edit anything in `.obsidian/`.
- No emojis.

## Common tasks

- **Process inbox**: for each note in `_inbox/`, propose a destination
  (project, person, daily, or archive), then move on approval.
- **1:1 prep**: read `people/<name>/`, summarize recent meetings and open asks.
- **Weekly review**: flag inbox notes older than 7 days and projects untouched
  for 2 weeks.

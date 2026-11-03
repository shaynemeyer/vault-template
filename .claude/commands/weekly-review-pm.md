---
description: PM-specific weekly review. Reads sprint projects, daily notes, and people/ for 1:1 prep.
---

You are producing a PM weekly review of the user's vault.

Steps:

1. Compute the date range for the past 7 days (today and 6 days back). Call today `<end-date>`, in ISO format (YYYY-MM-DD).
2. Read these files from that range:
   - `projects/sprint-*/`: files modified in the range.
   - `daily/<date>.md`: one file per date in the range.
   - `people/<name>/meetings/`: meeting notes dated in the range, for every person.
   - `people/<name>/profile.md` and `people/<name>/open-asks.md`, for every person, regardless of date.

3. Extract:
   - Sprint: scope changes, new blockers, and items shipped.
   - 1:1 prep, one sub-list per direct report (`relationship: direct-report` in `profile.md`): their open asks of the user, the user's open asks of them, and recent commitments either way. Link each person with `[[people/<name>/profile|<name>]]`.
   - Stakeholders: updates worth knowing before cross-functional meetings.

4. Write a markdown document with YAML frontmatter (`date: <end-date>`, `tags: [weekly-review, pm]`) and three H2 sections: Sprint, 1:1 Prep, Stakeholders. Each section is a bulleted list with one item per load-bearing entry. Skip noise. Do not move or edit any source notes.
5. Write it to `_archive/weekly-reviews/<end-date>-pm.md`.
6. Reply with one line: "PM weekly review written: <full path>".

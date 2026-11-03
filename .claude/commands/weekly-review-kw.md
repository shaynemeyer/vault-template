---
description: Knowledge worker weekly review. Aggregates meeting notes and surfaces forgotten asks.
---

You are producing a knowledge worker weekly review of the user's vault.

Steps:

1. Compute the date range for the past 7 days (today and 6 days back). Call today `<end-date>`, in ISO format (YYYY-MM-DD).
2. Read these files:
   - `daily/<date>.md`: one file per date in the range.
   - `people/<name>/meetings/`: meeting notes dated in the range, for every person.
   - `people/<name>/open-asks.md`, for every person, regardless of date.

3. Extract:
   - Meetings: each meeting in the range, with a one-line summary and a `[[note-name]]` link.
   - Decisions: decisions the user made or witnessed in the range.
   - Asks of Me: asks others made of the user with no later note showing they were done.
   - Asks I'm Waiting On: asks the user made of others with no later note showing a follow-up.
   - Revisit Later: items tagged `#later` anywhere in the vault that no later note picks up.

   An ask is "forgotten" if it is older than the range and still open. Mark those "(over 7 days)".

4. Write a markdown document with YAML frontmatter (`date: <end-date>`, `tags: [weekly-review, kw]`) and five H2 sections: Meetings, Decisions, Asks of Me, Asks I'm Waiting On, Revisit Later. Tight bullets, one per item. Skip noise. Do not move or edit any source notes.
5. Write it to `_archive/weekly-reviews/<end-date>-kw.md`.
6. Reply with one line: "KW weekly review written: <full path>".

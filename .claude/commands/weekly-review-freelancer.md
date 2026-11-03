---
description: Freelancer weekly review. Surfaces scope drift per client and produces billing summaries.
---

You are producing a freelancer weekly review of the user's vault.

Steps:

1. Compute the date range for the past 7 days (today and 6 days back). Call today `<end-date>`, in ISO format (YYYY-MM-DD).
2. List active clients: folders in `projects/` that contain `scope.md`. Call each one `<client>`.
3. Read `daily/<date>.md` for each date in the range, once.
4. For each client, read:
   - `projects/<client>/scope.md`: the original agreement. Its `billing` frontmatter property is one of `hourly`, `fixed`, `value`, or `retainer`.
   - `projects/<client>/changes.md`: scope changes over time.
   - `people/<name>/meetings/`: notes dated in the range that mention the client.
   - Entries in the daily notes that mention the client.

5. Write one H2 section per client, titled `<client> (<billing>)`, with a `[[projects/<client>/scope|scope]]` link and these bullets, ordered by billing model:
   - `hourly`: Hours logged, Hours estimated, Scope changes, Confirm in writing, Status.
   - `fixed`, `value`, `retainer`: Status, Deliverables, Scope changes, Confirm in writing, Hours logged, Hours estimated.
   - Not set: the `hourly` bullets plus Deliverables, with the title `<client> (billing not set)`.

   Bullet definitions:
   - Hours logged: hours the user recorded in the notes, with the source note, or "None logged".
   - Hours estimated: a rough estimate from daily work items, marked "(estimate, not for invoicing)".
   - Deliverables: items from `scope.md` and `changes.md` delivered or advanced this week.
   - Scope changes: `changes.md` entries dated in the range.
   - Confirm in writing: anything in the meeting notes that should be confirmed in writing before invoicing.
   - Status: "Needs scope conversation before invoice" if the week's work does not clearly match `scope.md` plus `changes.md`; otherwise "In scope".

6. Add YAML frontmatter (`date: <end-date>`, `tags: [weekly-review, freelancer]`). Skip noise. Do not move or edit any source notes.
7. Write it to `_archive/weekly-reviews/<end-date>-freelancer.md`.
8. Reply with one line: "Freelancer weekly review written: <full path>".

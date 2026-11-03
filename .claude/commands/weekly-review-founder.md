---
description: Founder weekly review. Aggregates decisions and shipped work into investor-update-ready bullets.
---

You are producing a founder weekly review of the user's vault.

Steps:

1. Compute the date range for the past 7 days (today and 6 days back). Call today `<end-date>`, in ISO format (YYYY-MM-DD).
2. Read these files from that range:
   - `projects/<project>/`: `decisions.md` and any files modified in the range, for every project.
   - `daily/<date>.md`: one file per date in the range.

3. Extract:
   - Decisions: entries added to each project's `decisions.md` in the range, plus entries under `## Decisions` in daily notes. Summarize each in 2-3 sub-bullets and link the source with `[[note-name]]`.
   - Shipped: items from `## Done` sections that are concrete deliverables, not routine tasks.
   - Open Questions: unresolved items from `## Open` sections and risks worth flagging.

4. Write a markdown document with YAML frontmatter (`date: <end-date>`, `tags: [weekly-review, founder]`) and three H2 sections: Decisions, Shipped, Open Questions. Shipped must be tight enough to paste into an investor update with light editing. Skip noise. Do not move or edit any source notes.
5. Write it to `_archive/weekly-reviews/<end-date>-founder.md`.
6. Reply with one line: "Founder weekly review written: <full path>".

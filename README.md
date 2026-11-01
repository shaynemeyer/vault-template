# Vault Template

A plain-Markdown notes vault for Obsidian, with Claude Code and Kiro hooks that
keep the AI agent following the vault's rules.

## Requirements

- [Obsidian](https://obsidian.md) (editor)
- [Claude Code](https://code.claude.com/docs) and/or [Kiro](https://kiro.dev/docs)
- `bash`, `jq`, `python3`
- [`gh`](https://cli.github.com) (optional, to create a repo from this template)

## Setup

1. Create your vault from this template:

   ```bash
   gh repo create my-vault --private --template OWNER/vault-template --clone
   ```

   Keep your vault private. It will hold your notes.

2. Open the `my-vault` folder as a vault in Obsidian.
3. Edit `CLAUDE.md`: set the title and adjust the rules to taste.
4. Start Claude Code or Kiro **from the vault root**. The hook paths are
   relative to it.

## Structure

| Folder | Purpose |
|---|---|
| `_inbox/` | Quick captures. Process within 7 days. |
| `daily/` | One note per day, `YYYY-MM-DD.md`. Append-only. |
| `projects/` | Active work only. Archive after 2 weeks untouched. |
| `people/` | One folder per regular contact. Used for 1:1 prep. |
| `_archive/` | Dormant material. Archive is not delete. |

`CLAUDE.md` holds the rules the agent follows. Each folder's `README.md`
describes it in more detail.

## Hooks

Scripts live in `.claude/hooks/`. Claude Code registers them in
`.claude/settings.json`; Kiro registers them in `.kiro/hooks/vault-hooks.json`.

| Hook | What it does | Claude Code | Kiro |
|---|---|---|---|
| `session-start.sh` | Loads `CLAUDE.md` into context | Yes | Yes |
| `user-prompt-submit.sh` | Adds a folder-rules reminder to each prompt | Yes | Yes |
| `post-tool-use.py` | Logs file edits to today's daily note | Yes | Not yet |
| `stop.sh` | Asks the agent to log decisions at end of turn | Yes | Not yet |
| `pre-compact.sh` | Asks the agent to log decisions before compaction | Yes | No equivalent |

`post-tool-use.py` and `stop.sh` aren't wired into Kiro yet: Kiro's docs don't
specify the event fields they need.

Docs: [Claude Code hooks](https://code.claude.com/docs/en/hooks),
[Kiro hooks](https://kiro.dev/docs/hooks/index).

Full guide: [docs/user-guide.md](docs/user-guide.md).

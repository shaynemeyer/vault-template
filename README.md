# Vault Template

A plain-Markdown notes vault for Obsidian, with Claude Code and Kiro hooks that
keep the AI agent following the vault's rules.

Website: <https://shaynemeyer.github.io/vault-template/>

## Requirements

- [Obsidian](https://obsidian.md) (editor)
- [Claude Code](https://code.claude.com/docs) and/or [Kiro](https://kiro.dev/docs)
- `bash`, `jq`, `python3`
- [`gh`](https://cli.github.com) (optional; see Setup for alternatives)

## Platform support

| Platform | Status                             |
| -------- | ---------------------------------- |
| macOS    | Supported; tested with Claude Code |
| Windows  | Not yet proven; work in progress   |

On Windows, the hooks are bash scripts and need Git Bash and `jq`. Without Git
Bash, Claude Code runs hooks in PowerShell, where they fail
([Claude Code hooks](https://code.claude.com/docs/en/hooks)). Full Windows
support is being tested.

## Setup

1. Create your vault from this template:

   ```bash
   gh repo create my-vault --private --template OWNER/vault-template --clone
   ```

   Keep your vault private. It will hold your notes.

   A private GitHub repo is one way to store and back up the vault. A folder in
   iCloud Drive, Dropbox, OneDrive or Google Drive, or Obsidian Sync, works too.
   Use one sync method per vault. See
   [Where to store your vault](_archive/docs/user-guide.md#where-to-store-your-vault).

   Without `gh`: click **Use this template** on GitHub, create a private repo,
   then `git clone` it. Or click **Code**, then **Download ZIP** to keep the vault
   local. The [user guide](_archive/docs/user-guide.md#steps) has details.

2. Open the `my-vault` folder as a vault in Obsidian.
3. Edit `CLAUDE.md`: set the title and adjust the rules to taste.
4. Start Claude Code or Kiro **from the vault root**. The hook paths are
   relative to it.

## Structure

| Folder      | Purpose                                            |
| ----------- | -------------------------------------------------- |
| `_inbox/`   | Quick captures. Process within 7 days.             |
| `daily/`    | One note per day, `YYYY-MM-DD.md`. Append-only.    |
| `projects/` | Active work only. Archive after 2 weeks untouched. |
| `people/`   | One folder per regular contact. Used for 1:1 prep. |
| `_archive/` | Dormant material. Archive is not delete.           |

`CLAUDE.md` holds the rules the agent follows. Each folder's `README.md`
describes it in more detail.

## Hooks

Scripts live in `.claude/hooks/`. Claude Code registers them in
`.claude/settings.json`; Kiro registers them in `.kiro/hooks/vault-hooks.json`.

| Hook                    | What it does                                      | Claude Code | Kiro          |
| ----------------------- | ------------------------------------------------- | ----------- | ------------- |
| `session-start.sh`      | Loads `CLAUDE.md` into context                    | Yes         | Yes           |
| `user-prompt-submit.sh` | Adds a folder-rules reminder to each prompt       | Yes         | Yes           |
| `post-tool-use.py`      | Logs file edits to today's daily note             | Yes         | Not yet       |
| `stop.sh`               | Asks the agent to log decisions at end of turn    | Yes         | Not yet       |
| `pre-compact.sh`        | Asks the agent to log decisions before compaction | Yes         | No equivalent |

`post-tool-use.py` and `stop.sh` aren't wired into Kiro yet: Kiro's docs don't
specify the event fields they need.

Docs: [Claude Code hooks](https://code.claude.com/docs/en/hooks),
[Kiro hooks](https://kiro.dev/docs/hooks/index).

## Sensitive notes

The agent can read anything in the vault, and so can your sync or backup
provider. Don't store passwords, keys or other secrets here.

To keep a folder away from Claude Code, you need both a `Read` deny rule and
the sandbox in `.claude/settings.json`. Either one alone leaks: the deny rule
misses `grep -r` and scripts, and the sandbox misses the Read tool.

```json
{
  "permissions": { "deny": ["Read(./private/**)"] },
  "sandbox": {
    "enabled": true,
    "allowUnsandboxedCommands": false,
    "failIfUnavailable": true,
    "filesystem": { "denyRead": ["./private"] }
  }
}
```

This was tested on macOS with a top-level folder; nested paths are untested.
The sandbox needs macOS, Linux or WSL2. Kiro's
[`.kiroignore`](https://kiro.dev/docs/kiroignore/) blocks direct reads and
search, but its docs don't say whether shell commands are covered. Notes that
must never be read belong where the agent can't read them at all, such as an
encrypted disk image you unmount before a session.

Docs: [permissions](https://code.claude.com/docs/en/permissions),
[sandboxing](https://code.claude.com/docs/en/sandboxing).

Full guide: [\_archive/docs/user-guide.md](_archive/docs/user-guide.md). It
lives inside the vault's archive; delete it once you no longer need it.

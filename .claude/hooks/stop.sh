#!/usr/bin/env bash

set -euo pipefail

ACTIVE=$(jq -r '.stop_hook_active // false')
[[ "$ACTIVE" == "true" ]] && exit 0

VAULT="${CLAUDE_PROJECT_DIR:-.}"
TODAY=$(date +%Y-%m-%d)
DAILY="$VAULT/daily/${TODAY}.md"

[[ -f "$DAILY" ]] || exit 0

ACTIVITY=$(awk '/^## Vault Activity/{f=1;next} /^## /{f=0} f' "$DAILY" \
  | grep -c '^- ' || true)

[[ "$ACTIVITY" -eq 0 ]] && exit 0

DIRECTIVE="Session ending. Close out the session:
1. Append any decisions made to daily/${TODAY}.md under a ## Decisions heading,
   one bullet each: '- HH:MM <decision>. Reasoning: <one sentence>.'
2. Update active project READMEs if next actions changed
3. Update people/ logs if anyone was discussed
4. Note any _inbox/ items that got processed

Do this now without asking. If nothing of substance happened, exit silently."

jq -n --arg ctx "$DIRECTIVE" '{hookSpecificOutput: {hookEventName: "Stop", additionalContext: $ctx}}'

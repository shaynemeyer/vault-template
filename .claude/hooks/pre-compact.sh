#!/usr/bin/env bash

set -euo pipefail

TODAY=$(date +%Y-%m-%d)
DIRECTIVE="Before compacting, scan this session for decisions made. For each
decision not already logged, append a bullet to daily/${TODAY}.md under a
## Decisions heading. Format:
'- HH:MM <decision>. Reasoning: <one sentence>.'
If no decisions were made in this session, do nothing. Do not ask
permission; just write the file."

jq -n --arg ctx "$DIRECTIVE" '{hookSpecificOutput: {hookEventName: "PreCompact", additionalContext: $ctx}}'

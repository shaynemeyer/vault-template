#!/usr/bin/env bash
set -euo pipefail

VAULT="${CLAUDE_PROJECT_DIR:-.}"
ACTIVE=$(awk '/^## Active Projects/{f=1;next} /^## /{f=0} f && /^- `projects\//{
  match($0, /projects\/[a-z0-9-]+/);
  print substr($0, RSTART+9, RLENGTH-9); exit
}' "$VAULT/CLAUDE.md" 2>/dev/null || echo "none")

REMINDER="VAULT REMINDER:
- 5 folders only: _inbox/, projects/, daily/, people/, _archive/
- Active project: $ACTIVE
- Default destination: _inbox/ if uncertain
- Read the active project README before suggesting work
- Do not invent new top-level folders"

printf "%s\n" "$REMINDER"

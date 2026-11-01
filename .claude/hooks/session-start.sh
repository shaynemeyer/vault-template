#!/usr/bin/env bash
set -euo pipefail

VAULT="${CLAUDE_PROJECT_DIR:-.}"
CLAUDE_MD=$(cat "$VAULT/CLAUDE.md" 2>/dev/null || echo "")

CONTEXT=$(printf "Vault context loaded.\n\n=== CLAUDE.md ===\n%s" "$CLAUDE_MD")

printf "%s\n" "$CONTEXT"
#!/usr/bin/env python3

import datetime
import json
import os
import pathlib
import sys

event = json.load(sys.stdin)
tool = event.get("tool_name", "?")
file_path = event.get("tool_input", {}).get("file_path") or event.get(
    "tool_input", {}
).get("path", "?")

vault = pathlib.Path(os.environ.get("CLAUDE_PROJECT_DIR") or event.get("cwd", "."))
day_file = vault / "daily" / f"{datetime.date.today().isoformat()}.md"
day_file.parent.mkdir(exist_ok=True)

if not day_file.exists():
    day_file.write_text(f"# {datetime.date.today().isoformat()}\n\n## Vault Activity\n")
elif "## Vault Activity" not in day_file.read_text():
    with day_file.open("a") as f:
        f.write("\n## Vault Activity\n")


def insert_activity(text, entry):
    """Insert entry as the last line of the Vault Activity section."""
    lines = text.splitlines(keepends=True)
    start = next(i for i, line in enumerate(lines) if line.startswith("## Vault Activity"))
    end = next(
        (i for i in range(start + 1, len(lines)) if lines[i].startswith("## ")),
        len(lines),
    )
    while end > start + 1 and not lines[end - 1].strip():
        end -= 1
    if not lines[end - 1].endswith("\n"):
        lines[end - 1] += "\n"
    lines.insert(end, entry)
    return "".join(lines)


ts = datetime.datetime.now().strftime("%H:%M")
rel = str(file_path).removeprefix(str(vault) + "/")
day_file.write_text(insert_activity(day_file.read_text(), f"- {ts} {tool}: `{rel}`\n"))

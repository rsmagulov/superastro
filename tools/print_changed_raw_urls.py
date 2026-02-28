# tools/print_changed_raw_urls.py
from __future__ import annotations

import subprocess
from pathlib import Path

OWNER = "rsmagulov"
REPO = "superastro"
BRANCH = "main"

def run(cmd: list[str]) -> str:
    return subprocess.check_output(cmd, text=True).strip()

def main() -> None:
    root = Path(__file__).resolve().parents[1]
    files = run(["git", "-C", str(root), "diff", "--name-only"]).splitlines()
    files = [f for f in files if f and not f.endswith((".pyc",)) and "__pycache__" not in f]

    if not files:
        print("No changed files (git diff --name-only is empty).")
        return

    for f in files:
        print(f"https://raw.githubusercontent.com/{OWNER}/{REPO}/{BRANCH}/{f}")

if __name__ == "__main__":
    main()

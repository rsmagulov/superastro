# C:\Projects\superastro\astroprocessor\tools\capture_cli_stdout.py
r"""
Capture stdout of a command to a file without PowerShell re-encoding (UTF-16/BOM).

Usage (PowerShell):
  py tools\capture_cli_stdout.py --out atomize_dryrun.json -- py -m app.knowledge.cli atomize --all --dry-run --json ...
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path


def parse_args(argv: list[str]) -> argparse.Namespace:
    p = argparse.ArgumentParser()
    p.add_argument("--out", required=True)
    p.add_argument("cmd", nargs=argparse.REMAINDER)
    ns = p.parse_args(argv)
    if not ns.cmd or ns.cmd[0] != "--":
        p.error("Command must be provided after `--` (example: -- py -m ...)")
    ns.cmd = ns.cmd[1:]
    return ns


def main(argv: list[str]) -> int:
    ns = parse_args(argv)
    out_path = Path(ns.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)

    proc = subprocess.run(ns.cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
    out_path.write_bytes(proc.stdout)

    if proc.returncode != 0:
        sys.stderr.buffer.write(proc.stderr)
        sys.stderr.write(f"\n[capture_cli_stdout] rc={proc.returncode} (stdout saved to {out_path})\n")
    return proc.returncode


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))

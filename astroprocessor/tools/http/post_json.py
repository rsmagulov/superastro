# tools/http/post_json.py
from __future__ import annotations

import argparse
import json
import sys
import urllib.error
import urllib.request
from pathlib import Path


def _read_json(path: Path) -> bytes:
    text = path.read_text(encoding="utf-8")
    json.loads(text)  # validate early
    return text.encode("utf-8")


def _write_bytes(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(prog="post_json")
    p.add_argument("--url", required=True)
    p.add_argument("--in", dest="in_path", required=True)
    p.add_argument("--out", dest="out_path", required=True)
    p.add_argument("--timeout", type=float, default=30.0)
    args = p.parse_args(argv)

    in_path = Path(args.in_path)
    out_path = Path(args.out_path)

    body = _read_json(in_path)
    req = urllib.request.Request(
        args.url,
        data=body,
        headers={"Content-Type": "application/json; charset=utf-8"},
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=args.timeout) as resp:
            data = resp.read()
            _write_bytes(out_path, data)
            print(f"HTTP:{resp.status}")
            return 0
    except urllib.error.HTTPError as e:
        data = e.read() if hasattr(e, "read") else b""
        _write_bytes(out_path, data or str(e).encode("utf-8", errors="replace"))
        print(f"HTTP:{e.code}", file=sys.stderr)
        return 2
    except Exception as e:
        _write_bytes(out_path, str(e).encode("utf-8", errors="replace"))
        print(f"ERR:{e}", file=sys.stderr)
        return 3


if __name__ == "__main__":
    raise SystemExit(main())

# astroprocessor/tools/normalize_text_ru.py
from __future__ import annotations

"""
Normalize Russian text files (txt/md) before ingest:
- fix common mojibake (UTF-8 bytes decoded as CP866 or CP1251)
- normalize Unicode (NFC)
- remove soft hyphen and control chars
- unify whitespace a bit

Usage:
    py tools/normalize_text_ru.py --path .\data\knowledge_sources\inbox --in-place
    py tools/normalize_text_ru.py --path .\knowledge\docs --in-place
"""

import argparse
import re
import unicodedata
from pathlib import Path

RE_MOJIBAKE_CP866 = re.compile(r"(?:╨|╤|тАФ|тАж|┬л|┬╗)")
RE_MOJIBAKE_CP1251 = re.compile(r"(?:Р[А-Яа-я]|С[А-Яа-я]|вЂ[“”«»—–…]|Ð|Ñ)")
RE_CTRL = re.compile(r"[\u0000-\u0008\u000B\u000C\u000E-\u001F]")
SOFT_HYPHEN = "\u00ad"
NBSP = "\u00a0"
NNBSP = "\u202f"


def _score_garble(s: str) -> int:
    return (
        5 * len(RE_MOJIBAKE_CP866.findall(s))
        + 5 * len(RE_MOJIBAKE_CP1251.findall(s))
        + len(RE_CTRL.findall(s))
    )


def _try_unmojibake(s: str) -> str:
    """
    Try reversing the most common damage:
    - UTF-8 bytes mis-decoded as CP866 -> shows up as '╨╤...'
    - UTF-8 bytes mis-decoded as CP1251 -> shows up as 'Р...'
    Pick the best by garble score.
    """
    candidates = [s]

    # CP866 -> UTF-8 (common for '╨╤' garbage)
    try:
        candidates.append(s.encode("cp866", errors="strict").decode("utf-8", errors="strict"))
    except Exception:
        pass

    # CP1251 -> UTF-8 (common for 'Р...' garbage)
    try:
        candidates.append(s.encode("cp1251", errors="strict").decode("utf-8", errors="strict"))
    except Exception:
        pass

    best = min(candidates, key=_score_garble)
    return best


def _normalize_text(s: str) -> str:
    s = unicodedata.normalize("NFC", s)
    s = s.replace(SOFT_HYPHEN, "")
    s = s.replace(NBSP, " ").replace(NNBSP, " ")
    s = RE_CTRL.sub("", s)
    s = _try_unmojibake(s)
    return s


def _iter_files(root: Path) -> list[Path]:
    if root.is_file():
        return [root]
    files: list[Path] = []
    for ext in ("*.txt", "*.md"):
        files.extend(root.rglob(ext))
    return sorted(set(files))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--path", required=True, help="file or directory with .txt/.md")
    ap.add_argument("--in-place", action="store_true", help="overwrite files (UTF-8)")
    ap.add_argument("--out-dir", default="", help="if not in-place, write to this dir preserving names")
    args = ap.parse_args()

    root = Path(args.path)
    files = _iter_files(root)
    if not files:
        print("No .txt/.md files found:", root.resolve())
        return 1

    out_dir = Path(args.out_dir).resolve() if args.out_dir else None
    if not args.in_place and out_dir is None:
        raise SystemExit("Use --in-place or set --out-dir")

    changed = 0
    total = 0

    for p in files:
        total += 1
        raw = p.read_text(encoding="utf-8", errors="replace")
        norm = _normalize_text(raw)
        if norm != raw:
            changed += 1

        if args.in_place:
            if norm != raw:
                p.write_text(norm, encoding="utf-8", newline="\n")
        else:
            assert out_dir is not None
            out_dir.mkdir(parents=True, exist_ok=True)
            (out_dir / p.name).write_text(norm, encoding="utf-8", newline="\n")

    print(f"files_total={total} changed={changed}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

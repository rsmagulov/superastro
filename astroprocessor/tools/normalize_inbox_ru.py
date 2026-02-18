# astroprocessor/tools/normalize_inbox_ru.py
from __future__ import annotations

r"""
Normalize Russian DOCX/TXT/MD in inbox and export clean UTF-8 TXT for ingest.

Usage (from astroprocessor/):
    py tools/normalize_inbox_ru.py --inbox .\data\knowledge_sources\inbox --out .\data\knowledge_sources\inbox_norm

Then ingest:
    py -m app.knowledge.cli init
    py -m app.knowledge.cli ingest --path .\data\knowledge_sources\inbox_norm --locale ru-RU --chunk-size 6000 --force
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


def _score(s: str) -> int:
    return (
        10 * len(RE_MOJIBAKE_CP866.findall(s))
        + 10 * len(RE_MOJIBAKE_CP1251.findall(s))
        + len(RE_CTRL.findall(s))
    )


def _try_fix_mojibake(s: str) -> str:
    candidates = [s]

    try:
        candidates.append(s.encode("cp866", errors="strict").decode("utf-8", errors="strict"))
    except Exception:
        pass

    try:
        candidates.append(s.encode("cp1251", errors="strict").decode("utf-8", errors="strict"))
    except Exception:
        pass

    return min(candidates, key=_score)


def normalize_text(s: str) -> str:
    s = s or ""
    s = s.replace("\r\n", "\n").replace("\r", "\n")
    s = unicodedata.normalize("NFC", s)
    s = s.replace(SOFT_HYPHEN, "")
    s = s.replace(NBSP, " ").replace(NNBSP, " ")
    s = RE_CTRL.sub("", s)
    s = _try_fix_mojibake(s)
    s = re.sub(r"[ \t]+", " ", s)
    s = re.sub(r"\n{3,}", "\n\n", s).strip()
    return s


def read_docx_text(p: Path) -> str:
    from docx import Document  # python-docx

    doc = Document(str(p))
    paras = [x.text for x in doc.paragraphs if (x.text or "").strip()]
    return "\n\n".join(paras)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--inbox", required=True, help="dir with source files (.docx/.txt/.md)")
    ap.add_argument("--out", required=True, help="output dir for normalized .txt")
    args = ap.parse_args()

    inbox = Path(args.inbox)
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    if not inbox.exists():
        print("ERROR: inbox not found:", inbox)
        return 2

    files = sorted([p for p in inbox.rglob("*") if p.is_file() and p.suffix.lower() in {".docx", ".txt", ".md"}])
    if not files:
        print("No .docx/.txt/.md files found:", inbox.resolve())
        return 1

    changed = 0
    total = 0

    for p in files:
        total += 1
        if p.suffix.lower() == ".docx":
            raw = read_docx_text(p)
        else:
            raw = p.read_text(encoding="utf-8", errors="replace")

        norm = normalize_text(raw)
        if norm != raw:
            changed += 1

        (out / (p.stem + ".txt")).write_text(norm, encoding="utf-8", newline="\n")

    print(f"files_total={total} exported_txt={total} changed={changed} out={out.resolve()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

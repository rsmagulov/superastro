from __future__ import annotations

import re
from pathlib import Path

MOJIBAKE_RE = re.compile(r"(?:Р[А-Яа-я]|С[А-Яа-я]|вЂ[“”«»—–…]|Ð|Ñ)")

def looks_like_mojibake(s: str) -> bool:
    return bool(s) and len(MOJIBAKE_RE.findall(s)) >= 3

def try_unmojibake_cp1251(s: str) -> str:
    try:
        fixed = s.encode("cp1251", errors="strict").decode("utf-8", errors="strict")
    except Exception:
        return s
    # принимаем только если маркеров стало меньше
    if len(MOJIBAKE_RE.findall(fixed)) < len(MOJIBAKE_RE.findall(s)):
        return fixed
    return s

def main() -> int:
    docs_dir = Path("knowledge") / "docs"
    if not docs_dir.exists():
        print("No docs dir:", docs_dir)
        return 1

    changed = 0
    total = 0

    for p in sorted(docs_dir.glob("*.md")):
        total += 1
        txt = p.read_text(encoding="utf-8", errors="replace")
        if not looks_like_mojibake(txt):
            continue

        fixed = try_unmojibake_cp1251(txt)
        if fixed != txt:
            p.write_text(fixed, encoding="utf-8", newline="\n")
            changed += 1

    print(f"docs_total={total} changed={changed}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())

# tools/import_knowledge_layer_b.py
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sqlite3
import subprocess
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple


# ------------------------- Config -------------------------

DEFAULT_DB_PATH = "./data/knowledge.db"
DEFAULT_SOURCES_DIR = "./data/sources"

SUPPORTED_EXTS = {".txt", ".md", ".pdf", ".docx", ".rtf", ".fb2", ".epub", ".djvu", ".djv"}

# Чанкование
CHUNK_MAX_CHARS = 1400
CHUNK_OVERLAP_CHARS = 200
CHUNK_MIN_CHARS = 300


# ------------------------- Helpers -------------------------

def utc_iso() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for b in iter(lambda: f.read(1024 * 1024), b""):
            h.update(b)
    return h.hexdigest()


def normalize_text(s: str) -> str:
    s = s.replace("\r\n", "\n").replace("\r", "\n")
    # убираем “лишние” пробелы
    s = re.sub(r"[ \t]+", " ", s)
    # схлопываем пустые строки, но оставляем абзацы
    s = re.sub(r"\n{3,}", "\n\n", s)
    return s.strip()


def try_parse_frontmatter(lines: List[str]) -> Tuple[Dict[str, str], int]:
    """
    Пытаемся считать @title/@author/@lang/@topic_hint в первых 30 строках.
    Возвращаем (meta, consumed_lines_count).
    """
    meta: Dict[str, str] = {}
    consumed = 0
    for i, line in enumerate(lines[:30]):
        m = re.match(r"^\s*@(\w+)\s*:\s*(.+?)\s*$", line)
        if not m:
            # прекращаем, если пошёл “обычный” текст (не мета)
            if i > 0 and line.strip():
                break
            consumed = i + 1
            continue
        key = m.group(1).lower()
        val = m.group(2).strip()
        if key in {"title", "author", "lang", "topic_hint"}:
            meta[key] = val
        consumed = i + 1
    return meta, consumed


def split_by_topic_markers(text: str) -> List[Tuple[str, str]]:
    """
    Делит текст по маркерам [topic:xxx].
    Возвращает список (topic_hint, section_text).
    Если маркеров нет, возвращает один элемент ("", text).
    """
    pattern = re.compile(r"^\s*\[topic:(?P<topic>[a-z_]+)\]\s*$", re.IGNORECASE | re.MULTILINE)
    matches = list(pattern.finditer(text))
    if not matches:
        return [("", text)]

    parts: List[Tuple[str, str]] = []
    for idx, m in enumerate(matches):
        topic = m.group("topic").lower()
        start = m.end()
        end = matches[idx + 1].start() if idx + 1 < len(matches) else len(text)
        section = text[start:end].strip()
        if section:
            parts.append((topic, section))
    return parts if parts else [("", text)]


# ------------------------- Extraction -------------------------

def extract_text_txt(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="ignore")


def extract_text_docx(path: Path) -> str:
    try:
        import docx  # python-docx
    except Exception as e:
        raise RuntimeError("python-docx not installed. pip install python-docx") from e

    doc = docx.Document(str(path))
    paras = [p.text for p in doc.paragraphs if p.text and p.text.strip()]
    return "\n\n".join(paras)


def extract_text_rtf(path: Path) -> str:
    try:
        from striprtf.striprtf import rtf_to_text
    except Exception as e:
        raise RuntimeError("striprtf not installed. pip install striprtf") from e

    raw = path.read_text(encoding="utf-8", errors="ignore")
    return rtf_to_text(raw)


def extract_text_fb2(path: Path) -> str:
    # FB2 = XML
    import xml.etree.ElementTree as ET

    raw = path.read_text(encoding="utf-8", errors="ignore")
    # иногда бывают странные namespace — ловим осторожно
    root = ET.fromstring(raw)

    # вытащим title/author, если есть
    texts: List[str] = []

    def iter_text(elem):
        if elem.text and elem.text.strip():
            texts.append(elem.text.strip())
        for ch in elem:
            iter_text(ch)
            if ch.tail and ch.tail.strip():
                texts.append(ch.tail.strip())

    # В FB2 основной контент обычно в <body>
    bodies = root.findall(".//{*}body")
    if bodies:
        for b in bodies:
            iter_text(b)
    else:
        iter_text(root)

    # немного “причесать”
    return "\n\n".join(texts)


def extract_text_epub(path: Path) -> str:
    try:
        from ebooklib import epub
        from bs4 import BeautifulSoup
    except Exception as e:
        raise RuntimeError("ebooklib and beautifulsoup4 required. pip install ebooklib beautifulsoup4") from e

    book = epub.read_epub(str(path))
    chunks: List[str] = []
    for item in book.get_items():
        # XHTML
        if item.get_type() == 9:  # ITEM_DOCUMENT
            soup = BeautifulSoup(item.get_content(), "html.parser")
            txt = soup.get_text("\n")
            txt = normalize_text(txt)
            if txt:
                chunks.append(txt)
    return "\n\n".join(chunks)


def extract_text_pdf(path: Path) -> str:
    # пробуем pypdf, потом pdfminer.six
    try:
        from pypdf import PdfReader
        reader = PdfReader(str(path))
        pages = []
        for p in reader.pages:
            t = p.extract_text() or ""
            t = normalize_text(t)
            if t:
                pages.append(t)
        return "\n\n".join(pages)
    except Exception:
        pass

    try:
        from pdfminer.high_level import extract_text as pdfminer_extract_text
        txt = pdfminer_extract_text(str(path))
        return normalize_text(txt)
    except Exception as e:
        raise RuntimeError(
            "Cannot extract PDF text. Install pypdf or pdfminer.six: pip install pypdf pdfminer.six"
        ) from e


def extract_text_djvu(path: Path) -> str:
    """
    Надёжный вариант: djvulibre (djvutxt или ddjvu).
    - djvutxt input.djvu > out.txt
    - ddjvu -format=txt input.djvu out.txt
    """
    # 1) djvutxt
    try:
        proc = subprocess.run(
            ["djvutxt", str(path)],
            capture_output=True,
            text=True,
            check=False,
        )
        if proc.returncode == 0 and proc.stdout.strip():
            return normalize_text(proc.stdout)
    except FileNotFoundError:
        pass

    # 2) ddjvu
    try:
        tmp_out = path.with_suffix(".tmp_txt_extract.txt")
        proc = subprocess.run(
            ["ddjvu", "-format=txt", str(path), str(tmp_out)],
            capture_output=True,
            text=True,
            check=False,
        )
        if proc.returncode == 0 and tmp_out.exists():
            txt = tmp_out.read_text(encoding="utf-8", errors="ignore")
            tmp_out.unlink(missing_ok=True)
            return normalize_text(txt)
    except FileNotFoundError:
        pass

    raise RuntimeError(
        "DJVU extraction requires djvulibre tools. Install djvulibre and ensure djvutxt or ddjvu is in PATH."
    )


def extract_text_any(path: Path) -> str:
    ext = path.suffix.lower()
    if ext in {".txt", ".md"}:
        return extract_text_txt(path)
    if ext == ".docx":
        return extract_text_docx(path)
    if ext == ".rtf":
        return extract_text_rtf(path)
    if ext == ".fb2":
        return extract_text_fb2(path)
    if ext == ".epub":
        return extract_text_epub(path)
    if ext == ".pdf":
        return extract_text_pdf(path)
    if ext in {".djvu", ".djv"}:
        return extract_text_djvu(path)
    raise RuntimeError(f"Unsupported file extension: {ext}")


# ------------------------- Tagging & Domain -------------------------

SIGNS = {
    "овен": "aries", "телец": "taurus", "близнецы": "gemini", "рак": "cancer",
    "лев": "leo", "дева": "virgo", "весы": "libra", "скорпион": "scorpio",
    "стрелец": "sagittarius", "козерог": "capricorn", "водолей": "aquarius", "рыбы": "pisces",
    # англ:
    "aries": "aries", "taurus": "taurus", "gemini": "gemini", "cancer": "cancer",
    "leo": "leo", "virgo": "virgo", "libra": "libra", "scorpio": "scorpio",
    "sagittarius": "sagittarius", "capricorn": "capricorn", "aquarius": "aquarius", "pisces": "pisces",
}

PLANETS = {
    "солнце": "sun", "луна": "moon", "меркурий": "mercury", "венера": "venus", "марс": "mars",
    "юпитер": "jupiter", "сатурн": "saturn", "уран": "uranus", "нептун": "neptune", "плутон": "pluto",
    "asc": "asc", "асцендент": "asc", "mc": "mc", "мс": "mc", "medium coeli": "mc",
    # англ:
    "sun": "sun", "moon": "moon", "mercury": "mercury", "venus": "venus", "mars": "mars",
    "jupiter": "jupiter", "saturn": "saturn", "uranus": "uranus", "neptune": "neptune", "pluto": "pluto",
    "ascendant": "asc",
}

ASPECTS = {
    "соедин": "conjunction", "оппоз": "opposition", "квадрат": "square", "трин": "trine", "секст": "sextile",
    "conjunction": "conjunction", "opposition": "opposition", "square": "square", "trine": "trine", "sextile": "sextile",
}

DOMAIN_KEYWORDS = {
    "natal": ["натал", "натальная", "радикс", "рождение", "карта рождения", "natal", "birth chart"],
    "synastry": ["синастр", "совместим", "партнер", "отношен", "synastry", "compatibility"],
    "transits": ["транзит", "прогноз", "сегодня", "недел", "месяц", "год", "transit", "forecast"],
    "horary": ["хорар", "horary"],
    "electional": ["электив", "выбор времени", "electional"],
    "general": [],
}


def count_hits(text_lower: str, needles: Iterable[str]) -> int:
    total = 0
    for n in needles:
        if not n:
            continue
        total += text_lower.count(n)
    return total


def guess_domain(text: str, hint: str = "") -> str:
    hint = (hint or "").strip().lower()
    if hint in DOMAIN_KEYWORDS and hint != "general":
        return hint

    tl = text.lower()
    scores = {}
    for dom, kws in DOMAIN_KEYWORDS.items():
        if dom == "general":
            continue
        scores[dom] = count_hits(tl, kws)

    if not scores:
        return "general"

    best_dom = max(scores, key=scores.get)
    if scores[best_dom] <= 0:
        return "general"
    return best_dom


def extract_simple_tags(text: str) -> Dict[str, List[str]]:
    tl = text.lower()

    signs = sorted({v for k, v in SIGNS.items() if k in tl})
    planets = sorted({v for k, v in PLANETS.items() if k in tl})
    aspects = sorted({v for k, v in ASPECTS.items() if k in tl})

    # дома — грубо (можно потом улучшить)
    houses = []
    if re.search(r"\b(дом|house)\b", tl):
        for i in range(1, 13):
            if re.search(rf"\b{i}\s*(дом|house)\b", tl):
                houses.append(str(i))

    return {
        "planets": planets,
        "signs": signs,
        "aspects": aspects,
        "houses": houses,
    }


# ------------------------- Chunking -------------------------

def smart_chunks(text: str, max_chars: int, overlap: int) -> List[str]:
    """
    Простое чанкование по абзацам с ограничением по символам.
    """
    paras = [p.strip() for p in text.split("\n\n") if p.strip()]
    chunks: List[str] = []
    buf: List[str] = []
    size = 0

    def flush():
        nonlocal buf, size
        if not buf:
            return
        chunk = "\n\n".join(buf).strip()
        if len(chunk) >= CHUNK_MIN_CHARS:
            chunks.append(chunk)
        buf = []
        size = 0

    for p in paras:
        if size + len(p) + 2 <= max_chars:
            buf.append(p)
            size += len(p) + 2
        else:
            flush()
            # если абзац сам огромный — режем
            if len(p) > max_chars:
                start = 0
                while start < len(p):
                    part = p[start:start + max_chars]
                    if len(part) >= CHUNK_MIN_CHARS:
                        chunks.append(part.strip())
                    start += max_chars - overlap if max_chars > overlap else max_chars
            else:
                buf = [p]
                size = len(p)
    flush()

    # overlap на уровне чанков (простая склейка хвоста)
    if overlap > 0 and len(chunks) > 1:
        overlapped: List[str] = []
        prev_tail = ""
        for c in chunks:
            if prev_tail:
                overlapped.append((prev_tail + "\n" + c).strip())
            else:
                overlapped.append(c)
            prev_tail = c[-overlap:]
        return overlapped

    return chunks


# ------------------------- DB -------------------------

@dataclass
class DocMeta:
    title: Optional[str]
    author: Optional[str]
    lang: str
    topic_hint: str


def ensure_schema(conn: sqlite3.Connection) -> None:
    # Безопасно: если миграцию не применили — можно применить минимальный набор тут.
    conn.execute("PRAGMA foreign_keys = ON")


def upsert_doc(
    conn: sqlite3.Connection,
    *,
    source_path: str,
    title: Optional[str],
    author: Optional[str],
    lang: str,
    fmt: str,
    bytes_size: int,
    sha256: str,
) -> int:
    cur = conn.execute(
        """
        INSERT INTO knowledge_docs(source_path, title, author, lang, format, bytes, sha256, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ON CONFLICT(source_path) DO UPDATE SET
            title=excluded.title,
            author=excluded.author,
            lang=excluded.lang,
            format=excluded.format,
            bytes=excluded.bytes,
            sha256=excluded.sha256
        """,
        (source_path, title, author, lang, fmt, bytes_size, sha256, utc_iso()),
    )
    # sqlite: lastrowid при update может быть 0 — достанем id явно
    row = conn.execute("SELECT id FROM knowledge_docs WHERE source_path = ?", (source_path,)).fetchone()
    return int(row[0])


def delete_doc_chunks(conn: sqlite3.Connection, doc_id: int) -> None:
    conn.execute("DELETE FROM knowledge_chunks WHERE doc_id = ?", (doc_id,))


def insert_chunks(
    conn: sqlite3.Connection,
    *,
    doc_id: int,
    sections: List[Tuple[str, str]],  # (topic_hint, text)
    lang: str,
) -> int:
    chunk_index = 0
    inserted = 0

    for topic_hint, section_text in sections:
        dom = guess_domain(section_text, hint=topic_hint)
        chunks = smart_chunks(section_text, CHUNK_MAX_CHARS, CHUNK_OVERLAP_CHARS)
        for c in chunks:
            tags = extract_simple_tags(c)
            tags_json = json.dumps(
                {"lang": lang, "domain": dom, **tags},
                ensure_ascii=False,
            )
            conn.execute(
                """
                INSERT INTO knowledge_chunks(doc_id, chunk_index, topic_domain, tags_json, text, created_at)
                VALUES (?, ?, ?, ?, ?, ?)
                """,
                (doc_id, chunk_index, dom, tags_json, c, utc_iso()),
            )
            chunk_index += 1
            inserted += 1

    return inserted


# ------------------------- Import flow -------------------------

def build_doc_meta_from_text(raw_text: str) -> Tuple[DocMeta, str]:
    lines = raw_text.split("\n")
    fm, consumed = try_parse_frontmatter(lines)
    rest = "\n".join(lines[consumed:]).strip()

    lang = fm.get("lang", "ru-RU")
    return DocMeta(
        title=fm.get("title"),
        author=fm.get("author"),
        lang=lang,
        topic_hint=fm.get("topic_hint", ""),
    ), rest


def iter_source_files(root: Path) -> List[Path]:
    out: List[Path] = []
    for p in root.rglob("*"):
        if p.is_file() and p.suffix.lower() in SUPPORTED_EXTS:
            out.append(p)
    return sorted(out)


def import_one(conn: sqlite3.Connection, file_path: Path, *, default_lang: str = "ru-RU") -> Tuple[bool, str]:
    try:
        raw = extract_text_any(file_path)
        raw = normalize_text(raw)
        if not raw or len(raw) < 200:
            return False, "empty_or_too_short"

        meta, body = build_doc_meta_from_text(raw)
        lang = meta.lang or default_lang

        # делим по [topic:...]
        sections = split_by_topic_markers(body)

        fmt = file_path.suffix.lower().lstrip(".")
        bytes_size = file_path.stat().st_size
        sha = sha256_file(file_path)

        doc_id = upsert_doc(
            conn,
            source_path=str(file_path.as_posix()),
            title=meta.title or file_path.stem,
            author=meta.author,
            lang=lang,
            fmt=fmt,
            bytes_size=bytes_size,
            sha256=sha,
        )

        # переимпорт: удаляем старые чанки этого документа и пишем заново
        delete_doc_chunks(conn, doc_id)
        inserted = insert_chunks(conn, doc_id=doc_id, sections=sections, lang=lang)

        return True, f"ok inserted_chunks={inserted}"

    except Exception as e:
        return False, f"{type(e).__name__}: {e}"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--db", default=DEFAULT_DB_PATH)
    ap.add_argument("--src", default=DEFAULT_SOURCES_DIR)
    ap.add_argument("--lang", default="ru-RU")
    ap.add_argument("--stop-on-error", action="store_true")
    args = ap.parse_args()

    db_path = Path(args.db)
    src_dir = Path(args.src)

    if not db_path.exists():
        raise SystemExit(f"DB not found: {db_path}. Create it and apply migrations first.")

    if not src_dir.exists():
        raise SystemExit(f"Sources dir not found: {src_dir}")

    files = iter_source_files(src_dir)
    if not files:
        raise SystemExit(f"No supported files in {src_dir}")

    conn = sqlite3.connect(str(db_path))
    conn.row_factory = sqlite3.Row
    ensure_schema(conn)

    ok_count = 0
    fail_count = 0

    print(f"[IMPORT] DB={db_path}  SRC={src_dir}  files={len(files)}")
    with conn:
        for fp in files:
            success, msg = import_one(conn, fp, default_lang=args.lang)
            if success:
                ok_count += 1
                print(f"[OK]  {fp}  {msg}")
            else:
                fail_count += 1
                print(f"[ERR] {fp}  {msg}")
                if args.stop_on_error:
                    raise SystemExit("Stopped on error.")

    print(f"[DONE] ok={ok_count} fail={fail_count}")


if __name__ == "__main__":
    main()

# tools/knowledge_importer.py
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable, Optional, Tuple

import sqlite3


# ----------------------------
# Optional deps (installed as needed)
# ----------------------------
# PDF:
#   pip install pypdf
# DOCX:
#   pip install python-docx
# EPUB:
#   pip install ebooklib beautifulsoup4 lxml
# FB2:
#   pip install beautifulsoup4 lxml
# RTF:
#   pip install striprtf
#
# DJVU:
#   easiest: install djvulibre and use `djvutxt` on PATH (recommended for Windows too)
#   https://djvu.sourceforge.net/djvuopensource.php
#   then this importer will call: djvutxt "file.djvu" -> text


ISO_Z = "%Y-%m-%dT%H:%M:%SZ"


@dataclass(frozen=True)
class DocMeta:
    title: Optional[str]
    author: Optional[str]
    lang: str
    format: str
    bytes: int
    sha256: str


def utc_now_iso() -> str:
    return datetime.now(timezone.utc).strftime(ISO_Z)


def file_sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def safe_relpath(path: Path, base: Path) -> str:
    # хранить source_path в БД удобно как относительный путь от корня sources
    try:
        return str(path.relative_to(base)).replace("\\", "/")
    except ValueError:
        return str(path).replace("\\", "/")


# ----------------------------
# Markup parsing (optional)
# ----------------------------
MARKUP_META_RE = re.compile(r"(?ms)^\s*---\s*(.*?)\s*---\s*")
MARKUP_KV_RE = re.compile(r"(?m)^\s*([a-zA-Z0-9_]+)\s*:\s*(.*?)\s*$")
SECTION_RE = re.compile(r"(?m)^\s*##\s*SECTION:\s*([a-zA-Z0-9_\-]+)\s*$")
KEY_RE = re.compile(r"(?m)^\s*###\s*KEY:\s*([a-zA-Z0-9_.\-]+)\s*$")


def parse_front_matter(text: str) -> Tuple[dict, str]:
    """
    Поддерживает простой YAML-подобный фронтматтер:
    ---
    title: ...
    author: ...
    lang: ru-RU
    ---
    """
    m = MARKUP_META_RE.match(text)
    if not m:
        return {}, text

    block = m.group(1)
    meta: dict[str, str] = {}
    for km in MARKUP_KV_RE.finditer(block):
        meta[km.group(1).strip().lower()] = km.group(2).strip()
    rest = text[m.end():]
    return meta, rest


def detect_domain_from_text(t: str) -> str:
    # грубая эвристика, но работает
    s = t.lower()
    if "синастр" in s or "synastr" in s:
        return "synastry"
    if "транзит" in s or "transit" in s:
        return "transits"
    if "натал" in s or "natal" in s:
        return "natal"
    return "general"


def build_tags_json(t: str) -> str:
    # супер простые счётчики, потом можно расширять
    s = t.lower()
    counts = {
        "has_aspects": int(("аспект" in s) or ("aspect" in s)),
        "has_houses": int(("дом" in s) or ("house" in s)),
        "has_signs": int(any(x in s for x in ["овен", "телец", "близнец", "рак", "лев", "дева",
                                            "весы", "скорпион", "стрелец", "козерог", "водолей", "рыбы"])),
        "has_planets": int(any(x in s for x in ["солнц", "лун", "меркур", "венер", "марс", "юпитер", "сатурн",
                                                "уран", "нептун", "плутон"])),
    }
    return json.dumps(counts, ensure_ascii=False)


# ----------------------------
# Text extraction per format
# ----------------------------
def read_text_txt(path: Path) -> str:
    # пытаемся utf-8, потом cp1251
    data = path.read_bytes()
    for enc in ("utf-8", "utf-8-sig", "cp1251"):
        try:
            return data.decode(enc)
        except UnicodeDecodeError:
            continue
    # fallback: replace
    return data.decode("utf-8", errors="replace")


def read_text_pdf(path: Path) -> str:
    try:
        from pypdf import PdfReader
    except Exception as e:
        raise RuntimeError("Для PDF нужен пакет pypdf: pip install pypdf") from e

    reader = PdfReader(str(path))
    parts: list[str] = []
    for page in reader.pages:
        try:
            parts.append(page.extract_text() or "")
        except Exception:
            parts.append("")
    return "\n".join(parts).strip()


def read_text_docx(path: Path) -> str:
    try:
        import docx  # python-docx
    except Exception as e:
        raise RuntimeError("Для DOCX нужен пакет python-docx: pip install python-docx") from e

    d = docx.Document(str(path))
    return "\n".join(p.text for p in d.paragraphs).strip()


def read_text_rtf(path: Path) -> str:
    try:
        from striprtf.striprtf import rtf_to_text
    except Exception as e:
        raise RuntimeError("Для RTF нужен пакет striprtf: pip install striprtf") from e
    return rtf_to_text(read_text_txt(path)).strip()


def read_text_epub(path: Path) -> Tuple[str, Optional[str], Optional[str]]:
    """
    Возвращает: text, title, author
    """
    try:
        from ebooklib import epub
        from bs4 import BeautifulSoup
    except Exception as e:
        raise RuntimeError("Для EPUB нужны пакеты ebooklib beautifulsoup4 lxml: pip install ebooklib beautifulsoup4 lxml") from e

    book = epub.read_epub(str(path))
    title = None
    author = None

    try:
        title = next(iter(book.get_metadata("DC", "title")))[0]
    except Exception:
        pass
    try:
        author = next(iter(book.get_metadata("DC", "creator")))[0]
    except Exception:
        pass

    texts: list[str] = []
    for item in book.get_items():
        if item.get_type() == 9:  # ITEM_DOCUMENT
            soup = BeautifulSoup(item.get_content(), "lxml")
            texts.append(soup.get_text("\n"))
    return ("\n".join(texts).strip(), title, author)


def read_text_fb2(path: Path) -> Tuple[str, Optional[str], Optional[str]]:
    """
    FB2 (xml). Возвращает: text, title, author
    """
    try:
        from bs4 import BeautifulSoup
    except Exception as e:
        raise RuntimeError("Для FB2 нужны пакеты beautifulsoup4 lxml: pip install beautifulsoup4 lxml") from e

    xml = read_text_txt(path)
    soup = BeautifulSoup(xml, "xml")

    title = None
    author = None

    bt = soup.find("book-title")
    if bt:
        title = bt.get_text(strip=True)

    au = soup.find("author")
    if au:
        parts = []
        for tag in ("first-name", "middle-name", "last-name", "nickname"):
            t = au.find(tag)
            if t and t.get_text(strip=True):
                parts.append(t.get_text(strip=True))
        if parts:
            author = " ".join(parts)

    # основной текст
    bodies = soup.find_all("body")
    chunks = []
    for b in bodies:
        chunks.append(b.get_text("\n"))
    return ("\n".join(chunks).strip(), title, author)


def read_text_djvu(path: Path) -> str:
    # лучший практический путь: djvutxt из djvulibre
    # djvutxt "file.djvu" -> stdout text
    cmd = ["djvutxt", str(path)]
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except FileNotFoundError as e:
        raise RuntimeError(
            "Для DJVU нужен djvutxt (DjVuLibre). Установи DjVuLibre и добавь djvutxt в PATH."
        ) from e

    if p.returncode != 0:
        raise RuntimeError(f"djvutxt failed: {p.stderr.strip()[:400]}")
    return (p.stdout or "").strip()


def extract_text_any(path: Path) -> Tuple[str, DocMeta]:
    ext = path.suffix.lower().lstrip(".")
    size = path.stat().st_size
    sha = file_sha256(path)

    title: Optional[str] = None
    author: Optional[str] = None
    lang = "ru-RU"
    fmt = ext or "unknown"

    if ext in ("txt", "md"):
        text = read_text_txt(path)

        # markup front matter может подсказать title/author/lang
        fm, rest = parse_front_matter(text)
        if fm:
            title = fm.get("title") or title
            author = fm.get("author") or author
            lang = fm.get("lang") or lang
            text = rest.strip()

    elif ext == "pdf":
        text = read_text_pdf(path)

    elif ext == "docx":
        text = read_text_docx(path)

    elif ext == "rtf":
        text = read_text_rtf(path)

    elif ext == "epub":
        text, t2, a2 = read_text_epub(path)
        title = t2 or title
        author = a2 or author

    elif ext == "fb2":
        text, t2, a2 = read_text_fb2(path)
        title = t2 or title
        author = a2 or author

    elif ext in ("djvu", "djv"):
        text = read_text_djvu(path)

    else:
        raise RuntimeError(f"Unsupported format: .{ext}")

    # последняя санитарная обработка
    text = re.sub(r"\r\n?", "\n", text)
    text = re.sub(r"[ \t]+\n", "\n", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text).strip()

    meta = DocMeta(
        title=title,
        author=author,
        lang=lang,
        format=fmt,
        bytes=int(size),
        sha256=sha,
    )
    return text, meta


# ----------------------------
# Chunking
# ----------------------------
def split_paragraphs(text: str) -> list[str]:
    # сохраняем смысловые блоки — по пустым строкам
    parts = [p.strip() for p in re.split(r"\n\s*\n", text) if p.strip()]
    return parts


def chunk_text(
    text: str,
    *,
    target_chars: int = 1600,
    max_chars: int = 2200,
    overlap_chars: int = 200,
) -> list[str]:
    """
    Делает чанки «по смыслу» (параграфы), но держит размеры.
    """
    paras = split_paragraphs(text)
    chunks: list[str] = []
    buf: list[str] = []
    buf_len = 0

    def flush():
        nonlocal buf, buf_len
        if not buf:
            return
        c = "\n\n".join(buf).strip()
        if c:
            chunks.append(c)
        buf = []
        buf_len = 0

    for p in paras:
        add_len = len(p) + (2 if buf else 0)
        if buf_len + add_len <= target_chars:
            buf.append(p)
            buf_len += add_len
            continue

        # если уже есть буфер — выталкиваем
        if buf:
            flush()

        # если параграф огромный — режем грубо
        if len(p) > max_chars:
            start = 0
            while start < len(p):
                end = min(start + max_chars, len(p))
                chunks.append(p[start:end].strip())
                start = max(0, end - overlap_chars)
            continue

        # иначе начинаем новый буфер с этим параграфом
        buf.append(p)
        buf_len = len(p)

    flush()

    # добавим перекрытие между чанками (легко)
    if overlap_chars > 0 and len(chunks) >= 2:
        with_overlap: list[str] = []
        prev_tail = ""
        for i, c in enumerate(chunks):
            if i == 0:
                with_overlap.append(c)
            else:
                # берём хвост предыдущего чанка
                prev = chunks[i - 1]
                prev_tail = prev[-overlap_chars:] if len(prev) > overlap_chars else prev
                with_overlap.append((prev_tail + "\n\n" + c).strip())
        chunks = with_overlap

    return chunks


# ----------------------------
# SQLite operations
# ----------------------------
def connect_db(db_path: Path) -> sqlite3.Connection:
    con = sqlite3.connect(str(db_path))
    con.execute("PRAGMA journal_mode=WAL;")
    con.execute("PRAGMA synchronous=NORMAL;")
    con.execute("PRAGMA foreign_keys=ON;")
    return con


def upsert_doc(con: sqlite3.Connection, *, source_path: str, meta: DocMeta) -> int:
    """
    Если doc уже существует (source_path UNIQUE), обновим метаданные.
    Возвращает doc_id.
    """
    cur = con.cursor()

    cur.execute("SELECT id, sha256 FROM knowledge_docs WHERE source_path = ?", (source_path,))
    row = cur.fetchone()

    if row:
        doc_id = int(row[0])
        # обновим, если sha изменился
        cur.execute(
            """
            UPDATE knowledge_docs
            SET title=?, author=?, lang=?, format=?, bytes=?, sha256=?
            WHERE id=?
            """,
            (meta.title, meta.author, meta.lang, meta.format, meta.bytes, meta.sha256, doc_id),
        )
        return doc_id

    cur.execute(
        """
        INSERT INTO knowledge_docs(source_path, title, author, lang, format, bytes, sha256)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        """,
        (source_path, meta.title, meta.author, meta.lang, meta.format, meta.bytes, meta.sha256),
    )
    return int(cur.lastrowid)


def delete_chunks_for_doc(con: sqlite3.Connection, doc_id: int) -> None:
    con.execute("DELETE FROM knowledge_chunks WHERE doc_id = ?", (doc_id,))


def insert_chunks(
    con: sqlite3.Connection,
    *,
    doc_id: int,
    chunks: list[str],
    default_domain: str,
) -> int:
    cur = con.cursor()
    n = 0
    for idx, c in enumerate(chunks):
        domain = detect_domain_from_text(c) if default_domain == "general" else default_domain
        tags_json = build_tags_json(c)
        cur.execute(
            """
            INSERT INTO knowledge_chunks(doc_id, chunk_index, topic_domain, tags_json, text)
            VALUES (?, ?, ?, ?, ?)
            """,
            (doc_id, idx, domain, tags_json, c),
        )
        n += 1
    return n


# ----------------------------
# Import runner
# ----------------------------
SUPPORTED_EXT = {".txt", ".md", ".pdf", ".docx", ".rtf", ".fb2", ".epub", ".djvu", ".djv"}


def iter_files(inbox: Path) -> Iterable[Path]:
    for p in inbox.rglob("*"):
        if p.is_file() and p.suffix.lower() in SUPPORTED_EXT:
            yield p


def import_one(
    *,
    con: sqlite3.Connection,
    file_path: Path,
    sources_root: Path,
    processed_dir: Path,
    failed_dir: Path,
    dry_run: bool,
) -> None:
    rel = safe_relpath(file_path, sources_root)

    try:
        text, meta = extract_text_any(file_path)
        if not text.strip():
            raise RuntimeError("Extracted empty text")

        default_domain = detect_domain_from_text(text[:5000])

        chunks = chunk_text(text)
        if not chunks:
            raise RuntimeError("Chunking produced 0 chunks")

        if dry_run:
            print(f"[DRY] {rel}: bytes={meta.bytes} chunks={len(chunks)} sha256={meta.sha256[:12]}...")
            return

        doc_id = upsert_doc(con, source_path=rel, meta=meta)

        # простая идемпотентность: перезаливаем чанки при любом запуске.
        # (можно оптимизировать: если sha прежний, не трогать)
        delete_chunks_for_doc(con, doc_id)
        inserted = insert_chunks(con, doc_id=doc_id, chunks=chunks, default_domain=default_domain)
        con.commit()

        # переносим файл в processed
        target = processed_dir / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.move(str(file_path), str(target))

        print(f"[OK] {rel}: doc_id={doc_id} chunks={inserted}")

    except Exception as e:
        if not dry_run:
            con.rollback()

        # переносим в failed
        try:
            target = failed_dir / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.move(str(file_path), str(target))
        except Exception:
            pass

        print(f"[FAIL] {rel}: {type(e).__name__}: {e}")


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description="Import knowledge sources into knowledge.db (layer B: docs+chunks+FTS)")
    ap.add_argument("--db", required=True, help="Path to knowledge.db")
    ap.add_argument("--inbox", required=True, help="Folder with books/files to import")
    ap.add_argument("--processed", required=True, help="Folder to move successfully imported files")
    ap.add_argument("--failed", required=True, help="Folder to move failed files")
    ap.add_argument("--dry-run", action="store_true", help="Do not write DB, only print what would happen")

    args = ap.parse_args(argv)

    db_path = Path(args.db).resolve()
    inbox = Path(args.inbox).resolve()
    processed = Path(args.processed).resolve()
    failed = Path(args.failed).resolve()

    if not db_path.exists():
        print(f"[ERR] db not found: {db_path}")
        return 2
    if not inbox.exists():
        print(f"[ERR] inbox not found: {inbox}")
        return 2

    processed.mkdir(parents=True, exist_ok=True)
    failed.mkdir(parents=True, exist_ok=True)

    con = connect_db(db_path)
    try:
        files = list(iter_files(inbox))
        if not files:
            print("[INFO] No supported files found.")
            return 0

        # sources_root = inbox parent, чтобы relpath был красивым: inbox/.. в корень sources
        sources_root = inbox.parent

        print(f"[INFO] Found {len(files)} file(s). Starting import...")
        for f in files:
            import_one(
                con=con,
                file_path=f,
                sources_root=sources_root,
                processed_dir=processed,
                failed_dir=failed,
                dry_run=args.dry_run,
            )
        return 0
    finally:
        con.close()


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))

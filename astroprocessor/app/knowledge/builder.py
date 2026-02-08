# app/knowledge/builder.py
from __future__ import annotations

import argparse
import sqlite3
from dataclasses import dataclass
from pathlib import Path
from typing import List, Optional, Sequence, Tuple

# Optional: use project settings if available
try:
    from app.settings import settings  # type: ignore
except Exception:
    settings = None  # fallback


# ----------------------------
# Data model
# ----------------------------
@dataclass(frozen=True)
class SeedItem:
    key: str
    topic_category: str
    locale: str
    text: str
    priority: int = 200


# ----------------------------
# Seeds (edit freely)
# ----------------------------
def default_seed_ru() -> List[SeedItem]:
    loc = "ru-RU"
    topic = "personality_core"

    return [
        # --- Any-level fallbacks ---
        SeedItem(
            key="natal.planet.sun.sign.any",
            topic_category=topic,
            locale=loc,
            priority=100,
            text=(
                "Солнце — ядро личности: воля, самоощущение, желание проявляться и брать ответственность. "
                "Это то, где человек стремится быть заметным и определять правила игры."
            ),
        ),
        SeedItem(
            key="natal.planet.moon.sign.any",
            topic_category=topic,
            locale=loc,
            priority=100,
            text=(
                "Луна — эмоциональная система: базовые потребности, привычные реакции, чувство безопасности. "
                "Показывает, как человек переживает стресс и восстанавливается."
            ),
        ),
        SeedItem(
            key="natal.angle.asc.sign.any",
            topic_category=topic,
            locale=loc,
            priority=100,
            text=(
                "Асцендент — стиль входа в мир: первое впечатление, поведенческие привычки, телесная реактивность. "
                "Это настройка по умолчанию в новых ситуациях."
            ),
        ),
        SeedItem(
            key="natal.angle.mc.sign.any",
            topic_category=topic,
            locale=loc,
            priority=100,
            text=(
                "MC (Середина Неба) — направление реализации: общественная роль, профессиональный вектор, репутация. "
                "Показывает стиль достижения целей и качества, которые дают рост статуса."
            ),
        ),
        # --- Planet any (coverage) ---
        SeedItem(
            key="natal.planet.mercury.sign.any",
            topic_category=topic,
            locale=loc,
            priority=100,
            text=(
                "Меркурий описывает мышление и коммуникацию: как ты воспринимаешь информацию, формулируешь мысли "
                "и принимаешь решения. В плюсе — ясность и гибкость ума; в минусе — суета и застревание в деталях."
            ),
        ),
        SeedItem(
            key="natal.planet.venus.sign.any",
            topic_category=topic,
            locale=loc,
            priority=100,
            text=(
                "Венера показывает ценности и чувство гармонии: что тебе приятно, что ты считаешь красивым, "
                "как проявляешь симпатию и выстраиваешь близость. В плюсе — дипломатичность; в минусе — зависимость от одобрения."
            ),
        ),
        SeedItem(
            key="natal.planet.mars.sign.any",
            topic_category=topic,
            locale=loc,
            priority=100,
            text=(
                "Марс описывает энергию действия: как ты стартуешь, добиваешься своего и реагируешь на конфликт. "
                "В плюсе — решительность; в минусе — раздражительность или выгорание."
            ),
        ),
    ]


# ----------------------------
# DB path + schema
# ----------------------------
def _default_db_path() -> Path:
    if settings and getattr(settings, "knowledge_db_path", None):
        return Path(str(settings.knowledge_db_path))
    return Path("data") / "knowledge.db"


def ensure_schema(conn: sqlite3.Connection) -> None:
    cur = conn.cursor()

    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS knowledge_items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            key TEXT NOT NULL,
            topic_category TEXT,
            locale TEXT NOT NULL,
            text TEXT NOT NULL,
            priority INTEGER NOT NULL DEFAULT 100,
            created_at TEXT DEFAULT (datetime('now')),
            is_active INTEGER NOT NULL DEFAULT 1
            meta_json TEXT NOT NULL DEFAULT '{}',
            updated_at TEXT
        );
        """
    )

    # Add missing columns for older DBs
    cols = {row[1] for row in cur.execute("PRAGMA table_info(knowledge_items)").fetchall()}

    if "priority" not in cols:
        cur.execute("ALTER TABLE knowledge_items ADD COLUMN priority INTEGER NOT NULL DEFAULT 100")

    if "created_at" not in cols:
        cur.execute("ALTER TABLE knowledge_items ADD COLUMN created_at TEXT")
        cur.execute("UPDATE knowledge_items SET created_at = COALESCE(created_at, datetime('now'))")

    if "is_active" not in cols:
        cur.execute("ALTER TABLE knowledge_items ADD COLUMN is_active INTEGER NOT NULL DEFAULT 1")

    conn.commit()


# ----------------------------
# Helpers: text inputs + filters
# ----------------------------
def _parse_only_keys(s: Optional[str]) -> Optional[List[str]]:
    if not s:
        return None
    keys = [k.strip() for k in s.split(",") if k.strip()]
    return keys or None


def _read_text_from_args(text: Optional[str], text_file: Optional[str]) -> Optional[str]:
    if text is not None and text_file is not None:
        raise SystemExit("ERROR: use only one of --text or --text-file")

    if text is not None:
        t = text.strip()
        return t if t else ""

    if text_file is not None:
        p = Path(text_file)
        if not p.exists():
            raise SystemExit(f"ERROR: --text-file not found: {p.as_posix()}")
        t = p.read_text(encoding="utf-8").strip()
        return t if t else ""

    return None


def _topic_norm(topic: Optional[str]) -> str:
    # Treat None as empty filter ONLY when building WHERE clauses intentionally.
    return "" if topic is None else str(topic)


# ----------------------------
# Core operations: SEED
# ----------------------------
def apply_seed(
    conn: sqlite3.Connection,
    items: Sequence[SeedItem],
    *,
    dry_run: bool,
    only_keys: Optional[set[str]] = None,
    set_priority: Optional[int] = None,
    priority_offset: int = 0,
) -> Tuple[int, int]:
    """
    Returns: (inserted, skipped)

    seed: insert only if no active row exists for (key, locale, topic_category, priority)
    """
    cur = conn.cursor()
    inserted = 0
    skipped = 0

    for it in items:
        if only_keys and it.key not in only_keys:
            continue

        pr = set_priority if set_priority is not None else it.priority
        pr = int(pr) + int(priority_offset)

        row = cur.execute(
            """
            SELECT 1 FROM knowledge_items
            WHERE key = ?
              AND locale = ?
              AND COALESCE(topic_category,'') = COALESCE(?, '')
              AND priority = ?
              AND is_active = 1
            LIMIT 1
            """,
            (it.key, it.locale, it.topic_category, pr),
        ).fetchone()
        if row:
            skipped += 1
            continue

        if dry_run:
            inserted += 1
            continue

        cur.execute(
            """
            INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active)
            VALUES (?, ?, ?, ?, ?, datetime('now'), 1)
            """,
            (it.key, it.topic_category, it.locale, it.text, pr),
        )
        inserted += 1

    if not dry_run:
        conn.commit()

    return inserted, skipped


# ----------------------------
# Core operations: VERSION (the important fix)
# ----------------------------
def _pick_source_row_for_version(
    conn: sqlite3.Connection,
    *,
    key: str,
    locale: str,
    topic: str,
    include_inactive: bool,
) -> Optional[sqlite3.Row]:
    """
    Pick the best existing row to clone.
    Policy:
      - same key + locale + topic (exact, with COALESCE)
      - if include_inactive=False -> only active
      - order: priority DESC, created_at DESC, id DESC
    """
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    where = [
        "key = ?",
        "locale = ?",
        "COALESCE(topic_category,'') = COALESCE(?, '')",
    ]
    params: List[object] = [key, locale, topic]

    if not include_inactive:
        where.append("is_active = 1")

    sql = f"""
        SELECT id, key, topic_category, locale, priority, is_active, created_at, text
        FROM knowledge_items
        WHERE {' AND '.join(where)}
        ORDER BY priority DESC, created_at DESC, id DESC
        LIMIT 1
    """
    row = cur.execute(sql, params).fetchone()
    return row


def apply_version(
    conn: sqlite3.Connection,
    *,
    only_keys: Sequence[str],
    locale: str,
    topic: str,
    dry_run: bool,
    set_priority: Optional[int] = None,
    priority_offset: int = 0,
    text_override: Optional[str] = None,
    include_inactive_source: bool = True,
) -> Tuple[int, List[str]]:
    """
    Returns: (inserted, errors)

    Versioning behavior:
      - Always insert a new row per key (new version).
      - Text comes from:
          1) --text / --text-file if provided
          2) else clone the best existing row for this key+locale+topic
      - If no source row and no text override -> error for that key.
    """
    cur = conn.cursor()
    inserted = 0
    errors: List[str] = []

    for key in only_keys:
        src = None if text_override is not None else _pick_source_row_for_version(
            conn,
            key=key,
            locale=locale,
            topic=topic,
            include_inactive=include_inactive_source,
        )

        if text_override is not None:
            text = text_override
        elif src is not None:
            text = (src["text"] or "").strip()
        else:
            errors.append(
                f"{key}: no existing rows to clone for locale={locale}, topic={topic}; provide --text/--text-file"
            )
            continue

        pr = set_priority if set_priority is not None else (int(src["priority"]) if src is not None else 200)
        pr = int(pr) + int(priority_offset)

        if dry_run:
            inserted += 1
            continue

        cur.execute(
            """
            INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active)
            VALUES (?, ?, ?, ?, ?, datetime('now'), 1)
            """,
            (key, topic if topic != "" else None, locale, text, pr),
        )
        inserted += 1

    if not dry_run:
        conn.commit()

    return inserted, errors


# ----------------------------
# List + activate/deactivate
# ----------------------------
def list_versions(
    conn: sqlite3.Connection,
    *,
    key: str,
    locale: Optional[str],
    topic: Optional[str],
    include_inactive: bool,
    limit: int,
) -> List[sqlite3.Row]:
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    where = ["key = ?"]
    params: List[object] = [key]

    if locale:
        where.append("locale = ?")
        params.append(locale)

    if topic is not None:
        where.append("COALESCE(topic_category,'') = COALESCE(?, '')")
        params.append(topic)

    if not include_inactive:
        where.append("is_active = 1")

    sql = f"""
        SELECT id, key, topic_category, locale, priority, is_active, created_at, text
        FROM knowledge_items
        WHERE {' AND '.join(where)}
        ORDER BY priority DESC, created_at DESC, id DESC
        LIMIT ?
    """
    params.append(int(limit))
    rows = cur.execute(sql, params).fetchall()
    return rows


def set_active(
    conn: sqlite3.Connection,
    *,
    row_id: int,
    active: bool,
    dry_run: bool,
) -> int:
    cur = conn.cursor()
    if dry_run:
        row = cur.execute("SELECT 1 FROM knowledge_items WHERE id = ? LIMIT 1", (int(row_id),)).fetchone()
        return 1 if row else 0

    cur.execute(
        "UPDATE knowledge_items SET is_active = ? WHERE id = ?",
        (1 if active else 0, int(row_id)),
    )
    conn.commit()
    return cur.rowcount


# ----------------------------
# CLI
# ----------------------------
def parse_args(argv: Optional[Sequence[str]] = None) -> argparse.Namespace:
    p = argparse.ArgumentParser(
        prog="python -m app.knowledge.builder",
        description="Knowledge DB builder with versioning tools (seed/version/list/activate/deactivate).",
    )
    p.add_argument(
        "--db-path",
        type=str,
        default=None,
        help="Path to knowledge.db (default: settings.knowledge_db_path or data/knowledge.db)",
    )
    p.add_argument("--dry-run", action="store_true", help="Don't write to DB; only show what would happen.")

    sub = p.add_subparsers(dest="command", required=True)

    # seed
    p_seed = sub.add_parser("seed", help="Idempotent: insert default seeds if not exists (active).")
    p_seed.add_argument("--only-keys", type=str, default=None, help="Comma-separated list of keys to apply (optional).")
    p_seed.add_argument("--set-priority", type=int, default=None, help="Override priority for inserted items.")
    p_seed.add_argument("--priority-offset", type=int, default=0, help="Add offset to each item's priority.")

    # version (fixed)
    p_ver = sub.add_parser(
        "version",
        help=(
            "Insert NEW versions. By default clones the best existing row per key+locale+topic. "
            "If you pass --text/--text-file, uses that text instead."
        ),
    )
    p_ver.add_argument(
        "--only-keys",
        type=str,
        required=True,
        help="Comma-separated list of keys to version, e.g. natal.planet.sun.sign.leo",
    )
    p_ver.add_argument("--locale", type=str, default="ru-RU", help="Locale for cloning/inserting (default ru-RU).")
    p_ver.add_argument(
        "--topic",
        type=str,
        default="personality_core",
        help="Topic category for cloning/inserting (default personality_core).",
    )
    p_ver.add_argument("--set-priority", type=int, default=None, help="Force priority for inserted versions.")
    p_ver.add_argument("--priority-offset", type=int, default=0, help="Add offset to computed priority.")
    p_ver.add_argument("--text", type=str, default=None, help="Inline text for ALL keys in --only-keys.")
    p_ver.add_argument("--text-file", type=str, default=None, help="Read text from file (utf-8) for ALL keys.")
    p_ver.add_argument(
        "--include-inactive-source",
        action="store_true",
        help="Allow cloning from inactive rows if no active found (default: True behavior).",
    )
    p_ver.add_argument(
        "--active-only-source",
        action="store_true",
        help="Strict: clone only from active rows (overrides --include-inactive-source).",
    )

    # list
    p_list = sub.add_parser("list", help="List versions for a given key.")
    p_list.add_argument("--key", required=True, type=str, help="Knowledge key, e.g. natal.planet.sun.sign.leo")
    p_list.add_argument("--locale", default=None, type=str, help="Locale filter, e.g. ru-RU (optional)")
    p_list.add_argument("--topic", default=None, type=str, help="Topic filter, e.g. personality_core (optional)")
    p_list.add_argument("--include-inactive", action="store_true", help="Include inactive versions too.")
    p_list.add_argument("--limit", default=20, type=int, help="Max rows to show (default 20).")

    # activate/deactivate
    p_act = sub.add_parser("activate", help="Set is_active=1 for row by id.")
    p_act.add_argument("--id", required=True, type=int, help="Row id")

    p_deact = sub.add_parser("deactivate", help="Set is_active=0 for row by id.")
    p_deact.add_argument("--id", required=True, type=int, help="Row id")

    return p.parse_args(argv)


def _print_rows(rows: List[sqlite3.Row]) -> None:
    if not rows:
        print("No rows found.")
        return

    print("id | pr | act | created_at           | locale | topic_category         | text")
    print("-" * 110)
    for r in rows:
        txt = (r["text"] or "").replace("\n", " ").strip()
        if len(txt) > 120:
            txt = txt[:117] + "..."
        created = (r["created_at"] or "")[:19].ljust(19)
        topic = (r["topic_category"] or "").ljust(22)[:22]
        loc = (r["locale"] or "").ljust(6)[:6]
        print(f"{r['id']:>3} | {r['priority']:>3} |  {r['is_active']}  | {created} | {loc} | {topic} | {txt}")


def main(argv: Optional[Sequence[str]] = None) -> int:
    args = parse_args(argv)

    db_path = Path(args.db_path) if args.db_path else _default_db_path()
    db_path.parent.mkdir(parents=True, exist_ok=True)

    conn = sqlite3.connect(db_path)
    try:
        ensure_schema(conn)

        if args.command == "seed":
            items = default_seed_ru()
            only_keys = _parse_only_keys(getattr(args, "only_keys", None))
            only_keys_set = set(only_keys) if only_keys else None

            inserted, skipped = apply_seed(
                conn,
                items,
                dry_run=bool(args.dry_run),
                only_keys=only_keys_set,
                set_priority=getattr(args, "set_priority", None),
                priority_offset=int(getattr(args, "priority_offset", 0)),
            )

            print(f"[SEED] DB: {db_path.as_posix()}")
            if args.dry_run:
                print("[DRY RUN] No changes were written.")
            if only_keys_set:
                print(f"[FILTER] only_keys: {sorted(list(only_keys_set))}")
            if getattr(args, "set_priority", None) is not None:
                print(f"[OVERRIDE] set_priority: {args.set_priority}")
            if int(getattr(args, "priority_offset", 0)) != 0:
                print(f"[OFFSET] priority_offset: {args.priority_offset}")

            print(f"Inserted: {inserted}")
            print(f"Skipped:  {skipped}")
            return 0

        if args.command == "version":
            keys = _parse_only_keys(args.only_keys) or []
            if not keys:
                raise SystemExit("ERROR: --only-keys must contain at least 1 key")

            text_override = _read_text_from_args(getattr(args, "text", None), getattr(args, "text_file", None))
            locale = str(getattr(args, "locale", "ru-RU"))
            topic = str(getattr(args, "topic", "personality_core"))

            # source policy
            include_inactive_source = True
            if getattr(args, "active_only_source", False):
                include_inactive_source = False
            elif getattr(args, "include_inactive_source", False):
                include_inactive_source = True
            # default behavior: include inactive allowed (True)

            inserted, errors = apply_version(
                conn,
                only_keys=keys,
                locale=locale,
                topic=topic,
                dry_run=bool(args.dry_run),
                set_priority=getattr(args, "set_priority", None),
                priority_offset=int(getattr(args, "priority_offset", 0)),
                text_override=text_override,
                include_inactive_source=include_inactive_source,
            )

            print(f"[VERSION] DB: {db_path.as_posix()}")
            if args.dry_run:
                print("[DRY RUN] No changes were written.")
            print(f"[FILTER] only_keys: {keys}")
            print(f"[CTX] locale={locale} topic={topic}")
            if getattr(args, "set_priority", None) is not None:
                print(f"[OVERRIDE] set_priority: {args.set_priority}")
            if int(getattr(args, "priority_offset", 0)) != 0:
                print(f"[OFFSET] priority_offset: {args.priority_offset}")
            if text_override is not None:
                print("[TEXT] Using text override for inserted versions.")
            print(f"Inserted: {inserted}")

            if errors:
                print("Errors:")
                for e in errors:
                    print(f"  - {e}")
                return 2

            return 0

        if args.command == "list":
            rows = list_versions(
                conn,
                key=args.key,
                locale=args.locale,
                topic=args.topic,
                include_inactive=bool(args.include_inactive),
                limit=int(args.limit),
            )
            print(f"[LIST] DB: {db_path.as_posix()}")
            print(f"Key: {args.key}")
            if args.locale:
                print(f"Locale: {args.locale}")
            if args.topic is not None:
                print(f"Topic: {args.topic}")
            print(f"Include inactive: {bool(args.include_inactive)}")
            print()
            _print_rows(rows)
            return 0

        if args.command in ("activate", "deactivate"):
            row_id = int(args.id)
            active = args.command == "activate"
            affected = set_active(conn, row_id=row_id, active=active, dry_run=bool(args.dry_run))

            label = "ACTIVATE" if active else "DEACTIVATE"
            print(f"[{label}] DB: {db_path.as_posix()}")
            if args.dry_run:
                print("[DRY RUN] No changes were written.")
            if affected == 0:
                print(f"Row id={row_id} not found.")
                return 2

            print(f"Row id={row_id} -> is_active={1 if active else 0}")
            return 0

        print("Unknown command.")
        return 2

    finally:
        conn.close()


if __name__ == "__main__":
    raise SystemExit(main())

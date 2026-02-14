# astroprocessor/tools/knowledge/normalize_ev1_data.py
from __future__ import annotations

import argparse
import sqlite3
import sys
from dataclasses import dataclass
from pathlib import Path


def _bootstrap_sys_path() -> None:
    """
    Ensure astroprocessor/ is on sys.path so `import app.*` works regardless of CWD.

    This file: astroprocessor/tools/knowledge/normalize_ev1_data.py
    parents[2] -> astroprocessor/
    """
    astro_root = Path(__file__).resolve().parents[2]
    if str(astro_root) not in sys.path:
        sys.path.insert(0, str(astro_root))


_bootstrap_sys_path()

from app.settings import settings  # noqa: E402
from app.knowledge import builder as kb  # noqa: E402


@dataclass(frozen=True)
class Report:
    keys_total: int
    canonical_locale: str
    fill_topic_category: str
    touch_inactive: bool
    conflict_strategy: str

    scoped_rows: int

    locale_rows_to_update: int
    locale_rows_updated: int

    topic_rows_missing_before: int

    # A) empties that conflict with an existing filled row
    topic_conflicts_with_filled_found: int
    topic_conflicts_with_filled_affected: int

    # B) duplicates among empties (same key+locale, empty topic, no filled row)
    topic_empty_dupes_found: int
    topic_empty_dupes_affected: int

    # final fill
    topic_rows_updated: int


def _sql_in(n: int) -> str:
    return ",".join(["?"] * n)


def _db_path() -> Path:
    p = Path(str(settings.knowledge_db_path))
    if not p.is_absolute():
        p = kb._astro_root() / p  # type: ignore[attr-defined]
    return p.resolve()


def _scalar_int(conn: sqlite3.Connection, sql: str, params: list[object]) -> int:
    row = conn.execute(sql, params).fetchone()
    return int(row[0] if row and row[0] is not None else 0)


def _fetch_ids(conn: sqlite3.Connection, sql: str, params: list[object]) -> list[int]:
    return [int(r[0]) for r in conn.execute(sql, params).fetchall()]


def _preview_rows(conn: sqlite3.Connection, keys: list[str], limit: int = 15) -> list[tuple]:
    sql = f"""
        SELECT id, key, locale, topic_category, is_active
        FROM knowledge_items
        WHERE key IN ({_sql_in(len(keys))})
        ORDER BY id
        LIMIT ?
    """.strip()
    return [tuple(r) for r in conn.execute(sql, [*keys, limit]).fetchall()]


def _norm_locale_for_match(s: str) -> str:
    return s.strip().lower().replace("_", "-").replace(" ", "-")


def _apply_conflict_action(
    conn: sqlite3.Connection,
    ids: list[int],
    *,
    conflict_strategy: str,  # skip|deactivate|delete
) -> int:
    if not ids or conflict_strategy == "skip":
        return 0
    if conflict_strategy == "delete":
        cur = conn.execute(f"DELETE FROM knowledge_items WHERE id IN ({_sql_in(len(ids))})", list(ids))
        return int(cur.rowcount or 0)
    if conflict_strategy == "deactivate":
        cur = conn.execute(f"UPDATE knowledge_items SET is_active=0 WHERE id IN ({_sql_in(len(ids))})", list(ids))
        return int(cur.rowcount or 0)
    raise ValueError("unexpected conflict_strategy")


def normalize_ev1_data(
    *,
    conn: sqlite3.Connection,
    keys: list[str],
    canonical_locale: str,
    fill_topic_category: str,
    apply: bool,
    touch_inactive: bool,
    conflict_strategy: str,  # skip|deactivate|delete
) -> Report:
    if not keys:
        raise ValueError("keys list is empty")

    canonical_locale = canonical_locale.strip()
    fill_topic_category = fill_topic_category.strip()
    if not canonical_locale:
        raise ValueError("canonical_locale is empty")
    if not fill_topic_category:
        raise ValueError("fill_topic_category is empty")

    conflict_strategy = (conflict_strategy or "").strip().lower()
    if conflict_strategy not in {"skip", "deactivate", "delete"}:
        raise ValueError("conflict_strategy must be one of: skip, deactivate, delete")

    active_clause = "" if touch_inactive else "AND is_active = 1"

    scoped_rows = _scalar_int(
        conn,
        f"""
        SELECT COUNT(*)
        FROM knowledge_items
        WHERE key IN ({_sql_in(len(keys))})
        {active_clause}
        """.strip(),
        list(keys),
    )

    # -------------------------
    # 1) Normalize locale
    # -------------------------
    raw_candidates = ["ru", "ru-ru", "ru_ru", "ru ru", "RU", "RU-RU", "ru-RU"]
    norm_candidates = sorted({_norm_locale_for_match(x) for x in raw_candidates if x.strip()})
    canonical_norm = _norm_locale_for_match(canonical_locale)

    locale_rows_to_update = _scalar_int(
        conn,
        f"""
        SELECT COUNT(*)
        FROM knowledge_items
        WHERE key IN ({_sql_in(len(keys))})
        {active_clause}
          AND LOWER(REPLACE(REPLACE(TRIM(locale), '_', '-'), ' ', '-')) IN ({_sql_in(len(norm_candidates))})
          AND LOWER(REPLACE(REPLACE(TRIM(locale), '_', '-'), ' ', '-')) <> ?
        """.strip(),
        [*keys, *norm_candidates, canonical_norm],
    )

    locale_rows_updated = 0
    if apply and locale_rows_to_update:
        cur = conn.execute(
            f"""
            UPDATE knowledge_items
               SET locale = ?
             WHERE key IN ({_sql_in(len(keys))})
             {active_clause}
               AND LOWER(REPLACE(REPLACE(TRIM(locale), '_', '-'), ' ', '-')) IN ({_sql_in(len(norm_candidates))})
               AND LOWER(REPLACE(REPLACE(TRIM(locale), '_', '-'), ' ', '-')) <> ?
            """.strip(),
            [canonical_locale, *keys, *norm_candidates, canonical_norm],
        )
        locale_rows_updated = int(cur.rowcount or 0)

    # -------------------------
    # 2) Fill topic_category (with full conflict resolution)
    # -------------------------
    topic_rows_missing_before = _scalar_int(
        conn,
        f"""
        SELECT COUNT(*)
        FROM knowledge_items
        WHERE key IN ({_sql_in(len(keys))})
        {active_clause}
          AND TRIM(COALESCE(topic_category, '')) = ''
        """.strip(),
        list(keys),
    )

    # A) empties that conflict with an existing filled row for the SAME (key, locale)
    conflict_with_filled_ids = _fetch_ids(
        conn,
        f"""
        SELECT src.id
        FROM knowledge_items AS src
        WHERE src.key IN ({_sql_in(len(keys))})
        {active_clause}
          AND TRIM(COALESCE(src.topic_category, '')) = ''
          AND EXISTS (
              SELECT 1
              FROM knowledge_items AS dst
              WHERE dst.key = src.key
                AND dst.locale = src.locale
                AND dst.topic_category = ?
          )
        """.strip(),
        [*keys, fill_topic_category],
    )
    topic_conflicts_with_filled_found = len(conflict_with_filled_ids)

    topic_conflicts_with_filled_affected = 0
    if apply:
        topic_conflicts_with_filled_affected = _apply_conflict_action(
            conn, conflict_with_filled_ids, conflict_strategy=conflict_strategy
        )

    # B) duplicates among empties themselves:
    # For same (key, locale), multiple rows with empty topic_category AND no filled row exists.
    # We keep MIN(id) per group, and remove all other ids.
    empty_dupe_ids = _fetch_ids(
        conn,
        f"""
        WITH empty_rows AS (
            SELECT id, key, locale
            FROM knowledge_items
            WHERE key IN ({_sql_in(len(keys))})
            {active_clause}
              AND TRIM(COALESCE(topic_category, '')) = ''
              AND NOT EXISTS (
                  SELECT 1
                  FROM knowledge_items AS dst
                  WHERE dst.key = knowledge_items.key
                    AND dst.locale = knowledge_items.locale
                    AND dst.topic_category = ?
              )
        ),
        keepers AS (
            SELECT key, locale, MIN(id) AS keep_id, COUNT(*) AS cnt
            FROM empty_rows
            GROUP BY key, locale
            HAVING cnt > 1
        )
        SELECT e.id
        FROM empty_rows e
        JOIN keepers k
          ON k.key = e.key AND k.locale = e.locale
        WHERE e.id <> k.keep_id
        """.strip(),
        [*keys, fill_topic_category],
    )
    topic_empty_dupes_found = len(empty_dupe_ids)

    topic_empty_dupes_affected = 0
    if apply:
        topic_empty_dupes_affected = _apply_conflict_action(
            conn, empty_dupe_ids, conflict_strategy=conflict_strategy
        )

    # Finally: update remaining empties to fill_topic_category.
    # This is safe now: (A) removed empties that conflict with existing filled row
    # and (B) de-duped empties within each (key, locale) group.
    topic_rows_updated = 0
    if apply:
        cur = conn.execute(
            f"""
            UPDATE knowledge_items
               SET topic_category = ?
             WHERE key IN ({_sql_in(len(keys))})
             {active_clause}
               AND TRIM(COALESCE(topic_category, '')) = ''
               AND NOT EXISTS (
                   SELECT 1
                   FROM knowledge_items AS dst
                   WHERE dst.key = knowledge_items.key
                     AND dst.locale = knowledge_items.locale
                     AND dst.topic_category = ?
               )
            """.strip(),
            [fill_topic_category, *keys, fill_topic_category],
        )
        topic_rows_updated = int(cur.rowcount or 0)

    return Report(
        keys_total=len(keys),
        canonical_locale=canonical_locale,
        fill_topic_category=fill_topic_category,
        touch_inactive=touch_inactive,
        conflict_strategy=conflict_strategy,
        scoped_rows=scoped_rows,
        locale_rows_to_update=locale_rows_to_update,
        locale_rows_updated=locale_rows_updated,
        topic_rows_missing_before=topic_rows_missing_before,
        topic_conflicts_with_filled_found=topic_conflicts_with_filled_found,
        topic_conflicts_with_filled_affected=topic_conflicts_with_filled_affected,
        topic_empty_dupes_found=topic_empty_dupes_found,
        topic_empty_dupes_affected=topic_empty_dupes_affected,
        topic_rows_updated=topic_rows_updated,
    )


def main() -> None:
    ap = argparse.ArgumentParser(
        prog="normalize_ev1_data",
        description="Normalize EV1 knowledge_items: locale -> canonical, fill missing topic_category",
    )
    ap.add_argument("--keys-file", default="", help="Path to EV1 keys txt. Recommended: ..\\ev1_keys_unique.txt")
    ap.add_argument("--canonical-locale", default="ru-RU", help="Canonical locale (default: ru-RU).")
    ap.add_argument("--fill-topic-category", default="personality_core", help="Fill empty topic_category with this value.")
    ap.add_argument("--touch-inactive", action="store_true", help="Also touch inactive rows (default: only active).")
    ap.add_argument(
        "--conflict-strategy",
        choices=["skip", "deactivate", "delete"],
        default="delete",
        help="How to resolve duplicates that would violate UNIQUE.",
    )
    ap.add_argument("--apply", action="store_true", help="Apply changes (default: dry-run).")
    args = ap.parse_args()

    keys_path, ok = kb.resolve_ev1_keys_file(args.keys_file or None)
    if not ok:
        raise SystemExit(f"❌ keys_file not found: {keys_path}")

    keys = kb.load_keys_txt(keys_path)
    if not keys:
        raise SystemExit(f"❌ keys_file is empty: {keys_path}")

    db_path = _db_path()
    if not db_path.exists():
        raise SystemExit(f"❌ knowledge db not found: {db_path}")

    print(f"keys_file: {keys_path} (keys={len(keys)})")
    print(f"DB: {db_path}")
    print(f"Mode: {'APPLY' if args.apply else 'DRY-RUN'} | touch_inactive={bool(args.touch_inactive)}")
    print(f"canonical_locale={args.canonical_locale} | fill_topic_category={args.fill_topic_category}")
    print(f"conflict_strategy={args.conflict_strategy}")
    print()

    conn = sqlite3.connect(str(db_path))
    conn.row_factory = sqlite3.Row
    try:
        # wrap apply in a transaction so either everything succeeds or nothing changes
        if args.apply:
            conn.execute("BEGIN IMMEDIATE")

        print("Preview BEFORE (first rows by id):")
        for row in _preview_rows(conn, keys, limit=12):
            print("  ", row)
        print()

        report = normalize_ev1_data(
            conn=conn,
            keys=keys,
            canonical_locale=args.canonical_locale,
            fill_topic_category=args.fill_topic_category,
            apply=bool(args.apply),
            touch_inactive=bool(args.touch_inactive),
            conflict_strategy=str(args.conflict_strategy),
        )

        if args.apply:
            conn.commit()

        print("=== Report ===")
        print(f"keys_total: {report.keys_total}")
        print(f"scoped_rows: {report.scoped_rows}")
        print(f"locale_rows_to_update: {report.locale_rows_to_update}")
        print(f"locale_rows_updated: {report.locale_rows_updated}")
        print(f"topic_rows_missing_before: {report.topic_rows_missing_before}")
        print(f"topic_conflicts_with_filled_found: {report.topic_conflicts_with_filled_found}")
        print(f"topic_conflicts_with_filled_affected: {report.topic_conflicts_with_filled_affected}")
        print(f"topic_empty_dupes_found: {report.topic_empty_dupes_found}")
        print(f"topic_empty_dupes_affected: {report.topic_empty_dupes_affected}")
        print(f"topic_rows_updated: {report.topic_rows_updated}")
        print()

        print("Preview AFTER (first rows by id):")
        for row in _preview_rows(conn, keys, limit=12):
            print("  ", row)

        if not args.apply:
            print("\nℹ️ Dry-run only. Re-run with --apply to persist changes.")
    except Exception:
        if args.apply:
            conn.rollback()
        raise
    finally:
        conn.close()


if __name__ == "__main__":
    main()

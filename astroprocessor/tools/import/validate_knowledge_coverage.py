#!/usr/bin/env python3
# tools/validate_knowledge_coverage.py
from __future__ import annotations

import argparse
import json
import sqlite3
import sys
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Sequence, Set, Tuple
import re
import itertools


def eprint(*args: Any) -> None:
    print(*args, file=sys.stderr)


PLACEHOLDER_RE = re.compile(r"\{([a-zA-Z_][a-zA-Z0-9_]*)\}")


def load_json(path: Path) -> Dict[str, Any]:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def _stable_dedup(items: Iterable[str]) -> List[str]:
    seen: Set[str] = set()
    out: List[str] = []
    for x in items:
        if x not in seen:
            seen.add(x)
            out.append(x)
    return out


def expand_required_keys(spec: Dict[str, Any]) -> List[str]:
    """
    Runtime-spec expansion.

    Supported spec shape:

    {
      "version": 1,
      "namespace": "natal.runtime",
      "locale": "ru-RU",
      "topic_category": null,
      "enums": {
        "planet": [...],
        "angle": [...],
        "sign": [...]
      },
      "keys": [
        {"key": "natal.generic"},
        {"key_template": "natal.planet.{planet}.sign.{sign}"},
        {"key_template": "natal.angle.{angle}.sign.{sign}"}
      ]
    }

    Rule:
    - For each key_template, detect placeholders {name}
    - For each placeholder name, take spec.enums[name] (must exist and be list)
    - Expand cartesian product
    """
    enums: Dict[str, List[str]] = spec.get("enums", {}) or {}
    keys_spec: List[Dict[str, Any]] = spec.get("keys", []) or []
    if not isinstance(keys_spec, list) or not keys_spec:
        raise ValueError("spec.keys должен быть непустым списком.")

    expanded: List[str] = []

    for entry in keys_spec:
        if "key" in entry:
            expanded.append(str(entry["key"]))
            continue

        tpl = entry.get("key_template")
        if not tpl:
            raise ValueError("Каждый элемент spec.keys должен иметь key или key_template.")

        placeholders = PLACEHOLDER_RE.findall(tpl)
        if not placeholders:
            expanded.append(str(tpl))
            continue

        # gather domains
        domains: List[Sequence[str]] = []
        for name in placeholders:
            values = enums.get(name)
            if not values or not isinstance(values, list):
                raise ValueError(f"В spec.enums отсутствует список для плейсхолдера {{{name}}}.")
            domains.append([str(v) for v in values])

        # expand cartesian
        for combo in itertools.product(*domains):
            s = str(tpl)
            for name, val in zip(placeholders, combo):
                s = s.replace("{"+name+"}", val)
            expanded.append(s)

    expanded = _stable_dedup(expanded)
    return expanded


def _sql_in_clause(n: int) -> str:
    # SQLite supports (?, ?, ...)
    return "(" + ",".join(["?"] * n) + ")"


def fetch_covered_keys(
    conn: sqlite3.Connection,
    required: Sequence[str],
    locale: Optional[str],
    topic_mode: str,
    topic_value: Optional[str],
    include_inactive: bool,
) -> Set[str]:
    """
    Pull keys from knowledge_items that match required list.

    topic_mode:
      - "any": ignore topic_category
      - "null": only NULL or '' topic_category
      - "value": exactly topic_value
    """
    if not required:
        return set()

    params: List[Any] = []
    sql = "SELECT DISTINCT key FROM knowledge_items WHERE key IN " + _sql_in_clause(len(required))
    params.extend(required)

    if not include_inactive:
        sql += " AND is_active = 1"

    if locale:
        sql += " AND locale = ?"
        params.append(locale)

    if topic_mode == "null":
        sql += " AND (topic_category IS NULL OR topic_category = '')"
    elif topic_mode == "value":
        sql += " AND topic_category = ?"
        params.append(topic_value)
    elif topic_mode == "any":
        pass
    else:
        raise ValueError("topic_mode must be one of: any, null, value")

    cur = conn.execute(sql, params)
    return {row[0] for row in cur.fetchall()}


def main(argv: Optional[List[str]] = None) -> int:
    p = argparse.ArgumentParser(description="Validate knowledge coverage against runtime key spec")
    p.add_argument("--db", required=True, help="Path to SQLite knowledge.db")
    p.add_argument("--spec", required=True, help="Path to runtime spec JSON")
    p.add_argument("--locale", default=None, help="Override locale filter (default: spec.locale if present)")
    p.add_argument(
        "--topic",
        default="spec",
        help="Topic filter: spec | any | null | <value>. Default: spec",
    )
    p.add_argument("--include-inactive", action="store_true", help="Count is_active=0 rows as covered")
    args = p.parse_args(argv)

    db_path = Path(args.db)
    spec_path = Path(args.spec)
    if not spec_path.exists():
        eprint(f"Spec не найден: {spec_path}")
        return 2
    if not db_path.exists():
        eprint(f"DB не найдена: {db_path}")
        return 2

    spec = load_json(spec_path)

    required = expand_required_keys(spec)
    expected = spec.get("expected_count")
    # allow optional sanity check
    if expected is not None and int(expected) != len(required):
        eprint(f"WARNING: spec.expected_count={expected}, но развёрнуто {len(required)} ключей.")

    locale = args.locale or spec.get("locale")

    # topic handling
    topic_arg = str(args.topic)
    if topic_arg == "spec":
        if "topic_category" in spec and spec["topic_category"] is None:
            topic_mode, topic_value = "null", None
        elif "topic_category" in spec:
            topic_mode, topic_value = "value", str(spec["topic_category"])
        else:
            topic_mode, topic_value = "any", None
    elif topic_arg == "any":
        topic_mode, topic_value = "any", None
    elif topic_arg == "null":
        topic_mode, topic_value = "null", None
    else:
        topic_mode, topic_value = "value", topic_arg

    conn = sqlite3.connect(str(db_path))
    try:
        covered = fetch_covered_keys(
            conn,
            required=required,
            locale=locale,
            topic_mode=topic_mode,
            topic_value=topic_value,
            include_inactive=bool(args.include_inactive),
        )
    finally:
        conn.close()

    missing = [k for k in required if k not in covered]

    print("=== Spec ===")
    print(f"required_keys: {len(required)}")
    print(f"locale: {locale!s}")
    print(f"topic_filter: {topic_mode}{'' if topic_mode!='value' else '=' + str(topic_value)}")
    print("=== Coverage ===")
    print(f"covered_total_from_db: {len(covered)}")
    print(f"covered_required: {len(covered)}/{len(required)}")

    if missing:
        print("=== Missing keys ===")
        for k in missing:
            print(k)
        print("=== Result ===")
        print("FAIL (coverage incomplete)")
        return 1

    print("=== Result ===")
    print("OK (coverage complete)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

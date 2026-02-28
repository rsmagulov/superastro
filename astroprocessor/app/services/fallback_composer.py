# app/services/fallback_composer.py
from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime
from typing import Any, Iterable, Optional


@dataclass
class ComposeResult:
    text: str
    used: int
    total: int


def _as_float(x: Any, default: float = 0.0) -> float:
    try:
        return float(x)
    except Exception:
        return default


def _as_str(x: Any) -> str:
    return "" if x is None else str(x)


def _as_dt(x: Any) -> Optional[datetime]:
    if x is None:
        return None
    if isinstance(x, datetime):
        return x
    # ожидаем ISO или "YYYY-MM-DD HH:MM:SS"
    s = str(x).strip()
    try:
        if len(s) >= 19 and s[10] == " ":
            s = s[:19].replace(" ", "T", 1)
        return datetime.fromisoformat(s)
    except Exception:
        return None


def _snippet(text: str, limit: int) -> str:
    t = (text or "").strip()
    if not t:
        return ""
    if len(t) <= limit:
        return t
    return t[:limit].rstrip() + "…"


def compose_fallback_text_v1(
    hits: Iterable[Any],
    *,
    max_hits: int = 4,
    per_hit_chars: int = 700,
    title_prefix: str = "Источник",
    dedupe_mode: str = "soft",  # "strict" | "soft" | "off"
) -> ComposeResult:
    hits_list = list(hits or [])
    total = len(hits_list)
    if total == 0:
        return ComposeResult(text="", used=0, total=0)

    norm = []
    for h in hits_list:
        score = _as_float(getattr(h, "score", 0.0))
        created_at = _as_dt(getattr(h, "created_at", None))
        doc_id = _as_str(getattr(h, "doc_id", ""))
        title = _as_str(getattr(h, "title", "")).strip() or "Без названия"
        text = _as_str(getattr(h, "text", "")).strip()

        norm.append(
            {
                "score": score,
                "created_at": created_at,
                "doc_id": doc_id,
                "title": title,
                "text": text,
            }
        )

    norm.sort(
        key=lambda x: (
            x["score"],
            x["created_at"].timestamp() if x["created_at"] else 0.0,
        ),
        reverse=True,
    )

    if dedupe_mode not in ("strict", "soft", "off"):
        dedupe_mode = "soft"

    selected: list[dict[str, Any]] = []
    used_docs: set[str] = set()

    if dedupe_mode == "off":
        for item in norm:
            if len(selected) >= max_hits:
                break
            if not item["text"]:
                continue
            selected.append(item)

    elif dedupe_mode == "strict":
        for item in norm:
            if len(selected) >= max_hits:
                break
            if not item["text"]:
                continue
            if item["doc_id"] and item["doc_id"] in used_docs:
                continue
            selected.append(item)
            if item["doc_id"]:
                used_docs.add(item["doc_id"])

    else:  # "soft" двухпроходка
        # Pass 1: уникальные

        # Pass 1: берём уникальные doc_id
        for item in norm:
            if len(selected) >= max_hits:
                break
            if not item["text"]:
                continue
            if item["doc_id"] and item["doc_id"] in used_docs:
                continue
            selected.append(item)
            if item["doc_id"]:
                used_docs.add(item["doc_id"])

        # Pass 2: если уникальных не хватило — добиваем повторами (из лучших по score)
        if len(selected) < max_hits:
            for item in norm:
                if len(selected) >= max_hits:
                    break
                if not item["text"]:
                    continue
                # допускаем повтор doc_id
                if item in selected:
                    continue
                selected.append(item)

    parts: list[str] = []
    for item in selected:
        snip = _snippet(item["text"], per_hit_chars)
        if not snip:
            continue
        parts.append(f"{title_prefix}: {item['title']}\n{snip}")

    final = "\n\n".join(parts).strip()
    return ComposeResult(text=final, used=len(parts), total=total)

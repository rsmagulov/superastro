import json
from dataclasses import dataclass
from typing import Optional

from app.knowledge.meta_schema import ALLOWED_ABSTRACTION_LEVELS, ALLOWED_TONES
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession


@dataclass(frozen=True)
class ValidationIssue:
    level: str  # "error" | "warning"
    item_id: int
    message: str


async def validate_knowledge_items(session: AsyncSession) -> list[ValidationIssue]:
    sql = text("""
        SELECT id, key, locale, topic_category, is_active, meta_json
        FROM knowledge_items
        WHERE is_active = 1
    """)
    res = await session.execute(sql)
    rows = res.fetchall()

    issues: list[ValidationIssue] = []
    for r in rows:
        item_id = int(r[0])
        meta_raw = r[5] if r[5] is not None else "{}"

        try:
            meta = json.loads(str(meta_raw))
        except Exception:
            issues.append(
                ValidationIssue("error", item_id, "meta_json: невалидный JSON")
            )
            continue

        tone = meta.get("tone")
        if not tone or tone not in ALLOWED_TONES:
            issues.append(
                ValidationIssue(
                    "error",
                    item_id,
                    "meta_json.tone: отсутствует или недопустимое значение",
                )
            )

        lvl = meta.get("abstraction_level")
        if not lvl or lvl not in ALLOWED_ABSTRACTION_LEVELS:
            issues.append(
                ValidationIssue(
                    "error",
                    item_id,
                    "meta_json.abstraction_level: отсутствует или недопустимое значение",
                )
            )

        tags = meta.get("tags")
        if tags is None:
            issues.append(
                ValidationIssue(
                    "warning",
                    item_id,
                    "meta_json.tags: отсутствует (лучше хранить пустой список)",
                )
            )
        elif not isinstance(tags, list):
            issues.append(
                ValidationIssue(
                    "warning", item_id, "meta_json.tags: должно быть списком"
                )
            )
        else:
            # простая проверка “мусора”
            for t in tags:
                if not isinstance(t, str) or len(t.strip()) == 0:
                    issues.append(
                        ValidationIssue(
                            "warning",
                            item_id,
                            "meta_json.tags: есть пустой/нестроковый тег",
                        )
                    )
                elif len(t) > 40:
                    issues.append(
                        ValidationIssue(
                            "warning",
                            item_id,
                            f"meta_json.tags: слишком длинный тег ({t[:20]}...)",
                        )
                    )

    return issues

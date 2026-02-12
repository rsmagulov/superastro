from __future__ import annotations

import json
import re
from typing import Any, Dict, Optional, Tuple

from app.knowledge.meta_schema import ALLOWED_ABSTRACTION_LEVELS, ALLOWED_TONES
from fastapi import HTTPException

_REPLACEMENT_CHAR = "\ufffd"  # Unicode replacement char


def _raise400(msg: str) -> None:
    raise HTTPException(status_code=400, detail=msg)


def validate_text_not_garbled(text: str, field_name: str = "text") -> None:
    """
    Защита от порчи данных из-за неправильной кодировки/перекодирования.
    """
    if text is None:
        return

    if _REPLACEMENT_CHAR in text:
        _raise400(
            f"{field_name}: обнаружен символ замены (�). Проверь кодировку запроса (нужен UTF-8)."
        )

    # Эвристика: много '?' подряд — часто признак "????" вместо кириллицы.
    # Не блокируем единичные знаки вопроса.
    q_count = text.count("?")
    if q_count >= 8 and (q_count / max(len(text), 1)) > 0.2:
        _raise400(
            f"{field_name}: похоже на испорченную кодировку (много '?'). Отправь JSON в UTF-8 (bytes)."
        )


def normalize_and_validate_meta_json(
    meta_json: str,
    *,
    is_active: bool,
    require_for_active: bool = True,
) -> str:
    """
    1) Проверяет, что meta_json — валидный JSON-объект.
    2) Нормализует: добавляет отсутствующие поля (tags/notes) к дефолтам.
    3) Если is_active=1 и require_for_active=True: tone и abstraction_level обязательны и должны быть из словаря.
    Возвращает НОРМАЛИЗОВАННУЮ JSON-строку (ensure_ascii=False).
    """
    raw = meta_json if meta_json is not None else "{}"
    if raw == "":
        raw = "{}"

    try:
        meta = json.loads(raw)
    except Exception:
        _raise400("meta_json: невалидный JSON")

    if not isinstance(meta, dict):
        _raise400("meta_json: должен быть JSON-объектом")

    # Нормализация минимального контракта
    if "tags" not in meta or meta["tags"] is None:
        meta["tags"] = []
    if "notes" not in meta or meta["notes"] is None:
        meta["notes"] = ""

    # Типы
    if not isinstance(meta["tags"], list):
        _raise400("meta_json.tags: должно быть списком")
    if not isinstance(meta["notes"], str):
        _raise400("meta_json.notes: должно быть строкой")

    # Обязательность для активных
    if require_for_active and is_active:
        tone = meta.get("tone")
        if not tone or not isinstance(tone, str) or tone not in ALLOWED_TONES:
            _raise400("meta_json.tone: отсутствует или недопустимое значение")
        lvl = meta.get("abstraction_level")
        if not lvl or not isinstance(lvl, str) or lvl not in ALLOWED_ABSTRACTION_LEVELS:
            _raise400(
                "meta_json.abstraction_level: отсутствует или недопустимое значение"
            )

    return json.dumps(meta, ensure_ascii=False)


def normalize_and_validate_meta_obj(
    meta: dict,
    *,
    is_active: bool,
    require_for_active: bool = True,
) -> str:
    # сериализуем объект в строку и прогоняем через существующую логику
    return normalize_and_validate_meta_json(
        json.dumps(meta, ensure_ascii=False),
        is_active=is_active,
        require_for_active=require_for_active,
    )

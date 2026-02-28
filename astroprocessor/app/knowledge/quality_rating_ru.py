# astroprocessor/app/knowledge/quality_rating_ru.py
from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Dict


@dataclass(frozen=True)
class QualityRating:
    score: int  # 0..100
    label: str  # "A".."F"
    reasons: Dict[str, int]


def _clamp(n: int, lo: int = 0, hi: int = 100) -> int:
    return max(lo, min(hi, n))


def _label(score: int) -> str:
    if score >= 90:
        return "A"
    if score >= 80:
        return "B"
    if score >= 70:
        return "C"
    if score >= 55:
        return "D"
    return "F"


def _count(pattern: re.Pattern[str], s: str) -> int:
    return len(pattern.findall(s))


def rate_fragment_ru(text: str) -> QualityRating:
    """
    RU KB suitability rating.

    Calibrated to be conservative:
      - start at 70, earn your way up
      - coaching/storytelling gets heavy penalties
      - definitional/structured text can reach A
    """
    s = (text or "").strip()
    if not s:
        return QualityRating(score=0, label="F", reasons={"empty": 1})

    s_l = s.lower().replace("ё", "е")
    reasons: Dict[str, int] = {}

    score = 70  # IMPORTANT: conservative base

    # ---------- Rewards (KB style)
    re_def_line = re.compile(r"(^|\n)\s*[А-ЯA-Z0-9][^:\n]{0,80}\s*(—|-|:)\s*.+", re.MULTILINE)
    re_def_words = re.compile(r"\b(это|означает|называется|определяется|характеризует|является)\b", re.IGNORECASE)
    re_struct = re.compile(r"\b(признак\w*|критери\w*|смысл|интерпретац\w*|значени\w*|влияни\w*)\b", re.IGNORECASE)
    re_bullets = re.compile(r"(^|\n)\s*(?:[-•*]|\d+[.)])\s+\S+", re.MULTILINE)

    if re_def_line.search(s):
        reasons["def_line"] = 1
        score += 18

    defw = _count(re_def_words, s_l)
    if defw:
        reasons["def_words"] = defw
        score += min(12, defw * 3)

    structw = _count(re_struct, s_l)
    if structw:
        reasons["kb_terms"] = structw
        score += min(12, structw * 2)

    bullets = _count(re_bullets, s)
    if bullets:
        reasons["lists"] = bullets
        score += min(15, bullets * 3)

    # Slight reward for being concise (KB fragments tend to be compact)
    if len(s) <= 500:
        reasons["concise"] = 1
        score += 4

    # ---------- Penalties (bad fit)
    # strong coaching / addressing reader
    re_you = re.compile(r"\b(ты|тебе|твой|твоя|твое|твои|вы|вам|ваш|ваша|ваше|ваши)\b", re.IGNORECASE)
    you_hits = _count(re_you, s_l)
    if you_hits:
        reasons["2nd_person"] = you_hits
        score -= min(35, 6 + you_hits * 3)

    # conversational fillers / slangy vibe
    re_fill = re.compile(
        r"\b(ну|короче|типа|в\s+общем|как\s+бы|реально|пипец|жесть|стремно|страшно|танцульк\w*|смешно|прикол)\b",
        re.IGNORECASE,
    )
    fill_hits = _count(re_fill, s_l)
    if fill_hits:
        reasons["slang_fillers"] = fill_hits
        score -= min(30, 8 + fill_hits * 4)

    # coaching / motivation markers
    re_coach = re.compile(
        r"\b(надо|нужно|должен|должна|обязан|обязана)\b(?=.*\b(ты|вы|тебе|вам|твой|ваш)\b)|"
        r"\b(пора|давай|сделай|поработай|прокачай|перестань|начни)\b",
        re.IGNORECASE,
    )
    coach_hits = _count(re_coach, s_l)
    if coach_hits:
        reasons["coaching"] = coach_hits
        score -= min(28, 10 + coach_hits * 6)

    # daily-life storytelling markers
    re_daily = re.compile(
        r"\b(деньги|кредит|страховк\w*|карман|болезн\w*|родственник\w*|работ\w*|продавать|покупать|ипотек\w*|долг\w*)\b",
        re.IGNORECASE,
    )
    daily_hits = _count(re_daily, s_l)
    if daily_hits:
        reasons["daily_story"] = daily_hits
        score -= min(26, 6 + daily_hits * 5)

    # excessive emotion punctuation
    excls = s.count("!")
    if excls >= 2:
        reasons["exclamations"] = excls
        score -= min(18, 6 + (excls - 1) * 5)

    qsts = s.count("?")
    if qsts >= 4:
        reasons["questions"] = qsts
        score -= min(12, 4 + (qsts - 3) * 2)

    # very long / rambling
    if len(s) > 900:
        reasons["too_long"] = 1
        score -= 12

    # "dialogue-ish" quotes often correlate with storytelling
    quotes = s.count("«") + s.count("»") + s.count('"')
    if quotes >= 6:
        reasons["many_quotes"] = quotes
        score -= 10

    score = _clamp(score)
    return QualityRating(score=score, label=_label(score), reasons=reasons)

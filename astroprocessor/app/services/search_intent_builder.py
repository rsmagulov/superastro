# astroprocessor/app/services/search_intent_builder.py
from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Any, Optional

"""
Search intent builder for KB full-text (FTS) search.

It converts candidate_keys (from key_builder) into "tokens" that help the FTS query.
Key points:
- Topic words are always added (topic_category -> synonyms).
- We ignore .generic keys (they are fallbacks, not semantic signals).
- Houses tokens are enabled only for selected topics (to avoid noise).
- Supports new key patterns: house.ruler.*, elements.*, polarity.*, modality.*,
  aspect_config.*, and angle/dsc/ic.
"""


@dataclass(frozen=True)
class IntentToken:
    text: str
    kind: str  # planet|sign|sign_phrase|house|angle|topic|anchor|aspect|config|element|attr
    weight: float = 1.0
    source: str = ""


@dataclass(frozen=True)
class SearchIntent:
    query: str
    query_soft: Optional[str]
    tokens: list[IntentToken]
    anchors: list[str]
    domain: str
    locale: str


@dataclass(frozen=True)
class SearchIntentTrace:
    candidate_keys_used: list[str]
    rules_fired: list[str]


@dataclass(frozen=True)
class SearchIntentResult:
    intent: SearchIntent
    trace: SearchIntentTrace


PLANET_RU = {
    "sun": "солнце",
    "moon": "луна",
    "mercury": "меркурий",
    "venus": "венера",
    "mars": "марс",
    "jupiter": "юпитер",
    "saturn": "сатурн",
    "uranus": "уран",
    "neptune": "нептун",
    "pluto": "плутон",
    "lilith": "лилит",
    "north_node": "северный узел",
    "south_node": "южный узел",
}

SIGN_RU = {
    "aries": "овен",
    "taurus": "телец",
    "gemini": "близнецы",
    "cancer": "рак",
    "leo": "лев",
    "virgo": "дева",
    "libra": "весы",
    "scorpio": "скорпион",
    "sagittarius": "стрелец",
    "capricorn": "козерог",
    "aquarius": "водолей",
    "pisces": "рыбы",
}

SIGN_LOC_RU = {
    "aries": "овне",
    "taurus": "тельце",
    "gemini": "близнецах",
    "cancer": "раке",
    "leo": "льве",
    "virgo": "деве",
    "libra": "весах",
    "scorpio": "скорпионе",
    "sagittarius": "стрельце",
    "capricorn": "козероге",
    "aquarius": "водолее",
    "pisces": "рыбах",
}

SIGN_GEN_RU = {
    "aries": "овна",
    "taurus": "тельца",
    "gemini": "близнецов",
    "cancer": "рака",
    "leo": "льва",
    "virgo": "девы",
    "libra": "весов",
    "scorpio": "скорпиона",
    "sagittarius": "стрельца",
    "capricorn": "козерога",
    "aquarius": "водолея",
    "pisces": "рыб",
}

ANGLE_RU = {
    "asc": "асцендент",
    "mc": "mc",
    "dsc": "десцендент",
    "ic": "ic",
}

ELEMENT_RU = {"fire": "огонь", "earth": "земля", "air": "воздух", "water": "вода"}
POLARITY_RU = {"yin": "инь", "yang": "ян", "balanced": "баланс"}
MODALITY_RU = {"cardinal": "кардинальный", "fixed": "фиксированный", "mutable": "мутабельный", "balanced": "баланс"}

TOPIC_RU = {
    "personality_core": ["личность", "характер", "психология"],
    "psychology": ["психология", "внутренний мир"],
    "talents": ["таланты", "способности"],
    "strengths_weaknesses": ["сильные стороны", "слабые стороны"],
    "purpose_path": ["предназначение", "путь"],
    "career": ["карьера", "работа", "профессия"],
    "money": ["деньги", "финансы"],
    "love_intimacy": ["любовь", "близость", "интимность"],
    "partnership_marriage": ["партнерство", "брак", "отношения"],
    "karmic_tasks": ["карма", "кармические задачи"],
    "past_lives_symbolic": ["прошлые жизни", "символика"],
    "emotional_world": ["эмоции", "чувства"],
    "how_others_see_me": ["восприятие", "как вас видят"],
    "self_esteem": ["самооценка", "уверенность"],
    "creativity": ["творчество", "самовыражение"],
    "ancestral_topics": ["род", "предки", "наследие"],
}

PLANET_RE = re.compile(r"(?:^|\.)planet\.([a-z_]+)(?:\.|$)")
SIGN_RE = re.compile(r"(?:^|\.)sign\.([a-z_]+)(?:\.|$)")
HOUSE_RE = re.compile(r"(?:^|\.)house\.(\d{1,2})(?:\.|$)")
ANGLE_RE = re.compile(r"(?:^|\.)angle\.([a-z_]+)(?:\.|$)")
ELEMENT_RE = re.compile(r"(?:^|\.)elements\.([a-z_]+)(?:\.|$)")
POLARITY_RE = re.compile(r"(?:^|\.)polarity\.(?:balance\.)?([a-z_]+)(?:\.|$)")
MODALITY_RE = re.compile(r"(?:^|\.)modality\.(?:balance\.)?([a-z_]+)(?:\.|$)")
ASPECT_CFG_RE = re.compile(r"(?:^|\.)aspect_config\.([a-z_]+)(?:\.|$)")

HOUSE_TOKENS_RU = {i: f"{i} дом" for i in range(1, 13)}
HOUSE_TOKENS_EN = {i: f"house {i}" for i in range(1, 13)}

HOUSE_ENABLED_TOPICS = {
    "career",
    "money",
    "love_intimacy",
    "partnership_marriage",
    "psychology",
    "talents",
    "purpose_path",
    "emotional_world",
    "ancestral_topics",
    "self_esteem",
}


def _is_ru(locale: str) -> bool:
    return (locale or "").lower().startswith("ru")


def _dedup_keep_order(items: list[str]) -> list[str]:
    seen = set()
    out: list[str] = []
    for x in items:
        if not x or x in seen:
            continue
        seen.add(x)
        out.append(x)
    return out


def _quote_if_phrase(s: str) -> str:
    s = s.strip()
    if not s:
        return s
    if " " in s or "-" in s:
        return f'"{s}"'
    return s


class SearchIntentBuilder:
    def build(
        self,
        *,
        topic_category: Optional[str],
        locale: str,
        tone_namespace: str,
        selection: list[dict[str, Any]],
        topic_domain: Optional[str] = None,
    ) -> SearchIntentResult:
        domain = topic_domain or tone_namespace or "general"
        rules: list[str] = []
        candidate_keys_used: list[str] = []

        tokens: list[IntentToken] = []
        anchors: list[str] = []

        if domain == "natal":
            anchors.append("натальная карта" if _is_ru(locale) else "natal chart")
            rules.append("anchor:domain:natal")
        elif domain == "synastry":
            anchors.append("синастрия" if _is_ru(locale) else "synastry")
            rules.append("anchor:domain:synastry")
        elif domain == "transits":
            anchors.append("транзиты" if _is_ru(locale) else "transits")
            rules.append("anchor:domain:transits")
        else:
            anchors.append("астрология" if _is_ru(locale) else "astrology")
            rules.append("anchor:domain:general")

        topic_words = self._topic_words(topic_category, locale)
        for w in topic_words:
            tokens.append(IntentToken(text=w, kind="topic", weight=1.6, source="topic_category"))
        if topic_words:
            rules.append("topic:category")

        enable_house = bool(topic_category) and str(topic_category) in HOUSE_ENABLED_TOPICS

        for blk in selection or []:
            ckeys = blk.get("candidate_keys") or []
            for k in ckeys:
                if not k:
                    continue
                ks = str(k)

                if ks.endswith(".generic") or ks == "natal.generic":
                    continue

                candidate_keys_used.append(ks)

                pm = PLANET_RE.search(ks)
                if pm:
                    p = pm.group(1)
                    txt = self._map_planet(p, locale)
                    if txt:
                        tokens.append(IntentToken(text=txt, kind="planet", weight=2.0, source=f"key:{ks}"))

                sm = SIGN_RE.search(ks)
                if sm:
                    s_key = (sm.group(1) or "").lower()
                    txt = self._map_sign(s_key, locale)
                    if txt:
                        tokens.append(IntentToken(text=txt, kind="sign", weight=1.8, source=f"key:{ks}"))
                    for phr, w in self._sign_phrases(s_key, locale):
                        tokens.append(IntentToken(text=phr, kind="sign_phrase", weight=w, source=f"key:{ks}"))

                am = ANGLE_RE.search(ks)
                if am:
                    a = am.group(1)
                    txt = self._map_angle(a, locale)
                    if txt:
                        tokens.append(IntentToken(text=txt, kind="angle", weight=1.7, source=f"key:{ks}"))

                hm = HOUSE_RE.search(ks)
                if hm and enable_house:
                    try:
                        h = int(hm.group(1))
                    except Exception:
                        h = 0
                    if 1 <= h <= 12:
                        tokens.append(IntentToken(text=self._map_house(h, locale), kind="house", weight=1.2, source=f"key:{ks}"))

                em = ELEMENT_RE.search(ks)
                if em:
                    e = (em.group(1) or "").lower()
                    txt = self._map_element(e, locale)
                    if txt:
                        tokens.append(IntentToken(text=txt, kind="element", weight=1.1, source=f"key:{ks}"))

                pol = POLARITY_RE.search(ks)
                if pol:
                    p = (pol.group(1) or "").lower()
                    txt = self._map_polarity(p, locale)
                    if txt:
                        tokens.append(IntentToken(text=txt, kind="attr", weight=1.0, source=f"key:{ks}"))

                mod = MODALITY_RE.search(ks)
                if mod:
                    m = (mod.group(1) or "").lower()
                    txt = self._map_modality(m, locale)
                    if txt:
                        tokens.append(IntentToken(text=txt, kind="attr", weight=1.0, source=f"key:{ks}"))

                cfg = ASPECT_CFG_RE.search(ks)
                if cfg:
                    c = (cfg.group(1) or "").lower()
                    tokens.append(IntentToken(text=c.replace("_", " "), kind="config", weight=1.0, source=f"key:{ks}"))

        if candidate_keys_used:
            rules.append("parse:candidate_keys")

        tokens = self._dedup_tokens(tokens)
        anchors = _dedup_keep_order(anchors)[:3]
        tokens = self._limit_tokens_smart(tokens, max_total=16)

        topic_required = bool(topic_words)
        query = self._build_match_query_strict(tokens=tokens, anchors=anchors, topic_required=topic_required)
        query_soft = self._build_match_query_soft(tokens=tokens, anchors=anchors, topic_required=topic_required)

        trace = SearchIntentTrace(candidate_keys_used=_dedup_keep_order(candidate_keys_used)[:120], rules_fired=rules)
        intent = SearchIntent(query=query, query_soft=query_soft, tokens=tokens, anchors=anchors, domain=domain, locale=locale)
        return SearchIntentResult(intent=intent, trace=trace)

    def _topic_words(self, topic_category: Optional[str], locale: str) -> list[str]:
        tc = (topic_category or "").strip()
        if not tc:
            return []
        if _is_ru(locale):
            return TOPIC_RU.get(tc, [tc.replace("_", " ")])
        return [tc.replace("_", " ")]

    def _map_planet(self, p: str, locale: str) -> Optional[str]:
        p = (p or "").lower()
        if not p:
            return None
        return PLANET_RU.get(p) if _is_ru(locale) else p

    def _map_sign(self, s: str, locale: str) -> Optional[str]:
        s = (s or "").lower()
        if not s:
            return None
        return SIGN_RU.get(s) if _is_ru(locale) else s

    def _map_angle(self, a: str, locale: str) -> Optional[str]:
        a = (a or "").lower()
        if not a:
            return None
        return ANGLE_RU.get(a) if _is_ru(locale) else a

    def _map_house(self, h: int, locale: str) -> str:
        return HOUSE_TOKENS_RU.get(h, f"{h} дом") if _is_ru(locale) else HOUSE_TOKENS_EN.get(h, f"house {h}")

    def _map_element(self, e: str, locale: str) -> Optional[str]:
        e = (e or "").lower()
        if not e:
            return None
        return ELEMENT_RU.get(e) if _is_ru(locale) else e

    def _map_polarity(self, p: str, locale: str) -> Optional[str]:
        p = (p or "").lower()
        if not p:
            return None
        return POLARITY_RU.get(p) if _is_ru(locale) else p

    def _map_modality(self, m: str, locale: str) -> Optional[str]:
        m = (m or "").lower()
        if not m:
            return None
        return MODALITY_RU.get(m) if _is_ru(locale) else m

    def _sign_phrases(self, sign_key: str, locale: str) -> list[tuple[str, float]]:
        sign_key = (sign_key or "").lower()
        if not sign_key:
            return []
        if not _is_ru(locale):
            return [(f"in {sign_key}", 1.8)]

        out: list[tuple[str, float]] = []
        loc = SIGN_LOC_RU.get(sign_key)
        if loc:
            out.append((f"в {loc}", 2.1))
        gen = SIGN_GEN_RU.get(sign_key)
        if gen:
            out.append((f"в знаке {gen}", 1.9))
        return out

    def _dedup_tokens(self, tokens: list[IntentToken]) -> list[IntentToken]:
        seen = set()
        out: list[IntentToken] = []
        for t in tokens:
            key = (t.kind, t.text)
            if key in seen:
                continue
            seen.add(key)
            out.append(t)
        return out

    def _limit_tokens_smart(self, tokens: list[IntentToken], *, max_total: int = 16) -> list[IntentToken]:
        caps: dict[str, int] = {
            "topic": 3,
            "planet": 6,
            "angle": 3,
            "house": 3,
            "sign_phrase": 6,
            "sign": 6,
            "element": 2,
            "attr": 2,
            "config": 2,
        }

        buckets: dict[str, list[IntentToken]] = {}
        for t in tokens:
            buckets.setdefault(t.kind, []).append(t)
        for _, lst in buckets.items():
            lst.sort(key=lambda x: x.weight, reverse=True)

        order = ["topic", "planet", "angle", "house", "sign_phrase", "sign", "element", "attr", "config"]
        out: list[IntentToken] = []
        for kind in order:
            cap = caps.get(kind, 0)
            if cap <= 0:
                continue
            out.extend((buckets.get(kind) or [])[:cap])

        out = self._dedup_tokens(out)
        return out if len(out) <= max_total else out[:max_total]

    def _fts_safe(self, s: str) -> str:
        s = (s or "").strip()
        if not s:
            return ""
        s = re.sub(r"[\"'():\[\]{}]", " ", s)
        s = re.sub(r"\s+", " ", s).strip()
        return s

    def _group_by_kind(self, tokens: list[IntentToken]) -> dict[str, list[str]]:
        by_kind: dict[str, list[str]] = {}
        for t in tokens:
            txt = self._fts_safe(t.text)
            if not txt:
                continue
            by_kind.setdefault(t.kind, []).append(_quote_if_phrase(txt))
        return by_kind

    def _or_group(self, items: list[str]) -> str:
        items = [x for x in items if x]
        if not items:
            return ""
        return items[0] if len(items) == 1 else "(" + " OR ".join(items) + ")"

    def _build_match_query_soft(self, *, tokens: list[IntentToken], anchors: list[str], topic_required: bool) -> str:
        by_kind = self._group_by_kind(tokens)

        topic_block = self._or_group(by_kind.get("topic", []))
        context_terms = (
            (by_kind.get("planet", []) or [])
            + (by_kind.get("angle", []) or [])
            + (by_kind.get("house", []) or [])
            + (by_kind.get("sign_phrase", []) or [])
            + (by_kind.get("sign", []) or [])
            + (by_kind.get("element", []) or [])
            + (by_kind.get("attr", []) or [])
            + (by_kind.get("config", []) or [])
        )

        aa = self._fts_safe(anchors[0]) if anchors else ""
        if aa:
            context_terms.append(_quote_if_phrase(aa))

        parts: list[str] = []
        if topic_required and topic_block:
            parts.append(topic_block)
        context_block = self._or_group(context_terms)
        if context_block:
            parts.append(context_block)

        return " AND ".join([p for p in parts if p]).strip()

    def _build_match_query_strict(self, *, tokens: list[IntentToken], anchors: list[str], topic_required: bool) -> str:
        by_kind = self._group_by_kind(tokens)

        topic_block = self._or_group(by_kind.get("topic", []))
        objects_block = self._or_group((by_kind.get("planet", []) or []) + (by_kind.get("angle", []) or []))
        house_block = self._or_group(by_kind.get("house", []) or [])

        sign_phrase_block = self._or_group(by_kind.get("sign_phrase", []) or [])
        sign_block = self._or_group(by_kind.get("sign", []) or [])
        attr_block = sign_phrase_block or sign_block

        parts: list[str] = []
        if topic_required and topic_block:
            parts.append(topic_block)

        if objects_block and (attr_block or house_block):
            parts.append(objects_block)
            if house_block:
                parts.append(house_block)
            if attr_block:
                parts.append(attr_block)
        elif house_block:
            parts.append(house_block)
            if attr_block:
                parts.append(attr_block)
        elif objects_block:
            parts.append(objects_block)
        elif attr_block:
            parts.append(attr_block)

        aa = self._fts_safe(anchors[0]) if anchors else ""
        if not parts and aa:
            parts.append(_quote_if_phrase(aa))

        return " AND ".join([p for p in parts if p]).strip()

# astroprocessor/app/knowledge/topic_gate_ru_natal.py
from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Dict, List, Optional, Pattern, Tuple


@dataclass(frozen=True)
class TopicGateResult:
    accepted: bool
    topics: List[str]
    topic_scores: Dict[str, int]
    strong_hit: bool
    total_score: int
    threshold: int
    profile: str
    reason: str  # "ok" | "no_topic" | "below_threshold"


def _norm(s: str) -> str:
    s = (s or "").strip().lower()
    return s.replace("ё", "е")


def _compile_many(patterns: List[str]) -> List[Pattern[str]]:
    return [re.compile(p, flags=re.IGNORECASE | re.MULTILINE) for p in patterns]


def _count_hits(s: str, patterns: List[Pattern[str]]) -> int:
    return sum(1 for p in patterns if p.search(s))


class NatalTopicGate:
    """
    ru_natal_v1 topic gate.

    Scoring:
      - strong hit => +3 for that topic
      - weak hits  => +1 per weak pattern matched, capped per topic
      - global natal boost => +0..2 (context, not bound to a topic)
      - synergy boost => +1 if 2+ topics have >=1 score each (helps "almost relevant" chunks)

    Accept if:
      - any strong hit, OR
      - total_score >= threshold
    """

    profile_name = "ru_natal_v1"

    def __init__(
        self,
        threshold: int = 3,
        include_topics: Optional[List[str]] = None,
        weak_cap_per_topic: int = 3,
        natal_boost_cap: int = 2,
        synergy_boost: int = 1,
    ) -> None:
        self.threshold = int(threshold or 3)
        self.include_topics = {t.strip() for t in (include_topics or []) if t and t.strip()}
        self.weak_cap_per_topic = int(max(1, weak_cap_per_topic))
        self.natal_boost_cap = int(max(0, natal_boost_cap))
        self.synergy_boost = int(max(0, synergy_boost))

        # Context patterns: increase total score when chunk is clearly natal-ish.
        # NOTE: includes guarded "в карте ..." only when astrology terms also appear somewhere.
        self._natal_context_weak = _compile_many(
            [
                r"\bнатал\w*\b",
                r"\bнатальн\w*\s+карт\w*\b",
                r"\bкарт\w*\s+рождени\w*\b",
                r"\bрадикс\b",
                r"\bгороскоп\b",
                r"\b(дата|время|место)\s+рождени\w*\b",
                r"\b(asc|dsc|mc|ic)\b",
                r"\bасцендент\w*\b|\bдесцендент\w*\b",
                r"\bсередина\s+неба\b|\bимум\s+цели\b",
                r"\bв\s+карт[еа]\b(?=.*\b(планет|дом|знак|аспект|асцендент|управител)\w*)",
            ]
        )

        self._topics: Dict[str, Tuple[List[Pattern[str]], List[Pattern[str]]]] = {
            # NEW: catches "общая натальная база" so it won't be no_topic
            "natal_basics": (
                _compile_many(
                    [
                        r"\bнатальн\w*\s+карт\w*\b\s*(?:—|\-|:)",
                        r"\bкарт\w*\s+рождени\w*\b\s*(?:—|\-|:)",
                        r"\bрадикс\b\s*(?:—|\-|:)",
                        r"\bгороскоп\b\s*(?:—|\-|:)",
                    ]
                ),
                _compile_many(
                    [
                        r"\bнатальн\w*\s+карт\w*\b",
                        r"\bкарт\w*\s+рождени\w*\b",
                        r"\bрадикс\b",
                        r"\bгороскоп\b",
                        r"\b(дата|время|место)\s+рождени\w*\b",
                    ]
                ),
            ),
            "elements_ip": (
                _compile_many(
                    [
                        r"\bстихи(?:я|и|й)\b\s*(?:—|\-|:)",
                        r"\b(огонь|земля|воздух|вода)\b\s*(?:—|\-|:)",
                        r"\bинь\b\s*(?:—|\-|:)|\bян\b\s*(?:—|\-|:)",
                        r"\bкардинальн\w*\b\s*(?:—|\-|:)|\bфиксированн\w*\b\s*(?:—|\-|:)|\bмутабельн\w*\b\s*(?:—|\-|:)",
                        r"\bбаланс\s+стихи\w*\b|\bбаланс\s+полярност\w*\b|\bбаланс\s+крест\w*\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bстихи(?:я|и|й)\b",
                        r"\b(огонь|земля|воздух|вода)\b",
                        r"\bполярност\w*\b",
                        r"\bкачества?\b|\bкрест(ы)?\b",
                        r"\bдоминировани\w*\b|\bдефицит\w*\b",
                    ]
                ),
            ),
            "planets": (
                _compile_many(
                    [
                        r"\bпланет(?:а|ы|у|е|ой|ам|ах)\b\s*(?:—|\-|:)",
                        r"\b(солнце|луна)\b\s*(?:—|\-|:)",
                        r"\b(меркури|венер|марс|юпитер|сатурн|уран|нептун|плутон)\w*\b\s*(?:—|\-|:)",
                        r"\b(лилит|северн\w*\s+узел|южн\w*\s+узел|узл(?:ы|а))\b\s*(?:—|\-|:)",
                        r"\bпланет\w*\s+в\s+знак\w*\b|\bпланет\w*\s+в\s+дом\w*\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bпланет(?:а|ы|у|е|ой|ам|ах)\b",
                        r"\b(солнце|луна)\b",
                        r"\b(меркури|венер|марс|юпитер|сатурн|уран|нептун|плутон)\w*\b",
                        r"\b(лилит|узл(?:ы|а)|северн\w*\s+узел|южн\w*\s+узел)\b",
                        r"\bретроградн\w*\b|\bдиректн\w*\b|\bстационарн\w*\b",
                        r"\bв\s+знак(е|ах)\b",
                        r"\bв\s+дом(е|ах)\b",
                        r"\bположени\w*\s+планет\w*\b",
                        r"\bпланет\w*\s+в\s+карт[еа]\b",
                    ]
                ),
            ),
            "signs": (
                _compile_many(
                    [
                        r"\bзнак(?:а|и|е|ов|ам|ах)?\b\s*(?:—|\-|:)",
                        r"\b(овен|телец|близнец|рак|лев|дева|весы|скорпион|стрелец|козерог|водолей|рыб)\w*\b\s*(?:—|\-|:)",
                        r"\bзнак\w*\s+зодиака\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bзнак(?:а|и|е|ов|ам|ах)?\b",
                        r"\bзодиак\w*\b",
                        r"\b(овен|телец|близнец|рак|лев|дева|весы|скорпион|стрелец|козерог|водолей|рыб)\w*\b",
                        r"\bобитель\w*\b|\bизгнани\w*\b|\bпадени\w*\b|\bэкзальтац\w*\b",
                    ]
                ),
            ),
            "houses_rulers": (
                _compile_many(
                    [
                        r"\b(?:[1-9]|1[0-2])\s*(?:-\s*)?(?:й|ый|ой)?\s*дом\b\s*(?:—|\-|:)",
                        r"\bуправител(ь|я)\s+(?:[1-9]|1[0-2])\s*(?:-\s*)?(?:й|ый|ой)?\s*дома\b",
                        r"\bуправител(ь|я)\s+дома\b\s*(?:—|\-|:)",
                        r"\bкуспид\w*\b",
                        r"\bвершин(а|е)\s+дома\b",
                        r"\bположени(е|я)\s+управител\w*\b",
                        r"\bаспект(ы)?\s+управител\w*\b|\bуправител\w*\s+в\s+аспект\w*\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\b(?:[1-9]|1[0-2])\s*(?:-\s*)?(?:й|ый|ой)?\s*дом\b",
                        r"\bдом(а|ов)\b",
                        r"\bв\s+дом(е|ах)\b",
                        r"\bуправител(ь|я)\b",
                        r"\bсфера\w*\b",
                        r"\bтема\s+дома\b",
                        r"\bуправител\w*\s+в\s+карт[еа]\b",
                    ]
                ),
            ),
            "angles_space": (
                _compile_many(
                    [
                        r"\b(asc|dsc|mc|ic)\b\s*(?:—|\-|:)",
                        r"\bасцендент\w*\b\s*(?:—|\-|:)|\bдесцендент\w*\b\s*(?:—|\-|:)",
                        r"\bсередина\s+неба\b\s*(?:—|\-|:)|\bимум\s+цели\b\s*(?:—|\-|:)",
                        r"\bвертекс\w*\b\s*(?:—|\-|:)",
                        r"\bоси\b\s*(?:—|\-|:)|\bось\b\s*(?:—|\-|:)",
                    ]
                ),
                _compile_many(
                    [
                        r"\bасцендент\w*\b|\bдесцендент\w*\b",
                        r"\basc\b|\bdsc\b|\bmc\b|\bic\b",
                        r"\bсередина\s+неба\b|\bимум\s+цели\b|\bвертекс\w*\b",
                        r"\bугол(?:а|ы|ов)?\b",
                        r"\bось\b|\bоси\b",
                    ]
                ),
            ),
            "aspects": (
                _compile_many(
                    [
                        r"\bаспект\w*\b\s*(?:—|\-|:)",
                        r"\b(соединени|оппозиц|квадрат|трин|секстил)\w*\b\s*(?:—|\-|:)",
                        r"\b0\s*°\b|\b60\s*°\b|\b90\s*°\b|\b120\s*°\b|\b180\s*°\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bаспект\w*\b",
                        r"\b(соединени|оппозиц|квадрат|трин|секстил)\w*\b",
                        r"\bорб(?:а|ы|е|ов)?\b",
                        r"\bрасходящ\w*\b|\bсходящ\w*\b",
                        r"\bаспектиру\w*\b",
                        r"\bв\s+карт[еа]\b(?=.*\bаспект\w*\b)",
                    ]
                ),
            ),
            "aspect_configs": (
                _compile_many(
                    [
                        r"\bконфигураци\w*\b\s*(?:—|\-|:)",
                        r"\bтау-?квадрат\b",
                        r"\bбольш(ой|ая)\s+трин\b",
                        r"\bбольш(ой|ая)\s+крест\b",
                        r"\bйод\b",
                        r"\bстеллиум\w*\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bконфигураци(я|и)\b",
                        r"\bфигура\w*\b",
                        r"\bпаттерн\w*\b",
                        r"\bстеллиум\w*\b",
                    ]
                ),
            ),
        }

    def _allowed(self, topic: str) -> bool:
        return (not self.include_topics) or (topic in self.include_topics)

    def classify(self, text: str) -> TopicGateResult:
        s = _norm(text)
        if not s:
            return TopicGateResult(
                accepted=False,
                topics=[],
                topic_scores={},
                strong_hit=False,
                total_score=0,
                threshold=self.threshold,
                profile=self.profile_name,
                reason="no_topic",
            )

        topics: List[str] = []
        scores: Dict[str, int] = {}
        strong_hit_any = False
        total = 0

        # Global natal boost (adds to total only)
        natal_hits = _count_hits(s, self._natal_context_weak)
        if natal_hits > 0 and self.natal_boost_cap > 0:
            total += min(self.natal_boost_cap, natal_hits)

        # Per-topic scoring
        for topic, (strong_res, weak_res) in self._topics.items():
            if not self._allowed(topic):
                continue

            strong_hits = _count_hits(s, strong_res)
            weak_hits = _count_hits(s, weak_res)

            sc = 0
            if strong_hits > 0:
                sc += 3
                strong_hit_any = True

            if weak_hits > 0:
                sc += min(self.weak_cap_per_topic, weak_hits)

            if sc > 0:
                topics.append(topic)
                scores[topic] = sc
                total += sc

        # Synergy: if chunk touches multiple topics, let it pass more often.
        if self.synergy_boost > 0:
            topic_count_with_signal = sum(1 for v in scores.values() if v >= 1)
            if topic_count_with_signal >= 2:
                total += self.synergy_boost

        accepted = bool(strong_hit_any or total >= self.threshold)
        if accepted:
            reason = "ok"
        else:
            reason = "no_topic" if not scores else "below_threshold"

        return TopicGateResult(
            accepted=accepted,
            topics=sorted(topics),
            topic_scores=scores,
            strong_hit=strong_hit_any,
            total_score=total,
            threshold=self.threshold,
            profile=self.profile_name,
            reason=reason,
        )

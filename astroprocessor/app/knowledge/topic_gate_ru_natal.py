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
    reason: str  # "ok" | "no_topic"


def _norm(s: str) -> str:
    s = (s or "").strip().lower()
    s = s.replace("ё", "е")
    return s


def _compile_many(patterns: List[str]) -> List[Pattern[str]]:
    return [re.compile(p, flags=re.IGNORECASE | re.MULTILINE) for p in patterns]


class NatalTopicGate:
    """
    Deterministic rule-based topic gate for ru natal knowledge.

    Scoring:
      - strong match => +3 per topic (capped)
      - weak match   => +1 per topic (capped)
    Accept if:
      - any strong hit, OR
      - total_score >= threshold
    """

    profile_name = "ru_natal_v1"

    def __init__(self, threshold: int = 3, include_topics: Optional[List[str]] = None) -> None:
        self.threshold = int(threshold or 3)
        self.include_topics = set([t.strip() for t in (include_topics or []) if t.strip()])

        self._topics: Dict[str, Tuple[List[Pattern[str]], List[Pattern[str]]]] = {
            # 1) Elements + integrals
            "elements_ip": (
                _compile_many(
                    [
                        r"\bстихи(я|и)\b",
                        r"\bогонь\b|\bземля\b|\bвоздух\b|\bвода\b",
                        r"\bинь\b|\bян\b",
                        r"\bкардинальн\w*\b|\bфиксированн\w*\b|\bмутабельн\w*\b",
                        r"\bбаланс\s+стихи\w*\b|\bбаланс\s+полярност\w*\b|\bбаланс\s+крест\w*\b",
                        r"\bдоминировани\w*\b|\bдефицит\w*\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bполярност\w*\b",
                        r"\bкачества\b|\bкрест(ы)?\b",
                        r"\bантагонист\w*\b",
                        r"\bкомбинаци\w*\s+стихи\w*\b",
                    ]
                ),
            ),
            # 2) Planets + points
            "planets": (
                _compile_many(
                    [
                        r"\bсолнце\b|\bлуна\b",
                        r"\bмеркури(й|я)\b|\bвенер(а|ы)\b|\bмарс(а)?\b",
                        r"\bюпитер\b|\bсатурн\b",
                        r"\bуран\b|\bнептун\b|\bплутон\b",
                        r"\bлилит\b",
                        r"\bсеверн\w*\s+узел\b|\bюжн\w*\s+узел\b|\bузл(ы|а)\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bпланет(а|ы)\b",
                        r"\bсветил(о|а)\b",
                        r"\bв\s+знак(е|ах)\b",
                        r"\bв\s+дом(е|ах)\b",
                    ]
                ),
            ),
            # 3) Signs
            "signs": (
                _compile_many(
                    [
                        r"\bовен\b|\bтелец\b|\bблизнец(ы|ов)\b|\bрак\b|\bлев\b|\bдева\b",
                        r"\bвесы\b|\bскорпион\b|\bстрелец\b|\bкозерог\b|\bводолей\b|\bрыбы\b",
                        r"\bзнак(и)?\s+зодиака\b",
                    ]
                ),
                _compile_many([r"\bзнак\b", r"\bв\s+знак(е|ах)\b"]),
            ),
            # 4) Houses + rulers
            "houses_rulers": (
                _compile_many(
                    [
                        r"\b[1-9]|1[0-2]\s*дом\b",
                        r"\bуправител(ь|я)\s+дома\b",
                        r"\bуправител(ь|я)\s+знак\w*\b",
                        r"\bкуспид\b|\bвершин(а|е)\s+дома\b",
                        r"\bположени(е|я)\s+управител\w*\b",
                        r"\bаспект(ы)?\s+управител\w*\b|\bуправител\w*\s+в\s+аспект\w*\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bдом(а|ов)\b",
                        r"\bв\s+дом(е|ах)\b",
                        r"\bуправител(ь|я)\b",
                    ]
                ),
            ),
            # 5) Angles/cusps/house space
            "angles_space": (
                _compile_many(
                    [
                        r"\basc\b|\bdsc\b|\bmc\b|\bic\b",
                        r"\bкуспид(ы)?\b|\bвершин(а|ы)\b",
                        r"\bначал(о|е)\s+дома\b|\bсередин(а|е)\s+дома\b|\bконец\s+дома\b",
                        r"\bнижн\w*\s+этаж\b|\bсредн\w*\s+этаж\b|\bверхн\w*\s+этаж\b",
                    ]
                ),
                _compile_many([r"\bугл(ы|а)\b", r"\bпространств\w*\s+дома\b"]),
            ),
            # 6) Aspects
            "aspects": (
                _compile_many(
                    [
                        r"\bаспект(ы)?\b",
                        r"\bсоединени(е|я)\b|\bоппозиц(ия|ии)\b|\bквадрат(ура)?\b|\bтрин\b|\bсекстил(ь|я)\b",
                        r"\bполусекстил(ь|я)\b|\bквинконс\b|\bполуквадратур(а|ы)\b|\bполутораквадратур(а|ы)\b",
                        r"\bквинтил(ь|я)\b|\bнонагон\w*\b",
                        r"\b0\s*°\b|\b30\s*°\b|\b45\s*°\b|\b60\s*°\b|\b90\s*°\b|\b120\s*°\b|\b135\s*°\b|\b150\s*°\b|\b180\s*°\b",
                    ]
                ),
                _compile_many(
                    [
                        r"\bмажорн\w*\b|\bминорн\w*\b",
                        r"\bгармоничн\w*\b|\bнапряженн\w*\b|\bнейтральн\w*\b",
                        r"\bпланет\w*\s*[↔-]\s*планет\w*\b",
                    ]
                ),
            ),
            # 7) Aspect configurations
            "aspect_configs": (
                _compile_many(
                    [
                        r"\bтау-?квадрат\b",
                        r"\bбольш(ой|ая)\s+трин\b",
                        r"\bбольш(ой|ая)\s+крест\b",
                        r"\bбисекстил(ь|я)\b",
                        r"\bдротик\b|\bсекир(а|ы)\b",
                        r"\bконверт\b|\bкосой\s+парус\b|\bбольш(ой|ая)\s+парус\b|\bтрапеци(я|и)\b",
                        r"\bконфигураци(я|и)\s+аспект\w*\b",
                    ]
                ),
                _compile_many([r"\bконфигураци(я|и)\b", r"\bфигура\b"]),
            ),
        }

    def _allowed(self, topic: str) -> bool:
        if not self.include_topics:
            return True
        return topic in self.include_topics

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
        strong_hit = False
        total = 0

        for topic, (strong_res, weak_res) in self._topics.items():
            if not self._allowed(topic):
                continue

            sc = 0
            if any(r.search(s) for r in strong_res):
                sc += 3
                strong_hit = True
            if any(r.search(s) for r in weak_res):
                sc += 1

            if sc > 0:
                topics.append(topic)
                scores[topic] = sc
                total += sc

        accepted = bool(strong_hit or total >= self.threshold)
        return TopicGateResult(
            accepted=accepted,
            topics=sorted(topics),
            topic_scores=scores,
            strong_hit=strong_hit,
            total_score=total,
            threshold=self.threshold,
            profile=self.profile_name,
            reason="ok" if accepted else "no_topic",
        )
TOPICS = {
  "elements_ip": {
    "strong": [
      r"\bстихи(?:я|и|й)\b",
      r"\b(огонь|земля|воздух|вода)\b",
      r"\b(кардинальн|фиксированн|мутабельн)\w*\b",
    ],
    "weak": [
      r"\bтемперамент\w*\b",
      r"\bкачества?\b",
    ],
  },

  "planets": {
    "strong": [
      r"\bпланет(?:а|ы|у|е|ой|ам|ах)\b",
      r"\b(солнце|луна)\b",
      r"\b(меркури|венер|марс|юпитер|сатурн|уран|нептун|плутон)\w*\b",
    ],
    "weak": [
      r"\bретроградн\w*\b",
      r"\bдиректн\w*\b",
      r"\bстационарн\w*\b",
    ],
  },

  "signs": {
    "strong": [
      r"\bзнак(?:а|и|е|ов|ам|ах)?\b",
      r"\b(овен|телец|близнец|рак|лев|дева|весы|скорпион|стрелец|козерог|водолей|рыб)\w*\b",
      r"\bзодиак\w*\b",
    ],
    "weak": [
      r"\bобитель\w*\b",
      r"\bизгнани\w*\b",
      r"\bпадени\w*\b",
      r"\bэкзальтац\w*\b",
    ],
  },

  "houses_rulers": {
    "strong": [
      r"\bдом(?:а|е|у|ом|ов|ам|ах)?\b",
      r"\bкуспид\w*\b",
      r"\bуправител\w*\b",
      r"\b(1|2|3|4|5|6|7|8|9|10|11|12)[-\s]?(?:й|ый|ой)?\s*дом\b",
    ],
    "weak": [
      r"\bсфера\w*\b",
      r"\bтема\s+дома\b",
    ],
  },

  "angles_space": {
    "strong": [
      r"\bасцендент\w*\b|\basc\b",
      r"\bдесцендент\w*\b|\bdsc\b",
      r"\bмс\b|\bmc\b|\bсередина\s+неба\b",
      r"\bic\b|\bимум\s+цели\b",
      r"\bвертекс\w*\b",
      r"\bоси\b|\bось\b",
    ],
    "weak": [
      r"\bугол(?:а|ы|ов)?\b",
      r"\bось\s+(?:asc|dsc|mc|ic)\b",
    ],
  },

  "aspects": {
    "strong": [
      r"\bаспект\w*\b",
      r"\b(соединени|оппозиц|квадрат|трин|секстил)\w*\b",
    ],
    "weak": [
      r"\bорб(?:а|ы|е|ов)?\b",
      r"\bрасходящ\w*\b|\bсходящ\w*\b",
    ],
  },

  "aspect_configs": {
    "strong": [
      r"\bконфигурац\w*\b",
      r"\b(тау[-\s]?квадрат|бисекстил|больш(?:ой|ая)\s+трин|йод|кит(?:а|ы))\b",
    ],
    "weak": [
      r"\bфигура\w*\b",
      r"\bпаттерн\w*\b",
    ],
  },
}
STRONG_KEYWORDS = [
  # angles_space
  r"\bасцендент\w*\b|\basc\b",
  r"\bдесцендент\w*\b|\bdsc\b",
  r"\bмс\b|\bmc\b|\bic\b|\bимум\s+цели\b",
  r"\bсередина\s+неба\b|\bвертекс\w*\b",

  # houses_rulers
  r"\bкуспид\w*\b",
  r"\bуправител\w*\b",
  r"\b(1|2|3|4|5|6|7|8|9|10|11|12)[-\s]?(?:й|ый|ой)?\s*дом\b",

  # aspects / configs
  r"\bаспект\w*\b",
  r"\b(соединени|оппозиц|квадрат|трин|секстил)\w*\b",
  r"\bтау[-\s]?квадрат\b|\bбольш(?:ой|ая)\s+трин\b|\bйод\b|\bбисекстил\b",

  # planets / signs / elements
  r"\bпланет(?:а|ы|у|е|ой|ам|ах)\b",
  r"\bзнак(?:а|и|е|ов|ам|ах)?\b",
  r"\bзодиак\w*\b",
  r"\bстихи(?:я|и|й)\b",
]

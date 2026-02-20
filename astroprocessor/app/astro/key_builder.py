from __future__ import annotations
import profile
import re
"""
Topic-aware natal knowledge key generation.

Design goals:
- Keys are a "specificity ladder": more specific -> more generic.
- Keys are built per topic_category (topic-aware) to avoid "natal.generic for everything".
- KnowledgeRepo already filters by topic_category; therefore the same key can exist in
  multiple topics with different texts.
- Each topic starts with a topic-generic fallback key: natal.<topic>.generic
  and ends with natal.generic (global fallback).
"""

from dataclasses import dataclass
from typing import Any, Dict, Iterable, List, Optional, Sequence, Tuple

# --- strict vocab / slugs ---

PLANETS: set[str] = {
    "sun",
    "moon",
    "mercury",
    "venus",
    "mars",
    "jupiter",
    "saturn",
    "uranus",
    "neptune",
    "pluto",
    "lilith",
    "north_node",
    "south_node",
}

SIGNS: set[str] = {
    "aries",
    "taurus",
    "gemini",
    "cancer",
    "leo",
    "virgo",
    "libra",
    "scorpio",
    "sagittarius",
    "capricorn",
    "aquarius",
    "pisces",
}

ANGLES: set[str] = {"asc", "mc", "dsc", "ic"}

ASPECTS: set[str] = {
    "conjunction",
    "sextile",
    "square",
    "trine",
    "opposition",
    # minor (supported if present in data)
    "semisextile",
    "quincunx",
    "semisquare",
    "sesquisquare",
    "quintile",
    "biquintile",
}

ASPECT_CONFIGS: set[str] = {
    "grand_trine",
    "t_square",
    "grand_cross",
    "kite",
    "yod",
    "trapezoid",
    "mystic_rectangle",
    "grand_sextile",
}

ELEMENTS: set[str] = {"fire", "earth", "air", "water"}
POLARITY: set[str] = {"yin", "yang", "balanced"}
MODALITY: set[str] = {"cardinal", "fixed", "mutable", "balanced"}

TOPIC_CATEGORIES: set[str] = {
    "personality_core",
    "psychology",
    "talents",
    "strengths_weaknesses",
    "purpose_path",
    "career",
    "money",
    "love_intimacy",
    "partnership_marriage",
    "karmic_tasks",
    "past_lives_symbolic",
    "emotional_world",
    "how_others_see_me",
    "self_esteem",
    "creativity",
    "ancestral_topics",
}

SIGN_ALIASES: dict[str, str] = {
    # ru
    "овен": "aries",
    "телец": "taurus",
    "близнецы": "gemini",
    "рак": "cancer",
    "лев": "leo",
    "дева": "virgo",
    "весы": "libra",
    "скорпион": "scorpio",
    "стрелец": "sagittarius",
    "козерог": "capricorn",
    "водолей": "aquarius",
    "рыбы": "pisces",
    # en common variants
    "ar": "aries",
    "ta": "taurus",
    "ge": "gemini",
    "cn": "cancer",
    "le": "leo",
    "vi": "virgo",
    "li": "libra",
    "sc": "scorpio",
    "sa": "sagittarius",
    "cp": "capricorn",
    "aq": "aquarius",
    "pi": "pisces",
}

PLANET_ALIASES: dict[str, str] = {
    "true_node": "north_node",
    "mean_node": "north_node",
    "northnode": "north_node",
    "southnode": "south_node",
    "ascendingnode": "north_node",
    "descendingnode": "south_node",
    "nnode": "north_node",
    "snode": "south_node",
}

_ASPECT_ALIASES: dict[str, str] = {
    "conj": "conjunction",
    "opp": "opposition",
    "sext": "sextile",
    "tri": "trine",
    "sq": "square",
}

_SIGN_TOKEN_RE = re.compile(r"[a-zA-Zа-яА-Я]+", re.UNICODE)


def _norm_sign(value: Any) -> str:
    s = _norm_token(value)
    if not s:
        return ""

    # take first alphabetic token (handles: "Leo ♌", "LEO", "Лев", "leo-sign", etc.)
    m = _SIGN_TOKEN_RE.search(s)
    if not m:
        return ""

    tok = m.group(0).lower().strip()
    tok = SIGN_ALIASES.get(tok, tok)

    return tok if tok in SIGNS else ""


def _norm_planet(value: Any) -> str:
    s = _norm_token(value).replace(" ", "_").replace("-", "_")
    if not s:
        return ""
    s = PLANET_ALIASES.get(s, s)
    return s if s in PLANETS else ""


def _norm_aspect(value: Any) -> str:
    s = _norm_token(value)
    if not s:
        return ""
    m = _SIGN_TOKEN_RE.search(s)  # same “letters only” trick
    tok = (m.group(0).lower().strip() if m else s)
    tok = _ASPECT_ALIASES.get(tok, tok)
    return tok if tok in ASPECTS else ""

class KeyBuilderError(ValueError):
    pass


@dataclass(frozen=True)
class KeyBlock:
    """
    One semantic block to retrieve a KB fragment for (e.g.) Sun core, MC, House10 ruler, etc.

    candidate_keys are ordered from most specific to most generic.
    """

    id: str
    candidate_keys: List[str]
    meta: Dict[str, Any]


@dataclass(frozen=True)
class TopicProfile:
    topic: str
    focus_planets: Tuple[str, ...]
    focus_angles: Tuple[str, ...]
    focus_houses: Tuple[int, ...]
    include_integrals: bool
    include_aspects: bool
    include_aspect_configs: bool


# Traditional rulers (with a "modern alt" where applicable).
# We emit keys for both primary and alt where present.
SIGN_RULERS: dict[str, Tuple[str, Optional[str]]] = {
    "aries": ("mars", None),
    "taurus": ("venus", None),
    "gemini": ("mercury", None),
    "cancer": ("moon", None),
    "leo": ("sun", None),
    "virgo": ("mercury", None),
    "libra": ("venus", None),
    "scorpio": ("mars", "pluto"),
    "sagittarius": ("jupiter", None),
    "capricorn": ("saturn", None),
    "aquarius": ("saturn", "uranus"),
    "pisces": ("jupiter", "neptune"),
}

# --- sign attributes (for element/polarity/modality keys) ---

SIGN_TO_ELEMENT: dict[str, str] = {
    "aries": "fire", "leo": "fire", "sagittarius": "fire",
    "taurus": "earth", "virgo": "earth", "capricorn": "earth",
    "gemini": "air", "libra": "air", "aquarius": "air",
    "cancer": "water", "scorpio": "water", "pisces": "water",
}

SIGN_TO_POLARITY: dict[str, str] = {
    "aries": "yang", "taurus": "yin", "gemini": "yang", "cancer": "yin",
    "leo": "yang", "virgo": "yin", "libra": "yang", "scorpio": "yin",
    "sagittarius": "yang", "capricorn": "yin", "aquarius": "yang", "pisces": "yin",
}

SIGN_TO_MODALITY: dict[str, str] = {
    "aries": "cardinal", "cancer": "cardinal", "libra": "cardinal", "capricorn": "cardinal",
    "taurus": "fixed", "leo": "fixed", "scorpio": "fixed", "aquarius": "fixed",
    "gemini": "mutable", "virgo": "mutable", "sagittarius": "mutable", "pisces": "mutable",
}


def _house_group(h: int) -> str:
    # angular: 1/4/7/10; succedent: 2/5/8/11; cadent: 3/6/9/12
    if h in (1, 4, 7, 10):
        return "angular"
    if h in (2, 5, 8, 11):
        return "succedent"
    return "cadent"


def _house_floor(h: int) -> str:
    # lower: 1-4; middle: 5-8; upper: 9-12
    if 1 <= h <= 4:
        return "lower"
    if 5 <= h <= 8:
        return "middle"
    return "upper"


def _aspect_class(aspect: str) -> str:
    # simple classifier (good enough for key ladders)
    if aspect in {"trine", "sextile"}:
        return "harmonic"
    if aspect in {"square", "opposition"}:
        return "tense"
    return "neutral"


# Topic mapping per agreed plan (maximal but safe if data is missing).
TOPIC_PROFILES: dict[str, TopicProfile] = {
    "personality_core": TopicProfile(
        topic="personality_core",
        focus_planets=("sun", "moon", "mercury", "venus", "mars"),
        focus_angles=("asc",),
        focus_houses=(1,),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "psychology": TopicProfile(
        topic="psychology",
        focus_planets=("moon", "neptune", "pluto"),
        focus_angles=("ic",),
        focus_houses=(4, 8, 12),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "talents": TopicProfile(
        topic="talents",
        focus_planets=("mercury", "uranus", "jupiter", "venus"),
        focus_angles=(),
        focus_houses=(3, 5, 9, 11),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "strengths_weaknesses": TopicProfile(
        topic="strengths_weaknesses",
        focus_planets=("sun", "moon", "mars", "saturn"),
        focus_angles=("asc", "mc"),
        focus_houses=(1, 6, 10, 12),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "purpose_path": TopicProfile(
        topic="purpose_path",
        focus_planets=("north_node", "saturn", "jupiter"),
        focus_angles=("mc",),
        focus_houses=(9, 10, 12),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "career": TopicProfile(
        topic="career",
        focus_planets=("saturn", "jupiter", "sun"),
        focus_angles=("mc",),
        focus_houses=(10, 6, 2, 11),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),

    "money": TopicProfile(
        topic="money",
        focus_planets=("venus", "jupiter", "saturn"),
        focus_angles=(),
        focus_houses=(2, 8, 11),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),

    "love_intimacy": TopicProfile(
        topic="love_intimacy",
        focus_planets=("venus", "mars", "moon"),
        focus_angles=("dsc",),
        focus_houses=(5, 7, 8),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),

    "partnership_marriage": TopicProfile(
        topic="partnership_marriage",
        focus_planets=("venus", "saturn"),
        focus_angles=("dsc",),
        focus_houses=(7,),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "karmic_tasks": TopicProfile(
        topic="karmic_tasks",
        focus_planets=("south_node", "saturn", "lilith"),
        focus_angles=(),
        focus_houses=(8, 12),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "past_lives_symbolic": TopicProfile(
        topic="past_lives_symbolic",
        focus_planets=("south_node", "saturn", "lilith"),
        focus_angles=(),
        focus_houses=(12, 8),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "emotional_world": TopicProfile(
        topic="emotional_world",
        focus_planets=("moon",),
        focus_angles=("ic",),
        focus_houses=(4,),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "how_others_see_me": TopicProfile(
        topic="how_others_see_me",
        focus_planets=("sun", "moon", "venus", "mars"),
        focus_angles=("asc",),
        focus_houses=(1,),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "self_esteem": TopicProfile(
        topic="self_esteem",
        focus_planets=("sun", "saturn"),
        focus_angles=("asc",),
        focus_houses=(2, 1),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "creativity": TopicProfile(
        topic="creativity",
        focus_planets=("venus", "neptune", "sun"),
        focus_angles=(),
        focus_houses=(5,),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "ancestral_topics": TopicProfile(
        topic="ancestral_topics",
        focus_planets=("moon", "saturn"),
        focus_angles=("ic",),
        focus_houses=(4,),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
}

# --- helpers to normalize various natal_data shapes (dicts, pydantic, objects) ---

def _as_dict(x: Any) -> dict[str, Any]:
    """
    Accept dict-like, pydantic models, dataclasses, simple objects.
    Returns {} if cannot convert.
    """
    if x is None:
        return {}
    if isinstance(x, dict):
        return x
    # pydantic v2
    md = getattr(x, "model_dump", None)
    if callable(md):
        try:
            v = md()
            return v if isinstance(v, dict) else {}
        except Exception:
            return {}
    # pydantic v1
    dct = getattr(x, "dict", None)
    if callable(dct):
        try:
            v = dct()
            return v if isinstance(v, dict) else {}
        except Exception:
            return {}
    # plain objects
    try:
        v = vars(x)
        return v if isinstance(v, dict) else {}
    except Exception:
        return {}


def _pick(*vals: Any) -> Any:
    for v in vals:
        if v is None:
            continue
        if isinstance(v, str) and not v.strip():
            continue
        return v
    return None


def _norm_sign(value: Any) -> str:
    """
    Supports:
      - "leo"
      - {"key":"leo"} / {"id":"leo"} / {"sign":"leo"}
      - objects with .key/.id/.sign
    """
    if value is None:
        return ""
    if isinstance(value, str):
        return _norm_token(value)
    if isinstance(value, dict):
        return _norm_token(_pick(value.get("key"), value.get("id"), value.get("sign"), value.get("sign_key"), value.get("name")))
    # object
    dv = _as_dict(value)
    if dv:
        return _norm_sign(dv)
    return ""


def _norm_house_value(value: Any) -> Optional[int]:
    """
    Supports:
      - 10
      - "10"
      - {"number":10} / {"house":10}
      - objects with .number/.house
    """
    if value is None or value == "":
        return None
    if isinstance(value, dict):
        value = _pick(value.get("house"), value.get("number"), value.get("house_number"))
    else:
        dv = _as_dict(value)
        if dv:
            value = _pick(dv.get("house"), dv.get("number"), dv.get("house_number"))
    try:
        return _norm_house(value)
    except Exception:
        return None


def _norm_token(x: Any) -> str:
    if x is None:
        return ""
    return str(x).strip().lower()


def _require_in_set(name: str, value: str, allowed: set[str]) -> str:
    if value not in allowed:
        raise KeyBuilderError(f"Invalid {name}: '{value}'. Allowed: {sorted(allowed)}")
    return value


def _norm_house(h: Any) -> Optional[int]:
    if h is None or h == "":
        return None
    try:
        hi = int(h)
    except Exception as e:
        raise KeyBuilderError(f"Invalid house: '{h}'") from e
    if not (1 <= hi <= 12):
        raise KeyBuilderError(f"House out of range: {hi}")
    return hi


def _dedup_keep_order(items: Iterable[str]) -> list[str]:
    seen: set[str] = set()
    out: list[str] = []
    for x in items:
        if not x or x in seen:
            continue
        seen.add(x)
        out.append(x)
    return out


def _topic_generic_key(*, tone_namespace: str, topic_category: str) -> str:
    return f"{tone_namespace}.{topic_category}.generic"


def _global_generic_key(*, tone_namespace: str) -> str:
    return f"{tone_namespace}.generic"


def _planet_sign_block(
    *,
    planet: str,
    sign: str,
    house: Optional[int],
    unknown_time: bool,
    tone_namespace: str,
) -> KeyBlock:
    el = SIGN_TO_ELEMENT.get(sign, "")
    pol = SIGN_TO_POLARITY.get(sign, "")
    mod = SIGN_TO_MODALITY.get(sign, "")

    keys: list[str] = []

    # most specific: planet+sign(+house)
    base = f"{tone_namespace}.planet.{planet}.sign.{sign}"
    if (not unknown_time) and house is not None:
        keys.append(f"{base}.house.{house}")
        keys.append(f"{base}.house.any")
        keys.append(f"{tone_namespace}.planet.{planet}.house.{house}")
        keys.append(f"{tone_namespace}.planet.{planet}.house.any")

        keys.append(f"{tone_namespace}.planet.{planet}.house.{house}.group.{_house_group(house)}")
        keys.append(f"{tone_namespace}.planet.{planet}.house.{house}.floor.{_house_floor(house)}")

    # sign-derived attributes
    if el:
        keys.append(f"{tone_namespace}.planet.{planet}.element.{el}")
        keys.append(f"{tone_namespace}.planet.any.element.{el}")
    if pol:
        keys.append(f"{tone_namespace}.planet.{planet}.polarity.{pol}")
        keys.append(f"{tone_namespace}.planet.any.polarity.{pol}")
    if mod:
        keys.append(f"{tone_namespace}.planet.{planet}.modality.{mod}")
        keys.append(f"{tone_namespace}.planet.any.modality.{mod}")

    # planet+sign (less specific)
    keys.append(base)
    keys.append(f"{tone_namespace}.planet.{planet}.sign.any")
    keys.append(f"{tone_namespace}.planet.{planet}")

    return KeyBlock(
        id=f"planet:{planet}",
        candidate_keys=_dedup_keep_order(keys),
        meta={"planet": planet, "sign": sign, "house": house, "unknown_time": unknown_time},
    )



def _angle_block(*, angle: str, sign: str, tone_namespace: str) -> KeyBlock:
    el = SIGN_TO_ELEMENT.get(sign, "")
    pol = SIGN_TO_POLARITY.get(sign, "")
    mod = SIGN_TO_MODALITY.get(sign, "")

    keys: list[str] = []
    keys.append(f"{tone_namespace}.angle.{angle}.sign.{sign}")

    if el:
        keys.append(f"{tone_namespace}.angle.{angle}.element.{el}")
        keys.append(f"{tone_namespace}.angle.any.element.{el}")
    if pol:
        keys.append(f"{tone_namespace}.angle.{angle}.polarity.{pol}")
        keys.append(f"{tone_namespace}.angle.any.polarity.{pol}")
    if mod:
        keys.append(f"{tone_namespace}.angle.{angle}.modality.{mod}")
        keys.append(f"{tone_namespace}.angle.any.modality.{mod}")

    keys.append(f"{tone_namespace}.angle.{angle}.sign.any")
    keys.append(f"{tone_namespace}.angle.{angle}")
    keys.append(f"{tone_namespace}.angle")

    return KeyBlock(id=f"angle:{angle}", candidate_keys=_dedup_keep_order(keys), meta={"angle": angle, "sign": sign})



def _aspect_block(*, a: str, aspect: str, b: str, tone_namespace: str) -> KeyBlock:
    left, right = sorted([a, b])
    cls = _aspect_class(aspect)
    base = f"{tone_namespace}.aspect.{left}.{aspect}.{right}"

    keys = [
        base,
        f"{tone_namespace}.aspect.{left}.{aspect}.any",
        f"{tone_namespace}.aspect.any.{aspect}.{right}",
        f"{tone_namespace}.aspect.{left}.any.{right}",
        f"{tone_namespace}.aspect.class.{cls}",
        f"{tone_namespace}.aspect.any.{aspect}.any",
        f"{tone_namespace}.aspect",
    ]
    return KeyBlock(
        id=f"aspect:{left}:{aspect}:{right}",
        candidate_keys=_dedup_keep_order(keys),
        meta={"a": left, "aspect": aspect, "b": right, "class": cls},
    )



def _aspect_config_block(*, cfg: str, tone_namespace: str) -> KeyBlock:
    base = f"{tone_namespace}.aspect_config.{cfg}"
    keys = [base, f"{tone_namespace}.aspect_config.any", f"{tone_namespace}.aspect_config"]
    return KeyBlock(id=f"aspect_config:{cfg}", candidate_keys=_dedup_keep_order(keys), meta={"config": cfg})


def _elements_integrals_blocks(natal_data: dict[str, Any], *, tone_namespace: str) -> list[KeyBlock]:
    """
    If natal_data has precomputed integrals -> use them.
    Else compute a light-weight version from planets' signs to emit stable keys.

    Goal: make early blocks rich in candidate_keys so debug_runtime shows growth (50-150 for career).
    """
    out: list[KeyBlock] = []

    integrals = natal_data.get("integrals") or natal_data.get("ip") or {}
    if isinstance(integrals, dict) and isinstance(integrals.get("elements"), dict):
        # keep existing behavior (compat)
        elements = integrals.get("elements") or {}
        for el, v in elements.items():
            e = _norm_token(el)
            if e not in ELEMENTS or not isinstance(v, dict):
                continue
            level = _norm_token(v.get("level"))
            if level in {"low", "mid", "high"}:
                out.append(
                    KeyBlock(
                        id=f"elements:{e}:level",
                        candidate_keys=[
                            f"{tone_namespace}.elements.{e}.level.{level}",
                            f"{tone_namespace}.elements.{e}.level.any",
                            f"{tone_namespace}.elements.{e}",
                            f"{tone_namespace}.elements",
                        ],
                        meta={"element": e, "level": level},
                    )
                )
            if bool(v.get("dominant")):
                out.append(
                    KeyBlock(
                        id=f"elements:{e}:dominant",
                        candidate_keys=[
                            f"{tone_namespace}.elements.{e}.dominant",
                            f"{tone_namespace}.elements.{e}",
                            f"{tone_namespace}.elements",
                        ],
                        meta={"element": e, "dominant": True},
                    )
                )
            if bool(v.get("deficit")):
                out.append(
                    KeyBlock(
                        id=f"elements:{e}:deficit",
                        candidate_keys=[
                            f"{tone_namespace}.elements.{e}.deficit",
                            f"{tone_namespace}.elements.{e}",
                            f"{tone_namespace}.elements",
                        ],
                        meta={"element": e, "deficit": True},
                    )
                )

        polarity = integrals.get("polarity") or {}
        if isinstance(polarity, dict):
            bal = _norm_token(polarity.get("balance"))
            if bal in POLARITY:
                out.append(
                    KeyBlock(
                        id="polarity:balance",
                        candidate_keys=[
                            f"{tone_namespace}.polarity.balance.{bal}",
                            f"{tone_namespace}.polarity.balance.any",
                            f"{tone_namespace}.polarity",
                        ],
                        meta={"balance": bal},
                    )
                )

        modality = integrals.get("modality") or {}
        if isinstance(modality, dict):
            bal = _norm_token(modality.get("balance"))
            if bal in MODALITY:
                out.append(
                    KeyBlock(
                        id="modality:balance",
                        candidate_keys=[
                            f"{tone_namespace}.modality.balance.{bal}",
                            f"{tone_namespace}.modality.balance.any",
                            f"{tone_namespace}.modality",
                        ],
                        meta={"balance": bal},
                    )
                )

        return out

    # --- computed integrals (fallback) ---
    planets = _extract_planets(natal_data)
    element_counts = {"fire": 0, "earth": 0, "air": 0, "water": 0}
    pol_counts = {"yin": 0, "yang": 0}
    mod_counts = {"cardinal": 0, "fixed": 0, "mutable": 0}

    for p, v in planets.items():
        sign = _norm_token((v or {}).get("sign"))
        if sign not in SIGNS:
            continue
        el = SIGN_TO_ELEMENT.get(sign)
        pol = SIGN_TO_POLARITY.get(sign)
        mod = SIGN_TO_MODALITY.get(sign)
        if el:
            element_counts[el] += 1
        if pol:
            pol_counts[pol] += 1
        if mod:
            mod_counts[mod] += 1

    # buckets (0,1,2,3,4+)
    def bucket(n: int) -> str:
        return "4p" if n >= 4 else str(max(0, int(n)))

    # dominant/deficient for elements (if any)
    if sum(element_counts.values()) > 0:
        max_el = max(element_counts, key=lambda k: element_counts[k])
        min_el = min(element_counts, key=lambda k: element_counts[k])

        for el, n in element_counts.items():
            out.append(
                KeyBlock(
                    id=f"elements:{el}:count",
                    candidate_keys=[
                        f"{tone_namespace}.elements.{el}.count.{bucket(n)}",
                        f"{tone_namespace}.elements.{el}.count.any",
                        f"{tone_namespace}.elements.{el}",
                        f"{tone_namespace}.elements",
                    ],
                    meta={"element": el, "count": n},
                )
            )

        out.append(
            KeyBlock(
                id="elements:dominant",
                candidate_keys=[
                    f"{tone_namespace}.elements.dominant.{max_el}",
                    f"{tone_namespace}.elements.dominant.any",
                    f"{tone_namespace}.elements",
                ],
                meta={"dominant": max_el},
            )
        )
        out.append(
            KeyBlock(
                id="elements:deficient",
                candidate_keys=[
                    f"{tone_namespace}.elements.deficient.{min_el}",
                    f"{tone_namespace}.elements.deficient.any",
                    f"{tone_namespace}.elements",
                ],
                meta={"deficient": min_el},
            )
        )

    # polarity balance
    if (pol_counts["yin"] + pol_counts["yang"]) > 0:
        if pol_counts["yin"] == pol_counts["yang"]:
            bal = "balanced"
        else:
            bal = "yin" if pol_counts["yin"] > pol_counts["yang"] else "yang"
        out.append(
            KeyBlock(
                id="polarity:balance",
                candidate_keys=[
                    f"{tone_namespace}.polarity.balance.{bal}",
                    f"{tone_namespace}.polarity.balance.any",
                    f"{tone_namespace}.polarity",
                ],
                meta={"balance": bal, "yin": pol_counts["yin"], "yang": pol_counts["yang"]},
            )
        )

    # modality balance
    if sum(mod_counts.values()) > 0:
        max_mod = max(mod_counts, key=lambda k: mod_counts[k])
        out.append(
            KeyBlock(
                id="modality:dominant",
                candidate_keys=[
                    f"{tone_namespace}.modality.dominant.{max_mod}",
                    f"{tone_namespace}.modality.dominant.any",
                    f"{tone_namespace}.modality",
                ],
                meta={"dominant": max_mod, **mod_counts},
            )
        )

    return out

def _norm_sign_value(v: Any) -> str:
    # supports: "leo", {"sign":"leo"}, {"key":"leo"}, {"name":"Leo"}, {"value":"leo"}
    if v is None:
        return ""
    if isinstance(v, str):
        return _norm_token(v)
    if isinstance(v, dict):
        return _norm_token(v.get("sign") or v.get("key") or v.get("name") or v.get("value"))
    return _norm_token(v)

def _norm_house_value(v: Any) -> Optional[int]:
    # supports: 10, "10", {"house":10}, {"number":10}, {"id":10}
    if v is None or v == "":
        return None
    if isinstance(v, dict):
        v = v.get("house") or v.get("number") or v.get("id")
    return _norm_house(v)


def _extract_planets(natal_data: dict[str, Any]) -> dict[str, dict[str, Any]]:
    """
    Normalize planet structures to:
      {"sun": {"sign":"leo","house":1}, ...}

    Supports:
      - dict: {"sun": {"sign":"leo","house":1}, ...}
      - dict with nested sign objects: {"sun": {"sign":{"key":"leo"}, "house":{"number":1}}, ...}
      - list: [{"name":"Sun","sign":"Leo","house":1}, ...]
      - list of pydantic/objects
    """
    planets_raw = (
        natal_data.get("planets")
        or natal_data.get("points")
        or natal_data.get("bodies")
        or natal_data.get("objects")
        or {}
    )
    out: dict[str, dict[str, Any]] = {}

    items: list[tuple[Any, Any]] = []
    if isinstance(planets_raw, dict):
        items = list(planets_raw.items())
    elif isinstance(planets_raw, list):
        for it in planets_raw:
            d = _as_dict(it) if not isinstance(it, dict) else it
            if not isinstance(d, dict):
                continue
            name = _pick(d.get("name"), d.get("planet"), d.get("id"), d.get("key"))
            items.append((name, d))
    else:
        # maybe object with .items()
        d = _as_dict(planets_raw)
        if isinstance(d, dict):
            items = list(d.items())

    for k, v in items:
        p = _norm_token(k)
        if p not in PLANETS:
            # sometimes keys are "Sun" etc.
            p2 = _norm_token(str(k))
            if p2 in PLANETS:
                p = p2
            else:
                continue

        vd = v if isinstance(v, dict) else _as_dict(v)
        if not isinstance(vd, dict):
            continue

        sign = _norm_sign(_pick(vd.get("sign"), vd.get("sign_key"), vd.get("zodiac_sign"), vd.get("signInfo")))
        if sign and sign not in SIGNS:
            # try strict validation
            try:
                sign = _require_in_set("sign", sign, SIGNS)
            except Exception:
                continue

        house_i = _norm_house_value(_pick(vd.get("house"), vd.get("house_number"), vd.get("houseInfo")))

        if not sign:
            # without sign this planet is not useful for keygen
            continue

        out[p] = {"sign": sign, "house": house_i}

    return out




def _extract_angles(natal_data: dict[str, Any]) -> dict[str, str]:
    """
    Normalize angles to: {"asc":"leo","mc":"taurus", ...}

    Supports:
      - {"asc":"leo","mc":"taurus"}
      - {"asc":{"sign":"leo"}, "mc":{"sign":{"key":"taurus"}}}
      - {"ascendant":..., "midheaven":...}
      - objects/pydantic
    """
    angles_raw = natal_data.get("angles") or natal_data.get("axes") or natal_data.get("angle_points") or {}
    out: dict[str, str] = {}

    d = angles_raw if isinstance(angles_raw, dict) else _as_dict(angles_raw)
    if not isinstance(d, dict):
        return out

    for k, v in d.items():
        ak = _norm_token(k)
        if ak in {"asc", "ascendant"}:
            a = "asc"
        elif ak in {"mc", "midheaven"}:
            a = "mc"
        elif ak in {"dsc", "dc", "desc", "descendant"}:
            a = "dsc"
        elif ak in {"ic"}:
            a = "ic"
        else:
            continue

        if isinstance(v, dict):
            sign = _norm_sign(_pick(v.get("sign"), v.get("sign_key"), v.get("key"), v.get("id")))
        else:
            vd = _as_dict(v)
            if vd:
                sign = _norm_sign(_pick(vd.get("sign"), vd.get("sign_key"), vd.get("key"), vd.get("id")))
            else:
                sign = _norm_sign(v)

        if not sign:
            continue
        if sign not in SIGNS:
            try:
                sign = _require_in_set("sign", sign, SIGNS)
            except Exception:
                continue

        out[a] = sign

    return out



def _extract_houses_cusps(natal_data: dict[str, Any]) -> dict[int, str]:
    """
    Normalize house cusp signs to: {1:"leo", 2:"virgo", ...}

    Supports:
      - {"1":{"sign":"leo"}, "2":{"sign":{"key":"virgo"}}, ...}
      - [{"house":1,"sign":"leo"}, ...]
      - {"houses":[...]} (nested)
      - objects/pydantic
    """
    houses_raw = natal_data.get("houses") or natal_data.get("house_cusps") or natal_data.get("cusps") or {}
    out: dict[int, str] = {}

    # tolerate nested {"houses": {...}} or {"houses":[...]}
    if isinstance(houses_raw, dict) and "houses" in houses_raw and len(houses_raw) == 1:
        houses_raw = houses_raw.get("houses")

    items: list[tuple[Any, Any]] = []
    if isinstance(houses_raw, dict):
        items = list(houses_raw.items())
    elif isinstance(houses_raw, list):
        for it in houses_raw:
            d = it if isinstance(it, dict) else _as_dict(it)
            if not isinstance(d, dict):
                continue
            hk = _pick(d.get("house"), d.get("number"), d.get("id"))
            items.append((hk, d))
    else:
        d = _as_dict(houses_raw)
        if isinstance(d, dict):
            items = list(d.items())

    for k, v in items:
        h = _norm_house_value(k)
        if h is None:
            # some dict forms use string keys
            try:
                h = _norm_house(k)
            except Exception:
                continue

        vd = v if isinstance(v, dict) else _as_dict(v)
        if not isinstance(vd, dict):
            continue

        sign = _norm_sign(_pick(vd.get("sign"), vd.get("sign_key"), vd.get("cusp_sign"), vd.get("key"), vd.get("id")))
        if not sign:
            continue
        if sign not in SIGNS:
            try:
                sign = _require_in_set("sign", sign, SIGNS)
            except Exception:
                continue

        out[h] = sign

    return out




def _house_cusp_block(*, house: int, cusp_sign: str, tone_namespace: str) -> KeyBlock:
    el = SIGN_TO_ELEMENT.get(cusp_sign, "")
    pol = SIGN_TO_POLARITY.get(cusp_sign, "")
    mod = SIGN_TO_MODALITY.get(cusp_sign, "")

    keys: list[str] = []
    keys.append(f"{tone_namespace}.house.{house}.cusp.sign.{cusp_sign}")

    if el:
        keys.append(f"{tone_namespace}.house.{house}.cusp.element.{el}")
        keys.append(f"{tone_namespace}.house.any.cusp.element.{el}")
    if pol:
        keys.append(f"{tone_namespace}.house.{house}.cusp.polarity.{pol}")
        keys.append(f"{tone_namespace}.house.any.cusp.polarity.{pol}")
    if mod:
        keys.append(f"{tone_namespace}.house.{house}.cusp.modality.{mod}")
        keys.append(f"{tone_namespace}.house.any.cusp.modality.{mod}")

    keys.append(f"{tone_namespace}.house.{house}.group.{_house_group(house)}")
    keys.append(f"{tone_namespace}.house.{house}.floor.{_house_floor(house)}")

    keys.append(f"{tone_namespace}.house.{house}.cusp.sign.any")
    keys.append(f"{tone_namespace}.house.{house}.cusp")
    keys.append(f"{tone_namespace}.house.{house}")
    keys.append(f"{tone_namespace}.house")

    return KeyBlock(id=f"house:{house}:cusp", candidate_keys=_dedup_keep_order(keys), meta={"house": house, "cusp_sign": cusp_sign})



def _house_ruler_blocks(
    *,
    house: int,
    cusp_sign: str,
    planets: dict[str, dict[str, Any]],
    tone_namespace: str,
    unknown_time: bool,
) -> list[KeyBlock]:
    primary, alt = SIGN_RULERS.get(cusp_sign, (None, None))
    rulers = [r for r in (primary, alt) if r]
    out: list[KeyBlock] = []

    for r in rulers:
        if r not in PLANETS:
            continue

        # ruler identity ladder
        keys = [
            f"{tone_namespace}.house.{house}.ruler.{r}",
            f"{tone_namespace}.house.{house}.ruler.any",
            f"{tone_namespace}.house.{house}.ruler",
            f"{tone_namespace}.house.ruler.{r}",  # cross-topic generic
            f"{tone_namespace}.house.ruler.any",
        ]
        out.append(
            KeyBlock(
                id=f"house:{house}:ruler:{r}",
                candidate_keys=_dedup_keep_order(keys),
                meta={"house": house, "ruler": r, "cusp_sign": cusp_sign},
            )
        )

        # ruler position ladder (sign/house + derived attrs)
        rp = planets.get(r) or {}
        rs = _norm_token(rp.get("sign"))
        rh = rp.get("house")
        rh_i = rh if isinstance(rh, int) else _norm_house(rh) if rh is not None else None

        pos_keys: list[str] = []
        if rs in SIGNS:
            pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.sign.{rs}")
            el = SIGN_TO_ELEMENT.get(rs, "")
            pol = SIGN_TO_POLARITY.get(rs, "")
            mod = SIGN_TO_MODALITY.get(rs, "")
            if el:
                pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.element.{el}")
            if pol:
                pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.polarity.{pol}")
            if mod:
                pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.modality.{mod}")
            pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.sign.any")

        if (not unknown_time) and rh_i is not None:
            pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.house.{rh_i}")
            pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.house.any")
            pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.house.{rh_i}.group.{_house_group(rh_i)}")
            pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.house.{rh_i}.floor.{_house_floor(rh_i)}")

        if rs in SIGNS and (not unknown_time) and rh_i is not None:
            pos_keys.append(f"{tone_namespace}.house.{house}.ruler.{r}.sign.{rs}.house.{rh_i}")

        if pos_keys:
            out.append(
                KeyBlock(
                    id=f"house:{house}:ruler:{r}:pos",
                    candidate_keys=_dedup_keep_order(pos_keys),
                    meta={"house": house, "ruler": r, "ruler_sign": rs, "ruler_house": rh_i},
                )
            )

    return out



def _planets_in_house_blocks(
    *,
    house: int,
    planets: dict[str, dict[str, Any]],
    unknown_time: bool,
    tone_namespace: str,
) -> list[KeyBlock]:
    if unknown_time:
        return []
    found: list[str] = []
    for p, v in planets.items():
        if v.get("house") == house:
            found.append(p)
    out: list[KeyBlock] = []
    if not found:
        return out

    for p in sorted(found):
        out.append(
            KeyBlock(
                id=f"house:{house}:planet:{p}",
                candidate_keys=[
                    f"{tone_namespace}.house.{house}.planet.{p}",
                    f"{tone_namespace}.house.{house}.planet.any",
                    f"{tone_namespace}.house.{house}.planets.present",
                    f"{tone_namespace}.house.{house}",
                ],
                meta={"house": house, "planet": p},
            )
        )
    return out


def _extract_aspects(natal_data: dict[str, Any]) -> list[dict[str, str]]:
    """
    Normalizes aspects list to entries with:
      {"a":"sun","aspect":"square","b":"moon"} where a/b can be planet or angle.
    Tolerates aspect strings like "Square 90°" or "square".
    """
    raw = natal_data.get("aspects") or []
    if not isinstance(raw, list):
        return []

    def norm_obj(x: Any) -> str:
        t = _norm_token(x).replace(" ", "_").replace("-", "_")
        if not t:
            return ""
        if t in {"ascendant"}:
            return "asc"
        if t in {"midheaven"}:
            return "mc"
        if t in {"desc", "descendant", "dc"}:
            return "dsc"
        if t in ANGLES:
            return t
        p = _norm_planet(t)
        return p

    out: list[dict[str, str]] = []
    for it in raw:
        if not isinstance(it, dict):
            continue

        a = norm_obj(it.get("p1") or it.get("a") or it.get("obj1"))
        b = norm_obj(it.get("p2") or it.get("b") or it.get("obj2"))
        asp = _norm_aspect(it.get("aspect") or it.get("type") or it.get("name"))

        if not a or not b or not asp:
            continue

        out.append({"a": a, "aspect": asp, "b": b})

    return out


def _extract_aspect_configs(natal_data: dict[str, Any]) -> list[str]:
    raw = natal_data.get("aspect_configurations") or natal_data.get("aspect_configs") or natal_data.get("configs") or []
    out: list[str] = []
    if isinstance(raw, list):
        for x in raw:
            cfg = _norm_token(x.get("name") if isinstance(x, dict) else x)
            if cfg in ASPECT_CONFIGS:
                out.append(cfg)
    elif isinstance(raw, dict):
        for k, v in raw.items():
            cfg = _norm_token(k)
            if bool(v) and cfg in ASPECT_CONFIGS:
                out.append(cfg)
    return _dedup_keep_order(out)


def _ordered_planets(
    normalized_planets: Dict[str, Dict[str, Any]],
    *,
    planets_order: Sequence[str],
    include_all_planets: bool,
) -> List[str]:
    base = [p for p in planets_order if p in normalized_planets]
    if not include_all_planets:
        return base
    tail = sorted([p for p in normalized_planets.keys() if p not in set(base)])
    return base + tail


def build_knowledge_key_blocks(
    natal_data: Dict[str, Any],
    *,
    topic_category: Optional[str] = None,
    tone_namespace: str = "natal",
    planets_order: Sequence[str] = ("sun", "moon", "mercury", "venus", "mars"),
    include_all_planets: bool = False,
    include_angles: bool = True,
    include_aspects: bool = True,
    max_aspects: int = 18,
) -> List[KeyBlock]:



    """
    Main entrypoint.

    If topic_category is provided (recommended), blocks are built topic-aware:
      - first block is a topic generic fallback: natal.<topic>.generic
      - then: topic-specific blocks (houses/angles/planets/aspects)
      - final fallback key appended to every block ladder: natal.generic (global)

    If topic_category is None: behaves like "personality_core" compatibility mode
    (still appends global fallback).
    """
    # topic-aware mode only if topic_category is explicitly provided
    tc: Optional[str] = None
    if topic_category is not None:
        tc = str(topic_category).strip()
        if tc not in TOPIC_CATEGORIES:
            raise KeyBuilderError(f"Invalid topic_category: '{topic_category}'")

    profile = TOPIC_PROFILES.get(tc or "", TOPIC_PROFILES["personality_core"])


    subject = natal_data.get("subject", {}) or {}
    unknown_time = bool(subject.get("unknown_time", False))

    profile = TOPIC_PROFILES.get(tc) or TOPIC_PROFILES["personality_core"]

    planets = _extract_planets(natal_data)
    angles = _extract_angles(natal_data)
    houses_cusps = _extract_houses_cusps(natal_data)

    blocks: list[KeyBlock] = []

    # 0) topic generic fallback as first block
    if tc is not None:
        blocks.append(
            KeyBlock(
                id="topic_generic",
                candidate_keys=[
                    _topic_generic_key(tone_namespace=tone_namespace, topic_category=tc),
                    _global_generic_key(tone_namespace=tone_namespace),
                ],
                meta={"topic_category": tc, "unknown_time": unknown_time},
            )
        )

    # 1) planets (topic focus first; optionally include_all_planets)
    ordered = _ordered_planets(
        planets,
        planets_order=tuple(profile.focus_planets) + tuple(planets_order),
        include_all_planets=include_all_planets,
    )
    for p in _dedup_keep_order(ordered):
        v = planets.get(p) or {}
        sign = _norm_token(v.get("sign"))
        if sign not in SIGNS:
            continue
        house = v.get("house")
        house_i = house if isinstance(house, int) else _norm_house(house) if house is not None else None
        blk = _planet_sign_block(
            planet=p,
            sign=sign,
            house=house_i,
            unknown_time=unknown_time,
            tone_namespace=tone_namespace,
        )
        blk_keys = blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]
        blocks.append(KeyBlock(id=blk.id, candidate_keys=_dedup_keep_order(blk_keys), meta=blk.meta))

    # 2) angles
    if include_angles:
        for a in _dedup_keep_order(profile.focus_angles):
            if a == "mc" and unknown_time:
                continue
            sign = angles.get(a)
            if sign:
                blk = _angle_block(angle=a, sign=sign, tone_namespace=tone_namespace)
                blk_keys = blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                blocks.append(KeyBlock(id=blk.id, candidate_keys=_dedup_keep_order(blk_keys), meta=blk.meta))




    # 3) houses: cusp + ruler + planets-in-house (if data exists)
    if not unknown_time and profile.focus_houses:
        for h in profile.focus_houses:
            cusp_sign = houses_cusps.get(h)
            if cusp_sign:
                blk = _house_cusp_block(house=h, cusp_sign=cusp_sign, tone_namespace=tone_namespace)
                blocks.append(KeyBlock(id=blk.id, candidate_keys=_dedup_keep_order(blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]), meta=blk.meta))
                for rb in _house_ruler_blocks(house=h, cusp_sign=cusp_sign, planets=planets, tone_namespace=tone_namespace, unknown_time=unknown_time):
                    blocks.append(KeyBlock(id=rb.id, candidate_keys=_dedup_keep_order(rb.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]), meta=rb.meta))
            for pib in _planets_in_house_blocks(house=h, planets=planets, unknown_time=unknown_time, tone_namespace=tone_namespace):
                blocks.append(KeyBlock(id=pib.id, candidate_keys=_dedup_keep_order(pib.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]), meta=pib.meta))

    # 4) aspects (prioritize those that touch focus planets/angles)
    if include_aspects and profile.include_aspects:
        aspects = _extract_aspects(natal_data)
        focus_set = set(profile.focus_planets) | set(profile.focus_angles)

        def score(it: dict[str, str]) -> int:
            return int(it["a"] in focus_set) + int(it["b"] in focus_set)

        aspects.sort(key=score, reverse=True)
        for it in aspects[: max(0, int(max_aspects))]:
            blk = _aspect_block(a=it["a"], aspect=it["aspect"], b=it["b"], tone_namespace=tone_namespace)
            blocks.append(
                KeyBlock(
                    id=blk.id,
                    candidate_keys=_dedup_keep_order(blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]),
                    meta=blk.meta,
                )
            )


    # 5) aspect configurations (optional)
    if profile.include_aspect_configs:
        for cfg in _extract_aspect_configs(natal_data):
            blk = _aspect_config_block(cfg=cfg, tone_namespace=tone_namespace)
            blocks.append(KeyBlock(id=blk.id, candidate_keys=_dedup_keep_order(blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]), meta=blk.meta))

    # 6) integrals (optional, only if provided by data)
    if profile.include_integrals:
        for b in _elements_integrals_blocks(natal_data, tone_namespace=tone_namespace):
            blocks.append(KeyBlock(id=b.id, candidate_keys=_dedup_keep_order(b.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]), meta=b.meta))

    if not blocks:
        blocks = [
            KeyBlock(
                id="generic",
                candidate_keys=[_global_generic_key(tone_namespace=tone_namespace)],
                meta={"topic_category": tc, "unknown_time": unknown_time},
            )
        ]

    normalized: list[KeyBlock] = []
    for b in blocks:
        keys = _dedup_keep_order(list(b.candidate_keys) + [_global_generic_key(tone_namespace=tone_namespace)])
        normalized.append(KeyBlock(id=b.id, candidate_keys=keys, meta=b.meta))

    return normalized


def build_knowledge_key_blocks_by_topic(
    natal_data: Dict[str, Any],
    *,
    topic_categories: Sequence[str],
    tone_namespace: str = "natal",
    include_all_planets: bool = False,
) -> dict[str, list[KeyBlock]]:
    """
    Convenience helper for the API layer:
      {topic: [KeyBlock, ...], ...}
    """
    out: dict[str, list[KeyBlock]] = {}
    for tc in topic_categories:
        out[str(tc)] = build_knowledge_key_blocks(
            natal_data,
            topic_category=str(tc),
            tone_namespace=tone_namespace,
            include_all_planets=include_all_planets,
        )
    return out

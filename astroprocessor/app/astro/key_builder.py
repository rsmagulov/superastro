from __future__ import annotations
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

# --- common: planet-groups + sign.present ------------------------------------

SIGN_ORDER: tuple[str, ...] = (
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
)

PERSONAL_PLANETS: tuple[str, ...] = ("sun", "moon", "mercury", "venus", "mars")

PLANET_GROUPS: dict[str, tuple[str, ...]] = {
    "luminaries": ("sun", "moon"),
    "inner": ("mercury", "venus", "mars"),
    "social": ("jupiter", "saturn"),
    "outer": ("uranus", "neptune", "pluto"),
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
        focus_planets=("sun", "moon"),
        focus_angles=("asc",),
        focus_houses=(1,),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "psychology": TopicProfile(
        topic="psychology",
        focus_planets=("moon", "neptune", "pluto"),
        focus_angles=("ic",),
        focus_houses=(12, 8, 4),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "talents": TopicProfile(
        topic="talents",
        focus_planets=("mercury", "uranus", "jupiter"),
        focus_angles=(),
        focus_houses=(3, 5, 9, 11),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "strengths_weaknesses": TopicProfile(
        topic="strengths_weaknesses",
        focus_planets=(),
        focus_angles=(),
        focus_houses=(),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "purpose_path": TopicProfile(
        topic="purpose_path",
        focus_planets=("north_node", "jupiter", "saturn"),
        focus_angles=("mc",),
        focus_houses=(9, 10, 12),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "career": TopicProfile(
        topic="career",
        focus_planets=("saturn", "jupiter"),
        focus_angles=("mc",),
        focus_houses=(10, 6, 2),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=True,
    ),
    "money": TopicProfile(
        topic="money",
        focus_planets=("venus", "jupiter"),
        focus_angles=(),
        focus_houses=(2, 8),
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
        focus_planets=("saturn",),
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
        focus_houses=(8, 12),
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
        focus_planets=(),
        focus_angles=("asc",),
        focus_houses=(1,),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "self_esteem": TopicProfile(
        topic="self_esteem",
        focus_planets=("sun",),
        focus_angles=("asc",),
        focus_houses=(2, 1),
        include_integrals=True,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "creativity": TopicProfile(
        topic="creativity",
        focus_planets=("venus", "neptune"),
        focus_angles=(),
        focus_houses=(5,),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
    "ancestral_topics": TopicProfile(
        topic="ancestral_topics",
        focus_planets=("moon",),
        focus_angles=("ic",),
        focus_houses=(4,),
        include_integrals=False,
        include_aspects=True,
        include_aspect_configs=False,
    ),
}

# --- helpers to normalize various natal_data shapes (dicts, pydantic, objects) ---

def _append_unique_block(blocks: list["KeyBlock"], new_block: "KeyBlock", *, dedupe_by_keys: bool = True) -> None:
    """
    Dedupe blocks to avoid wasting max_blocks on aliases producing identical key ladders.
    - Always dedupe by id
    - Optionally dedupe by candidate_keys tuple
    """
    if any(b.id == new_block.id for b in blocks):
        return

    if dedupe_by_keys:
        nk = tuple(new_block.candidate_keys or [])
        for b in blocks:
            if tuple(b.candidate_keys or []) == nk:
                return

    blocks.append(new_block)

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
    """Normalize token-like values coming from nested dumps (kerykeion/pydantic).

    Examples we must handle:
      {"name": "Leo"} / {"key": "leo"} / {"sign": {"name": "Leo"}} / ["Leo", ...]
    """
    if x is None:
        return ""

    if isinstance(x, dict):
        # common leaf keys
        for k in ("key", "id", "name", "slug", "value", "sign", "planet", "point", "type"):
            if k in x and x.get(k) is not None:
                return _norm_token(x.get(k))
        # fallback: first scalar value
        for v in x.values():
            if isinstance(v, (str, int, float, bool)):
                return str(v).strip().lower()
        return ""

    if isinstance(x, (list, tuple)) and x:
        for v in x:
            s = _norm_token(v)
            if s:
                return s
        return ""

    try:
        return str(x).strip().lower()
    except Exception:
        return ""


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
    # Most specific
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

    # IMPORTANT: do NOT include *.sign.any here to avoid duplicating skeleton hits
    keys.append(f"{tone_namespace}.angle.{angle}")
    keys.append(f"{tone_namespace}.angle")

    return KeyBlock(
        id=f"angle:{angle}",
        candidate_keys=_dedup_keep_order(keys),
        meta={"angle": angle, "sign": sign},
    )



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

    angle_set = {"asc", "dsc", "mc", "ic"}
    angle = None
    if left in angle_set:
        angle = left
    elif right in angle_set:
        angle = right

    if angle:
        keys.extend(
            [
                f"{tone_namespace}.aspect.{left}.{aspect}.with.angle.{angle}",
                f"{tone_namespace}.aspect.any.{aspect}.with.angle.{angle}",
                f"{tone_namespace}.aspect.with.angle.{angle}",
                f"{tone_namespace}.aspect.with.angle.any",
            ]
        )

    return KeyBlock(
        id=f"aspect:{left}:{aspect}:{right}",
        candidate_keys=_dedup_keep_order(keys),
        meta={"a": left, "aspect": aspect, "b": right, "class": cls, "with_angle": angle},
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
    Normalize several possible planet structures to:
      {"sun": {"sign":"leo","house":1}, ...}

    Supported shapes:
      1) natal_data["planets"] as dict or list
      2) kerykeion-like: natal_data["subject"][<planet_key>] = {"sign": "...", "house": ...}
         where <planet_key> is one of PLANETS (sun/moon/mercury/...)
    """
    out: dict[str, dict[str, Any]] = {}

    # --- (A) preferred: explicit planets container ---
    planets_raw = natal_data.get("planets") or natal_data.get("points") or None

    items: list[tuple[Any, Any]] = []
    if isinstance(planets_raw, dict):
        items = list(planets_raw.items())
    elif isinstance(planets_raw, list):
        for it in planets_raw:
            if isinstance(it, dict):
                name = it.get("name") or it.get("planet") or it.get("id")
                items.append((name, it))

    # --- (B) fallback: kerykeion-like planets inside subject ---
    if not items:
        subject = natal_data.get("subject") or {}
        if isinstance(subject, dict):
            for p in PLANETS:
                node = subject.get(p)
                if isinstance(node, dict):
                    items.append((p, node))

    for k, v in items:
        p = _norm_token(k)
        if p not in PLANETS or not isinstance(v, dict):
            continue

        sign = _norm_token(v.get("sign") or v.get("sign_key") or v.get("zodiac_sign"))
        house = v.get("house") or v.get("house_number")

        try:
            if sign:
                sign = _require_in_set("sign", sign, SIGNS)
        except KeyBuilderError:
            continue

        try:
            house_i = _norm_house(house)
        except KeyBuilderError:
            house_i = None

        out[p] = {"sign": sign, "house": house_i}

    return out





def _extract_angles(natal_data: dict[str, Any]) -> dict[str, str]:
    """
    Normalize angles to: {"asc":"leo","mc":"taurus", ...}

    Supported shapes:
      1) natal_data["angles"] / ["axes"] as dict
      2) kerykeion-like:
         natal_data["subject"]["ascendant"] = {"sign": "..."}
         natal_data["subject"]["medium_coeli"] = {"sign": "..."}
    """
    out: dict[str, str] = {}

    # --- (A) explicit angles container ---
    angles_raw = natal_data.get("angles") or natal_data.get("axes") or None
    if isinstance(angles_raw, dict):
        for k, v in angles_raw.items():
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

            sign = _norm_token(v.get("sign") if isinstance(v, dict) else v)
            if not sign:
                continue
            try:
                out[a] = _require_in_set("sign", sign, SIGNS)
            except KeyBuilderError:
                continue

        if out:
            return out

    # --- (B) fallback: kerykeion-like inside subject ---
    subject = natal_data.get("subject") or {}
    if not isinstance(subject, dict):
        return out

    asc = subject.get("ascendant")
    mc = subject.get("medium_coeli")

    if isinstance(asc, dict):
        s = _norm_token(asc.get("sign"))
        if s:
            try:
                out["asc"] = _require_in_set("sign", s, SIGNS)
            except KeyBuilderError:
                pass

    if isinstance(mc, dict):
        s = _norm_token(mc.get("sign"))
        if s:
            try:
                out["mc"] = _require_in_set("sign", s, SIGNS)
            except KeyBuilderError:
                pass

    return out

def _planet_groups_blocks(
    planets: dict[str, dict[str, Any]],
    *,
    tc: Optional[str],
    tone_namespace: str,
) -> list["KeyBlock"]:
    """
    Common blocks: natal.planets.group.<name>.present (+ optional count buckets).

    Order inside block:
      - most specific: count bucket
      - then present
      - then topic generic (if tc)
      - then global generic
    """
    blocks: list[KeyBlock] = []

    for group_name, members in PLANET_GROUPS.items():
        count = 0
        for p in members:
            v = planets.get(p) or {}
            sign = _norm_token(v.get("sign"))
            if sign in SIGNS:
                count += 1

        # bucket range: 0..len(members)
        max_n = len(members)
        if count < 0:
            count = 0
        if count > max_n:
            count = max_n

        keys: list[str] = [
            f"{tone_namespace}.planets.group.{group_name}.count.{count}",
            f"{tone_namespace}.planets.group.{group_name}.present",
        ]
        if tc is not None:
            keys.append(_topic_generic_key(tone_namespace=tone_namespace, topic_category=tc))
        keys.append(_global_generic_key(tone_namespace=tone_namespace))
        keys = _dedup_keep_order(keys)

        blocks.append(
            KeyBlock(
                id=f"planet_group_{group_name}",
                candidate_keys=keys,
                meta={
                    "group": group_name,
                    "members": list(members),
                    "present_count": count,
                },
            )
        )

    return blocks


def _sign_present_blocks(
    *,
    planets: dict[str, dict[str, Any]],
    angles: dict[str, Any],          # values may be str (current extractor) or dict (tolerate)
    houses_cusps: dict[int, Any],    # values may be str (current extractor) or dict (tolerate)
    tc: Optional[str],
    tone_namespace: str,
) -> list["KeyBlock"]:
    """
    Common blocks: natal.sign.<sign>.present

    A sign is 'present' if it appears in:
      - personal planets (sun/moon/mercury/venus/mars)
      - angles (asc/mc/dsc/ic) if known
      - house cusps if known

    NOTE: extractors in this repo normalize:
      - angles -> dict[str, str]
      - houses_cusps -> dict[int, str]
    This function tolerates dict-shaped values too.
    """
    signs: set[str] = set()

    # personal planets (dict values)
    for p in PERSONAL_PLANETS:
        v = planets.get(p) or {}
        s = _norm_sign(v.get("sign"))
        if s:
            signs.add(s)

    # angles (usually str values)
    for a in ("asc", "mc", "dsc", "ic"):
        raw = angles.get(a)
        s = _norm_sign(raw)
        if s:
            signs.add(s)

    # house cusps (usually str values)
    for h in range(1, 13):
        raw = houses_cusps.get(h)
        s = _norm_sign(raw)
        if s:
            signs.add(s)

    ordered_signs = [s for s in SIGN_ORDER if s in signs]

    blocks: list[KeyBlock] = []
    for s in ordered_signs:
        keys: list[str] = [f"{tone_namespace}.sign.{s}.present"]
        if tc is not None:
            keys.append(_topic_generic_key(tone_namespace=tone_namespace, topic_category=tc))
        keys.append(_global_generic_key(tone_namespace=tone_namespace))
        keys = _dedup_keep_order(keys)

        blocks.append(
            KeyBlock(
                id=f"sign_present_{s}",
                candidate_keys=keys,
                meta={"sign": s},
            )
        )

    return blocks


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

def _house_ruler_aspect_blocks(
    *,
    house: int,
    cusp_sign: str,
    planets: dict[str, dict[str, Any]],
    aspects: list[dict[str, str]],
    tone_namespace: str,
    unknown_time: bool,
    focus_set: set[str],
    max_ruler_aspects: int = 8,
) -> list[KeyBlock]:
    """
    House ruler aspects (ruler ↔ other planet/angle) as topic-aware high-signal keys.

    Emits keys like:
      natal.house.10.ruler.saturn.aspect.square.moon
      natal.house.10.ruler.saturn.aspect.any.with.angle.mc
      natal.house.10.ruler.aspect.class.tense
    """
    if unknown_time or not aspects:
        return []

    primary, alt = SIGN_RULERS.get(cusp_sign, (None, None))
    rulers = [r for r in (primary, alt) if r and r in PLANETS]
    if not rulers:
        return []

    angle_set = set(ANGLES)
    hard = {"square", "opposition"}

    def _score(it: dict[str, str], ruler: str) -> int:
        other = it["b"] if it["a"] == ruler else it["a"]
        sc = 0
        sc += 3 if it["aspect"] in hard else 0
        sc += 2 if other in focus_set else 0
        sc += 2 if other in angle_set else 0
        sc += 1 if other in PLANETS else 0
        return sc

    out: list[KeyBlock] = []

    for r in rulers:
        rel = [it for it in aspects if it.get("a") == r or it.get("b") == r]
        if not rel:
            continue

        rel.sort(key=lambda it: _score(it, r), reverse=True)
        rel = rel[: max(0, int(max_ruler_aspects))]

        # marker: ruler has aspects (useful generic hook)
        out.append(
            KeyBlock(
                id=f"house:{house}:ruler:{r}:aspects:present",
                candidate_keys=_dedup_keep_order(
                    [
                        f"{tone_namespace}.house.{house}.ruler.{r}.aspects.present",
                        f"{tone_namespace}.house.{house}.ruler.aspects.present",
                        f"{tone_namespace}.house.ruler.{r}.aspects.present",
                        f"{tone_namespace}.house.ruler.aspects.present",
                    ]
                ),
                meta={"house": house, "ruler": r, "cusp_sign": cusp_sign},
            )
        )

        for it in rel:
            aspect = it["aspect"]
            other = it["b"] if it["a"] == r else it["a"]
            cls = _aspect_class(aspect)

            keys: list[str] = [
                f"{tone_namespace}.house.{house}.ruler.{r}.aspect.{aspect}.{other}",
                f"{tone_namespace}.house.{house}.ruler.{r}.aspect.{aspect}.any",
                f"{tone_namespace}.house.{house}.ruler.{r}.aspect.any.{other}",
                f"{tone_namespace}.house.{house}.ruler.{r}.aspect.class.{cls}",
                f"{tone_namespace}.house.{house}.ruler.{r}.aspect.any.any",
                # ruler-any ladders (still house-scoped)
                f"{tone_namespace}.house.{house}.ruler.aspect.{aspect}.{other}",
                f"{tone_namespace}.house.{house}.ruler.aspect.{aspect}.any",
                f"{tone_namespace}.house.{house}.ruler.aspect.class.{cls}",
                f"{tone_namespace}.house.{house}.ruler.aspect.any.any",
                # cross-topic planet hook (sometimes useful)
                f"{tone_namespace}.planet.{r}.aspect.{aspect}.{other}",
            ]

            # with-angle ladders
            if other in angle_set:
                keys.extend(
                    [
                        f"{tone_namespace}.house.{house}.ruler.{r}.aspect.{aspect}.with.angle.{other}",
                        f"{tone_namespace}.house.{house}.ruler.{r}.aspect.any.with.angle.{other}",
                        f"{tone_namespace}.house.{house}.ruler.aspect.with.angle.{other}",
                    ]
                )

            # hard-present ladders (house+ruler scoped)
            if aspect in hard:
                keys.extend(
                    [
                        f"{tone_namespace}.house.{house}.ruler.{r}.aspect.hard.present",
                        f"{tone_namespace}.house.{house}.ruler.aspect.hard.present",
                    ]
                )

            out.append(
                KeyBlock(
                    id=f"house:{house}:ruler:{r}:aspect:{aspect}:{other}",
                    candidate_keys=_dedup_keep_order(keys),
                    meta={
                        "house": house,
                        "ruler": r,
                        "cusp_sign": cusp_sign,
                        "aspect": aspect,
                        "other": other,
                        "class": cls,
                    },
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

def _compute_aspects_fallback_from_longitudes(natal_data: dict[str, Any]) -> list[dict[str, str]]:
    """
    Fallback aspect computation when natal_data['aspects'] is empty.

    Returns the same normalized shape as _extract_aspects():
      [{"a":"sun","aspect":"square","b":"moon"}, ...]
    """
    planets = natal_data.get("planets") or {}
    angles = natal_data.get("angles") or {}

    def _lon(obj: Any) -> float | None:
        if not isinstance(obj, dict):
            return None
        for k in ("lon", "longitude", "ecliptic_longitude", "abs_pos", "position"):
            v = obj.get(k)
            if isinstance(v, (int, float)):
                return float(v)
        return None

    # Collect longitudes (planets + angles)
    longs: dict[str, float] = {}
    for p, v in planets.items():
        if isinstance(p, str):
            lv = _lon(v)
            if lv is not None:
                longs[_norm_planet(_norm_token(p))] = lv % 360.0

    for a, v in angles.items():
        if isinstance(a, str):
            ak = _norm_token(a)
            if ak in {"ascendant"}:
                ak = "asc"
            if ak in {"midheaven"}:
                ak = "mc"
            if ak in {"desc", "descendant", "dc"}:
                ak = "dsc"
            if ak in ANGLES:
                lv = _lon(v)
                if lv is not None:
                    longs[ak] = lv % 360.0

    if len(longs) < 2:
        return []

    # Major aspects with simple orbs (safe defaults)
    aspect_defs: list[tuple[str, float, float]] = [
        ("conjunction", 0.0, 6.0),
        ("sextile", 60.0, 4.0),
        ("square", 90.0, 5.0),
        ("trine", 120.0, 5.0),
        ("opposition", 180.0, 6.0),
    ]

    names = sorted(longs.keys())
    out: list[dict[str, str]] = []

    def _delta(a: float, b: float) -> float:
        d = abs(a - b) % 360.0
        return d if d <= 180.0 else 360.0 - d

    for i in range(len(names)):
        for j in range(i + 1, len(names)):
            n1, n2 = names[i], names[j]
            d = _delta(longs[n1], longs[n2])
            for asp_name, exact, orb in aspect_defs:
                if abs(d - exact) <= orb:
                    out.append({"a": n1, "aspect": asp_name, "b": n2})
                    break

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
    include_aspect_configs: bool = True,
    include_integrals: bool = True,
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

    profile = TOPIC_PROFILES.get(tc or "personality_core", TOPIC_PROFILES["personality_core"])


    subject = natal_data.get("subject", {}) or {}
    unknown_time = bool(subject.get("unknown_time", False))

    planets = _extract_planets(natal_data)
    angles = _extract_angles(natal_data)
    houses_cusps = _extract_houses_cusps(natal_data)

    blocks: list[KeyBlock] = []
    # aspects must exist before topic_generic meta.extract_stats
    aspects: list[dict[str, str]] = []
    if include_aspects and (not unknown_time) and profile.include_aspects:
        aspects = _extract_aspects(natal_data)
        if not aspects:
            aspects = _compute_aspects_fallback_from_longitudes(natal_data)

    # 0) topic generic fallback as first block
    if tc is not None:
        blocks.append(
            KeyBlock(
                id="topic_generic",
                candidate_keys=(
                    [
                        _topic_generic_key(tone_namespace=tone_namespace, topic_category=tc),
                        _global_generic_key(tone_namespace=tone_namespace),
                        f"{tone_namespace}.{tc}.budget.base",
                    ]
                    + (
                        [
                            f"{tone_namespace}.{tc}.budget.all_planets",
                            f"{tone_namespace}.{tc}.budget.rich",
                        ]
                        if include_all_planets
                        else [
                            f"{tone_namespace}.{tc}.budget.core",
                        ]
                    )
                ),
                meta={
                    "topic_category": tc,
                    "unknown_time": unknown_time,
                    "extract_stats": {
                        "planets": len(planets) if isinstance(planets, dict) else 0,
                        "angles": len(angles) if isinstance(angles, dict) else 0,
                        "houses_cusps": len(houses_cusps) if isinstance(houses_cusps, dict) else 0,
                        "aspects": len(aspects) if isinstance(aspects, list) else 0,
                    },
                }
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
        blk_keys = _dedup_keep_order(blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)])

        # NEW: keep old id AND add *_core alias for tests/compat
        # Keep *_core alias ONLY for planets_order (default: sun/moon/mercury/venus/mars)
        # This preserves legacy behavior for core planets, but avoids doubling every planet.
        _append_unique_block(blocks, KeyBlock(id=blk.id, candidate_keys=blk_keys, meta=blk.meta))

        # Core aliases:
        # - if include_all_planets=True -> alias every emitted planet (tests expect jupiter_core)
        # - else -> alias only baseline planets_order (sun/moon/mercury/venus/mars)
        if include_all_planets or (p in set(planets_order)):
            _append_unique_block(
                blocks,
                KeyBlock(id=f"{p}_core", candidate_keys=blk_keys, meta=blk.meta),
                dedupe_by_keys=False,  # важно: иначе alias выкидывается как дубль planet:<p>
            )

    # common blocks (all topics): planet-groups + sign.present
    blocks.extend(
        _planet_groups_blocks(
            planets,
            tc=tc,
            tone_namespace=tone_namespace,
        )
    )

    blocks.extend(
        _sign_present_blocks(
            planets=planets,
            angles=angles,
            houses_cusps=houses_cusps,
            tc=tc,
            tone_namespace=tone_namespace,
        )
    )
    
    # 2) angles (works even if sign missing)
    if include_angles:
        for a in _dedup_keep_order(profile.focus_angles):
            if a == "mc" and unknown_time:
                continue

            sign = angles.get(a)

            # Always emit skeleton so DB can hit *.sign.any seeds
            blocks.append(
                KeyBlock(
                    id=f"angle:{a}:any",
                    candidate_keys=_dedup_keep_order(
                        [
                            f"{tone_namespace}.angle.{a}",           # ✅ сборочный ключ первым (natal.angle.mc)
                            f"{tone_namespace}.angle.{a}.sign.any",  # fallback если сборочного нет
                            f"{tone_namespace}.angle",
                            _global_generic_key(tone_namespace=tone_namespace),
                        ]
                    ),
                    meta={"angle": a, "sign": sign or None, "skeleton": True},
                )
            )

            # If sign exists, emit full ladder ONLY if it adds specificity beyond *.sign.any
            if sign:
                blk = _angle_block(angle=a, sign=sign, tone_namespace=tone_namespace)
                full_keys = _dedup_keep_order(blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)])

                # Skip when full ladder degenerates to the same top key as skeleton.
                # (Typical when KB has only *.sign.any, so both blocks resolve to the same item.)
                skeleton_top = f"{tone_namespace}.angle.{a}.sign.any"
                full_top = f"{tone_namespace}.angle.{a}.sign.{sign}"

                # full block is only valuable if it contains the specific sign key
                # (otherwise it’s effectively the same as skeleton)
                if full_top in full_keys and full_top != skeleton_top:
                    blocks.append(KeyBlock(id=blk.id, candidate_keys=full_keys, meta=blk.meta))


    # 3) houses: cusp + ruler + planets-in-house (works even if cusp_sign missing)
    if (not unknown_time) and profile.focus_houses:
        for h in profile.focus_houses:
            cusp_sign = houses_cusps.get(h)

            # Always emit a minimal house-cusp ladder so DB can hit *.cusp.sign.any seeds
            skeleton_cusp_keys = _dedup_keep_order(
                [
                    f"{tone_namespace}.house.{h}",                # ✅ сборочный ключ первым (natal.house.10)
                    f"{tone_namespace}.house.{h}.cusp.sign.any",  # sign-any fallback
                    f"{tone_namespace}.house.{h}.cusp",
                    f"{tone_namespace}.house.cusp.core",
                    f"{tone_namespace}.house.boundary",
                    f"{tone_namespace}.house",
                ]
            )
            blocks.append(
                KeyBlock(
                    id=f"house:{h}:cusp:any",
                    candidate_keys=_dedup_keep_order(
                        skeleton_cusp_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                    ),
                    meta={"house": h, "cusp_sign": cusp_sign or None, "skeleton": True},
                )
            )

            # If we do have a real cusp sign, emit the full cusp ladder + ruler ladders
            if cusp_sign:
                blk = _house_cusp_block(house=h, cusp_sign=cusp_sign, tone_namespace=tone_namespace)
                blocks.append(
                    KeyBlock(
                        id=blk.id,
                        candidate_keys=_dedup_keep_order(
                            blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                        ),
                        meta=blk.meta,
                    )
                )

                for rb in _house_ruler_blocks(
                    house=h,
                    cusp_sign=cusp_sign,
                    planets=planets,
                    tone_namespace=tone_namespace,
                    unknown_time=unknown_time,
                ):
                    blocks.append(
                        KeyBlock(
                            id=rb.id,
                            candidate_keys=_dedup_keep_order(
                                rb.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                            ),
                            meta=rb.meta,
                        )
                    )

            # Always emit a minimal ruler-any ladder as a fallback (matches your seeds)
            skeleton_ruler_keys = _dedup_keep_order(
                [
                    f"{tone_namespace}.house.{h}.ruler.any",
                    f"{tone_namespace}.house.{h}.ruler",
                    f"{tone_namespace}.house.ruler.core",
                    f"{tone_namespace}.house.ruler.boundary",
                    f"{tone_namespace}.house",
                ]
            )
            blocks.append(
                KeyBlock(
                    id=f"house:{h}:ruler:any",
                    candidate_keys=_dedup_keep_order(
                        skeleton_ruler_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                    ),
                    meta={"house": h, "cusp_sign": cusp_sign or None, "skeleton": True},
                )
            )

            # planets in house (only works if houses exist in natal_data, but harmless otherwise)
            for pib in _planets_in_house_blocks(
                house=h,
                planets=planets,
                unknown_time=unknown_time,
                tone_namespace=tone_namespace,
            ):
                blocks.append(
                    KeyBlock(
                        id=pib.id,
                        candidate_keys=_dedup_keep_order(
                            pib.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                        ),
                        meta=pib.meta,
                    )
                )

    # 4) aspects (prioritize those that touch focus planets/angles)
        if include_aspects and (not unknown_time) and profile.include_aspects and aspects:
            # strengths_weaknesses: signal that hard aspects exist (square/opposition)
            if tc == "strengths_weaknesses":
                hard = {"square", "opposition"}
                if any((it.get("aspect") in hard) for it in aspects):
                    blocks.append(
                        KeyBlock(
                            id="aspects:hard:present",
                            candidate_keys=_dedup_keep_order(
                                [
                                    f"{tone_namespace}.aspect.hard.present",
                                    f"{tone_namespace}.aspect.square.present",
                                    f"{tone_namespace}.aspect.opposition.present",
                                    f"{tone_namespace}.aspect.class.tense",
                                    _global_generic_key(tone_namespace=tone_namespace),
                                ]
                            ),
                            meta={"topic_category": tc, "hard_present": True},
                        )
                    )

            focus_set = set(profile.focus_planets) | set(profile.focus_angles)

            def score(it: dict[str, str]) -> int:
                return int(it["a"] in focus_set) + int(it["b"] in focus_set)

            aspects.sort(key=score, reverse=True)

            for it in aspects[: max(0, int(max_aspects))]:
                blk = _aspect_block(a=it["a"], aspect=it["aspect"], b=it["b"], tone_namespace=tone_namespace)
                blocks.append(
                    KeyBlock(
                        id=blk.id,
                        candidate_keys=_dedup_keep_order(
                            blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                        ),
                        meta=blk.meta,
                    )
                )

            # House ruler aspects (ruler ↔ planets/angles) for focus houses
            if profile.focus_houses:
                for h in profile.focus_houses:
                    cusp_sign = houses_cusps.get(h)
                    if not cusp_sign:
                        continue
                    for rb in _house_ruler_aspect_blocks(
                        house=h,
                        cusp_sign=cusp_sign,
                        planets=planets,
                        aspects=aspects,
                        tone_namespace=tone_namespace,
                        unknown_time=unknown_time,
                        focus_set=focus_set,
                        max_ruler_aspects=8,
                    ):
                        blocks.append(
                            KeyBlock(
                                id=rb.id,
                                candidate_keys=_dedup_keep_order(
                                    rb.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]
                                ),
                                meta=rb.meta,
                            )
                        )

    # 5) aspect configurations (optional)
    if include_aspect_configs and profile.include_aspect_configs:
        for cfg in _extract_aspect_configs(natal_data):
            blk = _aspect_config_block(cfg=cfg, tone_namespace=tone_namespace)
            blocks.append(KeyBlock(id=blk.id, candidate_keys=_dedup_keep_order(blk.candidate_keys + [_global_generic_key(tone_namespace=tone_namespace)]), meta=blk.meta))

    # 6) integrals (optional, only if provided by data)
    if include_integrals and profile.include_integrals:
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

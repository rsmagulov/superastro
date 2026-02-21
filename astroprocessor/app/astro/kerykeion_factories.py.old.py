# astroprocessor/app/astro/kerykeion_factories.py
from __future__ import annotations

from dataclasses import asdict, is_dataclass
from pathlib import Path
from typing import Any, Optional


def _try_set_swisseph_path(ephemeris_path: str | None) -> None:
    """
    Best-effort Swiss Ephemeris path setup.

    Kerykeion uses Swiss Ephemeris (pyswisseph) under the hood.
    If ephemeris files are not present, Kerykeion may still work in some setups,
    but for reproducibility we set ephe path when provided.
    """
    if not ephemeris_path:
        return

    p = Path(str(ephemeris_path))
    if not p.is_absolute():
        # allow relative path from current working dir; do not resolve against project root here
        p = p.resolve()

    if not p.exists():
        # Don't crash hard: tests/dev setups may not ship se files
        return

    try:
        import swisseph as swe  # type: ignore

        swe.set_ephe_path(str(p))
    except Exception:
        # Optional dependency / environment differences
        return


def _import_kerykeion_subject_class():
    """
    Supports multiple Kerykeion versions.

    Common import paths:
    - from kerykeion import AstrologicalSubject
    - from kerykeion.AstrologicalSubject import AstrologicalSubject
    """
    try:
        from kerykeion import AstrologicalSubject  # type: ignore

        return AstrologicalSubject
    except Exception:
        pass

    try:
        from kerykeion.AstrologicalSubject import AstrologicalSubject  # type: ignore

        return AstrologicalSubject
    except Exception as e:
        raise ImportError(
            "Cannot import Kerykeion AstrologicalSubject. "
            "Make sure 'kerykeion' is installed and compatible."
        ) from e


def _safe_obj_to_dict(obj: Any) -> Any:
    if obj is None:
        return None
    if isinstance(obj, (str, int, float, bool)):
        return obj
    if isinstance(obj, (list, tuple, set)):
        return [_safe_obj_to_dict(x) for x in obj]
    if isinstance(obj, dict):
        return {str(k): _safe_obj_to_dict(v) for k, v in obj.items()}
    if is_dataclass(obj):
        return {k: _safe_obj_to_dict(v) for k, v in asdict(obj).items()}

    for meth in ("model_dump", "dict"):
        m = getattr(obj, meth, None)
        if callable(m):
            try:
                return _safe_obj_to_dict(m())
            except Exception:
                pass

    d = getattr(obj, "__dict__", None)
    if isinstance(d, dict) and d:
        out: dict[str, Any] = {}
        for k, v in d.items():
            if str(k).startswith("_"):
                continue
            try:
                out[str(k)] = _safe_obj_to_dict(v)
            except Exception:
                continue
        if out:
            return out

    return str(obj)


class AstrologicalSubjectFactory:
    """
    One place to build Kerykeion AstrologicalSubject with deterministic config.
    """

    @staticmethod
    def natal_chart_data(subject: Any) -> dict[str, Any]:
        """
        Always returns a key-builder friendly dict.
        Even if Kerykeion returns partial data, we keep required keys present.
        """

        # 0) Force lazy computations (kerykeion differs by version)
        for meth in (
            "get_planets",
            "get_houses",
            "get_aspects",
            "get_all_aspects",
            "make_chart",
            "calculate_chart",
            "calc_chart",
            "build_chart",
            "to_json",
            "json",
        ):
            fn = getattr(subject, meth, None)
            if callable(fn):
                try:
                    fn()
                except Exception:
                    pass

        # 1) Try to obtain a richer dump via to_json/json (often contains planets/houses)
        subject_dump = _safe_obj_to_dict(subject)

        def _try_json_dump() -> dict[str, Any] | None:
            import json as _json

            for meth in ("to_json", "json"):
                fn = getattr(subject, meth, None)
                if callable(fn):
                    try:
                        raw = fn()
                        if isinstance(raw, str):
                            parsed = _json.loads(raw)
                            return parsed if isinstance(parsed, dict) else None
                        if isinstance(raw, dict):
                            return raw
                    except Exception:
                        pass
            return None

        json_dump = _try_json_dump()
        if isinstance(json_dump, dict) and json_dump:
            # merge json_dump on top of subject_dump (prefer json)
            if isinstance(subject_dump, dict):
                merged = dict(subject_dump)
                merged.update(json_dump)
                subject_dump = merged
            else:
                subject_dump = json_dump

        dump_planets = dump_houses = dump_aspects = dump_angles = None
        if isinstance(subject_dump, dict):
            dump_planets = subject_dump.get("planets") or subject_dump.get("planets_dict")
            dump_houses = subject_dump.get("houses") or subject_dump.get("houses_dict") or subject_dump.get("houses_cusps")
            dump_aspects = subject_dump.get("aspects") or subject_dump.get("aspects_list")
            dump_angles = subject_dump.get("angles")

        # 2) Planets
        planets_out: dict[str, dict[str, Any]] = {}

        for p in ChartDataFactory.PLANETS:
            node = ChartDataFactory._get_attr(subject, p)
            if node is None and isinstance(subject_dump, dict):
                node = subject_dump.get(p)
            if node is None and isinstance(dump_planets, dict):
                node = dump_planets.get(p)
            if node is None:
                continue

            planets_out[p] = {
                "sign": ChartDataFactory._pick_sign(node),
                "house": ChartDataFactory._pick_house(node),
            }

        planets_container = ChartDataFactory._get_attr(subject, "planets", "planets_list") or dump_planets
        pc = _safe_obj_to_dict(planets_container)
        if isinstance(pc, dict):
            for k, v in pc.items():
                pk = str(k).lower()
                if pk and pk not in planets_out:
                    planets_out[pk] = {"sign": ChartDataFactory._pick_sign(v), "house": ChartDataFactory._pick_house(v)}
        elif isinstance(pc, list):
            for it in pc:
                d = it if isinstance(it, dict) else _safe_obj_to_dict(it)
                if not isinstance(d, dict):
                    continue
                name = (d.get("name") or d.get("planet") or d.get("id") or "").strip().lower()
                if name and name not in planets_out:
                    planets_out[name] = {"sign": ChartDataFactory._pick_sign(d), "house": ChartDataFactory._pick_house(d)}

        # 3) Angles
        angles_out: dict[str, dict[str, Any]] = {}
        for a, attrs in ChartDataFactory.ANGLE_ATTRS.items():
            node = ChartDataFactory._get_attr(subject, *attrs)
            if node is None and isinstance(subject_dump, dict):
                for cand in attrs:
                    if cand in subject_dump:
                        node = subject_dump.get(cand)
                        break
            if node is None and isinstance(dump_angles, dict):
                node = dump_angles.get(a)
            if node is None:
                continue
            angles_out[a] = {"sign": ChartDataFactory._pick_sign(node)}

        # 4) Houses
        houses_out: dict[str, dict[str, Any]] = {}
        houses_container = ChartDataFactory._get_attr(subject, "houses", "houses_list", "house") or dump_houses
        hc = _safe_obj_to_dict(houses_container)
        if isinstance(hc, dict):
            for k, v in hc.items():
                try:
                    hk = str(int(k))
                except Exception:
                    continue
                houses_out[hk] = {"sign": ChartDataFactory._pick_sign(v)}
        elif isinstance(hc, list):
            for it in hc:
                d = it if isinstance(it, dict) else _safe_obj_to_dict(it)
                if not isinstance(d, dict):
                    continue
                h = d.get("house") or d.get("number") or d.get("id")
                try:
                    hk = str(int(h))
                except Exception:
                    continue
                houses_out[hk] = {"sign": ChartDataFactory._pick_sign(d)}

        # 5) Aspects
        aspects_out: list[dict[str, Any]] = []
        aspects_container = ChartDataFactory._get_attr(subject, "aspects", "aspects_list") or dump_aspects
        ac = _safe_obj_to_dict(aspects_container)

        def _norm_p(x: Any) -> str | None:
            if not x:
                return None
            if isinstance(x, str):
                return x.lower()
            d = x if isinstance(x, dict) else _safe_obj_to_dict(x)
            if isinstance(d, dict):
                nm = d.get("name") or d.get("planet") or d.get("id") or d.get("point")
                return str(nm).lower() if nm else None
            return None

        if isinstance(ac, list):
            for it in ac:
                d = it if isinstance(it, dict) else _safe_obj_to_dict(it)
                if not isinstance(d, dict):
                    continue
                p1 = _norm_p(d.get("p1") or d.get("planet1") or d.get("first") or d.get("from"))
                p2 = _norm_p(d.get("p2") or d.get("planet2") or d.get("second") or d.get("to"))
                asp = d.get("aspect") or d.get("type") or d.get("name")
                orb = d.get("orb") or d.get("difference") or d.get("delta")
                if not (p1 and p2 and asp):
                    continue
                try:
                    orb_f = float(orb) if orb is not None else None
                except Exception:
                    orb_f = None
                aspects_out.append({"p1": p1, "p2": p2, "aspect": str(asp).lower(), "orb": orb_f})

        # IMPORTANT: always include keys even if empty
        return {
            "chart_type": "Natal",
            "planets": planets_out,
            "angles": angles_out,
            "houses": houses_out,
            "aspects": aspects_out,
            "subject": subject_dump if isinstance(subject_dump, dict) else {"value": subject_dump},
        }


class ChartDataFactory:
    """
    Stable natal dict for key_builder.

    Output contract (key_builder-friendly):
      - chart_type: "Natal"
      - planets: dict[str, {"sign": str|None, "house": int|None}]
      - angles: dict[str, {"sign": str|None}]
      - houses: dict[str(int)], {"sign": str|None}
      - aspects: list[{"p1": str, "p2": str, "aspect": str, "orb": float|None}]
      - subject: raw subject dump (debug/compat)
    """

    PLANETS = (
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
        "chiron",
        "north_node",
        "south_node",
    )

    ANGLE_ATTRS = {
        "asc": ("ascendant", "asc", "ascendant_point"),
        "mc": ("medium_coeli", "mc", "midheaven"),
        "dsc": ("descendant", "dsc", "dc"),
        "ic": ("imum_coeli", "ic"),
    }

    @staticmethod
    def _pick_sign(node: Any) -> str | None:
        d = node if isinstance(node, dict) else _safe_obj_to_dict(node)
        if not isinstance(d, dict):
            return None
        s = d.get("sign") or d.get("sign_key") or d.get("zodiac_sign") or d.get("zodiac")
        if isinstance(s, dict):
            return (s.get("key") or s.get("name") or s.get("sign")) if isinstance(s, dict) else None
        return str(s).lower() if s else None

    @staticmethod
    def _pick_house(node: Any) -> int | None:
        d = node if isinstance(node, dict) else _safe_obj_to_dict(node)
        if not isinstance(d, dict):
            return None
        h = d.get("house") or d.get("house_number") or d.get("house_num")
        try:
            return int(h)
        except Exception:
            return None

    @staticmethod
    def _get_attr(subject: Any, *names: str) -> Any:
        for n in names:
            if hasattr(subject, n):
                try:
                    return getattr(subject, n)
                except Exception:
                    continue
        return None

    @staticmethod
    def natal_chart_data(subject: Any) -> dict[str, Any]:
        # Best-effort: force lazy computations (kerykeion differs by version)
        for meth in (
            "get_planets",
            "get_houses",
            "get_aspects",
            "get_all_aspects",
            "make_chart",
            "calculate_chart",
            "calc_chart",
            "build_chart",
            "to_json",
            "json",
        ):
            fn = getattr(subject, meth, None)
            if callable(fn):
                try:
                    fn()
                except Exception:
                    pass
        subject_dump = _safe_obj_to_dict(subject)
        dump_planets = None
        dump_houses = None
        dump_aspects = None
        dump_angles = None
        if isinstance(subject_dump, dict):
            dump_planets = subject_dump.get("planets") or subject_dump.get("planets_dict")
            dump_houses = subject_dump.get("houses") or subject_dump.get("houses_dict") or subject_dump.get("houses_cusps")
            dump_aspects = subject_dump.get("aspects") or subject_dump.get("aspects_list")
            dump_angles = subject_dump.get("angles")

        planets_out: dict[str, dict[str, Any]] = {}
        for p in ChartDataFactory.PLANETS:
            node = ChartDataFactory._get_attr(subject, p)

            if node is None and isinstance(subject_dump, dict):
                node = subject_dump.get(p)

            if node is None and isinstance(dump_planets, dict):
                node = dump_planets.get(p)

            if node is None:
                continue

            planets_out[p] = {
                "sign": ChartDataFactory._pick_sign(node),
                "house": ChartDataFactory._pick_house(node),
            }

        planets_container = (
            ChartDataFactory._get_attr(subject, "planets", "planets_list")
            or dump_planets
        )
        pc = _safe_obj_to_dict(planets_container)
        if isinstance(pc, dict):
            for k, v in pc.items():
                pk = str(k).lower()
                if pk in ChartDataFactory.PLANETS and pk not in planets_out:
                    planets_out[pk] = {"sign": ChartDataFactory._pick_sign(v), "house": ChartDataFactory._pick_house(v)}
        elif isinstance(pc, list):
            for it in pc:
                d = it if isinstance(it, dict) else _safe_obj_to_dict(it)
                if not isinstance(d, dict):
                    continue
                name = (d.get("name") or d.get("planet") or d.get("id") or "").strip().lower()
                if name in ChartDataFactory.PLANETS and name not in planets_out:
                    planets_out[name] = {"sign": ChartDataFactory._pick_sign(d), "house": ChartDataFactory._pick_house(d)}

        angles_out: dict[str, dict[str, Any]] = {}
        for a, attrs in ChartDataFactory.ANGLE_ATTRS.items():
            node = ChartDataFactory._get_attr(subject, *attrs)
            if node is None and isinstance(subject_dump, dict):
                for cand in attrs:
                    if cand in subject_dump:
                        node = subject_dump.get(cand)
                        break
            if node is None and isinstance(dump_angles, dict):
                # dump_angles expected like {"asc":{"sign":...}, "mc":{...}}
                node = dump_angles.get(a)        
            if node is None:
                continue
            angles_out[a] = {"sign": ChartDataFactory._pick_sign(node)}

        houses_out: dict[str, dict[str, Any]] = {}
        houses_container = (
            ChartDataFactory._get_attr(subject, "houses", "houses_list", "house")
            or dump_houses
        )
        hc = _safe_obj_to_dict(houses_container)
        if isinstance(hc, dict):
            for k, v in hc.items():
                try:
                    hk = str(int(k))
                except Exception:
                    continue
                houses_out[hk] = {"sign": ChartDataFactory._pick_sign(v)}
        elif isinstance(hc, list):
            for it in hc:
                d = it if isinstance(it, dict) else _safe_obj_to_dict(it)
                if not isinstance(d, dict):
                    continue
                h = d.get("house") or d.get("number") or d.get("id")
                try:
                    hk = str(int(h))
                except Exception:
                    continue
                houses_out[hk] = {"sign": ChartDataFactory._pick_sign(d)}

        aspects_out: list[dict[str, Any]] = []
        aspects_container = (
            ChartDataFactory._get_attr(subject, "aspects", "aspects_list")
            or dump_aspects
        )
        ac = _safe_obj_to_dict(aspects_container)

        def _norm_p(x: Any) -> str | None:
            if not x:
                return None
            if isinstance(x, str):
                return x.lower()
            d = x if isinstance(x, dict) else _safe_obj_to_dict(x)
            if isinstance(d, dict):
                nm = (d.get("name") or d.get("planet") or d.get("id") or d.get("point") or "")
                return str(nm).lower() if nm else None
            return None

        if isinstance(ac, list):
            for it in ac:
                d = it if isinstance(it, dict) else _safe_obj_to_dict(it)
                if not isinstance(d, dict):
                    continue
                p1 = _norm_p(d.get("p1") or d.get("planet1") or d.get("first") or d.get("from"))
                p2 = _norm_p(d.get("p2") or d.get("planet2") or d.get("second") or d.get("to"))
                asp = d.get("aspect") or d.get("type") or d.get("name")
                orb = d.get("orb") or d.get("difference") or d.get("delta")
                if not (p1 and p2 and asp):
                    continue
                try:
                    orb_f = float(orb) if orb is not None else None
                except Exception:
                    orb_f = None
                aspects_out.append({"p1": p1, "p2": p2, "aspect": str(asp).lower(), "orb": orb_f})

        return {
            "chart_type": "Natal",
            "planets": planets_out,
            "angles": angles_out,
            "houses": houses_out,
            "aspects": aspects_out,
            "subject": subject_dump,
        }

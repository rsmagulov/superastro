# astroprocessor/app/astro/kerykeion_factories.py
from __future__ import annotations

from dataclasses import asdict, is_dataclass
from pathlib import Path
from typing import Any, Optional


def _try_set_swisseph_path(ephemeris_path: str | None) -> None:
    if not ephemeris_path:
        return
    p = Path(str(ephemeris_path))
    if not p.is_absolute():
        p = p.resolve()
    if not p.exists():
        return
    try:
        import swisseph as swe  # type: ignore

        swe.set_ephe_path(str(p))
    except Exception:
        return


def _import_kerykeion_subject_class():
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
    Internal subject factory that tolerates multiple kerykeion versions
    by trying different ctor kwargs (lng/lon/timezone).
    """

    @staticmethod
    def create(
        *,
        name: str,
        year: int,
        month: int,
        day: int,
        hour: int,
        minute: int,
        lat: float,
        lon: float,
        tz_str: str,
        houses_system_identifier: str = "P",
        ephemeris_path: str | None = None,
    ) -> Any:
        _try_set_swisseph_path(ephemeris_path)
        Subject = _import_kerykeion_subject_class()

        kwargs_variants: list[dict[str, Any]] = [
            {
                "name": name,
                "year": year,
                "month": month,
                "day": day,
                "hour": hour,
                "minute": minute,
                "lat": lat,
                "lng": lon,
                "tz_str": tz_str,
                "houses_system_identifier": houses_system_identifier,
            },
            {
                "name": name,
                "year": year,
                "month": month,
                "day": day,
                "hour": hour,
                "minute": minute,
                "lat": lat,
                "lon": lon,
                "tz_str": tz_str,
                "houses_system_identifier": houses_system_identifier,
            },
            {
                "name": name,
                "year": year,
                "month": month,
                "day": day,
                "hour": hour,
                "minute": minute,
                "lat": lat,
                "lng": lon,
                "timezone": tz_str,
                "houses_system_identifier": houses_system_identifier,
            },
        ]

        last_err: Optional[Exception] = None
        for kwargs in kwargs_variants:
            try:
                return Subject(**kwargs)
            except Exception as e:
                last_err = e
                continue

        raise RuntimeError(f"Failed to create AstrologicalSubject: {last_err}") from last_err


class ChartDataFactory:
    """
    Key-builder contract (MUST be present):
      - chart_type: "Natal"
      - planets: dict
      - angles: dict
      - houses: dict
      - aspects: list
      - subject: dict
      - __probe: debug info to see what kerykeion реально отдаёт
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
        "lilith",
    )

    ANGLE_ATTRS = {
        "asc": ("ascendant", "asc", "ascendant_point"),
        "mc": ("medium_coeli", "mc", "midheaven"),
        "dsc": ("descendant", "dsc", "dc"),
        "ic": ("imum_coeli", "ic"),
    }

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
    def _pick_sign(node: Any) -> str | None:
        d = node if isinstance(node, dict) else _safe_obj_to_dict(node)
        if not isinstance(d, dict):
            return None
        s = d.get("sign") or d.get("sign_key") or d.get("zodiac_sign") or d.get("zodiac")
        if isinstance(s, dict):
            s = s.get("key") or s.get("name") or s.get("sign")
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
    def natal_chart_data(subject: Any) -> dict[str, Any]:
        # 0) Force lazy computations (differs by kerykeion version)
        for meth in (
            "get_planets",
            "get_houses",
            "get_aspects",
            "get_all_aspects",
            "make_chart",
            "calculate_chart",
            "calc_chart",
            "build_chart",
        ):
            fn = getattr(subject, meth, None)
            if callable(fn):
                try:
                    fn()
                except Exception:
                    pass

        # 1) Prefer JSON dumps if present (often contains planets/houses)
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

        subject_dump = _safe_obj_to_dict(subject)
        json_dump = _try_json_dump()
        if isinstance(json_dump, dict) and json_dump:
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

        # 2) Normalize planets (ALWAYS include key in return, even if empty)
        planets_out: dict[str, dict[str, Any]] = {}
        for p in ChartDataFactory.PLANETS:
            node = ChartDataFactory._get_attr(subject, p)
            if node is None and isinstance(subject_dump, dict):
                node = subject_dump.get(p)
            if node is None and isinstance(dump_planets, dict):
                node = dump_planets.get(p)
            if node is None:
                continue
            planets_out[p] = {"sign": ChartDataFactory._pick_sign(node), "house": ChartDataFactory._pick_house(node)}

        planets_container = ChartDataFactory._get_attr(subject, "planets", "planets_list") or dump_planets
        pc = _safe_obj_to_dict(planets_container)
        if isinstance(pc, dict):
            for k, v in pc.items():
                pk = str(k).lower()
                if pk and pk not in planets_out:
                    planets_out[pk] = {"sign": ChartDataFactory._pick_sign(v), "house": ChartDataFactory._pick_house(v)}

        # 3) angles
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

        # 4) houses (cusps)
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

        # 5) aspects
        aspects_out: list[dict[str, Any]] = []
        aspects_container = ChartDataFactory._get_attr(subject, "aspects", "aspects_list") or dump_aspects
        ac = _safe_obj_to_dict(aspects_container)
        if isinstance(ac, list):
            for it in ac:
                d = it if isinstance(it, dict) else _safe_obj_to_dict(it)
                if not isinstance(d, dict):
                    continue
                p1 = d.get("p1") or d.get("planet1") or d.get("first") or d.get("from")
                p2 = d.get("p2") or d.get("planet2") or d.get("second") or d.get("to")
                asp = d.get("aspect") or d.get("type") or d.get("name")
                if not (p1 and p2 and asp):
                    continue
                aspects_out.append(
                    {"p1": str(p1).lower(), "p2": str(p2).lower(), "aspect": str(asp).lower(), "orb": d.get("orb")}
                )

        # Probe: покажет, что реально есть у subject и subject_dump
        probe = {
            "subject_type": str(type(subject)),
            "has_attr_planets": hasattr(subject, "planets"),
            "has_attr_sun": hasattr(subject, "sun"),
            "subject_dump_is_dict": isinstance(subject_dump, dict),
            "subject_dump_keys_sample": list(subject_dump.keys())[:40] if isinstance(subject_dump, dict) else [],
            "dump_planets_type": str(type(dump_planets)),
            "dump_houses_type": str(type(dump_houses)),
            "dump_aspects_type": str(type(dump_aspects)),
        }

        return {
            "chart_type": "Natal",
            "planets": planets_out,
            "angles": angles_out,
            "houses": houses_out,
            "aspects": aspects_out,
            "subject": subject_dump if isinstance(subject_dump, dict) else {"value": subject_dump},
            "__probe": probe,
        }
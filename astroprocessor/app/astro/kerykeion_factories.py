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
        """
        Returns canonical sign slug used by key_builder.SIGNS:
        aries, taurus, gemini, cancer, leo, virgo, libra,
        scorpio, sagittarius, capricorn, aquarius, pisces.

        Accepts kerykeion variants:
        - "Cap" / "cap"
        - "Capricorn"
        - {"key": "cap"} / {"name": "Capricorn"} etc.
        """
        SIGN_ALIASES: dict[str, str] = {
            "ari": "aries",
            "tau": "taurus",
            "gem": "gemini",
            "can": "cancer",
            "leo": "leo",
            "vir": "virgo",
            "lib": "libra",
            "sco": "scorpio",
            "sag": "sagittarius",
            "cap": "capricorn",
            "aqu": "aquarius",
            "pis": "pisces",
        }

        d = node if isinstance(node, dict) else _safe_obj_to_dict(node)
        if not isinstance(d, dict):
            return None

        s = d.get("sign") or d.get("sign_key") or d.get("zodiac_sign") or d.get("zodiac")
        if isinstance(s, dict):
            s = s.get("key") or s.get("name") or s.get("sign")

        if not s:
            return None

        raw = str(s).strip().lower()

        # full names already ok
        if raw in SIGN_ALIASES.values():
            return raw

        # 3-letter aliases
        if raw in SIGN_ALIASES:
            return SIGN_ALIASES[raw]

        # sometimes "Capricorn" comes as "capricorn" or "Capricorn"
        # keep anything else as-is (but normalized), upstream may still use it in probes
        return raw
    
    @staticmethod
    def _compute_aspects_from_subject_dump(subject_dump: dict[str, Any]) -> list[dict[str, Any]]:
        """
        Compute major aspects from planet longitudes if present in subject dump.

        Expected planet nodes live at subject_dump[planet_key] (e.g. "sun") with any of fields:
        - "position" / "abs_pos" / "longitude" / "lon" / "ecliptic_longitude"
        Returns list like:
        {"p1":"sun","p2":"moon","aspect":"square","orb":1.2}
        """
        import math

        def _get_lon(node: Any) -> float | None:
            d = node if isinstance(node, dict) else _safe_obj_to_dict(node)
            if not isinstance(d, dict):
                return None

            for k in ("abs_pos", "position", "longitude", "lon", "ecliptic_longitude"):
                v = d.get(k)
                if isinstance(v, (int, float)):
                    return float(v) % 360.0
                if isinstance(v, str):
                    try:
                        return float(v) % 360.0
                    except Exception:
                        pass

            return None

        # major aspects (degrees)
        aspect_angles: dict[str, float] = {
            "conjunction": 0.0,
            "sextile": 60.0,
            "square": 90.0,
            "trine": 120.0,
            "opposition": 180.0,
        }

        # orb default (degrees)
        orb = 6.0

        # pick planet keys (same strict vocab as key_builder uses)
        planet_keys = [
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
        ]

        pos: dict[str, float] = {}
        for p in planet_keys:
            if p in subject_dump:
                lon = _get_lon(subject_dump.get(p))
                if lon is not None:
                    pos[p] = lon

        out: list[dict[str, Any]] = []
        keys = list(pos.keys())
        for i in range(len(keys)):
            for j in range(i + 1, len(keys)):
                p1, p2 = keys[i], keys[j]
                d = abs(pos[p1] - pos[p2]) % 360.0
                if d > 180.0:
                    d = 360.0 - d

                best_name: str | None = None
                best_orb: float | None = None

                for name, ang in aspect_angles.items():
                    o = abs(d - ang)
                    if o <= orb and (best_orb is None or o < best_orb):
                        best_name, best_orb = name, o

                if best_name is not None and best_orb is not None:
                    out.append({"p1": p1, "p2": p2, "aspect": best_name, "orb": round(best_orb, 2)})

        # keep “stronger” aspects first (lower orb)
        out.sort(key=lambda x: float(x.get("orb") or 999.0))
        return out

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
        """
        Contract (MUST be present in returned dict):
        - chart_type: "Natal"
        - planets: dict
        - angles: dict
        - houses: dict
        - aspects: list
        - subject: dict
        - __probe: debug info

        Goals:
        - Never fail (no 500)
        - Always return stable keys planets/angles/houses/aspects (even empty)
        - Parse houses from first_house..twelfth_house (kerykeion.backword)
        - Best-effort aspects (only if available from dumps)
        """
        planets_out: dict[str, dict[str, Any]] = {}
        angles_out: dict[str, dict[str, Any]] = {}
        houses_out: dict[str, dict[str, Any]] = {}
        aspects_out: list[dict[str, Any]] = []

        probe: dict[str, Any] = {
            "subject_type": str(type(subject)),
            "subject_class": getattr(getattr(subject, "__class__", None), "__name__", None),
            "subject_module": getattr(getattr(subject, "__class__", None), "__module__", None),
        }

        HOUSE_KEY_TO_NUM: dict[str, int] = {
            "first_house": 1,
            "second_house": 2,
            "third_house": 3,
            "fourth_house": 4,
            "fifth_house": 5,
            "sixth_house": 6,
            "seventh_house": 7,
            "eighth_house": 8,
            "ninth_house": 9,
            "tenth_house": 10,
            "eleventh_house": 11,
            "twelfth_house": 12,
        }

        def _len(x: Any) -> int | None:
            try:
                return len(x)  # type: ignore[arg-type]
            except Exception:
                return None

        def _house_name_to_num(v: Any) -> int | None:
            if v is None:
                return None
            s = str(v).strip().lower()
            if s in HOUSE_KEY_TO_NUM:
                return HOUSE_KEY_TO_NUM[s]
            if s.endswith("_house") and s in HOUSE_KEY_TO_NUM:
                return HOUSE_KEY_TO_NUM[s]
            return None

        def _pick_house_any(node: Any) -> int | None:
            # 1) normal numeric keys
            h = ChartDataFactory._pick_house(node)
            if h:
                return h

            d = node if isinstance(node, dict) else _safe_obj_to_dict(node)
            if not isinstance(d, dict):
                return None

            # 2) house may be encoded as "first_house"/etc
            for k in ("house_key", "house_name", "house", "domicile_house"):
                if k in d:
                    hn = _house_name_to_num(d.get(k))
                    if hn:
                        return hn

            return None

        def _try_json_dump() -> dict[str, Any] | None:
            import json as _json

            for meth in ("to_json", "json"):
                fn = getattr(subject, meth, None)
                if not callable(fn):
                    continue
                try:
                    raw = fn()
                    probe[f"{meth}_ok"] = True
                    probe[f"{meth}_type"] = str(type(raw))

                    if isinstance(raw, str):
                        parsed = _json.loads(raw)
                        if isinstance(parsed, dict):
                            probe[f"{meth}_keys_sample"] = list(parsed.keys())[:120]
                            return parsed
                        return None

                    if isinstance(raw, dict):
                        probe[f"{meth}_keys_sample"] = list(raw.keys())[:120]
                        return raw
                except Exception as e:
                    probe[f"{meth}_ok"] = False
                    probe[f"{meth}_err"] = f"{type(e).__name__}: {e}"
            return None

        try:
            # 0) Force computations (some versions)
            compute_attempts: list[dict[str, Any]] = []
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
                if not callable(fn):
                    continue
                try:
                    ret = fn()
                    compute_attempts.append({"meth": meth, "ok": True, "ret_type": str(type(ret))})
                except Exception as e:
                    compute_attempts.append({"meth": meth, "ok": False, "err": f"{type(e).__name__}: {e}"})
            probe["compute_attempts"] = compute_attempts

            # 1) Dump
            subject_dump = _safe_obj_to_dict(subject)
            json_dump = _try_json_dump()

            if isinstance(json_dump, dict) and json_dump:
                if isinstance(subject_dump, dict):
                    merged = dict(subject_dump)
                    merged.update(json_dump)
                    subject_dump = merged
                else:
                    subject_dump = json_dump

            probe["subject_dump_type"] = str(type(subject_dump))
            if isinstance(subject_dump, dict):
                probe["subject_dump_keys_sample"] = list(subject_dump.keys())[:160]

            # 2) Wide-net containers
            dump_planets = dump_houses = dump_aspects = dump_angles = None
            if isinstance(subject_dump, dict):
                dump_planets = (
                    subject_dump.get("planets")
                    or subject_dump.get("planets_dict")
                    or subject_dump.get("objects")
                    or subject_dump.get("bodies")
                    or subject_dump.get("celestial_bodies")
                    or subject_dump.get("points")
                )
                dump_houses = (
                    subject_dump.get("houses")
                    or subject_dump.get("houses_dict")
                    or subject_dump.get("houses_cusps")
                    or subject_dump.get("cusps")
                )
                dump_aspects = subject_dump.get("aspects") or subject_dump.get("aspects_list")
                dump_angles = subject_dump.get("angles")

            probe["has_attr_sun"] = hasattr(subject, "sun")
            probe["has_attr_planets"] = hasattr(subject, "planets")
            probe["has_attr_houses"] = hasattr(subject, "houses")
            probe["has_attr_aspects"] = hasattr(subject, "aspects")
            probe["dump_planets_type"] = str(type(dump_planets))
            probe["dump_houses_type"] = str(type(dump_houses))
            probe["dump_aspects_type"] = str(type(dump_aspects))
            probe["dump_angles_type"] = str(type(dump_angles))

            # 3) Planets
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
                    "house": _pick_house_any(node),
                }

            # 4) Angles
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

            # 5) Houses – standard container if exists
            houses_container = ChartDataFactory._get_attr(subject, "houses", "houses_list", "house") or dump_houses
            hc = _safe_obj_to_dict(houses_container)
            if isinstance(hc, dict):
                for k, v in hc.items():
                    try:
                        hk = str(int(k))
                    except Exception:
                        continue
                    houses_out[hk] = {"sign": ChartDataFactory._pick_sign(v)}
                    houses_out = {k: v for k, v in houses_out.items() if k in {str(i) for i in range(1, 13)}}

            # 5b) Houses – kerykeion.backword fallback: first_house..twelfth_house
            if not houses_out and isinstance(subject_dump, dict):
                for hk, num in HOUSE_KEY_TO_NUM.items():
                    if hk not in subject_dump:
                        continue
                    node = subject_dump.get(hk)
                    houses_out[str(num)] = {"sign": ChartDataFactory._pick_sign(node)}
                probe["houses_from_named_keys"] = True

            # 6) Aspects (only if present)
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

            probe["out_counts"] = {
                "planets": len(planets_out),
                "angles": len(angles_out),
                "houses": len(houses_out),
                "aspects": len(aspects_out),
            }

            subject_out = subject_dump if isinstance(subject_dump, dict) else {"value": subject_dump}
            if not aspects_out and isinstance(subject_dump, dict):
                computed = ChartDataFactory._compute_aspects_from_subject_dump(subject_dump)
                if computed:
                    aspects_out = computed
                    probe["aspects_computed"] = True
                    probe["aspects_computed_count"] = len(aspects_out)

        except Exception as e:
            probe["fatal_err"] = f"{type(e).__name__}: {e}"
            subject_out = {"value": _safe_obj_to_dict(subject)}

        return {
            "chart_type": "Natal",
            "planets": planets_out,
            "angles": angles_out,
            "houses": houses_out,
            "aspects": aspects_out,
            "subject": subject_out,
            "__probe": probe,
        }
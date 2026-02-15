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
    """
    Convert Kerykeion objects to JSON-like structures.

    Goal: produce a stable, serialization-friendly dict without depending
    on a specific Kerykeion internal schema.
    """
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

    # Some Kerykeion objects may expose .dict()/.model_dump()
    for meth in ("model_dump", "dict"):
        m = getattr(obj, meth, None)
        if callable(m):
            try:
                return _safe_obj_to_dict(m())
            except Exception:
                pass

    # Fallback: public attrs
    if hasattr(obj, "__dict__"):
        out: dict[str, Any] = {}
        for k, v in obj.__dict__.items():
            if k.startswith("_"):
                continue
            try:
                out[str(k)] = _safe_obj_to_dict(v)
            except Exception:
                # best-effort only
                continue
        if out:
            return out

    # last resort: string representation
    return str(obj)


class AstrologicalSubjectFactory:
    """
    One place to build Kerykeion AstrologicalSubject with deterministic config.
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
        """
        Build a Kerykeion AstrologicalSubject.

        Parameters are kept simple/primitives so the rest of the project
        doesn't depend on Kerykeion-specific types.
        """
        _try_set_swisseph_path(ephemeris_path)

        Subject = _import_kerykeion_subject_class()

        # Kerykeion versions differ slightly by argument names.
        # We try the most common constructor signatures.
        kwargs_variants: list[dict[str, Any]] = [
            # Variant A (most common in recent versions)
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
            # Variant B (some versions use "lon" not "lng")
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
            # Variant C (older style: "timezone" key)
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
    Produces a stable natals dict used downstream by key-builder and API.

    Contract: returned dict MUST contain:
      - chart_type: "Natal"

    Everything else is best-effort enrichment.
    """

    @staticmethod
    def natal_chart_data(subject: Any) -> dict[str, Any]:
        """
        Compute natal chart data from subject.

        Kerykeion may precompute data lazily. We try to trigger calculations
        by accessing common attributes if they exist.
        """
        # Try to trigger internal computations (different versions)
        for attr in (
            "planets",
            "houses",
            "aspects",
            "json",
            "to_json",
            "get_chart",
            "make_chart",
        ):
            v = getattr(subject, attr, None)
            try:
                if callable(v):
                    _ = v()
                else:
                    _ = v
            except Exception:
                # ignore; we still can serialize subject state
                pass

        out: dict[str, Any] = {
            "chart_type": "Natal",
            "subject": _safe_obj_to_dict(subject),
        }

        # Add common “nice-to-have” fields if present
        for key, candidate_attrs in {
            "name": ("name",),
            "datetime": ("utc_datetime", "local_datetime", "datetime", "date_time"),
            "tz_str": ("tz_str", "timezone"),
            "lat": ("lat",),
            "lon": ("lng", "lon"),
            "houses_system_identifier": ("houses_system_identifier", "houses_system", "hsys"),
            "planets": ("planets", "planets_list"),
            "houses": ("houses", "houses_list", "house"),
            "aspects": ("aspects", "aspects_list"),
        }.items():
            for attr in candidate_attrs:
                if hasattr(subject, attr):
                    try:
                        out[key] = _safe_obj_to_dict(getattr(subject, attr))
                        break
                    except Exception:
                        continue

        return out

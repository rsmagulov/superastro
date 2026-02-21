# astroprocessor/app/astro/kerykeion_adapter.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, Optional

import swisseph as swe  # pyswisseph
from kerykeion import AstrologicalSubjectFactory as KerykeionSubjectFactory

from app.astro.kerykeion_factories import AstrologicalSubjectFactory, ChartDataFactory
from app.schemas.place import PlaceResolved


@dataclass(frozen=True)
class BirthData:
    year: int
    month: int
    day: int
    hour: int
    minute: int
    time_unknown: bool


class KerykeionAdapter:
    def __init__(self, ephemeris_path: Optional[str] = None) -> None:
        self._ephemeris_path = ephemeris_path
        if ephemeris_path:
            swe.set_ephe_path(ephemeris_path)

    def build_subject(
        self,
        name: str,
        birth: BirthData,
        place: PlaceResolved,
        *,
        zodiac_type: str = "Tropical",
        houses_system_identifier: str = "P",
        perspective_type: str = "Apparent Geocentric",
        active_points: Optional[list[str]] = None,
    ):
        place.require_ready()

        # 1) Prefer internal factory (version-tolerant)
        try:
            return AstrologicalSubjectFactory.create(
                name=name,
                year=birth.year,
                month=birth.month,
                day=birth.day,
                hour=birth.hour,
                minute=birth.minute,
                lat=float(place.lat),
                lon=float(place.lon),
                tz_str=str(place.tz_str),
                houses_system_identifier=houses_system_identifier,
                ephemeris_path=self._ephemeris_path,
            )
        except Exception:
            # 2) Fallback to kerykeion factory (some installs support this better)
            return KerykeionSubjectFactory.from_birth_data(
                name=name,
                year=birth.year,
                month=birth.month,
                day=birth.day,
                hour=birth.hour,
                minute=birth.minute,
                lng=float(place.lon),
                lat=float(place.lat),
                tz_str=str(place.tz_str),
                online=False,
                zodiac_type=zodiac_type,
                houses_system_identifier=houses_system_identifier,
                perspective_type=perspective_type,
                active_points=active_points,
            )

    def natal_chart_data(self, subject: Any) -> Dict[str, Any]:
        return ChartDataFactory.natal_chart_data(subject)

    def pick_time_for_unknown_birthtime(
        self,
        *,
        name: str,
        year: int,
        month: int,
        day: int,
        place: PlaceResolved,
        zodiac_type: str = "Tropical",
    ) -> tuple[int, int]:
        place.require_ready()
        return (12, 0)
# astroprocessor/app/astro/kerykeion_adapter.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, Optional

import swisseph as swe  # pyswisseph
from kerykeion import AstrologicalSubjectFactory, ChartDataFactory

from ..schemas.place import PlaceResolved


@dataclass(frozen=True)
class BirthData:
    """Данные пользователя после FSM."""

    year: int
    month: int
    day: int
    hour: int
    minute: int
    time_unknown: bool


class KerykeionAdapter:
    """
    Адаптер над Kerykeion, оффлайн-режим:
    - НЕ использует GeoNames
    - принимает lat/lon/tz_str, уже рассчитанные снаружи
    """

    def __init__(self, ephemeris_path: Optional[str] = None) -> None:
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

        subject = AstrologicalSubjectFactory.from_birth_data(
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
        return subject

    def natal_chart_data(self, subject) -> Dict[str, Any]:
        data_model = ChartDataFactory.create_natal_chart_data(subject)
        return data_model.model_dump()

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

        best = (12, 0)
        try:
            sun_probe = AstrologicalSubjectFactory.from_birth_data(
                name=name,
                year=year,
                month=month,
                day=day,
                hour=12,
                minute=0,
                lng=float(place.lon),
                lat=float(place.lat),
                tz_str=str(place.tz_str),
                online=False,
                zodiac_type=zodiac_type,
                houses_system_identifier="E",
            )
            target_sun_sign = sun_probe.sun.sign

            for h in range(0, 24):
                for m in range(0, 60, 10):
                    s = AstrologicalSubjectFactory.from_birth_data(
                        name=name,
                        year=year,
                        month=month,
                        day=day,
                        hour=h,
                        minute=m,
                        lng=float(place.lon),
                        lat=float(place.lat),
                        tz_str=str(place.tz_str),
                        online=False,
                        zodiac_type=zodiac_type,
                        houses_system_identifier="E",
                    )
                    if s.ascendant.sign == target_sun_sign:
                        return (h, m)

            return best
        except Exception:
            return best

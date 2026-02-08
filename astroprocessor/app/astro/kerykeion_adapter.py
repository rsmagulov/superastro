from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Dict, Any

import swisseph as swe  # pyswisseph

from kerykeion import AstrologicalSubjectFactory, ChartDataFactory


@dataclass(frozen=True)
class PlaceResolved:
    """Результат resolve_place() (Nominatim + timezonefinder)."""
    query: str
    display_name: str
    lat: float
    lon: float
    tz_str: str  # например: "Asia/Almaty"
    country_code: Optional[str] = None  # опционально


@dataclass(frozen=True)
class BirthData:
    """Данные пользователя после FSM."""
    year: int
    month: int
    day: int
    hour: int
    minute: int
    # seconds можно добавить, если надо
    time_unknown: bool  # True если пользователь нажал "Не знаю"


class KerykeionAdapter:
    """
    Адаптер над Kerykeion, который работает ТОЛЬКО оффлайн:
    - НЕ использует GeoNames
    - принимает lat/lon/tz_str, которые ты уже посчитал
    """

    def __init__(self, ephemeris_path: Optional[str] = None) -> None:
        # Подключаем Swiss Ephemeris файлы (если путь задан).
        # Важно: swe.set_ephe_path должен получать путь к папке с .se1 файлами.
        if ephemeris_path:
            swe.set_ephe_path(ephemeris_path)

    def build_subject(
        self,
        name: str,
        birth: BirthData,
        place: PlaceResolved,
        *,
        zodiac_type: str = "Tropical",
        houses_system_identifier: str = "P",  # Placidus по умолчанию
        perspective_type: str = "Apparent Geocentric",
        active_points: Optional[list[str]] = None,
    ):
        """
        Собирает AstrologicalSubject через фабрику в оффлайн-режиме.

        ВАЖНО: online=False + lng/lat/tz_str => GeoNames НЕ трогается.
        """
        # Если время неизвестно — тут пока НЕ “магия с асцендентом = Солнцу”.
        # Это отдельная функция-подстановка (ниже дам заготовку).
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
        """
        Строит “полные данные натала” (позиции/дома/аспекты/распределения и т.п.)
        Возвращаем как dict, чтобы удобно хранить/логировать/кешировать.
        """
        data_model = ChartDataFactory.create_natal_chart_data(subject)
        # Pydantic model -> dict
        return data_model.model_dump()

    # --- Опционально: заготовка твоей “внутренней подстановки” времени ---
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
        """
        Черновая “техническая” реализация под твое правило:
        - хотим подобрать время, чтобы Ascendant.sign == Sun.sign
        - и дальше использовать равнодомную/whole-sign логику

        Реально строго “Солнце в 1 доме” зависит от системы домов.
        Минимально-надёжно для MVP:
          1) подобрать время, где ASC знак = знак Солнца (грубый поиск)
          2) поставить houses_system_identifier="E" (Equal) или "W" (Whole Sign)

        Возвращает (hour, minute).
        """
        # Берём минутный шаг 10 минут, чтобы не убить производительность.
        # Можно сделать грубый поиск 0..23:50.
        best = (12, 0)  # fallback
        try:
            # Сначала узнаём знак Солнца на условном времени (например, 12:00)
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

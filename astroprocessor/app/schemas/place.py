# astroprocessor/app/schemas/place.py
from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class PlaceResolved:
    """
    Унифицированный результат resolve_place() для всего проекта.

    Важно:
    - tz_str: строка таймзоны (например "Asia/Almaty"), так её ожидает Kerykeion.
    - ok=False => остальное может быть None.
    """

    ok: bool
    query_raw: str
    query_norm: str
    locale: str

    display_name: str | None = None
    lat: float | None = None
    lon: float | None = None
    country_code: str | None = None
    tz_str: str | None = None

    source: str | None = None  # "cache" | "nominatim"
    error: str | None = None

    def require_ready(self) -> None:
        """
        Поднимает ValueError, если объект нельзя использовать для астрологических расчётов.
        """
        if not self.ok:
            raise ValueError(self.error or "place_not_resolved")
        if self.lat is None or self.lon is None:
            raise ValueError("place_missing_lat_lon")
        if not self.tz_str:
            raise ValueError("place_missing_tz")

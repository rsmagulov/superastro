# =========================================
# FILE: astroprocessor/app/schemas/birth.py
# =========================================
from __future__ import annotations

from datetime import date, time
from typing import Optional

from pydantic import BaseModel, Field

from ..astro.kerykeion_adapter import BirthData


class BirthInput(BaseModel):
    """
    Pydantic вход для API.

    Правила:
    - time может быть None, если unknown_time=True (в таком случае час/минута подберутся).
    - unknown_time=False => time обязателен.
    """

    date: date
    time: Optional[time] = None
    unknown_time: bool = Field(default=False)

    def to_domain(self) -> BirthData:
        if self.unknown_time:
            # будет подобрано в KerykeionAdapter.pick_time_for_unknown_birthtime()
            return BirthData(
                year=self.date.year,
                month=self.date.month,
                day=self.date.day,
                hour=12,
                minute=0,
                time_unknown=True,
            )

        if self.time is None:
            raise ValueError("birth.time is required when unknown_time=false")

        return BirthData(
            year=self.date.year,
            month=self.date.month,
            day=self.date.day,
            hour=int(self.time.hour),
            minute=int(self.time.minute),
            time_unknown=False,
        )



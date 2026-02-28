# ============================================================
# File: astroprocessor/app/schemas/birth.py
# ============================================================
from __future__ import annotations

import datetime as dt

from pydantic import BaseModel, Field, model_validator

from app.astro.kerykeion_adapter import BirthData


class BirthInput(BaseModel):
    """
    Вход для API → доменная BirthData.

    - unknown_time=True => time может быть None
    - unknown_time=False => time обязателен
    """

    date: dt.date
    time: dt.time | None = None
    unknown_time: bool = Field(default=False)

    @model_validator(mode="after")
    def _validate(self) -> "BirthInput":
        if self.unknown_time:
            return self
        if self.time is None:
            raise ValueError("birth.time is required when unknown_time=false")
        return self

    def to_domain(self) -> BirthData:
        if self.unknown_time:
            return BirthData(
                year=self.date.year,
                month=self.date.month,
                day=self.date.day,
                hour=12,
                minute=0,
                time_unknown=True,
            )

        t = self.time
        return BirthData(
            year=self.date.year,
            month=self.date.month,
            day=self.date.day,
            hour=int(t.hour),
            minute=int(t.minute),
            time_unknown=False,
        )
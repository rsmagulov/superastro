# astroprocessor/app/schemas/natal.py
from __future__ import annotations

import datetime as dt
from typing import Literal, Optional

from pydantic import BaseModel, model_validator

from .birth import BirthInput

TopicCategory = Literal[
    "personality_core",
    "psychology",
    "talents",
    "strengths_weaknesses",
    "purpose_path",
    "career",
    "money",
    "love_intimacy",
    "partnership_marriage",
    "karmic_tasks",
    "past_lives_symbolic",
    "emotional_world",
    "how_others_see_me",
    "self_esteem",
    "creativity",
    "ancestral_topics",
]


class BirthPayload(BaseModel):
    date: dt.date
    time: dt.time | None = None

    place_query: str
    gender: str
    unknown_time: bool = False

    @model_validator(mode="after")
    def _validate_time(self) -> "BirthPayload":
        if self.unknown_time:
            return self
        if self.time is None:
            raise ValueError("birth.time is required when unknown_time=false")
        return self

    def to_birth_input(self) -> BirthInput:
        return BirthInput(date=self.date, time=self.time, unknown_time=self.unknown_time)


class NatalRequest(BaseModel):
    name: str
    birth: BirthPayload
    topic_category: Optional[TopicCategory] = None

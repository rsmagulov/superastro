# =========================================
# FILE: astroprocessor/app/schemas/natal.py
# (ЗАМЕНИ СОДЕРЖИМОЕ ФАЙЛА ЦЕЛИКОМ)
# =========================================
from __future__ import annotations

from typing import Literal, Optional

from pydantic import BaseModel

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
    """
    Backward-compatible оболочка под твой текущий формат.

    Оставляем, чтобы не ломать клиента, но дальше внутри конвертируем в BirthInput.
    """

    date: BirthInput.model_fields["date"].annotation  # date
    time: BirthInput.model_fields["time"].annotation = None  # Optional[time]
    place_query: str
    gender: str
    unknown_time: bool = False

    def to_birth_input(self) -> BirthInput:
        return BirthInput(date=self.date, time=self.time, unknown_time=self.unknown_time)


class NatalRequest(BaseModel):
    name: str
    birth: BirthPayload
    topic_category: Optional[TopicCategory] = None
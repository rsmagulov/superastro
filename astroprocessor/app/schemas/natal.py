# app/schemas/natal.py
from __future__ import annotations

from datetime import date, time
from typing import Optional, Literal
from pydantic import BaseModel


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
    date: date
    time: Optional[time] = None
    place_query: str
    gender: str
    unknown_time: bool = False


class NatalRequest(BaseModel):
    name: str
    birth: BirthPayload
    topic_category: Optional[TopicCategory] = None

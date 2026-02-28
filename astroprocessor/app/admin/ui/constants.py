from typing import get_args

from app.schemas.natal import TopicCategory

TOPIC_CATEGORIES: list[str] = sorted(get_args(TopicCategory))

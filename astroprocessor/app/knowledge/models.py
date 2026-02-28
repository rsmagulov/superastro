from __future__ import annotations

from sqlalchemy import Column, Index, Integer, String, Text, UniqueConstraint
from sqlalchemy.orm import declarative_base

KnowledgeBase = declarative_base()


class KnowledgeItem(KnowledgeBase):
    __tablename__ = "knowledge_items"

    id = Column(Integer, primary_key=True, autoincrement=True)

    key = Column(String(255), nullable=False)
    topic_category = Column(String(100), nullable=False, default="")
    locale = Column(String(10), nullable=False, default="ru")
    text = Column(Text, nullable=False)
    priority = Column(Integer, nullable=False, default=100)

    __table_args__ = (
        UniqueConstraint(
            "key", "locale", "priority", name="uq_knowledge_key_locale_priority"
        ),
        Index("ix_knowledge_key_locale_priority", "key", "locale", "priority"),
        Index("ix_knowledge_topic_category", "topic_category"),
    )

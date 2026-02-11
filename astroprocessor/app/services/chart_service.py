# astroprocessor/app/services/chart_service.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, List, Optional

from sqlalchemy.ext.asyncio import AsyncSession

from app.astro.kerykeion_adapter import BirthData, KerykeionAdapter
from app.schemas.place import PlaceResolved
from app.astro.key_builder import build_knowledge_key_blocks
from app.services.knowledge_repo import KnowledgeHit, KnowledgeRepo



@dataclass(frozen=True)
class RawBlock:
    block_id: str
    knowledge_item_id: int
    key: str
    priority: int
    created_at: Optional[str]
    is_active: bool
    text: str
    tags: list
    weight: float


class ChartService:
    def __init__(self, *, ephemeris_path: str | None) -> None:
        self.k = KerykeionAdapter(ephemeris_path=ephemeris_path)
        self.repo = KnowledgeRepo()

    async def build_natal(self, *, user_name: str, birth: BirthData, place: PlaceResolved) -> dict:
        place.require_ready()

        if birth.time_unknown:
            h, m = self.k.pick_time_for_unknown_birthtime(
                name=user_name,
                year=birth.year,
                month=birth.month,
                day=birth.day,
                place=place,
            )
            birth = BirthData(
                year=birth.year,
                month=birth.month,
                day=birth.day,
                hour=h,
                minute=m,
                time_unknown=True,
            )
            houses_id = "E"
        else:
            houses_id = "P"

        subject = self.k.build_subject(
            name=user_name,
            birth=birth,
            place=place,
            houses_system_identifier=houses_id,
        )
        return self.k.natal_chart_data(subject)

    async def interpret_natal(
        self,
        *,
        session: AsyncSession,
        user_name: str,
        birth: BirthData,
        place: PlaceResolved,
        topic_category: str,
        locale: str,
        tone_namespace: str = "natal",
        max_blocks: int = 50,
        max_chars: int = 30_000,
    ) -> Dict[str, Any]:
        natal_data = await self.build_natal(user_name=user_name, birth=birth, place=place)

        knowledge_blocks = build_knowledge_key_blocks(
            natal_data,
            tone_namespace=tone_namespace,
        )

        raw_blocks: List[RawBlock] = []
        selection_trace: List[dict] = []
        hits_trace: List[dict] = []

        for kb in knowledge_blocks:
            selection_trace.append(
                {
                    "block_id": kb.id,
                    "candidate_keys": list(kb.candidate_keys),
                    "meta": kb.meta,
                }
            )

            hit: KnowledgeHit | None = await self.repo.pick_first_match(
                session,
                candidate_keys=kb.candidate_keys,
                topic_category=topic_category,
                locale=locale,
            )
            if not hit:
                continue

            raw_blocks.append(
                RawBlock(
                    block_id=kb.id,
                    knowledge_item_id=hit.id,
                    key=hit.key,
                    priority=hit.priority,
                    created_at=hit.created_at,
                    is_active=hit.is_active,
                    text=hit.text,
                    tags=[],
                    weight=1.0,
                )
            )
            hits_trace.append(
                {
                    "block_id": kb.id,
                    "key": hit.key,
                    "knowledge_item_id": hit.id,
                    "priority": hit.priority,
                    "created_at": hit.created_at,
                }
            )

        used: List[RawBlock] = []
        total_chars = 0
        for b in raw_blocks:
            if len(used) >= max_blocks:
                break
            if total_chars + len(b.text) > max_chars:
                break
            used.append(b)
            total_chars += len(b.text)

        final_text = "\n\n".join(b.text for b in used)
        final_meta = {
            "source": "raw.blocks",
            "mode": "concat_v0",
            "blocks_used": len(used),
            "budget": {"max_blocks": max_blocks, "max_chars": max_chars},
        }

        raw_blocks_dicts = [
            {
                "block_id": b.block_id,
                "knowledge_item_id": b.knowledge_item_id,
                "key": b.key,
                "priority": b.priority,
                "created_at": b.created_at,
                "is_active": b.is_active,
                "text": b.text,
                "tags": b.tags,
                "weight": b.weight,
            }
            for b in used
        ]
        knowledge_blocks_dump = [{"id": kb.id, "candidate_keys": kb.candidate_keys, "meta": kb.meta} for kb in knowledge_blocks]

        return {
            "natal_data": natal_data,
            "knowledge_blocks": knowledge_blocks_dump,
            "final_text": final_text,
            "raw_blocks": raw_blocks_dicts,
            "final_meta": final_meta,
            "trace": {"selection": selection_trace, "hits": hits_trace},
        }

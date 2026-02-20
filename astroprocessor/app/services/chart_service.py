# astroprocessor/app/services/chart_service.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, List, Optional, Sequence

from sqlalchemy.ext.asyncio import AsyncSession

from app.astro.kerykeion_adapter import BirthData, KerykeionAdapter
from app.astro.key_builder import KeyBlock, build_knowledge_key_blocks
from app.schemas.natal import InterpretRequest
from app.schemas.place_out import PlaceResolvedOut
from app.services.geocode import resolve_place
from app.services.knowledge_repo import KnowledgeHit, KnowledgeRepo
from app.services.meta_codec import build_response_meta
from app.services.natal_data_codec import to_plain_natal_data
from app.settings import settings


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
    def __init__(self, *, ephemeris_path: str | None = None) -> None:
        ephe = ephemeris_path if ephemeris_path is not None else settings.se_ephe_path
        self.k = KerykeionAdapter(ephemeris_path=ephe)
        self.repo = KnowledgeRepo()

    async def build_natal(self, *, user_name: str, birth: BirthData, place) -> dict:
        place.require_ready()

        houses_id = "A" if birth.time_unknown else "P"

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

        subject = self.k.build_subject(
            name=user_name,
            birth=birth,
            place=place,
            houses_system_identifier=houses_id,
        )
        natal_data_raw = self.k.natal_chart_data(subject)
        return to_plain_natal_data(natal_data_raw)

    def build_knowledge_blocks(self, *, natal_data: dict, tone_namespace: str = "natal") -> list[Any]:
        # Backward-compatible: old behavior (no topic_category here).
        return list(
            build_knowledge_key_blocks(
                natal_data,
                tone_namespace=tone_namespace,
                include_all_planets=True,
            )
        )

    def build_knowledge_blocks_for_topic(self, *, natal_data: dict, topic_category: str, tone_namespace: str = "natal") -> list[Any]:
        # New: topic-aware keygen.
        return list(
            build_knowledge_key_blocks(
                natal_data,
                tone_namespace=tone_namespace,
                include_all_planets=True,
                topic_category=topic_category,
            )
        )

    def _build_selection_trace(self, knowledge_blocks: Sequence[Any]) -> list[dict]:
        return [{"block_id": kb.id, "candidate_keys": list(kb.candidate_keys), "meta": kb.meta} for kb in knowledge_blocks]

    async def interpret_topics_with_blocks_batch(
        self,
        *,
        session: AsyncSession,
        knowledge_blocks: Sequence[Any],
        topic_categories: Sequence[str],
        locale: str,
        max_blocks: int = 50,
        max_chars: int = 30_000,
    ) -> dict[str, Dict[str, Any]]:
        selection_trace = self._build_selection_trace(knowledge_blocks)
        block_specs: list[tuple[str, Sequence[str]]] = [(kb.id, list(kb.candidate_keys)) for kb in knowledge_blocks]

        hits_by_topic_block = await self.repo.pick_first_matches_for_blocks_multi_topic(
            session,
            blocks=block_specs,
            topic_categories=[str(t) for t in topic_categories],
            locale=locale,
        )

        knowledge_blocks_dump = [{"id": kb.id, "candidate_keys": list(kb.candidate_keys), "meta": kb.meta} for kb in knowledge_blocks]

        out: dict[str, Dict[str, Any]] = {}
        for topic in [str(t) for t in topic_categories]:
            per_block = hits_by_topic_block.get(topic, {})

            hits_trace: List[dict] = []
            raw_blocks: List[RawBlock] = []

            for kb in knowledge_blocks:
                hit: KnowledgeHit | None = per_block.get(kb.id)
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
            final_meta = {"source": "raw.blocks", "mode": "concat_v0", "blocks_used": len(used), "budget": {"max_blocks": max_blocks, "max_chars": max_chars}}

            out[topic] = {
                "topic_category": topic,
                "final_text": final_text,
                "raw_blocks": [
                    {"block_id": b.block_id, "knowledge_item_id": b.knowledge_item_id, "key": b.key, "priority": b.priority, "created_at": b.created_at, "text": b.text}
                    for b in used
                ],
                "knowledge_blocks": knowledge_blocks_dump,
                "trace": {"selection": selection_trace, "hits": hits_trace},
                "final_meta": final_meta,
            }

        return out

    # --------- Backward-compatible wrappers (tests + /v1) ---------

    async def interpret_topic_with_blocks(
        self,
        *,
        session: AsyncSession,
        knowledge_blocks: Sequence[Any],
        topic_category: str,
        locale: str,
        max_blocks: int = 50,
        max_chars: int = 30_000,
    ) -> Dict[str, Any]:
        result = await self.interpret_topics_with_blocks_batch(
            session=session,
            knowledge_blocks=knowledge_blocks,
            topic_categories=[topic_category],
            locale=locale,
            max_blocks=max_blocks,
            max_chars=max_chars,
        )
        return result.get(str(topic_category), {"final_text": "", "raw_blocks": [], "trace": {"selection": [], "hits": []}})

    async def interpret_topic_with_natal_data(
        self,
        *,
        session: AsyncSession,
        natal_data: dict,
        topic_category: str,
        locale: str,
        tone_namespace: str = "natal",
        max_blocks: int = 50,
        max_chars: int = 30_000,
        topic_aware: bool = False,
    ) -> Dict[str, Any]:
        blocks = self.build_knowledge_blocks_for_topic(natal_data=natal_data, topic_category=topic_category, tone_namespace=tone_namespace) if topic_aware else self.build_knowledge_blocks(natal_data=natal_data, tone_namespace=tone_namespace)
        return await self.interpret_topic_with_blocks(
            session=session,
            knowledge_blocks=blocks,
            topic_category=topic_category,
            locale=locale,
            max_blocks=max_blocks,
            max_chars=max_chars,
        )

    async def interpret_topics_with_natal_data_batch(
        self,
        *,
        session: AsyncSession,
        natal_data: dict,
        topic_categories: Sequence[str],
        locale: str,
        tone_namespace: str = "natal",
        max_blocks: int = 50,
        max_chars: int = 30_000,
    ) -> Dict[str, Any]:
        """
        New: per-topic candidate_keys (topic-aware), but keeps old repo call signature.
        We do N topic-aware keygens, then query repo per-topic in batch (still 1 roundtrip).
        """
        topics = [str(t) for t in topic_categories]

        # Build blocks per topic with unique ids to avoid collisions
        block_specs: list[tuple[str, Sequence[str]]] = []
        blocks_dump_by_topic: dict[str, list[dict[str, Any]]] = {}
        selection_trace_by_topic: dict[str, list[dict[str, Any]]] = {}
        blocks_by_topic: dict[str, list[KeyBlock]] = {}

        for topic in topics:
            blocks = self.build_knowledge_blocks_for_topic(natal_data=natal_data, topic_category=topic, tone_namespace=tone_namespace)
            blocks_by_topic[topic] = blocks
            blocks_dump_by_topic[topic] = [{"id": b.id, "candidate_keys": list(b.candidate_keys), "meta": b.meta} for b in blocks]
            selection_trace_by_topic[topic] = [{"block_id": b.id, "candidate_keys": list(b.candidate_keys), "meta": b.meta} for b in blocks]
            for b in blocks:
                block_specs.append((f"{topic}:{b.id}", list(b.candidate_keys)))

        hits_by_topic_block = await self.repo.pick_first_matches_for_blocks_multi_topic(
            session,
            blocks=block_specs,
            topic_categories=topics,
            locale=locale,
        )

        out: dict[str, Dict[str, Any]] = {}
        for topic in topics:
            per_block = hits_by_topic_block.get(topic, {}) or {}

            hits_trace: List[dict] = []
            raw_blocks: List[RawBlock] = []

            for b in blocks_by_topic.get(topic, []):
                hit: KnowledgeHit | None = per_block.get(f"{topic}:{b.id}")
                if not hit:
                    continue
                raw_blocks.append(
                    RawBlock(
                        block_id=b.id,
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
                hits_trace.append({"block_id": b.id, "key": hit.key, "knowledge_item_id": hit.id, "priority": hit.priority, "created_at": hit.created_at})

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
            final_meta = {"source": "raw.blocks", "mode": "concat_v0", "blocks_used": len(used), "budget": {"max_blocks": max_blocks, "max_chars": max_chars}}

            out[topic] = {
                "topic_category": topic,
                "final_text": final_text,
                "raw_blocks": [{"block_id": b.block_id, "knowledge_item_id": b.knowledge_item_id, "key": b.key, "priority": b.priority, "created_at": b.created_at, "text": b.text} for b in used],
                "knowledge_blocks": blocks_dump_by_topic.get(topic, []),
                "trace": {"selection": selection_trace_by_topic.get(topic, []), "hits": hits_trace},
                "final_meta": final_meta,
            }

        return out

    async def interpret_topics_v2(
        self,
        *,
        knowledge_session: AsyncSession,
        natal_data: dict,
        topic_categories: Sequence[str],
        locale: str,
        tone_namespace: str = "natal",
        max_blocks: int = 50,
        max_chars: int = 30_000,
    ) -> Dict[str, Any]:
        """
        V2 contract: topic-aware knowledge blocks per topic.
        Keep this as a single entrypoint so /v2 router cannot accidentally use non-topic-aware logic.
        """
        return await self.interpret_topics_with_natal_data_batch(
            session=knowledge_session,
            natal_data=natal_data,
            topic_categories=topic_categories,
            locale=locale,
            tone_namespace=tone_namespace,
            max_blocks=max_blocks,
            max_chars=max_chars,
        )


    async def interpret_natal_api(
        self,
        *,
        request_id: str,
        req: InterpretRequest,
        locale: str,
        session: AsyncSession,
        knowledge_session: AsyncSession,
    ) -> Dict[str, Any]:
        place = await resolve_place(req.birth.place_query, locale, session)
        place_payload = PlaceResolvedOut.dump_from_domain(place=place, query=req.birth.place_query)

        if not getattr(place, "ok", False) or not getattr(place, "tz_str", None):
            return {
                "request_id": request_id,
                "ok": False,
                "topic_category": req.topic_category,
                "coverage": "empty",
                "text": "",
                "natal_data": {},
                "knowledge_blocks": [],
                "place": place_payload,
                "raw_blocks": [],
                "meta": {"reason": "place_not_resolved"},
                "error": getattr(place, "error", None) or "place_not_resolved",
            }

        birth: BirthData = req.birth.to_birth_input().to_domain()
        effective_topic = req.topic_category or "personality_core"

        natal_data = await self.build_natal(user_name=req.name, birth=birth, place=place)
        blocks = self.build_knowledge_blocks(natal_data=natal_data, tone_namespace="natal")

        core = await self.interpret_topic_with_blocks(
            session=knowledge_session,
            knowledge_blocks=blocks,
            topic_category=str(effective_topic),
            locale=locale,
        )

        used_blocks = core.get("raw_blocks") or []
        coverage = "ok" if len(used_blocks) > 0 else "empty"
        meta = build_response_meta(final_meta=core.get("final_meta"), trace=core.get("trace"))

        return {
            "request_id": request_id,
            "ok": True,
            "topic_category": effective_topic,
            "coverage": coverage,
            "text": core.get("final_text") or "",
            "natal_data": natal_data,
            "knowledge_blocks": core.get("knowledge_blocks") or [],
            "place": place_payload,
            "raw_blocks": used_blocks,
            "meta": meta,
            "error": None,
        }

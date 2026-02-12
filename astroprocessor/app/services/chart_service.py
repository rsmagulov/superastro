# ============================================================
# File: astroprocessor/app/services/chart_service.py
# (только те места, которые зависят от timezone/tz_str — полный файл)
# ============================================================
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, List, Optional

from sqlalchemy.ext.asyncio import AsyncSession

from app.astro.kerykeion_adapter import BirthData, KerykeionAdapter
from app.astro.key_builder import build_knowledge_key_blocks
from app.schemas.natal import InterpretRequest
from app.schemas.place import PlaceResolved
from app.services.geocode import resolve_place
from app.services.knowledge_repo import KnowledgeHit, KnowledgeRepo
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

    async def build_natal(self, *, user_name: str, birth: BirthData, place: PlaceResolved) -> dict:
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
        return self.k.natal_chart_data(subject)

    async def interpret_natal_core(
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

        knowledge_blocks = build_knowledge_key_blocks(natal_data, tone_namespace=tone_namespace)

        raw_blocks: List[RawBlock] = []
        selection_trace: List[dict] = []
        hits_trace: List[dict] = []

        for kb in knowledge_blocks:
            selection_trace.append(
                {"block_id": kb.id, "candidate_keys": list(kb.candidate_keys), "meta": kb.meta}
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
                "text": b.text,
            }
            for b in used
        ]

        return {
            "natal_data": natal_data,
            "final_text": final_text,
            "raw_blocks": raw_blocks_dicts,
            "final_meta": final_meta,
            "trace": {"selection": selection_trace, "hits": hits_trace},
        }

    async def interpret_natal_api(
        self,
        *,
        request_id: str,
        req: InterpretRequest,
        locale: str,
        session: AsyncSession,
        knowledge_session: AsyncSession,
    ) -> Dict[str, Any]:
        # 1) resolve place
        place = await resolve_place(req.birth.place_query, locale, session)

        place_payload = {
            "ok": bool(place.ok),
            "query": req.birth.place_query,
            "display_name": place.display_name,
            "lat": place.lat,
            "lon": place.lon,
            "country_code": place.country_code,
            "timezone": place.tz_str,  # наружный контракт
            "source": place.source,
            "error": place.error,
        }

        if not place.ok or not place.tz_str:
            return {
                "request_id": request_id,
                "ok": False,
                "topic_category": req.topic_category,
                "coverage": "empty",
                "text": "",
                "place": place_payload,
                "raw_blocks": [],
                "meta": {"reason": "place_not_resolved"},
                "error": place.error or "place_not_resolved",
            }

        # 2) birth
        birth: BirthData = req.birth.to_birth_input().to_domain()

        # 3) interpret
        effective_topic = req.topic_category or "personality_core"

        core = await self.interpret_natal_core(
            session=knowledge_session,
            user_name=req.name,
            birth=birth,
            place=place,
            topic_category=str(effective_topic),
            locale=locale,
        )

        used_blocks = core.get("raw_blocks") or []
        coverage = "ok" if len(used_blocks) > 0 else "empty"

        meta = dict(core.get("final_meta") or {})
        meta["trace"] = core.get("trace") or {}

        return {
            "request_id": request_id,
            "ok": True,
            "topic_category": effective_topic,
            "coverage": coverage,
            "text": core.get("final_text") or "",
            "place": place_payload,
            "raw_blocks": used_blocks,
            "meta": meta,
            "error": None,
        }
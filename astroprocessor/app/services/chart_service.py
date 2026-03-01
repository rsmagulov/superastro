# astroprocessor/app/services/chart_service.py
from __future__ import annotations

import json
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
from app.services.user_profile import Profile, profile_to_system_hint
from app.services.signals_builder import build_signals


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

def _dedupe_raw_blocks(blocks: List[RawBlock]) -> tuple[List[RawBlock], int]:
    """
    Stable dedupe by KB key.

    Returns:
      (deduped_blocks, removed_count)
    """
    out: List[RawBlock] = []
    idx_by_key: Dict[str, int] = {}
    removed = 0

    for b in blocks:
        idx = idx_by_key.get(b.key)
        if idx is None:
            idx_by_key[b.key] = len(out)
            out.append(b)
            continue

        removed += 1
        # prefer higher priority if duplicate occurs
        if b.priority > out[idx].priority:
            out[idx] = b

    return out, removed

def _sort_raw_blocks_for_use(blocks: List[RawBlock]) -> List[RawBlock]:
    """
    Selection should prefer higher priority KB texts (career-depth etc),
    not the generation order of key_builder.

    Stable: keeps original order among same priority.
    """
    indexed = list(enumerate(blocks))
    indexed.sort(key=lambda it: (-it[1].priority, it[0]))
    return [b for _, b in indexed]

def _llm_system_prompt(*, active_topic: str | None, user_profile: Profile | None) -> str:
    system = (
        "Ты — астрологический ассистент SuperAstro. Отвечай по-русски.\n"
        "КРИТИЧЕСКОЕ ПРАВИЛО: используй ТОЛЬКО факты из NATAL_CONTEXT_JSON.\n"
        "Запрещено придумывать положения планет/знаки/дома/аспекты/орбы/даты.\n"
        "Если данных в NATAL_CONTEXT_JSON недостаточно — скажи, чего не хватает.\n"
        "Если вопрос общий и не следует из карты — отметь это и ответь кратко.\n"
        "В ответе ссылайся на факты карты (например: 'Солнце в Козероге в 10 доме').\n"
    )
    if active_topic:
        system += f"Активная тема: {active_topic}. Держись темы, если вопрос не просит иначе.\n"
    if user_profile:
        system += profile_to_system_hint(user_profile) + "\n"
    return system


def _llm_grounding_user_block(*, natal_context: dict, active_topic: str | None) -> str:
    signals = build_signals(natal_context, topic=active_topic, max_items=12)
    signals_block = "KEY_SIGNALS:\n- " + "\n- ".join(signals) if signals else "KEY_SIGNALS:\n- (нет)"
    return (
        f"TOPIC: {active_topic or '(не задан)'}\n"
        f"{signals_block}\n\n"
        "NATAL_CONTEXT_JSON:\n"
        + json.dumps(natal_context, ensure_ascii=False)
    )

class ChartService:
    def __init__(self, *, ephemeris_path: str | None = None) -> None:
        ephe = ephemeris_path if ephemeris_path is not None else settings.se_ephe_path
        self.k = KerykeionAdapter(ephemeris_path=ephe)
        self.repo = KnowledgeRepo()
    def build_knowledge_blocks_for_topic(
        self,
        *,
        natal_data: dict,
        topic_category: str,
        tone_namespace: str = "natal",
        include_angles: bool = True,
        include_aspects: bool = True,
        include_aspect_configs: bool = True,
        include_integrals: bool = True,
        max_aspects: int = 18,
    ) -> list[Any]:
        """
        Topic-aware keygen.

        Важно: намеренно делаем разный “key budget” между темами,
        чтобы debug_runtime явно показывал topic-awareness.

        - personality_core: более узкий набор (include_all_planets=False)
        - другие темы: расширенный набор (include_all_planets=True)
        """
        include_all_planets = str(topic_category) != "personality_core"
        return list(
            build_knowledge_key_blocks(
                natal_data,
                tone_namespace=tone_namespace,
                include_all_planets=include_all_planets,
                topic_category=str(topic_category),
                include_angles=include_angles,
                include_aspects=include_aspects,
                include_aspect_configs=include_aspect_configs,
                include_integrals=include_integrals,
                max_aspects=max_aspects,
            )
        )
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
        """
        Backward-compatible: old behavior (no topic_category here).
        """
        return list(
            build_knowledge_key_blocks(
                natal_data,
                tone_namespace=tone_namespace,
                include_all_planets=True,
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
            raw_blocks, removed_raw = _dedupe_raw_blocks(raw_blocks)
            raw_blocks = _sort_raw_blocks_for_use(raw_blocks)
            used: List[RawBlock] = []
            total_chars = 0
            for b in raw_blocks:
                if len(used) >= max_blocks:
                    break
                if total_chars + len(b.text) > max_chars:
                    break
                used.append(b)
                total_chars += len(b.text)

            used, removed_used = _dedupe_raw_blocks(used)
            final_text = "\n\n".join(b.text for b in used)
            final_meta = {
                "source": "raw.blocks",
                "mode": "concat_v0",
                "blocks_used": len(used),
                "budget": {"max_blocks": max_blocks, "max_chars": max_chars},
                # 🔥 diagnostics marker
                "dedupe_enabled": True,
                "dedupe_removed_raw": removed_raw,
                "dedupe_removed_used": removed_used,
            }

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

    async def chat_with_natal_v2(
        self,
        *,
        natal_data: dict,
        topics: Sequence[str] | None,
        messages: Sequence[dict[str, Any]],
        llm_engine: Any,
        user_profile: dict | None = None,
    ) -> str:
        """
        Compatibility alias for routers/chat_v2.py

        chat_v2 router calls `chat_with_natal_v2`, while the service implements
        `chat_with_natal_by_context_v2`. This method bridges the two.
        """
        active_topic = str(list(topics)[0]) if topics else None

        history: list[dict[str, str]] = []
        for m in messages or []:
            role = (m.get("role") or "").strip()
            content = (m.get("content") or "").strip()
            if role in {"user", "assistant"} and content:
                history.append({"role": role, "content": content})

        # natal_data here is already natal_context-like dict in your design
        last_user = ""
        if history and history[-1]["role"] == "user":
            last_user = history.pop()["content"]

        return await self.chat_with_natal_by_context_v2(
            natal_context=natal_data,
            active_topic=active_topic,
            history=history,
            user_message=last_user,
            llm_engine=llm_engine,
            user_profile=user_profile,
        )

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
            raw_blocks, removed_raw = _dedupe_raw_blocks(raw_blocks)
            raw_blocks = _sort_raw_blocks_for_use(raw_blocks)
            used: List[RawBlock] = []
            total_chars = 0
            for b in raw_blocks:
                if len(used) >= max_blocks:
                    break
                if total_chars + len(b.text) > max_chars:
                    break
                used.append(b)
                total_chars += len(b.text)

            used, removed_used = _dedupe_raw_blocks(used)
            final_text = "\n\n".join(b.text for b in used)
            final_meta = {
                "source": "raw.blocks",
                "mode": "concat_v0",
                "blocks_used": len(used),
                "budget": {"max_blocks": max_blocks, "max_chars": max_chars},
                # 🔥 diagnostics marker
                "dedupe_enabled": True,
                "dedupe_removed_raw": removed_raw,
                "dedupe_removed_used": removed_used,
            }

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
        llm_engine: Any | None = None,
        user_profile: dict | None = None,
    ) -> Dict[str, Any]:
        """
        V2 contract:
        - если llm_engine передан -> LLM-генерация по теме (grounded на карте)
        - иначе -> текущая KB-логика (topic-aware)
        """
        if llm_engine is None:
            return await self.interpret_topics_with_natal_data_batch(
                session=knowledge_session,
                natal_data=natal_data,
                topic_categories=topic_categories,
                locale=locale,
                tone_namespace=tone_namespace,
                max_blocks=max_blocks,
                max_chars=max_chars,
            )

        p = Profile.from_dict(user_profile or {})
        out: Dict[str, Any] = {}
        for topic in [str(t) for t in topic_categories]:
            system = _llm_system_prompt(active_topic=topic, user_profile=p)
            grounding = _llm_grounding_user_block(natal_context=natal_data, active_topic=topic)
            user = (
                grounding
                + "\n\nЗадача: дай интерпретацию натальной карты строго по теме TOPIC. "
                + "Используй KEY_SIGNALS как опорные факты и опирайся на NATAL_CONTEXT_JSON.\n"
            )

            if hasattr(llm_engine, "gen"):
                llm_engine.gen.temperature = 0.3
                llm_engine.gen.top_p = 0.85
                llm_engine.gen.repetition_penalty = 1.05

            reply = await llm_engine.generate(system=system, user=user)

            out[topic] = {
                "topic_category": topic,
                "final_text": (reply or "").strip(),
                "raw_blocks": [],
                "knowledge_blocks": [],
                "trace": {"engine": "llm"},
                "final_meta": {"engine": "llm"},
            }
        return out


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


    async def chat_with_natal_by_context_v2(
        self,
        *,
        natal_context: dict,
        active_topic: str | None,
        history: list[dict[str, str]],
        user_message: str,
        llm_engine: Any,
        user_profile: dict | None = None,
    ) -> str:
        p = Profile.from_dict(user_profile or {})
        system = _llm_system_prompt(active_topic=active_topic, user_profile=p)

        messages: list[dict[str, str]] = [{"role": "system", "content": system}]
        messages.append(
            {
                "role": "user",
                "content": _llm_grounding_user_block(natal_context=natal_context, active_topic=active_topic),
            }
        )

        for m in history or []:
            role = (m.get("role") or "").strip()
            content = (m.get("content") or "").strip()
            if role in {"user", "assistant"} and content:
                messages.append({"role": role, "content": content})

        messages.append({"role": "user", "content": (user_message or "").strip()})

        # безопасный baseline декодинга (можно позже сделать из profile)
        if hasattr(llm_engine, "gen"):
            llm_engine.gen.temperature = 0.25 if getattr(p, "verbosity", None) != "detailed" else 0.3
            llm_engine.gen.top_p = 0.85
            llm_engine.gen.repetition_penalty = 1.05

        return (await llm_engine.generate_chat(messages)).strip()
from __future__ import annotations

import re
from dataclasses import dataclass
from datetime import datetime, timedelta, timezone
from typing import Any

import httpx
from timezonefinder import TimezoneFinder
from sqlalchemy import select, delete
from sqlalchemy.ext.asyncio import AsyncSession

from ..models import GeocodeCache
from ..settings import settings


@dataclass(frozen=True)
class PlaceResolved:
    ok: bool
    query_raw: str
    query_norm: str
    locale: str

    display_name: str | None = None
    lat: float | None = None
    lon: float | None = None
    country_code: str | None = None
    timezone: str | None = None

    source: str | None = None  # "cache" | "nominatim"
    error: str | None = None


_ws = re.compile(r"\s+")


def normalize_query(q: str) -> str:
    # Предсказуемая нормализация ключа кеша
    q = q.strip()
    q = _ws.sub(" ", q)
    return q.casefold()


def _now_utc() -> datetime:
    return datetime.now(timezone.utc)


async def resolve_place(query: str, locale: str, session: AsyncSession) -> PlaceResolved:
    query_raw = query
    qn = normalize_query(query)

    # 1) Попытка из кеша
    now = _now_utc()

    stmt = select(GeocodeCache).where(
        GeocodeCache.query_norm == qn,
        GeocodeCache.locale == locale,
        GeocodeCache.expires_at > now,
    )
    res = await session.execute(stmt)
    row = res.scalar_one_or_none()
    if row:
        p = row.payload
        return PlaceResolved(
            ok=True,
            query_raw=query_raw,
            query_norm=qn,
            locale=locale,
            display_name=p.get("display_name"),
            lat=p.get("lat"),
            lon=p.get("lon"),
            country_code=p.get("country_code"),
            timezone=p.get("timezone"),
            source="cache",
        )

    # (опционально) чистим протухшие записи для этого ключа
    await session.execute(
        delete(GeocodeCache).where(
            GeocodeCache.query_norm == qn,
            GeocodeCache.locale == locale,
            GeocodeCache.expires_at <= now,
        )
    )
    await session.commit()

    # 2) Запрос в Nominatim
    headers = {
        "User-Agent": settings.nominatim_user_agent,
        "Accept-Language": locale,
    }
    params = {
        "q": query_raw,
        "format": "jsonv2",
        "addressdetails": 1,
        "limit": 1,
    }

    try:
        async with httpx.AsyncClient(timeout=20) as client:
            r = await client.get("https://nominatim.openstreetmap.org/search", params=params, headers=headers)
            r.raise_for_status()
            data = r.json()
    except Exception as e:
        return PlaceResolved(
            ok=False,
            query_raw=query_raw,
            query_norm=qn,
            locale=locale,
            error=f"nominatim_request_failed: {type(e).__name__}: {e}",
            source="nominatim",
        )

    if not isinstance(data, list) or len(data) == 0:
        return PlaceResolved(
            ok=False,
            query_raw=query_raw,
            query_norm=qn,
            locale=locale,
            error="nominatim_no_results",
            source="nominatim",
        )

    item: dict[str, Any] = data[0]
    try:
        lat = float(item["lat"])
        lon = float(item["lon"])
        display_name = str(item.get("display_name") or query_raw)
        address = item.get("address") or {}
        country_code = (address.get("country_code") or None)
    except Exception as e:
        return PlaceResolved(
            ok=False,
            query_raw=query_raw,
            query_norm=qn,
            locale=locale,
            error=f"nominatim_parse_failed: {type(e).__name__}: {e}",
            source="nominatim",
        )

    # 3) timezonefinder (offline)
    tf = TimezoneFinder()
    tz = tf.timezone_at(lat=lat, lng=lon)

    # 4) Пишем в кеш
    ttl_days = 30
    expires = now + timedelta(days=ttl_days)
    payload = {
        "display_name": display_name,
        "lat": lat,
        "lon": lon,
        "country_code": country_code,
        "timezone": tz,
    }

    session.add(
        GeocodeCache(
            query_norm=qn,
            locale=locale,
            query_raw=query_raw,
            payload=payload,
            created_at=now,
            expires_at=expires,
        )
    )
    await session.commit()

    return PlaceResolved(
        ok=True,
        query_raw=query_raw,
        query_norm=qn,
        locale=locale,
        display_name=display_name,
        lat=lat,
        lon=lon,
        country_code=country_code,
        timezone=tz,
        source="nominatim",
    )

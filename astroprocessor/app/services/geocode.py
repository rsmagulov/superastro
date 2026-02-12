# ============================================================
# File: astroprocessor/app/services/geocode.py
# ============================================================
from __future__ import annotations

import re
from datetime import datetime, timedelta, timezone
from typing import Any

import httpx
from app.models import GeocodeCache
from app.schemas.place import PlaceResolved
from app.settings import settings
from sqlalchemy import delete, select
from sqlalchemy.ext.asyncio import AsyncSession
from timezonefinder import TimezoneFinder

_ws = re.compile(r"\s+")
_TF = TimezoneFinder()

# dev/offline shortcuts (только для локальной разработки)
_DEV_PLACES: dict[str, dict[str, Any]] = {
    "almaty": {
        "display_name": "Almaty, Kazakhstan",
        "lat": 43.238949,
        "lon": 76.889709,
        "country_code": "kz",
        "tz_str": "Asia/Almaty",
    },
    "алматы": {
        "display_name": "Алматы, Казахстан",
        "lat": 43.238949,
        "lon": 76.889709,
        "country_code": "kz",
        "tz_str": "Asia/Almaty",
    },
}


def normalize_query(q: str) -> str:
    q = q.strip()
    q = _ws.sub(" ", q)
    return q.casefold()


def _now_utc() -> datetime:
    return datetime.now(timezone.utc)


async def resolve_place(query: str, locale: str, session: AsyncSession) -> PlaceResolved:
    query_raw = query
    qn = normalize_query(query)

    # 0) DEV shortcut (если включен debug_meta)
    if settings.debug_meta and qn in _DEV_PLACES:
        p = _DEV_PLACES[qn]
        return PlaceResolved(
            ok=True,
            query_raw=query_raw,
            query_norm=qn,
            locale=locale,
            display_name=p["display_name"],
            lat=float(p["lat"]),
            lon=float(p["lon"]),
            country_code=p["country_code"],
            tz_str=p["tz_str"],
            source="dev_stub",
        )

    # 1) cache
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
            tz_str=p.get("tz_str"),
            source="cache",
        )

    await session.execute(
        delete(GeocodeCache).where(
            GeocodeCache.query_norm == qn,
            GeocodeCache.locale == locale,
            GeocodeCache.expires_at <= now,
        )
    )
    await session.commit()

    # 2) nominatim
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

    timeout = httpx.Timeout(connect=5.0, read=8.0, write=5.0, pool=5.0)

    try:
        async with httpx.AsyncClient(timeout=timeout) as client:
            r = await client.get(
                "https://nominatim.openstreetmap.org/search",
                params=params,
                headers=headers,
            )
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
        country_code = address.get("country_code") or None
    except Exception as e:
        return PlaceResolved(
            ok=False,
            query_raw=query_raw,
            query_norm=qn,
            locale=locale,
            error=f"nominatim_parse_failed: {type(e).__name__}: {e}",
            source="nominatim",
        )

    tz_str = _TF.timezone_at(lat=lat, lng=lon)

    ttl_days = 30
    expires = now + timedelta(days=ttl_days)
    payload = {
        "display_name": display_name,
        "lat": lat,
        "lon": lon,
        "country_code": country_code,
        "tz_str": tz_str,
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
        tz_str=tz_str,
        source="nominatim",
    )
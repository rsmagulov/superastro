# ============================================================
# File: astroprocessor/app/services/place_codec.py  (NEW)
# ============================================================
from __future__ import annotations

from typing import Any

from app.schemas.place import PlaceResolved


def to_place_resolve_response(place: PlaceResolved) -> dict[str, Any]:
    """
    Build /v1/place/resolve response payload.

    Contract:
    - no request_id in body (request id only in X-Request-ID header via middleware)
    - includes query_raw/query_norm/locale and tz_str (domain timezone)
    """
    return {
        "ok": bool(place.ok),
        "query_raw": place.query_raw,
        "query_norm": place.query_norm,
        "locale": place.locale,
        "display_name": place.display_name,
        "lat": place.lat,
        "lon": place.lon,
        "country_code": place.country_code,
        "tz_str": place.tz_str,
        "source": place.source,
        "error": place.error,
    }
import pytest

from app.knowledge.meta_schema import ALLOWED_TONES, ALLOWED_ABSTRACTION_LEVELS

pytestmark = pytest.mark.asyncio


def _pick_first(seq) -> str:
    """
    ALLOWED_* может быть list/tuple/set.
    Делаем детерминированный выбор первого значения.
    """
    if not seq:
        raise RuntimeError("ALLOWED_* is empty in meta_schema")
    if isinstance(seq, (set, frozenset)):
        return sorted(seq)[0]
    return list(seq)[0]


async def test_items_page_ok(client):
    r = await client.get("/admin/ui/items")
    assert r.status_code == 200
    assert "Фрагменты" in r.text  # заголовок страницы


async def test_items_table_filters_ok(client):
    # базовый
    r = await client.get(
        "/admin/ui/items/table",
        params={
            "q": "",
            "locale": "ru-RU",
            "topic_category": "",
            "is_active": "",
            "selected": "",
        },
    )
    assert r.status_code == 200
    assert "natal.planet.sun.sign.any" in r.text

    # topic_category = __NULL__
    r = await client.get(
        "/admin/ui/items/table",
        params={
            "locale": "ru-RU",
            "topic_category": "__NULL__",
            "is_active": "",
            "selected": "",
        },
    )
    assert r.status_code == 200
    # у нас только id=1 с topic_category NULL
    assert "row-1" in r.text
    assert "row-2" not in r.text

    # is_active=1
    r = await client.get(
        "/admin/ui/items/table",
        params={
            "locale": "en-US",
            "is_active": "1",
            "selected": "",
        },
    )
    assert r.status_code == 200
    assert "row-4" in r.text


async def test_select_item_ok_and_no_500(client):
    r = await client.get(
        "/admin/ui/items/select/2",
        params={
            "q": "",
            "locale": "ru-RU",
            "topic_category": "",
            "is_active": "1",
            "selected": "",
        },
    )
    assert r.status_code == 200
    assert "Редактор" in r.text
    # важное: в ответе должен быть OOB для таблицы или строки
    assert "hx-swap-oob" in r.text


async def test_bulk_set_tone_requires_ids(client):
    tone = _pick_first(ALLOWED_TONES)

    r = await client.post(
        "/admin/ui/items/bulk/set-tone",
        data={
            "tone": tone,
            "ids": "",
        },
    )
    assert r.status_code == 400


async def test_bulk_set_tone_ok(client):
    tone = _pick_first(ALLOWED_TONES)

    r = await client.post(
        "/admin/ui/items/bulk/set-tone",
        data={
            "tone": tone,
            "ids": "1,2",
        },
    )

    # если упадет — удобно сразу видеть почему
    assert r.status_code == 200, f"status={r.status_code} body={r.text}"
    assert r.headers.get("HX-Trigger") == "itemsChanged"


async def test_bulk_set_abstraction_ok(client):
    lvl = _pick_first(ALLOWED_ABSTRACTION_LEVELS)

    r = await client.post(
        "/admin/ui/items/bulk/set-abstraction",
        data={
            "abstraction_level": lvl,
            "ids": "1,2,3",
        },
    )

    assert r.status_code == 200, f"status={r.status_code} body={r.text}"
    assert r.headers.get("HX-Trigger") == "itemsChanged"


async def test_bulk_set_active_validation_blocks_bad_meta(client):
    # id=3: abstraction_level пустой -> нельзя включить
    r = await client.post(
        "/admin/ui/items/bulk/set-active",
        data={
            "active": "1",
            "ids": "3",
        },
    )
    assert r.status_code == 400
    assert "Нельзя активировать" in r.text


async def test_bulk_set_active_ok_when_meta_ok(client):
    # id=2 meta ok -> включаем
    r = await client.post(
        "/admin/ui/items/bulk/set-active",
        data={
            "active": "1",
            "ids": "2",
        },
    )
    assert r.status_code == 200, f"status={r.status_code} body={r.text}"
    assert r.headers.get("HX-Trigger") == "itemsChanged"

async def test_bulk_set_topic_category_ok(client):
    r = await client.post(
        "/admin/ui/items/bulk/set-topic-category",
        data={
            "topic_category": "personality_core",
            "ids": "1,2",
        },
    )
    assert r.status_code == 200
    assert "HX-Trigger" in r.headers
    assert r.headers["HX-Trigger"] == "itemsChanged"

async def test_bulk_set_topic_category_null_ok(client):
    r = await client.post(
        "/admin/ui/items/bulk/set-topic-category",
        data={
            "topic_category": "",
            "ids": "1,2",
        },
    )
    assert r.status_code == 200
    assert r.headers.get("HX-Trigger") == "itemsChanged"

async def test_bulk_set_topic_category_invalid_400(client):
    r = await client.post(
        "/admin/ui/items/bulk/set-topic-category",
        data={
            "topic_category": "INVALID_CATEGORY",
            "ids": "1,2",
        },
    )
    assert r.status_code == 400

async def test_bulk_set_topic_category_ok(client):
    r = await client.post(
        "/admin/ui/items/bulk/set-topic-category",
        data={
            "topic_category": "personality_core",
            "ids": "1,2",
        },
    )
    assert r.status_code == 200
    assert r.headers.get("HX-Trigger") == "itemsChanged"


async def test_bulk_set_topic_category_null_ok(client):
    r = await client.post(
        "/admin/ui/items/bulk/set-topic-category",
        data={
            "topic_category": "",
            "ids": "1,2",
        },
    )
    assert r.status_code == 200
    assert r.headers.get("HX-Trigger") == "itemsChanged"


async def test_bulk_set_topic_category_invalid_400(client):
    r = await client.post(
        "/admin/ui/items/bulk/set-topic-category",
        data={
            "topic_category": "INVALID_CATEGORY",
            "ids": "1,2",
        },
    )
    assert r.status_code == 400

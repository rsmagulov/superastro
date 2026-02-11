import pytest

@pytest.mark.asyncio
async def test_sources_page_ok(client):
    r = await client.get("/admin/ui/sources")
    assert r.status_code == 200

@pytest.mark.asyncio
async def test_import_source_ok(client):
    r = await client.post(
        "/admin/ui/sources/import",
        data={
            "title": "Test Source",
            "author": "Author 1",
            "school": "School",
            "source_type": "book",
            "language": "ru",
            "priority": "100",
            "is_enabled": "1",
        },
        files={},  # без файла в MVP допускаем
    )
    assert r.status_code == 200
    assert r.headers.get("HX-Trigger") == "sourcesChanged"

@pytest.mark.asyncio
async def test_source_card_404(client):
    r = await client.get("/admin/ui/sources/999999")
    assert r.status_code == 404

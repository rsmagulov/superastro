import httpx

class AstroClient:
    def __init__(self, base_url: str):
        self.base_url = base_url.rstrip("/")

    async def interpret_stub(self, payload: dict):
        async with httpx.AsyncClient(timeout=30) as client:
            r = await client.post(f"{self.base_url}/v1/natal/interpret", json=payload)
            r.raise_for_status()
            return r.json()

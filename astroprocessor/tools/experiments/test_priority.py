import asyncio
from app.db import get_knowledge_session
from app.services.knowledge_repo import KnowledgeRepo

async def main():
    repo = KnowledgeRepo()
    async for session in get_knowledge_session():
        hit = await repo.pick_first_match(
            session,
            candidate_keys=["test.priority"],
            topic_category="personality_core",
            locale="ru-RU",
        )
        print(hit)
        break

asyncio.run(main())

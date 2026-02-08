from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session
from app.services.knowledge_items_validator import validate_knowledge_items

router = APIRouter(prefix="/admin/knowledge", tags=["admin-knowledge"])

@router.get("/validate")
async def admin_validate(session: AsyncSession = Depends(get_knowledge_session)):
    issues = await validate_knowledge_items(session)
    errors = [i for i in issues if i.level == "error"]
    warnings = [i for i in issues if i.level == "warning"]
    return {
        "ok": len(errors) == 0,
        "errors": [i.__dict__ for i in errors],
        "warnings": [i.__dict__ for i in warnings],
    }

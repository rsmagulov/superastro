# astroprocessor/app/services/user_profile.py
from __future__ import annotations

import json
from dataclasses import dataclass, field
from typing import Any, Dict, Optional


@dataclass(frozen=True)
class Profile:
    """
    User preferences without fine-tune.

    Stored as JSON in DB (users.user_profile_json).
    Keep schema tolerant: unknown keys are ignored.
    """

    verbosity: Optional[str] = None  # e.g. "short" | "normal" | "detailed"
    tone: Optional[str] = None  # e.g. "neutral" | "friendly" | "professional"
    format: Optional[str] = None  # e.g. "bullets" | "text" | "steps"
    emojis: Optional[bool] = None
    examples: Optional[bool] = None
    terminology: Optional[str] = None  # e.g. "simple" | "astro_terms"
    user_terms: Dict[str, str] = field(default_factory=dict)  # user's custom terms

    @staticmethod
    def from_dict(d: dict[str, Any]) -> "Profile":
        if not isinstance(d, dict):
            return Profile()
        return Profile(
            verbosity=_as_opt_str(d.get("verbosity")),
            tone=_as_opt_str(d.get("tone")),
            format=_as_opt_str(d.get("format")),
            emojis=_as_opt_bool(d.get("emojis")),
            examples=_as_opt_bool(d.get("examples")),
            terminology=_as_opt_str(d.get("terminology")),
            user_terms=_as_dict_str_str(d.get("user_terms")) or {},
        )

    def to_dict(self) -> dict[str, Any]:
        out: dict[str, Any] = {}
        if self.verbosity is not None:
            out["verbosity"] = self.verbosity
        if self.tone is not None:
            out["tone"] = self.tone
        if self.format is not None:
            out["format"] = self.format
        if self.emojis is not None:
            out["emojis"] = self.emojis
        if self.examples is not None:
            out["examples"] = self.examples
        if self.terminology is not None:
            out["terminology"] = self.terminology
        if self.user_terms:
            out["user_terms"] = dict(self.user_terms)
        return out


def profile_to_system_hint(profile: Profile) -> str:
    """
    Converts profile into a single system hint line.
    """
    d = profile.to_dict()
    if not d:
        return ""
    try:
        s = json.dumps(d, ensure_ascii=False)
    except Exception:
        s = str(d)
    return f"Предпочтения пользователя: {s}"


def _as_opt_str(v: Any) -> Optional[str]:
    if v is None:
        return None
    s = str(v).strip()
    return s or None


def _as_opt_bool(v: Any) -> Optional[bool]:
    if v is None:
        return None
    if isinstance(v, bool):
        return v
    if isinstance(v, (int, float)) and v in (0, 1):
        return bool(v)
    s = str(v).strip().lower()
    if s in {"true", "1", "yes", "y", "да"}:
        return True
    if s in {"false", "0", "no", "n", "нет"}:
        return False
    return None


def _as_dict_str_str(v: Any) -> Optional[Dict[str, str]]:
    if not isinstance(v, dict):
        return None
    out: Dict[str, str] = {}
    for k, val in v.items():
        if k is None:
            continue
        ks = str(k).strip()
        if not ks:
            continue
        out[ks] = "" if val is None else str(val)
    return out
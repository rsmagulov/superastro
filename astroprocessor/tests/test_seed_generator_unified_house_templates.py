# FILE: C:\Projects\superastro\astroprocessor\tests\test_seed_generator_unified_house_templates.py
from __future__ import annotations

import runpy
from pathlib import Path

import pytest


def _load_seed_generator_module():
    """
    We load the generator via runpy because tools/seed is not a Python package.
    """
    root = Path(__file__).resolve().parents[1]  # .../astroprocessor
    gen_path = root / "tools" / "seed" / "generate_career_overrides_from_debug_shortest.py"
    if not gen_path.exists():
        raise FileNotFoundError(f"Seed generator not found: {gen_path}")
    return runpy.run_path(str(gen_path))


@pytest.mark.smoke
def test_unified_house_ruler_any_does_not_fallback_to_default():
    mod = _load_seed_generator_module()
    synth_text = mod["synth_text"]

    keys = [
        "natal.house.2.ruler.any",
        "natal.house.3.ruler.any",
        "natal.house.4.ruler.any",
        "natal.house.5.ruler.any",
        "natal.house.7.ruler.any",
        "natal.house.8.ruler.any",
        "natal.house.9.ruler.any",
        "natal.house.10.ruler.any",
        "natal.house.12.ruler.any",
    ]

    for k in keys:
        txt = synth_text(key=k, topic="money")
        assert isinstance(txt, str) and len(txt) > 50
        assert not txt.startswith("Натальный маркер"), f"Unexpected default fallback for {k}"
        assert "Управитель" in txt, f"Template should mention 'Управитель' for {k}"


@pytest.mark.smoke
def test_unified_house_ruler_any_unknown_house_has_generic_text_not_default():
    mod = _load_seed_generator_module()
    synth_text = mod["synth_text"]

    # 6 дом в нашем override-словаре может быть не задан — должен пойти "generic house ruler any",
    # но НЕ _txt_default().
    txt = synth_text(key="natal.house.6.ruler.any", topic="career")
    assert not txt.startswith("Натальный маркер")
    assert "Управитель" in txt
    assert "6" in txt  # должен хоть как-то отражать дом


@pytest.mark.smoke
def test_unified_house_planet_special_cases_for_1_10_12():
    mod = _load_seed_generator_module()
    synth_text = mod["synth_text"]

    t10 = synth_text(key="natal.house.10.planet.mars", topic="career")
    assert "карьер" in t10.lower() or "репутац" in t10.lower() or "видим" in t10.lower()
    assert not t10.startswith("Натальный маркер")

    t12 = synth_text(key="natal.house.12.planet.mars", topic="past_lives_symbolic")
    assert ("внутрен" in t12.lower()) or ("подсозн" in t12.lower()) or ("за кадром" in t12.lower())
    assert not t12.startswith("Натальный маркер")

    t1 = synth_text(key="natal.house.1.planet.mars", topic="personality_core")
    assert ("образ" in t1.lower()) or ("поведен" in t1.lower()) or ("самопрез" in t1.lower())
    assert not t1.startswith("Натальный маркер")


@pytest.mark.smoke
def test_build_sql_contains_upserts_for_house_ruler_any_and_house_planet():
    mod = _load_seed_generator_module()
    build_sql = mod["build_sql"]

    Opt = mod["Opt"]
    opt = Opt(
        in_path=Path("debug_before.json"),
        out_path=Path("seed.sql"),
        topic="career",
        locale="ru-RU",
        max_len=420,
        max_keys=200,
        priority=140,
    )

    keys = [
        "natal.house.2.ruler.any",
        "natal.house.10.ruler.any",
        "natal.house.10.planet.mars",
    ]
    sql = build_sql(keys, opt)

    assert "BEGIN;" in sql
    assert "COMMIT;" in sql
    for k in keys:
        assert f"VALUES('{k}', '{opt.topic}', '{opt.locale}'" in sql
    assert "ON CONFLICT(key, topic_category, locale) DO UPDATE" in sql


@pytest.mark.smoke
def test_select_short_keys_filters_by_max_len_and_dedups():
    mod = _load_seed_generator_module()
    select_short_keys = mod["select_short_keys"]
    Opt = mod["Opt"]

    opt = Opt(
        in_path=Path("x.json"),
        out_path=Path("y.sql"),
        topic="career",
        locale="ru-RU",
        max_len=10,
        max_keys=10,
        priority=140,
    )

    used_blocks = [
        {"key": "natal.house.2.ruler.any", "text": "1234567890"},     # len 10 OK
        {"key": "natal.house.2.ruler.any", "text": "DUPLICATE"},      # same key, must dedup
        {"key": "natal.house.10.planet.mars", "text": "12345678901"}, # len 11 too long
        {"key": "natal.sign.aries.present", "text": "short"},         # ok
    ]

    keys = select_short_keys(used_blocks, opt)

    assert "natal.house.2.ruler.any" in keys
    assert "natal.sign.aries.present" in keys
    assert "natal.house.10.planet.mars" not in keys
    assert len([k for k in keys if k == "natal.house.2.ruler.any"]) == 1
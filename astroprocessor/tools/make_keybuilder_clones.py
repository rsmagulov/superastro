# tools/make_keybuilder_clones.py
from __future__ import annotations
import json
from pathlib import Path

SRC = [
    "knowledge_items_02_planets__ETALON.jsonl",
    "knowledge_items_03_signs__ETALON.jsonl",
    "knowledge_items_04_house_rulers__ETALON.jsonl",
    "knowledge_items_06_aspects__ETALON.jsonl",
    "knowledge_items_07_aspect_configurations__ETALON.jsonl",
]

OUT = "knowledge_items_keybuilder_clones_patch.jsonl"

def load_jsonl(p: Path):
    out = []
    for line in p.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line:
            continue
        out.append(json.loads(line))
    return out

def dump_jsonl(p: Path, items):
    with p.open("w", encoding="utf-8") as f:
        for it in items:
            f.write(json.dumps(it, ensure_ascii=False) + "\n")

def clone_item(it: dict, new_key: str) -> dict:
    c = dict(it)
    c["key"] = new_key
    # на всякий случай: topic_category не ставим
    c["topic_category"] = None
    # meta/meta_json уже есть; is_active оставляем False
    return c

def main():
    patch = []
    base = Path("data")  # если у тебя jsonl лежат в data/
    if not base.exists():
        base = Path(".")  # иначе рядом

    all_items = []
    for name in SRC:
        p = base / name
        if not p.exists():
            raise FileNotFoundError(f"Не найден файл: {p}")
        all_items.extend(load_jsonl(p))

    # Индекс по key
    by_key = {it["key"]: it for it in all_items}

    # --- Планеты: natal.planet.any.core ---
    for k in ["natal.planet.core.definition", "natal.planet.core.definition".replace(".definition","")]:
        if k in by_key:
            src = by_key[k]
            patch.append(clone_item(src, "natal.planet.any.core"))
            break
    else:
        # если нет core.definition, берём любую планету как источник формулировки (лучше, чем ничего)
        for k in by_key:
            if k.startswith("natal.planet.") and k.endswith(".core") and k.count(".") == 3:
                patch.append(clone_item(by_key[k], "natal.planet.any.core"))
                break

    # --- Знаки: natal.sign.any.core ---
    if "natal.sign.core.definition" in by_key:
        patch.append(clone_item(by_key["natal.sign.core.definition"], "natal.sign.any.core"))
    else:
        # fallback
        for k in by_key:
            if k.startswith("natal.sign.") and k.endswith(".core"):
                patch.append(clone_item(by_key[k], "natal.sign.any.core"))
                break

    # --- Управитель дома: natal.house.any.ruler.core ---
    # ищем самый “общий” источник
    src_candidates = [
        "natal.house.ruler.core",
        "natal.house.ruler.core.definition",
    ]
    for k in src_candidates:
        if k in by_key:
            patch.append(clone_item(by_key[k], "natal.house.any.ruler.core"))
            break
    else:
        # если у тебя только конкретные, всё равно можно сделать общий
        for k in by_key:
            if k.startswith("natal.house.") and ".ruler." in k and k.endswith(".core"):
                patch.append(clone_item(by_key[k], "natal.house.any.ruler.core"))
                break

    # --- Аспекты: natal.aspect.any.core ---
    if "natal.aspect.core.definition" in by_key:
        patch.append(clone_item(by_key["natal.aspect.core.definition"], "natal.aspect.any.core"))

    # --- Конфигурации: natal.aspect_config.any.core ---
    if "natal.aspect_config.core.definition" in by_key:
        patch.append(clone_item(by_key["natal.aspect_config.core.definition"], "natal.aspect_config.any.core"))

    # Удалим дубли по key (на случай если источники совпали)
    uniq = {}
    for it in patch:
        uniq[it["key"]] = it
    patch = list(uniq.values())

    dump_jsonl(base / OUT, patch)
    print(f"DONE: {OUT} items={len(patch)}")

if __name__ == "__main__":
    main()

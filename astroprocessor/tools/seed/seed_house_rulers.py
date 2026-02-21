from __future__ import annotations

from pathlib import Path
from time import time

SIGNS = [
    "aries", "taurus", "gemini", "cancer", "leo", "virgo",
    "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces",
]

SIGN_RU = {
    "aries":"Овен","taurus":"Телец","gemini":"Близнецы","cancer":"Рак",
    "leo":"Лев","virgo":"Дева","libra":"Весы","scorpio":"Скорпион",
    "sagittarius":"Стрелец","capricorn":"Козерог","aquarius":"Водолей","pisces":"Рыбы",
}

SIGN_RULERS = {
    "aries": ("mars", None),
    "taurus": ("venus", None),
    "gemini": ("mercury", None),
    "cancer": ("moon", None),
    "leo": ("sun", None),
    "virgo": ("mercury", None),
    "libra": ("venus", None),
    "scorpio": ("mars", "pluto"),
    "sagittarius": ("jupiter", None),
    "capricorn": ("saturn", None),
    "aquarius": ("saturn", "uranus"),
    "pisces": ("jupiter", "neptune"),
}

TOPICS = {
    "career": [10, 6, 2],
    "money": [2, 8],
    "love_intimacy": [5, 7, 8],
}

LOCALE = "ru-RU"

def esc(s: str) -> str:
    return s.replace("'", "''")

def cusp_text(topic: str, house: int, sign: str) -> str:
    if topic == "career":
        if house == 10:
            return f"10 дом в {SIGN_RU[sign]}: стиль целей, статуса и профессионального образа."
        if house == 6:
            return f"6 дом в {SIGN_RU[sign]}: как вы выстраиваете работу, рутину и эффективность."
        return f"2 дом в {SIGN_RU[sign]}: связь дохода с ценностями, навыками и устойчивостью."
    if topic == "money":
        if house == 2:
            return f"2 дом в {SIGN_RU[sign]}: личные ресурсы и способы зарабатывать."
        return f"8 дом в {SIGN_RU[sign]}: общие ресурсы, обязательства и финансовые трансформации."
    if house == 5:
        return f"5 дом в {SIGN_RU[sign]}: романтика, влюблённость и творческое самовыражение."
    if house == 7:
        return f"7 дом в {SIGN_RU[sign]}: стиль партнёрства и ожидания от союза."
    return f"8 дом в {SIGN_RU[sign]}: близость, доверие и глубина отношений."

def ruler_text(topic: str, house: int, ruler: str, sign: str, alt: bool) -> str:
    kind = "современный управитель" if alt else "управитель"
    if topic == "career" and house == 10:
        return f"{kind} 10 дома ({ruler}) при куспиде в {sign} показывает, через что строится карьера и признание."
    if topic == "career" and house == 6:
        return f"{kind} 6 дома ({ruler}) при куспиде в {sign} описывает механику работы, дисциплины и навыков."
    if topic == "career" and house == 2:
        return f"{kind} 2 дома ({ruler}) при куспиде в {sign} показывает, как легче монетизировать сильные стороны."
    if topic == "money" and house == 2:
        return f"{kind} 2 дома ({ruler}) при куспиде в {sign} — про источники дохода и финансовые привычки."
    if topic == "money" and house == 8:
        return f"{kind} 8 дома ({ruler}) при куспиде в {sign} — про общие ресурсы, риски и доверие."
    if topic == "love_intimacy" and house == 5:
        return f"{kind} 5 дома ({ruler}) при куспиде в {sign} — про романтику и то, как вы проявляете чувства."
    if topic == "love_intimacy" and house == 7:
        return f"{kind} 7 дома ({ruler}) при куспиде в {sign} — про модель союза и партнёрские сценарии."
    return f"{kind} 8 дома ({ruler}) при куспиде в {sign} — про интимность и глубину связи."

def main() -> None:
    now = str(int(time()))
    rows: list[str] = ["BEGIN;"]

    for topic, houses in TOPICS.items():
        for house in houses:
            for sign in SIGNS:
                key_cusp = f"natal.house.{house}.cusp.sign.{sign}"
                rows.append(
                    "INSERT OR IGNORE INTO knowledge_items "
                    "(key, topic_category, locale, text, priority, created_at, is_active, meta_json) "
                    f"VALUES ('{esc(key_cusp)}','{esc(topic)}','{esc(LOCALE)}','{esc(cusp_text(topic, house, sign))}',86,'{now}',1,'{{}}');"
                )

                primary, alt = SIGN_RULERS[sign]
                for r, is_alt in ((primary, False), (alt, True)):
                    if not r:
                        continue
                    key_r = f"natal.house.{house}.ruler.{r}"
                    rows.append(
                        "INSERT OR IGNORE INTO knowledge_items "
                        "(key, topic_category, locale, text, priority, created_at, is_active, meta_json) "
                        f"VALUES ('{esc(key_r)}','{esc(topic)}','{esc(LOCALE)}','{esc(ruler_text(topic, house, r, sign, is_alt))}',84,'{now}',1,'{{}}');"
                    )

    rows.append("COMMIT;")
    out_path = Path('seed_house_rulers.sql')
    out_path.write_text('\n'.join(rows) + '\n', encoding='utf-8')
    print(f"Wrote {out_path} ({len(rows)-2} statements).")

if __name__ == '__main__':
    main()

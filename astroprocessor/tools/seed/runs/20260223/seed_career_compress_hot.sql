BEGIN;

UPDATE knowledge_items SET text =
'MC (Средина Неба) — главный вектор карьеры: куда ты растёшь, какой результат должен быть видимым. Практика: опиши «идеальный результат» в 3 пунктах и под него выбери 1–2 KPI на месяц.'
WHERE key='natal.angle.mc' AND topic_category='career' AND locale='ru-RU';

UPDATE knowledge_items SET text =
'MC в Весах: продвижение через партнёрства, репутацию, эстетику/баланс интересов. Важно качество договорённостей. Практика: фиксируй условия письменно и развивай сеть контактов через взаимную выгоду.'
WHERE key='natal.angle.mc.sign.libra' AND topic_category='career' AND locale='ru-RU';

UPDATE knowledge_items SET text =
'10-й дом: карьера/статус/видимость результата. Управитель 10-го дома — главный рычаг роста. Практика: выбери 1 проект, где управитель проявляется сильнее всего, и закрепи ритм отчётности/планирования.'
WHERE key='natal.house.10' AND topic_category='career' AND locale='ru-RU';

UPDATE knowledge_items SET text =
'Управитель 10-го дома (Venus): рост через отношения, вкус к качеству, ценность и переговоры. Практика: улучшай упаковку результата (портфолио/презентация) и согласовывай критерии качества заранее.'
WHERE key='natal.house.10.ruler.venus' AND topic_category='career' AND locale='ru-RU';

UPDATE knowledge_items SET text =
'Управитель 10-го дома (Венера), знак не уточнён (sign.any). Важнее функция: ценность, договорённости, репутация. Практика: введи правило «критерии качества до начала» и шаблон для согласований.'
WHERE key='natal.house.10.ruler.venus.sign.any' AND topic_category='career' AND locale='ru-RU';

UPDATE knowledge_items SET text =
'Управитель 10-го дома не уточнён (any). Сфокусируйся на теме 10-го дома: статус, видимый результат, ответственность. Практика: 1 KPI, 1 дедлайн, 1 регулярный отчёт — на 2 недели.'
WHERE key='natal.house.10.ruler.any' AND topic_category='career' AND locale='ru-RU';

COMMIT;
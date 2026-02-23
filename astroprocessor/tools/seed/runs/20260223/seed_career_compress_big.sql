BEGIN;

UPDATE knowledge_items
SET text =
  CASE
    WHEN LENGTH(text) <= 360 THEN text
    ELSE
      SUBSTR(text, 1, 320) ||
      ' … Практика: выбери 1 действие на 7–14 дней и проверь эффект по метрикам (скорость, качество, доход, стабильность).'
  END
WHERE topic_category='career' AND locale='ru-RU' AND is_active=1 AND priority=140
  AND LENGTH(text) > 500;

COMMIT;
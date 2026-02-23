BEGIN;

UPDATE knowledge_items
SET text =
  CASE
    WHEN LENGTH(text) <= 360 THEN text
    ELSE SUBSTR(text, 1, 280) ||
         ' … Практика: 1 действие на 7–14 дней + метрики (скорость/качество/доход/стабильность).'
  END
WHERE topic_category='career' AND locale='ru-RU' AND is_active=1 AND priority=140
  AND LENGTH(text) >= 420;

COMMIT;
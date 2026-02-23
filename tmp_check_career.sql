.headers on
.mode column
SELECT key, priority, LENGTH(text) AS len
FROM knowledge_items
WHERE topic_category='career' AND locale='ru-RU' AND is_active=1 AND priority=140
  AND (
    key LIKE 'natal.polarity.%' OR
    key LIKE 'natal.elements.%' OR
    key LIKE 'natal.modality.%' OR
    key LIKE 'natal.house.%.cusp.sign.%'
  )
ORDER BY len ASC
LIMIT 50;

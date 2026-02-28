BEGIN;

UPDATE knowledge_items
SET text =
  CASE key
    WHEN 'natal.angle.mc.sign.aries'       THEN REPLACE(text, 'MC в aries',       'MC в Овне')
    WHEN 'natal.angle.mc.sign.taurus'      THEN REPLACE(text, 'MC в taurus',      'MC в Тельце')
    WHEN 'natal.angle.mc.sign.gemini'      THEN REPLACE(text, 'MC в gemini',      'MC в Близнецах')
    WHEN 'natal.angle.mc.sign.cancer'      THEN REPLACE(text, 'MC в cancer',      'MC в Раке')
    WHEN 'natal.angle.mc.sign.leo'         THEN REPLACE(text, 'MC в leo',         'MC в Льве')
    WHEN 'natal.angle.mc.sign.virgo'       THEN REPLACE(text, 'MC в virgo',       'MC в Деве')
    WHEN 'natal.angle.mc.sign.libra'       THEN REPLACE(text, 'MC в libra',       'MC в Весах')
    WHEN 'natal.angle.mc.sign.scorpio'     THEN REPLACE(text, 'MC в scorpio',     'MC в Скорпионе')
    WHEN 'natal.angle.mc.sign.sagittarius' THEN REPLACE(text, 'MC в sagittarius', 'MC в Стрельце')
    WHEN 'natal.angle.mc.sign.capricorn'   THEN REPLACE(text, 'MC в capricorn',   'MC в Козероге')
    WHEN 'natal.angle.mc.sign.aquarius'    THEN REPLACE(text, 'MC в aquarius',    'MC в Водолее')
    WHEN 'natal.angle.mc.sign.pisces'      THEN REPLACE(text, 'MC в pisces',      'MC в Рыбах')
    ELSE text
  END
WHERE key LIKE 'natal.angle.mc.sign.%';

COMMIT;

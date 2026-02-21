BEGIN;

INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.angle.mc.sign.any','career','ru-RU','MC (Середина Неба) показывает общий вектор карьеры и социальной реализации.',90,strftime('%s','now'),1,'{}'),
('natal.house.10.cusp.sign.any','career','ru-RU','10 дом: знак на куспиде задаёт стиль целей, статуса и профессионального образа.',85,strftime('%s','now'),1,'{}'),
('natal.house.10.ruler.any','career','ru-RU','Управитель 10 дома уточняет, через какие качества и сферы проще всего строить карьеру.',85,strftime('%s','now'),1,'{}'),
('natal.house.10.ruler.aspects.present','career','ru-RU','Аспекты управителя 10 дома показывают ключевые драйверы и напряжения в теме карьеры.',85,strftime('%s','now'),1,'{}'),
('natal.house.10.ruler.aspect.hard.present','career','ru-RU','Напряжённые аспекты управителя 10 дома часто дают вызовы, которые требуют дисциплины и стратегии.',85,strftime('%s','now'),1,'{}'),
('natal.house.6.cusp.sign.any','career','ru-RU','6 дом: стиль работы, рутина и то, как вы выстраиваете процесс и дисциплину.',80,strftime('%s','now'),1,'{}'),
('natal.house.6.ruler.any','career','ru-RU','Управитель 6 дома показывает, что помогает быть эффективным и как лучше организовать ежедневную работу.',80,strftime('%s','now'),1,'{}'),
('natal.house.2.cusp.sign.any','career','ru-RU','2 дом: связь дохода с личными навыками, ценностями и устойчивостью.',80,strftime('%s','now'),1,'{}'),
('natal.house.2.ruler.any','career','ru-RU','Управитель 2 дома показывает, через что проще монетизировать таланты и на чём держится финансовая устойчивость.',80,strftime('%s','now'),1,'{}'),
('natal.planet.saturn.sign.any','career','ru-RU','Сатурн: дисциплина, ответственность и способность строить долгосрочную траекторию.',75,strftime('%s','now'),1,'{}'),
('natal.planet.jupiter.sign.any','career','ru-RU','Юпитер: рост, возможности и расширение горизонтов в профессиональной сфере.',75,strftime('%s','now'),1,'{}'),

('natal.house.2.cusp.sign.any','money','ru-RU','2 дом: личные ресурсы, доход и ощущение финансовой опоры.',90,strftime('%s','now'),1,'{}'),
('natal.house.2.ruler.any','money','ru-RU','Управитель 2 дома показывает, через какие навыки и стратегии проще зарабатывать.',90,strftime('%s','now'),1,'{}'),
('natal.house.2.ruler.aspects.present','money','ru-RU','Аспекты управителя 2 дома показывают, какие факторы усиливают или осложняют денежный поток.',88,strftime('%s','now'),1,'{}'),
('natal.house.2.ruler.aspect.hard.present','money','ru-RU','Напряжённые аспекты управителя 2 дома часто требуют пересборки финансовых привычек и приоритетов.',88,strftime('%s','now'),1,'{}'),
('natal.house.8.cusp.sign.any','money','ru-RU','8 дом: общие ресурсы, обязательства, кредиты/инвестиции и финансовые трансформации.',88,strftime('%s','now'),1,'{}'),
('natal.house.8.ruler.any','money','ru-RU','Управитель 8 дома показывает подход к общим ресурсам и то, как вы управляете рисками.',88,strftime('%s','now'),1,'{}'),
('natal.house.8.ruler.aspects.present','money','ru-RU','Аспекты управителя 8 дома подсвечивают сценарии доверия/контроля и финансовых трансформаций.',86,strftime('%s','now'),1,'{}'),
('natal.planet.venus.sign.any','money','ru-RU','Венера: ценности, притяжение к комфорту и способы получать удовольствие от материального.',85,strftime('%s','now'),1,'{}'),
('natal.planet.jupiter.sign.any','money','ru-RU','Юпитер: расширение возможностей, удача и рост через обучение/связи/масштабирование.',85,strftime('%s','now'),1,'{}'),

('natal.angle.dsc.sign.any','love_intimacy','ru-RU','DSC (Десцендент): образ партнёрства и то, какие качества вы ищете в отношениях.',90,strftime('%s','now'),1,'{}'),
('natal.house.7.cusp.sign.any','love_intimacy','ru-RU','7 дом: стиль союза, ожидания от партнёра и динамика "я-мы".',88,strftime('%s','now'),1,'{}'),
('natal.house.7.ruler.any','love_intimacy','ru-RU','Управитель 7 дома показывает, как вы строите отношения и что важно для устойчивости союза.',88,strftime('%s','now'),1,'{}'),
('natal.house.7.ruler.aspects.present','love_intimacy','ru-RU','Аспекты управителя 7 дома показывают, что усиливает близость и где возможны трения.',86,strftime('%s','now'),1,'{}'),
('natal.house.5.cusp.sign.any','love_intimacy','ru-RU','5 дом: романтика, влюблённость, игра и способ выражать чувства.',86,strftime('%s','now'),1,'{}'),
('natal.house.8.cusp.sign.any','love_intimacy','ru-RU','8 дом: интимность, доверие, глубина и трансформации в отношениях.',86,strftime('%s','now'),1,'{}'),
('natal.planet.venus.sign.any','love_intimacy','ru-RU','Венера: язык любви, привлекательность и то, что создаёт гармонию.',85,strftime('%s','now'),1,'{}'),
('natal.planet.mars.sign.any','love_intimacy','ru-RU','Марс: страсть, инициативность и способ добиваться желаемого в отношениях.',85,strftime('%s','now'),1,'{}'),
('natal.planet.moon.sign.any','love_intimacy','ru-RU','Луна: эмоциональные потребности и то, что создаёт чувство безопасности в близости.',85,strftime('%s','now'),1,'{}'),
('natal.aspect.with.angle.dsc','love_intimacy','ru-RU','Аспекты к DSC подчёркивают, какие энергии сильнее всего включаются в парных взаимодействиях.',82,strftime('%s','now'),1,'{}'),
('natal.aspect.any.square.with.angle.dsc','love_intimacy','ru-RU','Квадраты к DSC часто показывают задачи по границам и совместимости ожиданий.',80,strftime('%s','now'),1,'{}'),
('natal.aspect.any.opposition.with.angle.dsc','love_intimacy','ru-RU','Оппозиции к DSC часто дают полярность "я-партнёр", требующую баланса и диалога.',80,strftime('%s','now'),1,'{}'),

('natal.house.cusp.core','','ru-RU','Куспид дома: знак на границе дома задаёт стиль проявления тем этого дома.',70,strftime('%s','now'),1,'{}'),
('natal.house.ruler.core','','ru-RU','Управитель дома: планета-управитель знака на куспиде показывает механизм реализации тем дома.',70,strftime('%s','now'),1,'{}'),
('natal.aspect.core.definition','','ru-RU','Аспекты описывают взаимодействие факторов карты: гармония даёт лёгкость, напряжение - задачи и рост.',70,strftime('%s','now'),1,'{}');

COMMIT;

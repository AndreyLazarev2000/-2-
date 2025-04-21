-- Вставка жанров (не менее 3)
INSERT INTO genres (name) VALUES
    ('Рок'),
    ('Поп'),
    ('Хип-хоп'),
    ('Джаз'),
    ('Электроника');

-- Вставка исполнителей (не менее 4)
INSERT INTO artists (name) VALUES
    ('Кино'),
    ('Ария'),
    ('Баста'),
    ('Земфира'),
    ('Би-2');

-- Вставка связей исполнителей и жанров
INSERT INTO artist_genres (artist_id, genre_id) VALUES
    (1, 1),  -- Кино - Рок
    (2, 1),  -- Ария - Рок
    (3, 3),  -- Баста - Хип-хоп
    (3, 2),  -- Баста - Поп
    (4, 1),  -- Земфира - Рок
    (4, 2),  -- Земфира - Поп
    (5, 1),  -- Би-2 - Рок
    (5, 2);  -- Би-2 - Поп

-- Вставка альбомов (не менее 3)
INSERT INTO albums (title, release_year) VALUES
    ('Группа крови', 1988),
    ('Герой асфальта', 1987),
    ('Баста 3', 2010),
    ('Земфира Live', 1999),
    ('Мяу кисс ми', 2001);

-- Вставка связей альбомов и исполнителей
INSERT INTO albums_artists (album_id, artist_id) VALUES
    (1, 1),  -- Группа крови - Кино
    (2, 2),  -- Герой асфальта - Ария
    (3, 3),  -- Баста 3 - Баста
    (4, 4),  -- Земфира Live - Земфира
    (5, 5);  -- Мяу кисс ми - Би-2

-- Вставка треков (не менее 6)
INSERT INTO tracks (title, duration, album_id) VALUES
    -- Альбом "Группа крови"
    ('Группа крови', 291, 1),
    ('Закрой за мной дверь', 242, 1),
    
    -- Альбом "Герой асфальта"
    ('Герой асфальта', 366, 2),
    ('Улица роз', 314, 2),
    
    -- Альбом "Баста 3"
    ('Сансара', 238, 3),
    ('Мама', 204, 3),
    
    -- Альбом "Земфира Live"
    ('Ариведерчи', 219, 4),
    
    -- Альбом "Мяу кисс ми"
    ('Полковнику никто не пишет', 259, 5),
    ('Варвара', 221, 5);

-- Вставка сборников (не менее 4)
INSERT INTO compilations (title, release_year) VALUES
    ('Лучшие русские рок-хиты', 2005),
    ('Хип-хоп сборник', 2012),
    ('Поп-музыка 2000-х', 2019),
    ('Легенды русского рока', 2020),
    ('Классика русского рэпа', 2018);

-- Вставка связей сборников и треков
INSERT INTO compilation_tracks (compilation_id, track_id) VALUES
    -- Лучшие русские рок-хиты
    (1, 1),  -- Группа крови
    (1, 2),  -- Закрой за мной дверь
    (1, 3),  -- Герой асфальта
    (1, 9),  -- Полковнику никто не пишет
    
    -- Хип-хоп сборник
    (2, 5),  -- Сансара
    (2, 6),  -- Мама
    
    -- Поп-музыка 2000-х
    (3, 6),  -- Мама
    (3, 7),  -- Ариведерчи
    
    -- Легенды русского рока
    (4, 1),  -- Группа крови
    (4, 3),  -- Герой асфальта
    (4, 9),  -- Полковнику никто не пишет
    
    -- Классика русского рэпа
    (5, 5);  -- Сансара


--Всех исполнителей не хватило и поэтому добавил еще несколько 
-- Сначала добавляем всех исполнителей
INSERT INTO artists (name) VALUES
    ('Монеточка'),
    ('Нервы'),
    ('Скриптонит'),
    ('Мэйби Бэйби'),
    ('ЛСП'),
    ('Face'),
    ('Канги'),
    ('Макс Корж'),
    ('Элджей');

-- Теперь добавляем связи исполнителей с жанрами
-- Используем подзапросы для получения правильных artist_id
INSERT INTO artist_genres (artist_id, genre_id) VALUES
    ((SELECT artist_id FROM artists WHERE name = 'Монеточка'), 2),  -- Монеточка - Поп
    ((SELECT artist_id FROM artists WHERE name = 'Нервы'), 1),      -- Нервы - Рок
    ((SELECT artist_id FROM artists WHERE name = 'Нервы'), 2),      -- Нервы - Поп
    ((SELECT artist_id FROM artists WHERE name = 'Скриптонит'), 3), -- Скриптонит - Хип-хоп
    ((SELECT artist_id FROM artists WHERE name = 'Мэйби Бэйби'), 2),-- Мэйби Бэйби - Поп
    ((SELECT artist_id FROM artists WHERE name = 'ЛСП'), 3),        -- ЛСП - Хип-хоп
    ((SELECT artist_id FROM artists WHERE name = 'ЛСП'), 2),        -- ЛСП - Поп
    ((SELECT artist_id FROM artists WHERE name = 'Face'), 3),       -- Face - Хип-хоп
    ((SELECT artist_id FROM artists WHERE name = 'Канги'), 3),      -- Канги - Хип-хоп
    ((SELECT artist_id FROM artists WHERE name = 'Макс Корж'), 2),  -- Макс Корж - Поп
    ((SELECT artist_id FROM artists WHERE name = 'Макс Корж'), 3),  -- Макс Корж - Хип-хоп
    ((SELECT artist_id FROM artists WHERE name = 'Элджей'), 3),     -- Элджей - Хип-хоп
    ((SELECT artist_id FROM artists WHERE name = 'Элджей'), 2);     -- Элджей - Поп

-- Добавляем новые альбомы
INSERT INTO albums (title, release_year) VALUES
    -- 2018 год
    ('Раскраски для взрослых', 2018),
    ('Костёр', 2018),
    ('2004', 2018),
    
    -- 2019 год
    ('Декоративно-прикладное искусство', 2019),
    ('Tragic City', 2019),
    ('Sayonara Boy X', 2019),
    
    -- 2020 год
    ('Не в этом мире', 2020),
    ('Малый повзрослел', 2020),
    ('Sayonara Boy 2', 2020);

-- Добавляем связи альбомов с исполнителями (используем подзапросы для получения ID)
INSERT INTO albums_artists (album_id, artist_id) VALUES
    ((SELECT album_id FROM albums WHERE title = 'Раскраски для взрослых'), 
     (SELECT artist_id FROM artists WHERE name = 'Монеточка')),
    
    ((SELECT album_id FROM albums WHERE title = 'Костёр'), 
     (SELECT artist_id FROM artists WHERE name = 'Нервы')),
    
    ((SELECT album_id FROM albums WHERE title = '2004'), 
     (SELECT artist_id FROM artists WHERE name = 'Скриптонит')),
    
    ((SELECT album_id FROM albums WHERE title = 'Декоративно-прикладное искусство'), 
     (SELECT artist_id FROM artists WHERE name = 'Мэйби Бэйби')),
    
    ((SELECT album_id FROM albums WHERE title = 'Tragic City'), 
     (SELECT artist_id FROM artists WHERE name = 'ЛСП')),
    
    ((SELECT album_id FROM albums WHERE title = 'Sayonara Boy X'), 
     (SELECT artist_id FROM artists WHERE name = 'Face')),
    
    ((SELECT album_id FROM albums WHERE title = 'Не в этом мире'), 
     (SELECT artist_id FROM artists WHERE name = 'Канги')),
    
    ((SELECT album_id FROM albums WHERE title = 'Малый повзрослел'), 
     (SELECT artist_id FROM artists WHERE name = 'Макс Корж')),
    
    ((SELECT album_id FROM albums WHERE title = 'Sayonara Boy 2'), 
     (SELECT artist_id FROM artists WHERE name = 'Элджей'));

-- Добавляем треки для новых альбомов (используем подзапросы для album_id)
INSERT INTO tracks (title, duration, album_id) VALUES
    ('Каждый раз', 193, (SELECT album_id FROM albums WHERE title = 'Раскраски для взрослых')),
    ('Нимфоманка', 224, (SELECT album_id FROM albums WHERE title = 'Раскраски для взрослых')),
    
    ('Костёр', 195, (SELECT album_id FROM albums WHERE title = 'Костёр')),
    ('Батареи', 213, (SELECT album_id FROM albums WHERE title = 'Костёр')),
    
    ('2004', 183, (SELECT album_id FROM albums WHERE title = '2004')),
    ('Фокус', 201, (SELECT album_id FROM albums WHERE title = '2004')),
    
    ('90', 178, (SELECT album_id FROM albums WHERE title = 'Декоративно-прикладное искусство')),
    ('Кукла', 165, (SELECT album_id FROM albums WHERE title = 'Декоративно-прикладное искусство')),
    
    ('Мне скучно жить', 221, (SELECT album_id FROM albums WHERE title = 'Tragic City')),
    ('Один', 198, (SELECT album_id FROM albums WHERE title = 'Tragic City')),
    
    ('Грустная песня', 185, (SELECT album_id FROM albums WHERE title = 'Sayonara Boy X')),
    ('Малый прыгает', 203, (SELECT album_id FROM albums WHERE title = 'Sayonara Boy X')),
    
    ('Не в этом мире', 192, (SELECT album_id FROM albums WHERE title = 'Не в этом мире')),
    ('Плачь', 176, (SELECT album_id FROM albums WHERE title = 'Не в этом мире')),
    
    ('Малый повзрослел', 211, (SELECT album_id FROM albums WHERE title = 'Малый повзрослел')),
    ('Бандит', 199, (SELECT album_id FROM albums WHERE title = 'Малый повзрослел')),
    
    ('Sayonara Boy', 188, (SELECT album_id FROM albums WHERE title = 'Sayonara Boy 2')),
    ('Деньги', 205, (SELECT album_id FROM albums WHERE title = 'Sayonara Boy 2'));

-- Добавляем новые сборники
INSERT INTO compilations (title, release_year) VALUES
    ('Русский рок 2018-2020', 2021),
    ('Хиты 2020', 2020);

-- Добавляем связи сборников с треками (используем подзапросы для получения ID)
INSERT INTO compilation_tracks (compilation_id, track_id) VALUES
    ((SELECT compilation_id FROM compilations WHERE title = 'Русский рок 2018-2020'),
     (SELECT track_id FROM tracks WHERE title = 'Костёр' AND album_id = (SELECT album_id FROM albums WHERE title = 'Костёр'))),
    
    ((SELECT compilation_id FROM compilations WHERE title = 'Русский рок 2018-2020'),
     (SELECT track_id FROM tracks WHERE title = 'Батареи' AND album_id = (SELECT album_id FROM albums WHERE title = 'Костёр'))),
    
    ((SELECT compilation_id FROM compilations WHERE title = 'Русский рок 2018-2020'),
     (SELECT track_id FROM tracks WHERE title = 'Малый повзрослел' AND album_id = (SELECT album_id FROM albums WHERE title = 'Малый повзрослел'))),
    
    ((SELECT compilation_id FROM compilations WHERE title = 'Хиты 2020'),
     (SELECT track_id FROM tracks WHERE title = 'Не в этом мире' AND album_id = (SELECT album_id FROM albums WHERE title = 'Не в этом мире'))),
    
    ((SELECT compilation_id FROM compilations WHERE title = 'Хиты 2020'),
     (SELECT track_id FROM tracks WHERE title = 'Малый повзрослел' AND album_id = (SELECT album_id FROM albums WHERE title = 'Малый повзрослел'))),
    
    ((SELECT compilation_id FROM compilations WHERE title = 'Хиты 2020'),
     (SELECT track_id FROM tracks WHERE title = 'Деньги' AND album_id = (SELECT album_id FROM albums WHERE title = 'Sayonara Boy 2')));
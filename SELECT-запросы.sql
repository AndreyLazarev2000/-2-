-- Добавляем нового исполнителя
INSERT INTO artists (name) VALUES ('Новый исполнитель');

-- Добавляем новый жанр (если нужно)
INSERT INTO genres (name) VALUES ('Новый жанр')
ON CONFLICT (name) DO NOTHING;

-- Связываем исполнителя с жанром (используем существующий жанр Рок с id=1)
INSERT INTO artist_genres (artist_id, genre_id) 
VALUES (
    (SELECT artist_id FROM artists WHERE name = 'Новый исполнитель'),
    1
);

-- Добавляем новый альбом
INSERT INTO albums (title, release_year) 
VALUES ('Мой первый альбом', 2023);

-- Связываем альбом с исполнителем
INSERT INTO albums_artists (album_id, artist_id)
VALUES (
    (SELECT album_id FROM albums WHERE title = 'Мой первый альбом'),
    (SELECT artist_id FROM artists WHERE name = 'Новый исполнитель')
);

-- Добавляем трек с словом "мой"
INSERT INTO tracks (title, duration, album_id)
VALUES (
    'Это мой трек',
    240,
    (SELECT album_id FROM albums WHERE title = 'Мой первый альбом')
);

-- Добавляем трек с словом "my" (английская версия)
INSERT INTO tracks (title, duration, album_id)
VALUES (
    'This is my song',
    210,
    (SELECT album_id FROM albums WHERE title = 'Мой первый альбом')
);

-- Добавляем сборник (опционально)
INSERT INTO compilations (title, release_year)
VALUES ('Лучшие треки 2023', 2023);

-- Связываем треки со сборником
INSERT INTO compilation_tracks (compilation_id, track_id)
VALUES (
    (SELECT compilation_id FROM compilations WHERE title = 'Лучшие треки 2023'),
    (SELECT track_id FROM tracks WHERE title = 'Это мой трек')
),
(
    (SELECT compilation_id FROM compilations WHERE title = 'Лучшие треки 2023'),
    (SELECT track_id FROM tracks WHERE title = 'This is my song')
);






-- SELECT-запросы
-- Название и продолжительность самого длительного трека:
SELECT title, duration 
FROM tracks 
ORDER BY duration DESC 
LIMIT 1;

--Название треков, продолжительность которых не менее 3,5 минут (210 секунд):
SELECT title 
FROM tracks 
WHERE duration >= 210;


--Названия сборников, вышедших в период с 2018 по 2020 год включительно:
SELECT title 
FROM compilations 
WHERE release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова:
SELECT name 
FROM artists 
WHERE name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my» (решение через регулярки):
SELECT title 
FROM tracks 
WHERE title ~* '(^|\s)мой(\s|$)' 
   OR title ~* '(^|\s)my(\s|$)';

--Название треков, которые содержат слово «мой» или «my» (решение через LIKE):
SELECT title 
FROM tracks 
WHERE title ILIKE 'мой %'   -- В начале с пробелом после
   OR title ILIKE '% мой'   -- В конце с пробелом перед
   OR title ILIKE '% мой %' -- В середине с пробелами
   OR title ILIKE 'мой'     -- Только слово
   OR title ILIKE 'my %'    -- В начале с пробелом после
   OR title ILIKE '% my'    -- В конце с пробелом перед
   OR title ILIKE '% my %'  -- В середине с пробелами
   OR title ILIKE 'my';     -- Только слово

--Задание 3
--Количество исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;

--Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;
--*Примечание: в текущих данных только сборник "Поп-музыка 2000-х" (2019) и "Легенды русского рока" (2020) попадают в этот диапазон, 
--но сами альбомы с треками выпущены раньше. Для получения непустого результата можно временно изменить год альбома:*

UPDATE albums SET release_year = 2019 WHERE album_id = 5;

--Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, 
       ROUND(AVG(t.duration), 2) AS avg_duration_seconds,
       CONCAT(FLOOR(AVG(t.duration)/60), ':', LPAD(FLOOR(AVG(t.duration)%60)::text, 2, '0')) AS avg_duration_min_sec
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.title
ORDER BY avg_duration_seconds DESC;

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name AS artist_name
FROM artists ar
WHERE ar.artist_id NOT IN (
    SELECT aa.artist_id
    FROM albums_artists aa
    JOIN albums al ON aa.album_id = al.album_id
    WHERE al.release_year = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (например, "Би-2")
SELECT DISTINCT c.title AS compilation_title
FROM compilations c
JOIN compilation_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN albums_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'Би-2'
ORDER BY c.title;
-- 1. Количество исполнителей в каждом жанре
SELECT g.genres_name, COUNT(ag.author_id) AS authors_count
FROM Genres g
LEFT JOIN Author_Genres ag ON g.genres_id = ag.genres_id
GROUP BY g.genres_id, g.genres_name
ORDER BY authors_count DESC;

-- 2. Количество треков в альбомах 2019–2020 гг.
SELECT COUNT(t.track_id) AS tracks_count
FROM Track t
JOIN Album a ON t.album_id = a.album_id
WHERE a.album_release BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT a.album_name, AVG(t.track_duration) AS avg_duration_sec
FROM Album a
JOIN Track t ON a.album_id = t.album_id
GROUP BY a.album_id, a.album_name
ORDER BY avg_duration_sec DESC;

-- 4. Исполнители, НЕ выпустившие альбомы в 2020 году
SELECT DISTINCT au.author_name
FROM Author au
WHERE au.author_id NOT IN (
    SELECT aa.author_id
    FROM Author_Album aa
    JOIN Album al ON aa.album_id = al.album_id
    WHERE al.album_release = 2020
);

-- 5. Сборники с треками конкретного исполнителя (например, Queen = author_id = 1)
SELECT DISTINCT c.collection_name
FROM Collection c
JOIN Collection_Track ct ON c.collection_id = ct.collection_id
JOIN Track t ON ct.track_id = t.track_id
JOIN Author_Album aa ON t.album_id = aa.album_id
WHERE aa.author_id = 1; -- Queen
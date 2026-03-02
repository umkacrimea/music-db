-- 1. Название и продолжительность самого длительного трека
SELECT track_name, track_duration 
FROM Track 
ORDER BY track_duration DESC 
LIMIT 1;

-- 2. Треки длительностью ≥ 3.5 минут (210 секунд)
SELECT track_name 
FROM Track 
WHERE track_duration >= 210;

-- 3. Сборники 2018–2020 гг.
SELECT collection_name 
FROM Collection 
WHERE collection_release BETWEEN 2018 AND 2020;

-- 4. Исполнители с именем из одного слова (без пробелов)
SELECT author_name 
FROM Author 
WHERE author_name !~ '\s';

-- 5. Треки, содержащие «мой» или «my» (регистронезависимо)
SELECT track_name 
FROM Track 
WHERE track_name ILIKE '%my%';
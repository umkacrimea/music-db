-- Жанры (3+)
INSERT INTO Genres (genres_name) VALUES
('Rock'),
('Pop'),
('Electronic');

-- Исполнители (4+)
INSERT INTO Author (author_name) VALUES
('Queen'),
('Madonna'),
('DaftPunk'),
('Beyonce');

-- Связь исполнителей с жанрами
INSERT INTO Author_Genres (author_id, genres_id) VALUES
(1, 1), -- Queen → Rock
(2, 2), -- Madonna → Pop
(3, 3), -- DaftPunk → Electronic
(4, 2), -- Beyonce → Pop
(1, 2), -- Queen → Pop (кросс-жанр)
(3, 1); -- DaftPunk → Rock (кросс-жанр)

-- Альбомы (3+)
INSERT INTO Album (album_name, album_release) VALUES
('A Night at the Opera', 1975),
('Like a Prayer', 1989),
('Random Access Memories', 2013),
('Lemonade', 2016),
('Future Nostalgia', 2020);

-- Связь исполнителей с альбомами
INSERT INTO Author_Album (author_id, album_id) VALUES
(1, 1), -- Queen → A Night at the Opera
(2, 2), -- Madonna → Like a Prayer
(3, 3), -- DaftPunk → Random Access Memories
(4, 4), -- Beyonce → Lemonade
(1, 3), -- Queen → Random Access Memories (коллаб)
(2, 5); -- Madonna → Future Nostalgia (коллаб)

-- Треки (6+) — длительность в секундах
-- Дополнительные треки для проверки поиска слов "my" и "мой"
INSERT INTO Track (track_name, track_duration, album_id) VALUES
-- Должны попасть в выборку (содержат "my" как отдельное слово)
('my own', 210, 1),        -- "my" в начале
('own my', 195, 2),        -- "my" в конце  
('my', 180, 3),            -- только "my"
('oh my god', 225, 4),     -- "my" в середине
('my life', 240, 5),       -- "my" в начале
('this is my song', 255, 1), -- "my" в середине
('say my name', 230, 2),   -- "my" в середине

-- Должны попасть в выборку (содержат "мой" как отдельное слово)
('мой день', 200, 3),       -- "мой" в начале
('это мой мир', 215, 4),    -- "мой" в середине
('голос мой', 190, 5),      -- "мой" в конце
('мой', 175, 1),            -- только "мой"
('где мой дом', 235, 2),    -- "мой" в середине

-- НЕ должны попасть в выборку (содержат "my" как часть слова)
('myself', 220, 3),         -- my часть слова myself
('by myself', 245, 4),      -- my часть слова myself
('bemy self', 205, 5),      -- my часть слова bemy
('myself by', 215, 1),      -- my часть слова myself
('by myself by', 225, 2),   -- my часть слова myself
('beemy', 185, 3),          -- my часть слова beemy
('premyne', 195, 4),        -- my часть слова premyne
('myopic', 210, 5),         -- my часть слова myopic (медицинский термин)
('myth', 200, 1),           -- my часть слова myth
('enemy', 190, 2),          -- my часть слова enemy

-- НЕ должны попасть в выборку (содержат "мой" как часть слова)
('помойка', 180, 3),        -- мой часть слова помойка
('замой', 175, 4),          -- мой часть слова замой
('мойка', 185, 5),          -- мой часть слова мойка
('примой', 195, 1),         -- мой часть слова примой
('обмой', 205, 2);          -- мой часть слова обмой

-- Сборники (4+)
INSERT INTO Collection (collection_name, collection_release) VALUES
('Greatest Hits 2018', 2018),
('Best of Pop', 2019),
('Electronic Vibes', 2020),
('Rock Legends', 2017),
('Summer Mix 2020', 2020);

-- Связь сборников с треками
INSERT INTO Collection_Track (collection_id, track_id) VALUES
(1, 1), -- Greatest Hits 2018 → Bohemian Rhapsody
(1, 3), -- Greatest Hits 2018 → Like a Prayer
(2, 3), -- Best of Pop → Like a Prayer
(2, 6), -- Best of Pop → Formation
(3, 4), -- Electronic Vibes → Get Lucky
(3, 5), -- Electronic Vibes → my way
(4, 1), -- Rock Legends → Bohemian Rhapsody
(5, 7), -- Summer Mix 2020 → Halo
(5, 8); -- Summer Mix 2020 → Levitating

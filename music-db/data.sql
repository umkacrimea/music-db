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
INSERT INTO Track (track_name, track_duration, album_id) VALUES
('Bohemian Rhapsody', 354, 1),      -- 5:54
('My Heart Will Go On', 280, 1),     -- 4:40
('Like a Prayer', 340, 2),           -- 5:40
('Get Lucky', 368, 3),               -- 6:08
('my way', 295, 3),                  -- 4:55 (содержит "my")
('Formation', 206, 4),               -- 3:26
('Halo', 261, 4),                    -- 4:21
('Levitating', 203, 5);              -- 3:23

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
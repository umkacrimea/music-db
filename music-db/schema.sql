-- Удаление таблиц в обратном порядке (для перезапуска)
DROP TABLE IF EXISTS Collection_Track CASCADE;
DROP TABLE IF EXISTS Collection CASCADE;
DROP TABLE IF EXISTS Track CASCADE;
DROP TABLE IF EXISTS Author_Album CASCADE;
DROP TABLE IF EXISTS Album CASCADE;
DROP TABLE IF EXISTS Author_Genres CASCADE;
DROP TABLE IF EXISTS Author CASCADE;
DROP TABLE IF EXISTS Genres CASCADE;

-- Жанры
CREATE TABLE Genres (
    genres_id SERIAL PRIMARY KEY,
    genres_name VARCHAR(255) NOT NULL UNIQUE
);

-- Исполнители
CREATE TABLE Author (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL UNIQUE,
    CHECK (author_name !~ '\s') -- имя из одного слова (опционально)
);

-- Связь исполнителей и жанров (многие-ко-многим)
CREATE TABLE Author_Genres (
    author_id INT NOT NULL,
    genres_id INT NOT NULL,
    PRIMARY KEY (author_id, genres_id), -- составной первичный ключ
    FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE CASCADE,
    FOREIGN KEY (genres_id) REFERENCES Genres(genres_id) ON DELETE CASCADE
);

-- Альбомы
CREATE TABLE Album (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    album_release INT NOT NULL CHECK (album_release BETWEEN 1900 AND 2100)
);

-- Связь исполнителей и альбомов (многие-ко-многим)
CREATE TABLE Author_Album (
    author_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (author_id, album_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES Album(album_id) ON DELETE CASCADE
);

-- Треки (duration в секундах — INTEGER)
CREATE TABLE Track (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    track_duration INT NOT NULL CHECK (track_duration > 0 AND track_duration <= 7200), -- до 2 часов
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Album(album_id) ON DELETE CASCADE
);

-- Сборники
CREATE TABLE Collection (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    collection_release INT NOT NULL CHECK (collection_release BETWEEN 1900 AND 2100)
);

-- Связь сборников и треков (многие-ко-многим)
CREATE TABLE Collection_Track (
    collection_id INT NOT NULL,
    track_id INT NOT NULL,
    PRIMARY KEY (collection_id, track_id),
    FOREIGN KEY (collection_id) REFERENCES Collection(collection_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Track(track_id) ON DELETE CASCADE
);
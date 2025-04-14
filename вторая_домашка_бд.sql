-- Жанры
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Исполнители
CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Связь исполнителей и жанров (многие-ко-многим)
CREATE TABLE artist_genres (
    artist_id INTEGER REFERENCES artists(artist_id),
    genre_id INTEGER REFERENCES genres(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

-- Альбомы
CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER
);

-- Связь альбомов и исполнителей (многие-ко-многим)
CREATE TABLE albums_artists (
    album_id INTEGER REFERENCES albums(album_id),
    artist_id INTEGER REFERENCES artists(artist_id),
    PRIMARY KEY (album_id, artist_id)
);

-- Треки
CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER REFERENCES albums(album_id)
);

-- Сборники
CREATE TABLE compilations (
    compilation_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER
);

-- Связь сборников и треков (многие-ко-многим)
CREATE TABLE compilation_tracks (
    compilation_id INTEGER REFERENCES compilations(compilation_id),
    track_id INTEGER REFERENCES tracks(track_id),
    PRIMARY KEY (compilation_id, track_id)
);
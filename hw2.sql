CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL UNIQUE 

);

CREATE TABLE IF NOT EXISTS Authors (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL UNIQUE 
);

CREATE TABLE IF NOT EXISTS GenresAuthors (
	genre_id INTEGER REFERENCES Genres(id),
	author_id INTEGER REFERENCES Authors(id),
	CONSTRAINT genresauthor PRIMARY KEY (genre_id, author_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL UNIQUE,
	release DATE NOT NULL CHECK (release BETWEEN '1970-01-01' AND current_date)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL UNIQUE,
	duration INTEGER NOT NULL CHECK (duration > 60),
	album_id INTEGER REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS AlbumsAuthors (
	album_id INTEGER REFERENCES Albums(id),
	author_id INTEGER REFERENCES Authors(id),
	CONSTRAINT albumsauthor PRIMARY KEY (album_id, author_id)
);

CREATE TABLE IF NOT EXISTS Compilations (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL UNIQUE,
	release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS CompilationsTracks (
	compilation_id INTEGER REFERENCES Compilations(id),
	track_id INTEGER REFERENCES Tracks(id),
	CONSTRAINT ct PRIMARY KEY (compilation_id, track_id)
);


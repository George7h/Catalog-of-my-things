CREATE TABLE Items (
  id INT GENERATED ALWAYS AS IDENTITY,
  published_date DATE,
  archived BOOLEAN,
)

-- Labels Table
CREATE TABLE Labels (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,, 
  published_date DATE,
  item_id INT,
  items TEXT[],
  Foreign Key (item_id) REFERENCES (items_id)
  PRIMARY KEY (id)
);

-- Books Table
CREATE TABLE Books (
    id INT GENERATED ALWAYS AS IDENTITY
    item_id INT,
    title VARCHAR(255),
    author_id INT,
    label_id Int,
    cover_state VARCHAR(255),
    publisher VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
    PRIMARY KEY(id)
);

-- Authors Table
CREATE TABLE authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT
);

-- Games Table
CREATE TABLE games (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  genre TEXT,
  author_id INTEGER,
  source TEXT,
  label TEXT,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- MusicAlbum Table
CREATE TABLE musicalbum (
  id INT GENERATED ALWAYS AS IDENTITY,
  item_id INT,
  on_spotify BOOLEAN,
  FOREIGN KEY (item_id) REFERENCES items(id),
  PRIMARY KEY(id)
);

-- Genre Table
CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  item_id INT,
  items TEXT[],
  Foreign Key (item_id) REFERENCES (items_id)
  PRIMARY KEY (id)
);

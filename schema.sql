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

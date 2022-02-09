CREATE DATABASE catalog_of_my_things;


CREATE TABLE Book (
  id            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  genre_id      INT,
  label_id     INT,  
  publish_date  DATE,
  archived      BOOLEAN,
  publisher     VARCHAR(250),
  cover_state   VARCHAR(4),

  FOREIGN KEY (genre_id) REFERENCES Genre(id)  
  FOREIGN KEY (label_id) REFERENCES Label(id)
    
);

CREATE TABLE MusicAlbum(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    genre_id      INT,
    label_id      INT,
    publish_date  DATE,
    archived      BOOLEAN,
    on_spotify VARCHAR(2),
    

    FOREIGN KEY (genre_id) REFERENCES Genre(id)  
    FOREIGN KEY (label_id) REFERENCES Label(id)
    
);

CREATE TABLE Label (
    id      INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title   VARCHAR(100),
    color   VARCHAR(100)
);

CREATE TABLE Genre(
  id    INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
  name VARCHAR(100)
); 
DROP DATABASE IF EXISTS DB4_2024_Movies;
CREATE DATABASE IF NOT EXISTS DB4_2024_Movies;
USE DB4_2024_Movies;

CREATE TABLE movies (
	moviename VARCHAR(30),
	producer VARCHAR(30),
    releasedate  DATETIME NOT NULL
	);
    
    insert into movies values('Movie 1','Producer 1','2024-01-01');
    insert into movies values('Movie 2','Producer 2','2024-01-01');
    insert into movies values('Movie 3','Producer 3','2024-04-03');
	

SELECT * FROM movies;
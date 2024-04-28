CREATE DATABASE `6.2 assignment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
/*
  Title: db_assignment.sql
  Author: Victor Gregory
  Professor Sampson
  Date: 4/20/2024
  Description: movies database initilization script.
*/

-- drop database user if exists
DROP USER IF EXISTS 'movies_user'@'localhost';

-- create movies_user and grant them all privileges to the movies database
CREATE USER 'movies_user'@'localhost' IDENTIFIED with mysql_native_password BY 'popcorn';

-- drop tables if they are present
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS genre;

-- create the studio table
CREATE TABLE studio (
  Studio_id INT NOT NULL AUTO_INCREMENT,
  studio_name VARCHAR(75) NOT NULL,
  PRIMARY KEY (studio_id)
);

-- create the genre table
CREATE TABLE genre (
  genre_id INT NOT NULL AUTO_INCREMENT,
  genre_name VARCHAR(75) NOT NULL,
  PRIMARY KEY (genre_id)
);

-- create the film table and set the foreign key
CREATE TABLE film (
  film_id INT NOT NULL AUTO_INCREMENT,
  film_name VARCHAR(75) NOT NULL,
  film_releaseDate DATE NOT NULL,
  film_runtime INT NOT NULL,
  film_director VARCHAR(100),
  studio_id INT NOT NULL,
  FOREIGN KEY (studio_id) REFERENCES studio(studio_id),
  genre_id INT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
  PRIMARY KEY (film_id)
);

-- insert studio records
INSERT INTO studio(studio_name)
  VALUES('20th Century Fox');

INSERT INTO studio(studio_name)
  VALUES('Walt Disney Studios');

INSERT INTO studio(studio_name)
  VALUES('Universal Pictures');

-- insert genre records
INSERT INTO genre(genre_name)
  VALUES('Horror');

INSERT INTO genre(genre_name)
  VALUES('SciFi');

INSERT INTO genre(genre_name)
  VALUES('Drama');

-- insert movie records
INSERT INTO film(film_name, film_releaseDate, film_runtime, film_director, studio_id, genre_id)
  VALUES('Gladiator', '2000-05-05', 155, 'Ridley Scott', (SELECT studio_id FROM studio WHERE studio_name = '20th Century Fox'),
  (SELECT genre_id FROM genre WHERE genre_name = 'Drama'));

INSERT INTO film(film_name, film_releaseDate, film_runtime, film_director, studio_id, genre_id)
  VALUES('Alien', '1979-05-25', 104, 'Ridley Scott', 
         (SELECT studio_id FROM studio WHERE studio_name = '20th Century Fox'), 
         (SELECT genre_id FROM genre WHERE genre_name = 'SciFi'));

INSERT INTO film(film_name, film_releaseDate, film_runtime, film_director, studio_id, genre_id)
  VALUES('Get Out', '2017-02-24', 104, 'Jordan Peele', 
         (SELECT studio_id FROM studio WHERE studio_name = 'Universal Pictures'), 
         (SELECT genre_id FROM genre WHERE genre_name = 'Horror'));
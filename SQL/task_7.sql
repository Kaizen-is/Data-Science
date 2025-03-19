CREATE DATABASE CinemaBooking ;
CREATE SCHEMA   Schedules;

CREATE TABLE Movies (
	movie_id int primary key,
    movie_name varchar (100),
    genre varchar (100),
    duration time,
    rating float
);

INSERT INTO Movies (movie_id, movie_name, genre, duration, rating)
VALUES  
(1, 'The Shawshank Redemption', 'Drama', 142, 9.3),
(2, 'The Dark Knight', 'Action', 152, 9.0),
(3, 'Inception', 'Sci-Fi', 148, 8.8),
(4, 'Forrest Gump', 'Drama', 142, 8.8),
(5, 'The Matrix', 'Sci-Fi', 136, 8.7),
(6, 'The Godfather', 'Crime', 175, 9.2),
(7, 'Pulp Fiction', 'Crime', 154, 8.9),
(8, 'Fight Club', 'Drama', 139, 8.8),
(9, 'Interstellar', 'Sci-Fi', 169, 8.6),
(10, 'The Lion King', 'Animation', 88, 8.5),
(11, 'The Avengers', 'Action', 143, 8.0),
(12, 'The Social Network', 'Biography', 120, 7.7),
(13, 'The Godfather Part II', 'Crime', 202, 9.0),
(14, 'Gladiator', 'Action', 155, 8.5),
(15, 'Avatar', 'Sci-Fi', 162, 7.8);   
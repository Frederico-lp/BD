.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

--query for average duration of movies for each genre (not working)
--SELECT Genre.name, avg(strftime('%S',Movie.duration)) AS duration, COUNT(Genre.name) 
SELECT Genre.name AS genre, avg(Movie.duration) AS duration, COUNT(Genre.name) 
FROM Movie
NATURAL JOIN  ShowGenre
NATURAL JOIN  Genre
GROUP BY Genre.name;
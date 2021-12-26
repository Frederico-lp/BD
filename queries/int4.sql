.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

--query for show with highest rating
SELECT id, name, rating
FROM Show
WHERE rating = (
    SELECT MAX(rating)
    FROM Show
)

--query for shows with rating higher than 8
--SELECT id, name, rating
--FROM Show
--WHERE rating > 8;
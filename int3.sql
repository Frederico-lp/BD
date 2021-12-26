.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

--query for shows that have the word 'game' in it's title
SELECT Show.id, Show.name, Show.rating
FROM Show
WHERE name LIKE '%game%'
ORDER BY rating ASC;
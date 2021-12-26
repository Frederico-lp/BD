.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

--query for shows from certain category
SELECT Show.id, Show.name, Show.rating, Genre.name
FROM Show, Genre, ShowGenre
WHERE ShowGenre.id_Show = Show.id AND ShowGenre.id_Genre = Genre.id
AND Genre.name='Western';
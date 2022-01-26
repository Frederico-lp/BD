.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

SELECT * FROM ShowGenre;

-- Inválido por ter um NULL associado como género
INSERT INTO ShowGenre (id_Show, id_Genre)
VALUES (2, NULL);

SELECT * FROM ShowGenre;

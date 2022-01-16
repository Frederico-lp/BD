.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

--notificate user when new episode of serie he is following is added
CREATE TRIGGER IF NOT EXISTS GATILHO_1
AFTER INSERT
ON Episode
--quando user seguir serie
WHEN
    SELECT id_User
    FROM Following, (
        SELECT id_Serie as id_of_season
        FROM Season
        WHERE id_Serie = inserted.id_Season
    )
    WHERE id_Serie = id_of_season
--nao estou a guardar o user e acho que falta alguma coisa em cima
BEGIN 
    INSERT INTO Notification
    VALUES (((SELECT max(id) FROM Notification) + 1), 'Episode'+inserted.number+'was added', User.id);
END;

INSERT INTO Notification
SELECT ((SELECT max(id) FROM Notification) + 1), 'Episode'+inserted.number+'was added', id_User
FROM Following, (
    SELECT id_Serie as id_of_season
    FROM Season
    WHERE id_Serie = 28
)
WHERE id_Serie = id_of_season;

-- SELECT id_User
-- FROM Following, (
--     SELECT id_Serie as id_of_season
--     FROM Season
--     WHERE id_Serie = 28
-- )
-- WHERE id_Serie = id_of_season;


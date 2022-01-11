.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

--notificate user when new episode of serie he is following is added
CREATE TRIGGER IF NOT EXISTS GATILHO_1
AFTER INSERT
ON Episode
--quando user seguir serie
WHEN inserted.id_Season = (Serie.id=
(
    SELECT Serie.id
    FROM Serie
    NATURAL JOIN Following
    NATURAL JOIN Serie
))
--nao estou a guardar o user e acho que falta alguma coisa em cima
BEGIN 
    INSERT INTO Notification
    VALUES (User.id, 'Episode'+inserted.number+'was added', User.id);
END;

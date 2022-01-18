.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

--Lista quais os comentários que foram feitos antes de um episódio ser lançado
SELECT name, content, cDate, launchDate
FROM Comment, Episode
WHERE Comment.id_Episode = Episode.id
AND DATE(Comment.cDate) < DATE(Episode.launchDate);

-- SQLite
/* SELECT id, username FROM User WHERE EXISTS (
    SELECT id_User
    FROM Following
    UNION
    SELECT id_User 
    FROM Watched
    UNION 
    SELECT id_User
    FROM Comment
) AND subActive = true; */

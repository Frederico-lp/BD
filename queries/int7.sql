.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

-- listar os comentários que 
-- foram publicados antes de um episódio ser lançado

SELECT name, content, cDate, launchDate
FROM Comment, Episode
WHERE Comment.id_Episode = Episode.id
AND DATE(Comment.cDate) < DATE(Episode.launchDate);

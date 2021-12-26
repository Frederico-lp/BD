.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

--query for episodes that didn't come out yet
SELECT Episode.name, Episode.launchDate, Episode.number, Season.number, Show.name
FROM Episode, Season, Serie, Show
WHERE Episode.id_Season=Season.id AND id_Serie=Serie.id AND Serie.id=Show.id
AND DATE(Episode.launchDate) > DATE('now');
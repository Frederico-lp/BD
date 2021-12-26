.mode columns
.headers ON
.nullvalue NULL


PRAGMA foreign_keys=ON;

--query for all episodes from specific season(1) and show(id=17)
SELECT Episode.name, Episode.number, Season.number, Show.name
FROM Episode, Season, Serie, Show
WHERE Episode.id_Season=Season.id AND id_Serie=Serie.id AND Serie.id=Show.id
AND Show.id=17 AND Season.number=1;
-- Type in the following syntax to join three tables.
SELECT pl."PlaylistId", pl."Name", pt."TrackId", tr."Name"
FROM public."Playlist" pl
JOIN public."PlaylistTrack" pt USING ("PlaylistId")
JOIN public."Track" tr USING ("TrackId")
ORDER BY pl."Name";

-- To include aggregate functions, type in the following syntax.
SELECT ar."ArtistId", ar."Name", al."Title",
Count(*),
SUM(ar."ArtistId")
FROM public."Artist" ar
JOIN public."Album" al USING ("ArtistId")
JOIN public."Track" tr USING ("AlbumId")
GROUP BY ar."ArtistId", ar."Name", al."Title"
ORDER BY COUNT(ar."ArtistId") DESC;
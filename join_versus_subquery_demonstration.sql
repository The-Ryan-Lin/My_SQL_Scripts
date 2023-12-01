--- Type the following INNER JOIN syntax. 
--- Take note that an alias for the tables was used and the result table will be limited to 15 rows.
SELECT ar."ArtistId", "Name"
FROM public."Artist" ar
INNER JOIN public."Album" al
USING ("ArtistId")
ORDER BY ar."Name"
LIMIT 15;

-- Type the following subquery syntax. 
-- Take note that no alias for the tables was used here. 
SELECT ar."ArtistId", "Name"
FROM public."Artist" ar
WHERE "ArtistId"
IN (SELECT "ArtistId"
   FROM public."Album")
ORDER BY ar."Name"
LIMIT 15;
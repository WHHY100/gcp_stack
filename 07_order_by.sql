# -------------------------------------------------------------------------
# ORDER BY (mozna podac numer kolumny zamiast nazwy kolumny)
# -------------------------------------------------------------------------

SELECT * FROM DQL.tab_bicycles ORDER BY bike_id limit 10;
SELECT * FROM DQL.tab_bicycles order by bike_id desc limit 10;
SELECT * FROM DQL.tab_bicycles order by duration desc limit 3;

SELECT * FROM DQL.tab_bicycles order by 3 desc limit 3;

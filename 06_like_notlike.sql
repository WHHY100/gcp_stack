# -------------------------------------------------------------------------
# LIKE / NOT LIKE (% - dowolny ciag znakow, _ - dowolny znak)
# -------------------------------------------------------------------------

CREATE OR REPLACE TABLE DQL.movies(
  id int64
  ,name string
  ,rate float64
);

INSERT INTO DQL.movies VALUES(1, 'Batman', 5.0);
INSERT INTO DQL.movies VALUES(2, 'Dziewczyna moich koszmarów', 4.5);
INSERT INTO DQL.movies VALUES(3, 'Spiderman', 3.5);
INSERT INTO DQL.movies VALUES(4, 'Ania z zielonego wzgórza', 2.5);
INSERT INTO DQL.movies VALUES(5, 'Kod lyoko', 1.5);

SELECT * FROM DQL.movies WHERE upper(name) like '%MAN%';
SELECT * FROM DQL.movies WHERE upper(name) not like '%MAN%';
SELECT * FROM DQL.movies WHERE upper(name) like 'DZIEWCZYNA _OICH _OSZMAR_W';




# -------------------------------------------------------------------------
# SELECT -> ciekawa własność BQ
# -------------------------------------------------------------------------

SELECT 3;
SELECT 3 as NUMBER;
SELECT 
  3 as NUMBER
  ,4 as number2
  ,'python' as test;

# -------------------------------------------------------------------------
# TWORZENIE TABELI Z DANYCH UDOSTEPNIONYCH -> mozliwe jezeli ten sam region
# -------------------------------------------------------------------------

CREATE OR REPLACE TABLE DQL.tab_bicycles as
SELECT * FROM bigquery-public-data.london_bicycles.cycle_hire limit 100000;

# -------------------------------------------------------------------------
# SELECT DISTINCT - obvius, usuwa duplikaty
# SELECT EXCEPT - drop w SAS, usuwa z wyniku podane kolumny
# SELECT REPLACE - operacja na kolumnie, zamiana danych po operacji
# -------------------------------------------------------------------------

SELECT DISTINCT
  a.rental_id
  ,a.duration
  ,a.start_date
  ,a.end_date
FROM DQL.tab_bicycles a
LIMIT 20;

SELECT
  a.*
  EXCEPT (
      start_station_logical_terminal
      ,end_station_logical_terminal
      ,end_station_priority_id
    )
FROM DQL.tab_bicycles a
WHERE
  a.start_station_logical_terminal is not null
LIMIT 20;

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
LIMIT 20;

# -------------------------------------------------------------------------
# INSTRUKCJA WHERE (wydobywa dane na pierwotnych danych nieprzetworzonych)
# -------------------------------------------------------------------------

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
WHERE
  a.duration / 60 > 300
;

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
WHERE
  a.bike_id =  3798
  or a.bike_id = 7906
;

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
WHERE
  a.bike_id =  3798
  and a.duration / 60 > 1
;

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
WHERE
  a.bike_id in (3798, 7906)
;

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
WHERE
  a.bike_id not in (3798, 7906)
;

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
WHERE
  -- between jest zbiorem zamknietym w BQ  1<= a <= 30
  a.duration / 60 between 1 and 30;

SELECT DISTINCT
  a.*
  EXCEPT (start_station_logical_terminal)
  REPLACE(a.duration / 60 as duration)
FROM DQL.tab_bicycles a
WHERE
  a.start_date between '2016-09-01' and '2016-09-30';

# -------------------------------------------------------------------------
# INSTRUKCJA COUNT
# -------------------------------------------------------------------------
-- liczy wszystkie wiersze w tabeli
SELECT count(*) as N FROM DQL.tab_bicycles;
-- liczy wszystkie niepuste wiersze w tabeli
SELECT count(end_station_logical_terminal) as N FROM DQL.tab_bicycles;



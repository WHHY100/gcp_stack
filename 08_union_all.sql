# -------------------------------------------------------------------------
# UNION ALL
# -------------------------------------------------------------------------

CREATE TEMP TABLE tab_najdluzsza AS
SELECT DISTINCT
  extract(year FROM a.start_date) as rok
  ,a.bike_id
  ,round(a.duration / 60, 2) as czas_trwania_min
  ,row_number() over(partition by extract(year FROM a.start_date) order by a.duration desc) as RN
  ,'najdluzsza podróż w roku' as opis_dzialania
FROM DQL.tab_bicycles a;

CREATE TEMP TABLE tab_najkrotsza AS
SELECT DISTINCT
  extract(year FROM a.start_date) as rok
  ,a.bike_id
  ,round(a.duration / 60, 2) as czas_trwania_min
  ,row_number() over(partition by extract(year FROM a.start_date) order by a.duration asc) as RN
  ,'najkrótsza podróż w roku' as opis_dzialania
FROM DQL.tab_bicycles a;

WITH TAB_LATA_PODROZ AS 
(
  SELECT * FROM tab_najdluzsza WHERE RN = 1
  UNION ALL
  /* W TYM MIEJSCU MOZLIWE UNION ALL - WSZYSTKIE REKORDY / UNION DISTINCT - BEZ DUPLIKATÓW*/
  SELECT * FROM tab_najkrotsza WHERE RN = 1
)
SELECT
  a.*
FROM TAB_LATA_PODROZ a
ORDER BY a.rok, a.opis_dzialania;



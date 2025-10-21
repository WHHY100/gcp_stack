# -------------------------------------------------------------------------
# GRUPOWANIE DANYCH I ORDER (MOŻNA ORDER PO ALIASIE)
# -------------------------------------------------------------------------

SELECT
  a.bike_id
  ,count(*) as N
FROM DQL.tab_bicycles a
GROUP BY a.bike_id
ORDER BY N desc;

# -------------------------------------------------------------------------
# GRUPOWANIE KILKA KOLUMN
# -------------------------------------------------------------------------

SELECT
  a.bike_id
  ,a.end_station_name
  ,count(*) as N
FROM DQL.tab_bicycles a
WHERE
  a.duration >= 50
GROUP BY a.bike_id, a.end_station_name
ORDER BY N desc;

# -------------------------------------------------------------------------
# HAVING - WARUNEK NA GRUPOWANĄ KOLUMNĘ
# -------------------------------------------------------------------------

SELECT
  a.bike_id
  ,a.end_station_name
  ,count(*) as N
FROM DQL.tab_bicycles a
WHERE
  a.duration >= 50
GROUP BY a.bike_id, a.end_station_name
HAVING N > 1
ORDER BY N desc;

# -------------------------------------------------------------------------
# OFFSET - POMIJA DANĄ LICZBE WIERSZY W WYNIKU, WYSTĘPUJE W PARZE Z LIMIT
# -------------------------------------------------------------------------

SELECT
  a.bike_id
  ,a.end_station_name
  ,count(*) as N
FROM DQL.tab_bicycles a
WHERE
  a.duration >= 50
GROUP BY a.bike_id, a.end_station_name
HAVING N > 1
ORDER BY N desc
LIMIT 5
OFFSET 1;

# -------------------------------------------------------------------------
# STATYSTYKI OPISOWE (GROUP BY I ORDER BY PO ALIASACH!)
# -------------------------------------------------------------------------

SELECT
  case
    when extract(month from a.start_date) <= 9
      then concat(extract(year from a.start_date), '.0', extract(month from a.start_date)) 
      else concat(extract(year from a.start_date), '.', extract(month from a.start_date)) 
   end as rok_miesiac
  ,count(*) as N_liczba_rekordow
  ,max(a.duration) as maksymalna_dlugosc_wypo
  ,min(a.duration) as minimalna_dlugosc_wypo
  ,avg(a.duration) as srednia_dlugosc_wypo
  ,sum(a.duration) as suma_dlugosc_wypo
  ,count(a.duration) as total_number_of_rental
FROM DQL.tab_bicycles a
GROUP BY rok_miesiac
HAVING total_number_of_rental > 0
ORDER BY rok_miesiac asc;
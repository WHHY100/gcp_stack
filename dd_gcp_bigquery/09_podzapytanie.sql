# -------------------------------------------------------------------------
# PODZAPYTANIA
# -------------------------------------------------------------------------
SELECT
  a.bike_id
  ,max(a.duration) as max_duration
  ,min(a.duration) as min_duration
  ,avg(a.duration) as avg_duration
FROM
(
  SELECT 
    a.rental_id
    ,a.bike_id
    ,a.duration
  FROM `bigquery-public-data.london_bicycles.cycle_hire` a
  WHERE
    a.duration >= 50
  LIMIT 1000
) a
GROUP BY a.bike_id
ORDER BY avg_duration desc;

# -------------------------------------------------------------------------
# ŚREDNI CZAS TRWANIA W MIESIACU -> ZADANIE
# -------------------------------------------------------------------------

SELECT
  extract(YEAR from a.start_date) as rok
  ,extract(MONTH from a.start_date) as miesiac
  ,round(avg(a.duration / 60), 2) as sredni_czas_trwania
FROM `bigquery-public-data.london_bicycles.cycle_hire` a
GROUP BY rok, miesiac
ORDER BY rok, miesiac;






# -------------------------------------------------------------------------
# FUNKCJE OKNA -> OVER
# -------------------------------------------------------------------------

SELECT DISTINCT day FROM DQL.tab_tips;

SELECT
  a.*
  ,sum(a.tip) over(partition by a.day) as suma_rachunkow_na_dzien
FROM DQL.tab_tips a;

SELECT
  a.*
  ,round(sum(a.total_bill) over(partition by a.day order by a.day, a.total_bill desc), 2) as suma_rachunkow_na_dzien
  ,count(a.total_bill) over(partition by a.day order by a.day, a.total_bill) as numer_wystapienia
FROM DQL.tab_tips a;

# -------------------------------------------------------------------------
# FUNKCJE OKNA -> OVER (ZAAWANSOWANA)
# -------------------------------------------------------------------------

SELECT
  a.*
  ,sum(a.total_bill) over(partition by a.day order by a.day, a.total_bill rows between 1 preceding and 1 following)
   as suma_wierszy_1_przed_i_1_po_biezacym
  ,sum(a.total_bill) over(partition by a.day order by a.day, a.total_bill rows between unbounded preceding and 0 following)
   as suma_wierszy_1_przed_i_1_po_biezacym
FROM DQL.tab_tips a;

SELECT
  a.end_station_name
  ,a.duration
  ,avg(a.duration) over(partition by a.end_station_name order by a.end_station_name, a.duration desc rows between 3 preceding and 3
   following) as kroczacy_h
FROM DQL.tab_bicycles a;



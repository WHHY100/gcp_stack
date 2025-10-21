# -------------------------------------------------------------------------
# FUNKCJA ROW_NUMBER()
# -------------------------------------------------------------------------

WITH TAB_CENA_OBIAD AS
(
  SELECT
    a.*
    ,row_number() over(order by a.day, a.total_bill) as numer_wiersza
    ,row_number() over(partition by a.day order by a.day, a.total_bill desc) as numer_wiersza_dzien
  FROM DQL.tab_tips a
)
SELECT
  a.*
FROM TAB_CENA_OBIAD a
WHERE
  /*najwieksze 3 rachunki danego dnia!*/
  a.numer_wiersza_dzien in (1, 2, 3);

# -------------------------------------------------------------------------
# FUNKCJA POZYCYJNA
# -------------------------------------------------------------------------

SELECT 
  a.*
  ,first_value(a.total_bill) over(partition by a.day order by a.day, a.total_bill desc) as pierwsza_wartosc_okna
  ,last_value(a.total_bill) over(partition by a.day order by a.day, a.total_bill desc) as ostatnia_wartosc_okna
  ,last_value(a.total_bill) over(order by a.total_bill desc rows between unbounded preceding and unbounded following) as   
   ostatnia_wartosc_okna_2
FROM DQL.tab_tips a;

SELECT 
  a.*
  ,nth_value(a.total_bill, 3) over(partition by a.day order by a.day, a.total_bill desc) as trzecia_wartosc_okna
FROM DQL.tab_tips a;

SELECT 
  a.*
  ,lag(a.total_bill) over(order by a.total_bill) as total_bill_prev
  ,lag(a.total_bill, 2) over(order by a.total_bill) as total_bill_prev_2_rows
FROM DQL.tab_tips a
ORDER BY a.total_bill;

-- PERCENTILE_CONT -> zwracaja wartosci konkretnych percentylów



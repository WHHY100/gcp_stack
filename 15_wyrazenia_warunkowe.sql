# -------------------------------------------------------------------------
# WYRAŻENIA WARUNKOWE
# -------------------------------------------------------------------------

DECLARE v_sredni_rachunek float64;
DECLARE v_kwartyl_napiwek float64;

SET v_sredni_rachunek = (SELECT avg(total_bill) FROM DQL.tab_tips);
SET v_kwartyl_napiwek = (SELECT DISTINCT round(PERCENTILE_CONT(tip, 0.25) OVER (), 2) FROM DQL.tab_tips);

SELECT
  *
  ,case
    when a.total_bill >= v_sredni_rachunek then 'Rachunek powyżej średniej'
    when a.total_bill = v_sredni_rachunek then 'Rachunek równy średniej'
    else 'Rachunek poniżej średniej'
   end as kategoria_rachunku
  ,case
    when a.tip <= v_kwartyl_napiwek * 1 then 'Bardzo mały napiwek'
    when a.tip <= v_kwartyl_napiwek * 2 then 'Maly napiwek'
    when a.tip <= v_kwartyl_napiwek * 3 then 'Średni napiwek'
    else 'Duży napiwek'
   end as kategoria_napiwku
FROM DQL.tab_tips a;

# -------------------------------------------------------------------------
# COALESCE -> jeżeli wartość NULL to sprawdz kolejną
# -------------------------------------------------------------------------

SELECT
  a.*
  ,COALESCE(nullif(a.day, ''), 'brak nazwy') as dzien
  ,IF (day in ('Sat', 'Sun'), 'weekend', 'workday') as flaga_weekend
  ,ifnull(a.day, 'brak') as wpisz_jezeli_kolumna_jest_null
  ,nullif(sex, "Female") as jezeli_kobieta_to_null
FROM DQL.tab_tips a
LIMIT 150;






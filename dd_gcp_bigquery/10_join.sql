# -------------------------------------------------------------------------
# UTWÓRZ TABELE I WSADŹ DANE
# -------------------------------------------------------------------------

CREATE OR REPLACE TABLE DQL.pracownicy (id int64, nazwa string, salary int64); 
CREATE OR REPLACE TABLE DQL.departamenty (pracownik_id int64, dep_name string, dep_code string); 

INSERT INTO DQL.pracownicy VALUES(1, 'Dorian Kowalski', 13250);
INSERT INTO DQL.pracownicy VALUES(2, 'Ewa Kowalska', 13250);
INSERT INTO DQL.pracownicy VALUES(3, 'Dominik Kowalski', 13250);
INSERT INTO DQL.pracownicy VALUES(5, 'TESTOWY PRACOWNIK', 13250);

INSERT INTO DQL.departamenty VALUES (1, 'Innowacje i technologie', 'IT');
INSERT INTO DQL.departamenty VALUES (2, 'Marketing', 'MA');
INSERT INTO DQL.departamenty VALUES (3, 'Sprzedaż', 'SA');
INSERT INTO DQL.departamenty VALUES (4, 'PUSTY', 'NULL');

# -------------------------------------------------------------------------
# SPR.JOINOW
# -------------------------------------------------------------------------

SELECT
  a.*
  ,b.nazwa
  ,b.salary
FROM DQL.departamenty a
INNER JOIN DQL.pracownicy b on a.pracownik_id = b.id;

SELECT
  a.*
  ,b.nazwa
  ,b.salary
FROM DQL.departamenty a
LEFT JOIN DQL.pracownicy b on a.pracownik_id = b.id;

SELECT
  a.*
  ,b.nazwa
  ,b.salary
FROM DQL.departamenty a
RIGHT JOIN DQL.pracownicy b on a.pracownik_id = b.id;

SELECT
  a.*
  ,b.nazwa
  ,b.salary
FROM DQL.departamenty a
FULL OUTER JOIN DQL.pracownicy b on a.pracownik_id = b.id;

SELECT
  a.*
  ,b.nazwa
  ,b.salary
FROM DQL.departamenty a
CROSS JOIN DQL.pracownicy b;

-- SLOWNIK:
-- INNER JOIN -> ZOSTAWIA TE REKORDY KTÓRE SĄ W KLUCZACH W OBU TABELACH
-- LEFT JOIN -> DOPASUJE REKORDY DO TABELI Z FROM (GŁÓWNEJ), NIESPASOWANE SĄ NULLEM
-- RIGHT JOIN -> DOPASUJE REKORDY DO TABELI Z join (DODAWANEJ), NIESPASOWANE SĄ NULLEM
-- FULL OUTER JOIN -> ZWRACA WSZYSTKIE WIERSZE Z LEWEJ I PRAWEJ TABELI
-- CROSS JOIN -> ILOCZYN KARTEZJAŃSKI, BEZ KLUCZY, KAŻDY Z KAŻDYM




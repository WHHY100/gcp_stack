# -------------------------------------------------------------------------
# DEKLARACJE ZMIENNYCH
# -------------------------------------------------------------------------
DECLARE CURRENT_DATA_CZAS datetime;
DECLARE PREV_DATA_CZAS datetime;
DECLARE FUTURE_DATA_CZAS datetime;

# -------------------------------------------------------------------------
# FUNKCJE DATY PRZYPISANIE WARTOSCI DO ZMIENNEJ
# -------------------------------------------------------------------------

SELECT CURRENT_DATE('Europe/Warsaw') as aktualna_data_warszawa;
SET CURRENT_DATA_CZAS = (SELECT CURRENT_DATETIME('Europe/Warsaw') as aktualna_data_czas_warszawa);

SELECT EXTRACT(year FROM CURRENT_DATA_CZAS) as rok;
SELECT EXTRACT(quarter FROM CURRENT_DATA_CZAS) as kwartal;
SELECT EXTRACT(month FROM CURRENT_DATA_CZAS) as miesiac;
SELECT EXTRACT(day FROM CURRENT_DATA_CZAS) as dzien;
SELECT EXTRACT(hour FROM CURRENT_DATA_CZAS) as godzina;
SELECT EXTRACT(minute FROM CURRENT_DATA_CZAS) as minuta;
SELECT EXTRACT(second FROM CURRENT_DATA_CZAS) as sekunda;
SELECT DATE(2025, 01, 01) as utworzona_data;
SET FUTURE_DATA_CZAS = (SELECT DATE_ADD(CURRENT_DATA_CZAS, interval 3 day) as data_za_3_dni);
SET PREV_DATA_CZAS = (SELECT DATE_SUB(CURRENT_DATA_CZAS, interval 3 day) as data_minus_3_dni);
SELECT DATE_DIFF(FUTURE_DATA_CZAS, PREV_DATA_CZAS, day) as roznica_w_dniach_pomiedzy_datami;

# -------------------------------------------------------------------------
# FUNKCJE DATY I CZASU
# -------------------------------------------------------------------------

SELECT DATETIME_ADD(CURRENT_DATA_CZAS, interval 2 hour) as dodaj_dwie_godziny;
SELECT DATETIME_SUB(CURRENT_DATA_CZAS, interval 2 hour) as odejmij_dwie_godziny;
SELECT DATETIME_DIFF(DATETIME '2025-01-01 21:00:00', DATETIME '2025-01-01 19:00:00', hour) as roznica_godzina;

# -------------------------------------------------------------------------
# FUNKCJE CZASU
# -------------------------------------------------------------------------

SELECT CURRENT_TIME('Europe/Warsaw') as aktualny_czas_warszawa;
SELECT TIME(20, 0, 0) as definiowana_godzina;
SELECT TIME_ADD(TIME '20:00:00', interval 2 hour) as dodaj_dwie_godziny;
SELECT TIME_SUB(TIME '20:00:00', interval 2 hour) as odejmij_dwie_godziny;
SELECT TIME_DIFF(TIME '20:00:00', TIME '19:00:00', hour) as roznica_w_godzinach;
SELECT TIME_DIFF(TIME '20:00:00', TIME '19:00:00', minute) as roznica_w_minutach;
















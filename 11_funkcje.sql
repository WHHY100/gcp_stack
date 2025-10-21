DECLARE CURRENT_DATA_CZAS datetime;

# -------------------------------------------------------------------------
# CAST - zmienia typ jednej zmiennej na drugą (np. int na napis)
# -------------------------------------------------------------------------

SELECT 
  * 
  ,cast(age as float64) as age_float 
  ,concat(cast(age as string), ' years old') as age_string
FROM DML.tab_people;

# -------------------------------------------------------------------------
# SAFE CAST - w momencie napotkania bledu zwroci wartosc NULL
# -------------------------------------------------------------------------

SELECT 
  CAST('001' as int64) as number
  ,CAST(0 AS BOOL) as bool_type
  ,SAFE_CAST('a' as DATE) as string_na_date;

# -------------------------------------------------------------------------
# TWORZENIE WŁASNYCH FUNKCJI
# -------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION functions.multiple_by_5(x int64) AS (x * 5);

SELECT functions.multiple_by_5(10);

CREATE OR REPLACE FUNCTION functions.calculate_area(a int64, b int64) as (a * b);

SELECT functions.calculate_area(10, 5);

# -------------------------------------------------------------------------
# COUNT, MIN, MAX, SUM, AVG
# -------------------------------------------------------------------------

SELECT
  a.end_station_name
  ,count(*) as N_liczba_rekordow
  ,countif(a.duration >= 1000) as N_liczba_rekordow_wieksze_od_100
  ,min(a.duration) as min_duration /* null pomiety w tej funkcji */
  ,max(a.duration) as max_duration
  ,sum(a.duration) as sum_duration
  ,avg(a.duration) as avg_duration /* null pomiety w tej funkcji */
  ,any_value(end_station_name) as losowya_nazwa
FROM DQL.tab_bicycles a
GROUP BY a.end_station_name;

# -------------------------------------------------------------------------
# STRING AGG
# -------------------------------------------------------------------------

SELECT
  extract(date from a.end_date) as stop_date
  ,string_agg(a.end_station_name, ' ' order by a.end_station_name) as concat_string_grupowanie
FROM DQL.tab_bicycles a
GROUP BY stop_date
ORDER BY stop_date;

# -------------------------------------------------------------------------
# STATYSTYCZNE FUNKCJE AGEEGUJĄCE
# -------------------------------------------------------------------------

SELECT
  CORR(a.duration, a.duration_ms) as wsp_korelacji 
  /* 1 maks skorelowany | 0 - nieskorelowany */
  ,COVAR_POP(a.duration, a.duration_ms) as wsp_kowariancji_populacji 
  ,COVAR_SAMP(a.duration, a.duration_ms) as wsp_kowariancji_probki
  /* dodatnia kowariancja - zgodny kierunek zmian (jedno i drugie rosnie), ujemna - przeciwny kierunek zmian */
  ,STDDEV_POP(a.duration) as odchylenie_standardowe_populacji
  ,STDDEV_SAMP(a.duration) as odchylenie_standardowe_probki
  /* odch standardowe - o ile wartosci przecietnie odchylają sie od średniej */
  ,VAR_POP(a.duration) as wariancja_populacji
  ,VAR_SAMP(a.duration) as wariancja_probki
  /* niska wariancja - dane blizsze średniej, mniejsze rozproszenie, wysoka wariancja to dane dalsze od sredniej */
FROM DQL.tab_bicycles a
LIMIT 1000;

# -------------------------------------------------------------------------
# RANK, DENSE_RANK, PERCENT_RANK
# -------------------------------------------------------------------------

SELECT
  a.*
  ,rank() over(order by a.duration) as ranking_czas_wypozyczenia_1 /*wartosci w funkcji over */
  ,rank() over(order by a.duration desc) as ranking_czas_wypozyczenia_2 /*odwrotnie */
  ,dense_rank() over(order by a.duration) as ranking_czas_wypozyczenia_3 /*szereg zwarty - nie pomija liczb przy podwojnych rankingach */
  ,percent_rank() over(order by a.duration) as ranking_czas_wypozyczenia_3 /*procentowa wartosc rankingujaca */
FROM DQL.tab_bicycles a
ORDER BY ranking_czas_wypozyczenia_1
LIMIT 100;

# -------------------------------------------------------------------------
# FUNKCJE MATEMATYCZNE
# -------------------------------------------------------------------------

SELECT
  abs(a.duration) as wartosc_bezwzgledna_duration
  ,sign(a.duration) as minus_1_gdy_ujemna_zero_gdy_zero_1_gdy_dodatnia_duration
  ,safe_divide(a.duration , 0) as bezpieczne_dzielenie_gdy_przez_0_to_null_duration_1
  ,safe_divide(a.duration , 1) as bezpieczne_dzielenie_gdy_przez_0_to_null_duration_2
  ,rand() as losowa_liczba_przedzial_0_1
  ,sqrt(a.duration) as pierwiastek_kwadratowy_duration
  ,pow(a.duration, 2) as potega_duration
  ,round(a.duration / 3.1, 2) as zaokraglenie_dwa_miejsca_duration
FROM DQL.tab_bicycles a
LIMIT 100;

# -------------------------------------------------------------------------
# FUNKCJE TEKSTOWE
# -------------------------------------------------------------------------

SELECT char_length('Dorian') as dlugosc_string;
SELECT concat('Dorian', ' ', 'to', ' ', 'spoko', ' ', 'gość!') as sklejony_tekst;
SELECT ends_with('Dorian', 'n') sprawdz_czy_napis_konczy_sie_na;
SELECT starts_with('Dorian', 'D') sprawdz_czy_napis_zaczyna_sie_na;
SELECT upper('dorian') as duze_litery;
SELECT lower('DORIAN') as male_litery;
SELECT ltrim(' Dorian') as usun_spacje_lewo;
SELECT rtrim('Dorian ') as usun_spacje_prawo;
SELECT trim('   Dorian to fajny gosc!   ') as usun_znaki_na_koncu_i_poczatku;
SELECT replace('Dorian to fajny gość', 'Dorian', 'Kordian') as zamien_wybrany_ciag;
SELECT reverse('Dorian') as odwrocona_kolejnosc;
SELECT split('Dorian to fajny gość!', ' ') as podziel_na_array;
SELECT strpos('Dorian to fajny gość!', 'to') as pozycja_slowa;
SELECT substr('Dorian to fajny gość!', 1, 6) as wyciety_fragment;

# -------------------------------------------------------------------------
# FUNKCJE DATY
# -------------------------------------------------------------------------

SELECT CURRENT_DATE('Europe/Warsaw') as aktualna_data_warszawa;
SELECT CURRENT_DATETIME('Europe/Warsaw') as aktualna_data_czas_warszawa;




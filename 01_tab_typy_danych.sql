# -------------------------------------------------------------------------
# ZAMIANA TYPU DANYCH INT NA FLOAT I FLOAT NA INT
# -------------------------------------------------------------------------

SELECT
  var1 # integer
  ,cast(var1 as FLOAT64) as var_1_float #rzutowanie na float
  ,var2 #float
  ,cast(var2 as INT64) as var_2_int #rzutowanie na int
  ,var3 #float
  ,cast(var3 as INT64) as var_3_int #rzutowanie na int
FROM `udemy-nauka-test.data_types.tab_01_numeric`;

# -------------------------------------------------------------------------
# MANIPULACJE TYPEM DANYCH BOOLEAN
# -------------------------------------------------------------------------

SELECT 
  var1 # integer
  ,cast(var2 as BOOLEAN) as var1_bool #konwert int na boolean
  ,var2 #boolean
  ,cast(var2 as INT64) as var2_int #konwert bool na int
  ,var3 #boolean
  ,cast(cast(var3 as INT64) as FLOAT64) as var3_float #konwert bool na float
FROM `udemy-nauka-test.data_types.tab_02_boolean`;

# -------------------------------------------------------------------------
# MANIPULACJE NAPISEM
# -------------------------------------------------------------------------

SELECT
  var1 #string
  ,cast(var1 as int64) as var1_int #rzutowanie string na int
  ,cast(var1 as float64) as var2_float #rzutowanie string na float
FROM `udemy-nauka-test.data_types.tab_03_string`;

# -------------------------------------------------------------------------
# MANIPULACJE DATĄ I CZASEM
# -------------------------------------------------------------------------

SELECT 
  var1 as var1_timestamp #data
  ,cast(var1 AS DATE) as var1_date #konwert timestamp na datę
  ,var2 as var2_date #data
  ,cast(var2 AS TIMESTAMP) as var2_timestamp #konwert na timestamp
FROM `udemy-nauka-test.data_types.tab_04_datetime`;

# -------------------------------------------------------------------------
# TABLICE
# -------------------------------------------------------------------------

SELECT [1, 2, 3] as var_array_int; #podstawowa tablica int
SELECT ['python', 'sql', 'java'] as var_array_string; #podstawowa tablica string
SELECT [TRUE, FALSE, FALSE] as var_array_string; #podstawowa tablica boolean

SELECT 
  [TRUE, FALSE, FALSE]
  ,['python', 'sql', 'java']
  ,[1, 2] 
; #wywolanie tablic w jednym zapytaniu

SELECT ARRAY<FLOAT64> [1, 2, 3, 4, 5] as arr_float; #deklaracja typu zmiennych w danej tablicy - float
SELECT ARRAY<INT64> [1, 2, 3, 4, 5] as arr_int; #deklaracja typu zmiennych w danej tablicy - int

SELECT GENERATE_ARRAY(0, 10, 1) as gen_array; #generacja tablicy, start, stop, krok przetwarzania
SELECT GENERATE_ARRAY(0, 10, 2) as gen_array; #generacja tablicy, start, stop, krok przetwarzania co dwa
SELECT GENERATE_ARRAY(10, 0, -1) as gen_array; #generacja tablicy, start, stop, krok przetwarzania od konca

SELECT GENERATE_DATE_ARRAY('2025-01-01', '2025-01-31', INTERVAL 1 DAY) as gen_date_array; #generacja tablicy z datami - co dzien
SELECT GENERATE_DATE_ARRAY('2025-01-01', '2025-12-31', INTERVAL 1 WEEK) as gen_date_array; #generacja tablicy z datami - co tydzien
SELECT GENERATE_DATE_ARRAY('2025-01-01', '2025-12-31', INTERVAL 1 MONTH) as gen_date_array; #generacja tablicy z datami - co miesiac
SELECT GENERATE_DATE_ARRAY('2025-01-01', '2030-12-31', INTERVAL 1 YEAR) as gen_date_array; #generacja tablicy z datami - co rok


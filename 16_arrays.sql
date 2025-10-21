# -------------------------------------------------------------------------
# TWORZENIE TABELI Z ARRAYAMI
# -------------------------------------------------------------------------

CREATE OR REPLACE TABLE DQL.tab_arrays(id int64, var_array array<string>);

INSERT INTO DQL.tab_arrays(id, var_array) VALUES (1, ['test1', 'test2', 'test3']);
INSERT INTO DQL.tab_arrays(id, var_array) VALUES (2, ['test1', 'test2', 'test3']);
INSERT INTO DQL.tab_arrays(id, var_array) VALUES (3, ['test1', 'test2', 'test3']);

CREATE OR REPLACE TABLE DQL.tab_arrays_num(id int64, var_array array<float64>);

INSERT INTO DQL.tab_arrays_num(id, var_array) VALUES (1, [1.5, 2.5, 3.5]);
INSERT INTO DQL.tab_arrays_num(id, var_array) VALUES (2, [1.0, 2.0, 3.0]);
INSERT INTO DQL.tab_arrays_num(id, var_array) VALUES (3, [0.5, 1.5, 2.5]);

# -------------------------------------------------------------------------
# WYSWIETL ZAWSZE PIERWSZA WAROTSC W TABLICY
# -> OFFSET to index od 0
# -> ORDINAL to index od 1
# -------------------------------------------------------------------------

SELECT id, var_array[offset(0)] as pierwsza_wartosc FROM DQL.tab_arrays order by id;
SELECT id, var_array[ordinal(1)] as pierwsza_wartosc FROM DQL.tab_arrays order by id;

# -------------------------------------------------------------------------
# DLUGOSC TABLICY
# -------------------------------------------------------------------------

SELECT id, array_length(var_array) as dlugosc_tablicy FROM DQL.tab_arrays order by id;

# -------------------------------------------------------------------------
# UNNEST - rozpakowuje tablice
# -------------------------------------------------------------------------

SELECT id, rozpakowane FROM DQL.tab_arrays, UNNEST(tab_arrays.var_array) as rozpakowane order by id;

# -------------------------------------------------------------------------
# AGREGACJA TABLIC
# -------------------------------------------------------------------------

SELECT ARRAY_AGG(rozpakowane order by rozpakowane) FROM DQL.tab_arrays, UNNEST(tab_arrays.var_array) as rozpakowane;

# -------------------------------------------------------------------------
# TABLICA DO NAPISU
# -------------------------------------------------------------------------

SELECT ARRAY_TO_STRING(var_array, ' ') as napis FROM DQL.tab_arrays;

# -------------------------------------------------------------------------
# PRACA NA TABLICACH NUMERYCZNYCH
# -------------------------------------------------------------------------


SELECT id, kol FROM DQL.tab_arrays_num, UNNEST(var_array) as kol;

SELECT
  id
  ,sum(kol) as suma_kolumn_na_id
  ,avg(kol) as srenia_kolumn_na_id
FROM DQL.tab_arrays_num a,
UNNEST(var_array) as kol
GROUP BY a.id
ORDER BY a.id;


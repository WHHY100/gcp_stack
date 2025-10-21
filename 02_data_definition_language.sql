# -------------------------------------------------------------------------
# DATA DEFINITION LANGUAGE - TWORZENIE TABELI
# -------------------------------------------------------------------------

DROP TABLE IF EXISTS data_definition_language.tab_01_pierwsza_DDL;
DROP TABLE IF EXISTS data_definition_language.tab_02_druga;
DROP TABLE IF EXISTS data_definition_language.tab_03_trzecia;
DROP TABLE IF EXISTS data_definition_language.tab_04_czwarta;

CREATE TABLE data_definition_language.tab_01_pierwsza_DDL(
  id string
  ,age int64
  ,name string
);

# -------------------------------------------------------------------------
# WSADZANIE WARTOŚCI DO TABELI
# -------------------------------------------------------------------------

INSERT INTO data_definition_language.tab_01_pierwsza_DDL values('001', 10, 'Dorian');
INSERT INTO data_definition_language.tab_01_pierwsza_DDL values('002', 20, 'Dorian');
INSERT INTO data_definition_language.tab_01_pierwsza_DDL values('003', 30, 'Dorian');

# -------------------------------------------------------------------------
# USUWANIE TABELI ZE ZBIORU DANYCH
# -------------------------------------------------------------------------

DROP TABLE data_definition_language.tab_01_pierwsza_DDL;

# -------------------------------------------------------------------------
# DATA DEFINITION LANGUAGE - TWORZENIE TABELI POD WARUNKIEK ZE NIE ISTNIEJE
# -------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS data_definition_language.tab_01_pierwsza_DDL(
  id string
  ,age int64
  ,name string
);

# -------------------------------------------------------------------------
# DATA DEFINITION LANGUAGE - NADPISYWANIE TABELI KTORA JUZ ISTNIEJE
# -------------------------------------------------------------------------

-- CREATE OR REPLACE TABLE data_definition_language.tab_01_pierwsza_DDL(
--   id string
--   ,age int64
--   ,full_name string
-- );

# -------------------------------------------------------------------------
# DATA DEFINITION LANGUAGE - TWORZENIE BARDZIEJ ROZBUDOWANEJ TABELI
# -------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS data_definition_language.tab_02_druga(
  id int64
  ,name string
  ,has_married bool
  ,date_of_birth date
  ,data_rekordu datetime
);

INSERT INTO data_definition_language.tab_02_druga VALUES (1, 'Dorian', TRUE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_02_druga VALUES (2, 'Dorian', FALSE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_02_druga VALUES (3, 'Dorian', FALSE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_02_druga VALUES (4, 'Dorian', TRUE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_02_druga VALUES (5, 'Dorian', FALSE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));

# -------------------------------------------------------------------------
# TWORZENIE TABELI PROSTO Z ZAPYTANIA
# -------------------------------------------------------------------------

CREATE TABLE data_definition_language.tab_03_trzecia as
SELECT * FROM data_definition_language.tab_02_druga;

# -------------------------------------------------------------------------
# DATA DEFINITION LANGUAGE - NULL W TABELI OKRESLENIE CZY MOZLIWE
# -------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS data_definition_language.tab_04_czwarta(
  id int64 NOT NULL
  ,name string
  ,has_married bool
  ,date_of_birth date
  ,data_rekordu datetime
);

INSERT INTO data_definition_language.tab_04_czwarta VALUES (1, NULL, TRUE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_04_czwarta VALUES (2, NULL, FALSE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_04_czwarta VALUES (3, NULL, FALSE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_04_czwarta VALUES (4, NULL, TRUE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));
INSERT INTO data_definition_language.tab_04_czwarta VALUES (5, NULL, FALSE, '1996-04-16', DATETIME(CURRENT_TIMESTAMP(), "Europe/Warsaw"));

# -------------------------------------------------------------------------
# TABELA TYMCZASOWA - MOŻLIWA DO ODCZYTU TYLKO PODCZAS AKTYWNEGO QUERY
# -------------------------------------------------------------------------

CREATE TEMP TABLE tab_tymczasowa_01(
  id string
  ,age int64
  ,name string
);

INSERT INTO tab_tymczasowa_01 values('001', 10, 'Dorian');
INSERT INTO tab_tymczasowa_01 values('002', 20, 'Dorian');
INSERT INTO tab_tymczasowa_01 values('003', 30, 'Dorian');

SELECT * FROM tab_tymczasowa_01;

# -------------------------------------------------------------------------
# TABELA TYMCZASOWA Z ZAPYTANIA
# -------------------------------------------------------------------------

CREATE TEMP TABLE tab_tymczasowa_zapytanie AS
SELECT * FROM data_definition_language.tab_02_druga;

SELECT * FROM tab_tymczasowa_zapytanie ORDER BY id;


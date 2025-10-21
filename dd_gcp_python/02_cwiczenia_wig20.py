# --------------------------------------------------------------------------------------------
# IMPORT BIBLIOTEK
# --------------------------------------------------------------------------------------------

import pandas as pd

# --------------------------------------------------------------------------------------------
# DEKLARACJA LISTY + ZAMIANA NA SERIES
# --------------------------------------------------------------------------------------------

wig20_companies = [
    "PKO Bank Polski",
    "PZU",
    "KGHM Polska Miedź",
    "Orlen",
    "CD Projekt",
    "LPP",
    "PGE",
    "JSW",
    "Alior Bank",
    "PGNiG",
    "Santander Bank Polska",
    "Asseco Poland",
    "Orange Polska",
    "Cyfrowy Polsat",
    "Bank Pekao",
    "Grupa Lotos",
    "mBank",
    "Ciech",
    "Budimex",
    "Play Communications"
]

s = pd.Series(wig20_companies, name = 'nazwa_firmy')

# --------------------------------------------------------------------------------------------
# WIELKIE LITERY W SLOWNIKU
# --------------------------------------------------------------------------------------------

s = pd.Series(s.apply(lambda x : x.upper()))

# --------------------------------------------------------------------------------------------
# SPRAWDZENIE CZY ISTNIEJE PKO BP W ZBIORZE
# --------------------------------------------------------------------------------------------

x = s[s.isin(['PKO BANK POLSKI'])]


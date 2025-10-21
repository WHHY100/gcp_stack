# --------------------------------------------------------------------------------------------
# IMPORT DO ŚRODOWISKA BIBLOTEKI PANDAS
# --------------------------------------------------------------------------------------------
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# --------------------------------------------------------------------------------------------
# PODSTAWOWA DEKLARACJA DATAFRAME -> LISTA
# --------------------------------------------------------------------------------------------
df1 = pd.DataFrame(data=[12, 13, 14, 15])
df2 = pd.DataFrame(data=[[12, 13, 14],
                         [14, 15, 16]],
                   index = ['first', 'second'],
                   columns = ['x1', 'x2', 'x3'])
df3 = pd.DataFrame(data=[[12, 13, 14],
                         [14, 15, 16],
                         [17, 18, 19]],
                   index = ['first', 'second', 'third'],
                   columns = ['x1', 'x2', 'x3'])
# --------------------------------------------------------------------------------------------
# PODSTAWOWA DEKLARACJA DATAFRAME -> SLOWNIK
# --------------------------------------------------------------------------------------------
dict1 = {'one' : pd.Series([1, 2, 3]),
         'two' : pd.Series([3, 4, 6])}

df4 = pd.DataFrame(dict1)

dict2 = {'one' : pd.Series(['Dorian', 'Ewa', 'Kordian']),
         'two' : pd.Series(['Dorian', 'Ewa', 'Kordian'])}

df5 = pd.DataFrame(dict2)

dict3 = {'one' : pd.Series(['Dorian', 'Ewa', 'Kordian', 'Halina']),
         'two' : pd.Series(['Dorian', 'Ewa', 'Kordian'])}

df6 = pd.DataFrame(dict3)

dict4 = {
    'one' : pd.Series(np.random.randn(100)),
    'two' : pd.Series(np.random.randn(100)),
    'three' : pd.Series(np.random.randn(100))
}

df7 = pd.DataFrame(dict4)

list_of_dicts = [{'Dorian' : 1, 'Ewa' : 2, 'Kordian' : 3}, {'Dorian' : 1, 'Ewa' : 2, 'Kordian' : 3}]
df8 = pd.DataFrame(list_of_dicts)

dict5 = {
    'wig20' : ['PKO BP', 'LPP', 'PEKAO SA'],
    'wig40' : ['CD Projekt', 'Budimex', 'TEST']
}

df9 = pd.DataFrame(dict5)

print(df9)

print(df9.index) # -> wydobycie indeksu z obiekty dataframe
print(df9.columns) # -> zwraca nazwy kolumn

# --------------------------------------------------------------------------------------------
# DZIALANIA PĘTLĄ NA DF
# --------------------------------------------------------------------------------------------

for i in df8.columns:
    print(i) # -> w tym przypadku drukuje nazwe kolumn

nazwy_kolumn = []

for i in df8.columns:
    nazwy_kolumn.append(i.upper())

df8.columns = nazwy_kolumn

print(df8)

# --------------------------------------------------------------------------------------------
# SELEKCJA KOLUMN
# --------------------------------------------------------------------------------------------

df_apple = pd.read_csv('https://stooq.pl/q/d/l/?s=aapl.us&i=d')
df_apple.columns = ['Date', 'Open', 'Highest', 'Lowest', 'Close', 'Volume']
df_apple = df_apple.set_index('Date') # -> zamiana indeksu na istniejacym DF

open_price1 = df_apple['Open'] # -> wybiera kolumne open
open_price2 = df_apple.iloc[:, 0] # -> wybiera kolumne open
open_price3 = df_apple.Open # -> wybiera kolumne open
volume = df_apple.iloc[:, -1] # -> wybiera ostatnią
open_high_low = df_apple.iloc[:, [0, 1, 2]] # -> wybiera 3 pierwsze kolumny
pierwsze_4_kolumny = df_apple.iloc[:, 0:4] # -> wybiera 4 pierwsze kolumny

print(df_apple)
print(open_price1)
print(open_price2)
print(open_price3)
print(volume)
print(open_high_low)
print(pierwsze_4_kolumny)

# --------------------------------------------------------------------------------------------
# SELEKCJA DANYCH
# --------------------------------------------------------------------------------------------

print(df_apple.iloc[:5]) # -> wyswietl pierwsze 5 rekordów
print(df_apple.iloc[5:10]) # -> wyswietl wiersze od 5 do 10
print(df_apple.iloc[10:]) # -> wyswietl wszystkie wiersze poza pierwszymi 10
print(df_apple.iloc[:, :2]) # -> wyswietl 2 pierwszych kolumn
print(df_apple.iloc[:5, :2]) # -> wyswietl 5 pierwszych wierszy i 2 pierwsze kolumny
print(df_apple.iloc[[1]]) # -> zwracamy pierwszy wiersz
print(df_apple.iloc[[1, 4]]) # -> zwracamy pierwszy i czwarty wiersz

# --------------------------------------------------------------------------------------------
# OBLICZANIE NOWYCH KOLUMN
# --------------------------------------------------------------------------------------------

df_apple['Average'] = (df_apple['Open'] + df_apple['Close'])/2
df_apple['Prev_value'] = df_apple['Close'].shift(1) # -> SAS lag, przesuwa wartosc o 1
df_apple['Daily_change'] = df_apple['Close'] / df_apple['Close'].shift(1) - 1 # procentowa zmiana do val prev
df_apple = df_apple.assign(test = 'test') # rowniej dodaje kolumne do df
df_apple['Flag'] = df_apple['Daily_change'] > 0

print(df_apple['Daily_change'].max()) # maksymalna zmiana w ciagu dnia
print(df_apple['Daily_change'].idxmax()) # maksymalna zmiana w ciagu dnia -> kiedy
print(df_apple['Daily_change'].min()) # najwiekszy spadek w ciagu dnia
print(df_apple['Daily_change'].idxmin()) # najwiekszy spadek w ciagu dnia -> kiedy
print(df_apple['Daily_change'].mean()) # srednia zmiana procentowa
print(df_apple['Flag'].sum() / df_apple['Flag'].count()) # procent dni z dodatnią stopą zwrotu
print(df_apple)

df_apple['Daily_change'].hist(bins=100)
plt.savefig('./img/daily_change_apple.png', format = 'png')

# --------------------------------------------------------------------------------------------
# IMPORT DO ŚRODOWISKA BIBLOTEKI PANDAS
# --------------------------------------------------------------------------------------------
import pandas as pd
import numpy as np

# --------------------------------------------------------------------------------------------
# SERIA W PANDASIE -> TWORZY COS NA KSZTAŁT TABLICY, KAŻDY Z ELEMENTÓW MA ODPOWIEDNI INDEKS
# 0 1
# 1 2
# 2 3
# --------------------------------------------------------------------------------------------

s1 = pd.Series([1, 2, 3, 4, 5, 6, 7, 8, 9])
s2 = pd.Series([20, 30, 40], ['Dorian', 'Ewa', 'Kordian'], name = 'age')

# wylosowanie 10 liczb z rozklady normalnego -> random.randn

a = np.random.randn(10)

s3=pd.Series(a)

b = {'Apple' : 'USA', 'Alphabet' : 'USA', 'Orlen' : 'Poland'}
s4 = pd.Series(b, name = 'Country')

c = {'Apple' : 196.10, 'Alphabet' : 10.91, 'Orlen' : 120.43}
s5 = pd.Series(c, name = 'Notowania')

# przedstawienie wartosci z obiektu series jako tablicy w python
s5_arr = s5.values

# wyciagnie wartosci dla konkretnego indeksu
s5_orlen = s5['Orlen']

# sprawdzanie czy wartosc jest w obiekcie series
result_s5_apple = False
if 'Apple' in s5:
    result_s5_apple = True

# wycinanie wartosci z obiektu series na podstawie indeksów

np.random.seed(0) # ustawienie ziarna losowania na moment 0
A = np.random.randn(20) # 20 liczb losowana z rozkladu normalnego

s6 = pd.Series(A, name = 'losowe_liczby')
kilka_wartosci = s6[0:6]


# --------------------------------------------------------------------------------------------
# OPERACJE NA SERIES
# --------------------------------------------------------------------------------------------

np.random.seed(0)
X = np.random.randint(0, 1000, 1500)
s7 = pd.Series(X, name = 'LOS')

# atrybuty obiekty series
print(s7.dtype) # -> typ wartości w obiekcie
print(s7.iloc[3]) # -> wyciecie elementu z indeksu numer 3
print(s7.iloc[-1]) # -> wyciecie elementu od konca (ostatni)
print(s7.index) # -> wyswietl jak wyglada indeks obiektu
print(s7.name) # -> wyswietl nazwe obiektu
print(s7.shape) # -> wyswietl wielkosc obiektu

N1 = np.random.randn(10)
N2 = np.random.randn(10)

s_N1 = pd.Series(N1)
s_N2 = pd.Series(N2)
print(s_N1)
print(s_N2)
# obliczenia na obiektach typu series
print(s_N1.abs()) # -> wyswietla wartosci wieksze od 0
print(s_N1.add(s_N2)) # -> dodaj wartosci z jednego series i drugiego do siebie
print(s_N1.subtract(s_N2)) # -> odejmij wartosci z jednego series i drugiego do siebie
print(s_N1.divide(s_N2)) # -> podziel jeden obiekt przez drugi
print(s_N1.drop_duplicates()) # -> wyrzuca duplikaty z obiektu series

# na indeksie 4 przypisz obiekt pusty - brak wartosci
s_N1[4] = np.nan
print(s_N1)

print(s_N1.dropna()) # -> usunie wartosci puste "NAN" ze zbioru
print(s_N1.idxmax()) # -> zwraca index najwiekszej wartosci series
print(s_N1.idxmin()) # -> zwraca index najmniejszej wartosci series
print(s_N1.count()) # -> zwraca ilość wartości które nie są puste
print(s_N1.cumsum) # -> narastajaca suma wzgledem series
print(s_N1.cummin) # -> zwraca kumulatywnie najmniejszy element
print(s_N1.cummax) # -> zwraca kumulatywnie najwiekszy element
print(s_N1.describe()) # -> statystyki dotyczace obiektu series
print(s_N1.nlargest(3)) # -> zwraca top 3 najwiekszych wartosci
print(s_N1.nsmallest(3)) # -> zwraca 3 najmniejsze wartosci
print(s_N1.quantile(0.25)) # -> zwracamy pierwszy kwartyl szeregu
print(s_N1.quantile(0.5)) # -> zwracamy wartosc mediany
print(s_N1.round(2)) # -> zaokraglanie elementów series

# przesuniecie obiektu -> metoda shit
print(s_N1.shift(1)) # -> zwraca przesuniety obiekt o 1 element w dol
print(s_N1.fillna(100)) # -> w miejsce NA wstaw konkretną wartość
print(s_N1.sort_values()) # -> zwraca posortowane wartości rosnąco
print(s_N1.sort_values(ascending = False)) # -> zwraca posortowane wartosci malejąco

# --------------------------------------------------------------------------------------------
# AGREGACJA DANYCH (funkcja aggregate w niektorych miejscach niemozliwe uzycie - future warning
# --------------------------------------------------------------------------------------------

s_agregacja = pd.Series(np.random.randn(20))

minimum = s_agregacja.min()
print(minimum)
maksimum = s_agregacja.max()
print(maksimum)
suma = s_agregacja.sum()
print(suma)
srednia = s_agregacja.mean()
print(srednia)
odchylenie_standardowe = s_agregacja.std()
print(odchylenie_standardowe)

statystyki = s_agregacja.aggregate(['min', 'max', 'sum', 'mean', 'std'])
print(statystyki)

# --------------------------------------------------------------------------------------------
# METODA APPLY
# --------------------------------------------------------------------------------------------

Y = pd.Series(np.random.randn(10) * 2 + 5)
print(Y.apply(int)) # -> konwersja na int
print(Y.apply(lambda x: 100 * x)) # -> wszystkie argumenty pomnozone przez 100
print(Y.apply(lambda y: abs(y))) # -> wartosc bezwzgledna z Y

# --------------------------------------------------------------------------------------------
# WCZYTANIE DANYCH DATAFRAME DO OBIEKTU DO OBIEKTU DF
# --------------------------------------------------------------------------------------------

df = pd.read_csv('./data/pkn_d.csv', index_col = 'Data') # -> import csv, index_col zamienia def. index
cena_zamkniecia = pd.Series(df['Zamkniecie'], name = 'Orlen_closed')
cena_zamkniecia.to_csv('./data/pkn_d_cena_zamkniecia.csv', header=['closed'])



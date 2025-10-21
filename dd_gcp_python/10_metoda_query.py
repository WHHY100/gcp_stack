import pandas as pd
import numpy as np

df = pd.DataFrame(np.random.randn(5, 5), columns=['a', 'b', 'c', 'd', 'e'], index=['a', 'b', 'c', 'd', 'e'])

print(df)

# w metodzie query mozemy podawac warunki takie jak w SQL
wynik = df.query('a > 0 and b < 5')
print(wynik)

import pandas as pd
import numpy as np

df = pd.DataFrame(np.random.randn(5, 5), columns=['a', 'b', 'c', 'd', 'e'], index=['a', 'b', 'c', 'd', 'e'])

print(df)

# wyciagnij pierwsza kolumne
print(df.iloc[:, 0])

# wyciagnij dwie pierwsze kolumny
print(df.iloc[:, 0:2])

# wyciagnij konkretne kolumny
print(df.iloc[:, [0, 1, 3]])

# wycinanie po wierszach -> pierwszy
print(df.iloc[0, :])
print(df.iloc[[0], :])

# wycinanie po wierszach -> 3 pierwsze
print(df.iloc[0:3, :])

# wycinanie po wierszach -> konkretne wiersze
print(df.iloc[[1, 2, 4], :])

import pandas as pd
import numpy as np

df = pd.DataFrame(np.random.randn(5, 5), columns=['a', 'b', 'c', 'd', 'e'], index=['a', 'b', 'c', 'd', 'e'])
print(df)

# kolumna a
print(df.loc[:,'a'])

# kolumna a i b
print(df.loc[:, ['a', 'b']])

# wiersz a
print(df.loc['a', :])
print(df.loc[['a'], :])

# wiersz a i b
print(df.loc[['a', 'b'], :])


import pandas as pd
import numpy as np

df = pd.DataFrame(np.random.randn(10, 5), columns=['a', 'b', 'c', 'd', 'e'], index=pd.date_range(start='2025-01-01', periods=10))

# drukuj df
print(df)

# wyciagnij index
print(df.index)

# wyciagnij jeden dzien
print(df.loc['2025-01-01'])
print(df.loc[['2025-01-01']])

# wyciagnij caly tydzien
print(df.loc['2025-01-01' : '2025-01-07'])

# wyciagnij wszystkie dni przed/po 7 stycznia
print(df.loc['2025-01-07' :])
print(df.loc[: '2025-01-07'])

import pandas as pd
import numpy as np

df = pd.DataFrame(np.random.randn(5, 5), columns=['a', 'b', 'c', 'd', 'e'], index=['a', 'b', 'c', 'd', 'e'])

print(df)

# tam gdzie nie spelnia warunków zwraca nam wartosci NAN
out = df.where(df.a > 0)
print(out)

# normalny where mozemy wykonywac w ten sposób
out = df[df.a > 0]
print(out)

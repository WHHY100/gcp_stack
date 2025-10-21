import pandas as pd
import numpy as np

df = pd.DataFrame(np.random.randn(5, 5), columns=['a', 'b', 'c', 'd', 'e'], index=['a', 'b', 'c', 'd', 'e'])

# drukuj zbiór
print(df)

# wybierz kolumne
print(df.a)

# maska -> true / false
mask = df.b > 0
df['mask'] = mask

print(df)

# maska -> true / false dwa warunki koniunkcja (and)

mask_koniunkcja = (df.a > 0) & (df.b > 0)
df['mask_koniunkcja'] = mask_koniunkcja

print(df)

# maska -> true / false dwa warunki alternatywa (or)

mask_alternatywa = (df.a > 0) | (df.b > 0)
df['mask_alternatywa'] = mask_alternatywa

print(df)

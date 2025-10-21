import pandas as pd
from datetime import datetime
import matplotlib.pyplot as plt

# --------------------------------------------------------------------------------------------
# GENIALNIE PROSTY IMPORT I ZAPIS CSV
# --------------------------------------------------------------------------------------------

data_dzis = str(datetime.today().date())

df = pd.read_csv('https://stooq.pl/q/d/l/?s=amzn.us&i=d', index_col = 'Data')
cena_zamkniecia = pd.Series(df['Zamkniecie'])
cena_zamkniecia_od_2000 = cena_zamkniecia['2000-01-01' : data_dzis]
cena_zamkniecia_od_2000.to_csv('./data/cena_zamkniecia_amazon.csv')

# --------------------------------------------------------------------------------------------
# WIZUALIZACJA I ZAPIS JAKO OBRAZ
# --------------------------------------------------------------------------------------------

cena_zamkniecia_od_2000.plot(title = 'Wykres notowan amazon', logy = True)
plt.savefig('./img/amazon_od_2000.png', format = 'png')

# Using this dataset, add a column with the 3 and 5-day moving averages for the closing prices. Then, visualize the output with a line chart.

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

raw_data = {'day': [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 

        'price': [119, 146, 147, 119, 102, 124, 148, 140, 133, 153, 155, 162, 150, 171, 167]

        }

df = pd.DataFrame(raw_data, columns = ['day', 'price'])

df['3day'] = df.price.rolling(3).mean()
df['5day'] = df.price.rolling(5).mean()
df['3dayCum'] = df.price.expanding(3).mean()

plt.plot(df.price, label='closing price')
plt.plot(df['3day'], label='3 day MA')
plt.plot(df['5day'], label='5 day MA')
plt.legend(loc=2)

sns.lineplot(x=df.day, y=df.price)
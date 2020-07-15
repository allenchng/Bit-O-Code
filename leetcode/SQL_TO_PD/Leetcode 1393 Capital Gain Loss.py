
import pandas as pd
import numpy as np

df = pd.DataFrame(
    {'stock_name': ['Leetcode', 'Corona Masks', 'Leetcode', 'Handbags', 'Corona Masks', 'Corona Masks', 'Corona Masks', 'Corona Masks', 'Handbags', 'Corona Masks'],
  'operation': ['Buy', 'Buy', 'Sell', 'Buy', 'Sell', 'Buy', 'Sell', 'Buy', 'Sell', 'Sell'],
  'operation_day' : [1,2,5,17,3,4,5,6,29,10],
  'price': [1000, 10, 9000, 30000, 1010, 1000, 500, 1000, 7000, 10000]}
)

df['money_change'] = np.where(df["operation"] == "Buy", df["price"] * -1, df["price"])
df_agg = df.groupby('stock_name')['money_change'].sum().reset_index()
df_agg.columns = ["stock_name", "capital_gain_loss"]

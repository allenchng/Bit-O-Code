import pandas as pd
import numpy as np

df = pd.DataFrame(
    {
        'sale_date': ["2020-05-01", "2020-05-01", "2020-05-02", "2020-05-02", "2020-05-03", "2020-05-03", "2020-05-04", "2020-05-04"],
        'fruit': ["apples", "oranges", "apples", "oranges", "apples", "oranges", "apples", "oranges"],
        'sold_num': [10, 8, 15, 15, 20, 0, 15, 16]
    }
)

self_df = df.copy()


merged_df = pd.merge(df, self_df, how='left', on='sale_date')
merged_df = merged_df[(merged_df['fruit_x'] == 'apples') & (merged_df['fruit_y'] == 'oranges')]

merged_df['diff'] = merged_df.sold_num_x - merged_df.sold_num_y
merged_df[['sale_date', 'diff']]
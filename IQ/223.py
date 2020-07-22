# You are given the following dataset, containing information on baby names from the U.S. Social Security Administration.

# Using the dataset, write code to find the following:

# Number of unique names across the dataset, split by both # of unique male/female names

# Top 10 most popular male and female names, along with their associated counts

# The top 10 most trending names (% growth) from 2010+, with an associated plot to show the relative growth between names

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
baby_names = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/ddi_baby_names.csv')

baby_names.groupby(['gender'])['name'].nunique()

b = baby_names.groupby(['gender', 'name'])['count'].sum().sort_values(ascending=False).reset_index()

b[b['gender'] == "M"].head(10)

b[b['gender'] == "F"].head(10)

df = baby_names[baby_names['year'] >= 2010]
df_piv = pd.pivot_table(df, index=["name"], columns = ['year'], values=['count'], aggfunc=np.sum).fillna(0)

df_perc = df_piv / df_piv.sum() * 100

df_perc['total'] = df_perc.sum(axis=1)

df_perc.total.sort_values(ascending=False).head(10)
ten = df_perc.sort_values("total", ascending=False).drop('total', axis=1)[0:10]
tt = ten.transpose()
tt.plot()
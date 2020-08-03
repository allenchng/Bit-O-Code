# Can you identify the financial product that receives the most complaints? Within that product can you highlight (1) the largest issue within the product and (2) the company that is contributing most to that product?

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import math
from scipy import stats

df = pd.read_csv('https://query.data.world/s/mfpyc37uml5olufnxdh63r3fu26e4m')

df.groupby(['Product'])['Complaint ID'].size().sort_values(ascending=False).reset_index()

mortgage = df.loc[df['Product'] == 'Mortgage']
mortgage.groupby(['Issue'])['Complaint ID'].size().sort_values(ascending=False)
mortgage.groupby(['Company'])['Complaint ID'].size().sort_values(ascending=False).nlargest(10)
# Suppose you are working for an e-commerce company and the marketing team is trying to decide if they should launch a new webpage. They ran an A/B test and need help analyzing the results. They provided you with this dataset, which contains the following fields:

# user_id: the user_id of the person visiting the website
# timestamp: the time in which the user visited the website
# group: treatment vs control, treatment saw the new landing page, control saw the old landing page
# landing_page: new vs old landing page, labeled 'new_page'/'old_page'
# converted: 0/1 flag denoted whether the user visiting the page ended up converting

# Given this information, you're asked to come up with a recommendation for the marketing team -- should the marketing team adopt the new landing page? The team wants the landing page with the highest conversion rate.


import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from scipy import stats

# Reading in data
df = pd.read_csv('https://github.com/erood/interviewqs.com_code_snippets/blob/master/Datasets/ab_data.csv?raw=true', parse_dates=True) 


cleaned = df[((df.group == 'control') & (df.landing_page == 'old_page')) | ((df.group == 'treatment') & (df.landing_page == 'new_page'))]

grouped = cleaned.groupby('group').mean().reset_index()

stats.ttest_ind(cleaned[cleaned['group'] == 'control']['converted'], cleaned[cleaned['group'] == 'treatment']['converted'])
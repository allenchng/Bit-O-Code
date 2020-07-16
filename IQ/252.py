# Suppose you're given a dataset containing information relevant to employee engagement, satisfaction, and turnover. The dataset contains the following fields:

# satisfaction_level - scored from 0-1, 1 being most satisfied
# last_evaluation - scored from 0-1, 1 being most positive evaluation
# number_project - integer, # of active projects employee is working on
# average_montly_hours - the average monthly hours the employee works
# time_spend_company - the employee's tenure at the company, in years
# Work_accident - binary flag indicating whether or not employee had accident at work
# left - binary flag indicating whether or not employee left the company (1 = left company)
# promotion_last_5years - binary flag indicating whether or not employee was promoted in last 5 years (1 = promoted)
# department - name of the department employee works in
# salary - binned salary ranges, high/medium/low

# Using this data, run an exploratory analysis to determine which factors had the most impact on employee turnover. Also, for simplicity of the exercise, you can ignore the string fields 'salary' and 'department' when determining which factors most impact turnover.

# Note that this is an example of a more open ended/case study type problem, and there are a number of 'correct' ways one could go about it.

# Importing packages
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import math
import datetime as dt

from scipy import stats
%matplotlib inline

# Setting seaborn figure size
sns.set(rc={'figure.figsize':(14, 5)})
# Import the csv into a dataframe   
df = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/HR_comma_sep.csv', parse_dates=True) 

df1 = df.drop(columns=['department', 'salary'])

df1.left.value_counts() / len(df)

df1.groupby('left').mean()

corr = df.corr()
sns.heatmap(corr)

stats.ttest_1samp(a = df1[df1['left'] == 1]['satisfaction_level'], popmean = df1['satisfaction_level'].mean())
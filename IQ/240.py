# Suppose you are given two datasets as shown below:

# Data on the Gini coefficient (proxy for income inequality).

# This is a number between 0 and 1, where 0 corresponds to perfect equality (e.g. everyone has the same income) and 1 corresponds to perfect inequality (where one person has all the income—and everyone else has no income). You can read more about the Gini coefficient on Wikipedia here

# Data containing a Happiness Score from the World Happiness Report.

# The score represents a weighted average across a number of variables and ranges from 1-10, where 10 is perfectly happy. You can read more about the World Happiness Report Wikipedia here

# Given this data, determine if there is a correlation between income equality (field: 'current' in Gini index dataset) and happiness (field: 'overall_score' in Happiness dataset). You'll only want to keep records that exist in both datasets (there are many countries/regions in the World Happiness Report that do not have a measured Gini index).

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

from scipy.stats import pearsonr

gini_index = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/gini_index.csv')
happiness_index = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/happiness_index.csv')


sub = pd.merge(happiness_index, gini_index, how="inner", left_on="country_or_region", right_on="country").reset_index()

pearsonr(sub.overall_score, sub.current)

sns.regplot(sub.overall_score, sub.current)

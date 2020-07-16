# Using this dataset, write code to compute how often the oldest person alive dies (length of time they were recognized as oldest person before passing away and being replaced by a new oldest person). Visualize this information for a stakeholder.

import matplotlib.pyplot as plt
import datetime
import numpy as np
import pandas as pd
import seaborn as sns
old = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/oldest_person_dataset.csv')

old['shifted'] = old.death_date.shift(1)

old1 = old.loc[1:, :]

old1.death_date = pd.to_datetime(old1.death_date)
old1.shifted = pd.to_datetime(old1.shifted)

old1.diff = (old1.death_date - old1.shifted).dt.days

sns.scatterplot(x= old1.index, y = old1.diff)
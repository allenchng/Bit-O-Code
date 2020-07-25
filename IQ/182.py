# Suppose you are working for a food delivery company looking to compare delivery times across its two delivery systems (one with autonomous vehicles called System A, one with contract drivers called System B).

# The data table below, called 'delivery_cycle_times', shows the full cycle time of delivering food for a given order in minutes. Given this, run a statistical test using python to determine whether there is a significant difference in food delivery between the two systems:

# Table: delivery_cycle_times

# System A	System B
# 23	25
# 20	28
# 26	35
# 30	32
# 15	19
# 26	30


import pandas as pd
import scipy.stats
import numpy as np
import random

a = [23, 20, 26,30,15,26]
b = [25, 28, 35, 32, 19, 30]

# non-parametric bootstrap

diff =  np.mean(a) - np.mean(b)

n = 1000
joint = a + b
sims = [0] * n

for i in range(0, n):
    random.shuffle(joint)
    a_ = joint[0:5]
    b_ = joint[6:10]
    
    joint_diff = np.mean(a_) - np.mean(b_)
    sims[i] = joint_diff

((sims < diff).sum() + (sims > abs(diff)).sum()) / n

# parametric t-test

scipy.stats.ttest_ind(a, b)
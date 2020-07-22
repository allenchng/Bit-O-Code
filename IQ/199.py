# Given the following datasets:

# US births/deaths by state U.S. population by state Answer the following questions:

# Calculate the birth rate and death rate for each state. For the purposes of this question you can define the rate as the # of births/deaths divided by the total population.

# Create a new column appended to the first dataset with the net population change (births-deaths) by state.

# Using the column from (2), project out the future population by state in 5 years, assuming the population change remains the same (on an absolute/n-count basis). You can assume each state's net transfer in/out rate from folks moving is 0 for this question's sake.

# For example, if CA's population is 30M and the birth-death rate is 150k, then the projected population in 5 years is just 30,000,000 + 150,000*5 = 30.75M.

#Importing packages.
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
%matplotlib inline

#reading csv into a dataframe
us_population = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/us_state_populations.csv')
us_births_deaths = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/us_state_births.csv')

states = pd.merge(us_population, us_births_deaths, how='inner', on='State')

states['birth_rate'] = states.Births / states.Population
states['death_rate'] = states.Deaths / states.Population

states_a = states.sort_values('State', ascending=True).reset_index(drop=True)

states_a['net_change'] = states_a.Births-states_a.Deaths

states_a["five_year"] = states_a.Population + (states_a.net_change * 5)


# Given the following datasets, containing both price and calorie information for McDonald's food items:

# McDonald's menu item prices

# McDonald's menu item calories

# Write code to merge the two datasets, calculate the price per calorie of food, and stack rank the foods from the 'best value' (most calories per dollar*) to 'worst value' (least calories per dollar*).

# *There are of course nuances in nutritional benefits, protein, etc, but we're simplifying here for the purposes of these definitions and assuming someone wants to optimize purely for cost of calories.


import numpy as np
import pandas as pd

#to visualize the results
import matplotlib.pyplot as plt

#First, read in, preview our CSV
food_calories = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/mcD_food_calories.csv')
food_prices = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/mcD_food_prices.csv')

food = pd.merge(food_calories, food_prices, on='Food', how="inner")
food['value'] = food.Price_USD / food.Calories
food.sort_values('value', ascending=False)


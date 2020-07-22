# Suppose you are given the following dataframe containing food, weight, and calories. You'll notice the foods have varying weights associated with them:

# food	grams	calories
# 0	bacon	50	271
# 1	strawberries	200	64
# 2	banana	100	89
# 3	spinach	200	46
# 4	chicken breast	50	80
# 5	peanuts	100	567

# Using Python (Pandas), can you sort the dataframe in descending order with the most calorically dense food (normalized for weight) at the top?

import pandas as pd

df = pd.DataFrame({'food': ['bacon', 'strawberries', 'banana', 'spinach', 'chicken breast', 'peanuts'],
'grams': [50, 200, 100, 200, 50, 100],
'calories': [271, 64, 89, 46, 80, 567]})

df['c_per_g'] = df.calories / df.grams

df.sort_values('c_per_g', ascending=False)
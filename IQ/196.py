# Suppose you're given a large table containing student grades, with the following structure:

# age	favorite_color	grade	name
# 0	20	blue	88	Willard Morris
# 1	19	blue	95	Al Jennings
# 2	22	yellow	92	Omar Mullins
# 3	21	green	70	Spencer McDaniel
# 4	21	green	94	Linda Ugo
# 5	20	blue	90	Susy Smith

# Using Python, add a column with the student ranking in ascending order by 'grade'.

# Next, calculate the following summary statistics for the student grades:

# median grade
# 25th percentile grade
# 75th percentile grade

df['rank'] = df.grade.rank(ascending=False).astype(int)

df.grade.quantile([.25, .5, .75])
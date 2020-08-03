# Suppose you have the following dataset, which shows a subset of 311 service requests from NYC Open Data. Given the dataset, plot the most common complaint types across all boroughs.

import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/311-service-requests.csv')

complaints = df['Complaint Type'].value_counts().nlargest(10)
complaints.plot(kind='bar')
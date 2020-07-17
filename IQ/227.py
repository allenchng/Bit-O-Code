# Given the following dataset, calculate the average lifetime value of a customer.

# Below are a couple of definitions to help solve the problem:

# Lifetime value is average revenue divided by the churn rate

# Churn rate is defined as the total number of churned customers / total number of customers

#Importing packages
import pandas as pd
import numpy as np

#Read in the dataset
data = pd.read_csv("https://raw.githubusercontent.com/erood/interviewqs.com_code_snippets/master/Datasets/teleco_user_data.csv") 
#Convert these column types to int
data['TotalCharges'] = pd.to_numeric(data.TotalCharges, downcast='integer', errors='coerce')
data['MonthlyCharges'] = pd.to_numeric(data.MonthlyCharges, downcast='integer', errors='coerce')

data['churn_num'] = np.where(data.Churn == "Yes", 1, 0)

churn_rate = data.churn_num.mean()

average_revenue = data.TotalCharges.mean()

average_revenue / churn_rate
# simple linear regression

from sklearn.datasets import make_regression
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

def make_input_data(n_samples, n_features, n_informative, test_size, random_state):
    X, y = make_regression(n_samples, n_features, n_informative)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=test_size,random_state=random_state)
    return X_train, X_test, y_train, y_test

X_train, X_test, y_train, y_test = make_input_data(1000, 10, 7, 0.3, 123)

regr = LinearRegression()
regr.fit(X_train, y_train)

y_pred = regr.predict(X_test)

print("Mean squared error: %.2f" % mean_squared_error(y_test, y_pred))
print('Variance score: %.2f' % r2_score(y_test, y_pred))


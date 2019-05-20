from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix, roc_auc_score

def make_input_data(n_samples, n_features, n_informative, test_size, random_state):
    X, y = make_classification(n_samples, n_features, n_informative)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=test_size, random_state=random_state)
    return X_train, X_test, y_train, y_test

X_train, X_test, y_train, y_test = make_input_data(1000, 10, 7, 0.3, 2019)

logreg = LogisticRegression()
logreg.fit(X_train, y_train)

y_pred = logreg.predict(X_test)

confusion_matrix(y_test, y_pred)


print('AUC score: %.2f' % roc_auc_score(y_test, y_pred))
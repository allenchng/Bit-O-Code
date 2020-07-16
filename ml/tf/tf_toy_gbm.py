import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split

def make_input_data(n_samples, n_features, n_informative, test_size, random_state):
    X, y = make_classification(n_samples, n_features, n_informative)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=test_size,random_state=random_state)
    return X_train, X_test, y_train, y_test

X_train, X_test, y_train, y_test = make_input_data(500, 10, 7, 0.3, 2019)

X_train = pd.DataFrame(X_train)
X_test = pd.DataFrame(X_test)
y_train = pd.DataFrame(y_train)
y_test = pd.DataFrame(y_test)

X_train.columns = X_train.columns.astype(str)
X_test.columns = X_test.columns.astype(str)
y_train.columns = y_train.columns.astype(str)
y_test.columns = y_test.columns.astype(str)

fc = tf.feature_column

NUMERIC_COLUMNS = list(X_train.columns.astype(str))

feature_columns = []

for feature_name in NUMERIC_COLUMNS:
  feature_columns.append(fc.numeric_column(feature_name,
                                           dtype=tf.float32))

NUM_EXAMPLES = len(y_train)

def make_input_fn(X, y, n_epochs=None, shuffle=True):
  def input_fn():
    dataset = tf.data.Dataset.from_tensor_slices((dict(X), y))
    if shuffle:
      dataset = dataset.shuffle(NUM_EXAMPLES)
    # For training, cycle thru dataset as many times as need (n_epochs=None).    
    dataset = dataset.repeat(n_epochs)  
    # In memory training doesn't use batching.
    dataset = dataset.batch(NUM_EXAMPLES)
    return dataset
  return input_fn

train_input_fn = make_input_fn(X_train, y_train)
eval_input_fn = make_input_fn(X_test, y_test, shuffle=False, n_epochs=1)

n_batches = 1
est = tf.estimator.BoostedTreesClassifier(feature_columns,
                                            n_batches_per_layer=n_batches)

est.train(train_input_fn, max_steps=100)

results = est.evaluate(eval_input_fn)
print('Accuracy : ', results['accuracy'])
print('AUC : ', results['auc'])
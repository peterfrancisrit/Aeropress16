# Sampling from clusters

import csv 
import pandas as pd



path = "/Users/harryritchie/Documents/Aeropress16/Coffee_17_.csv"
df = pd.read_csv(path, index_col=0, parse_dates=True,sep=';')
df = pd.get_dummies(df, columns=['Position','Filter', 'Preparation','Grinder','Type of Water'])
del df['Position_Upright']
print(df)
target = df['Position_Inverted']
del df['Position_Inverted']




# X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(X,y,test_size=0.33,random_state=5)
# lm = LogisticRegression(penalty='l2')

# lm.fit(X_train,y_train)
# pred_train = lm.predict(X_train)
# pred_test = lm.predict(X_test)


# print(np.mean((y_train - pred_train))**2)
# print(np.mean((y_test - pred_test))**2)



import numpy as np
np.random.seed(10)

import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import (RandomTreesEmbedding, RandomForestClassifier,
                              GradientBoostingClassifier)
from sklearn.preprocessing import OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve
from sklearn.pipeline import make_pipeline

n_estimator = 10
X = df
y = target 

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33)

# Supervised transformation based on random forests
rf = RandomForestClassifier(max_depth=1, n_estimators=n_estimator)
rf.fit(X_train,y_train)
pred_train = rf.predict(X_train)
pred_test = rf.predict(X_test)

print(np.mean((y_train - pred_train))**2)
print(np.mean((y_test - pred_test))**2)

tpr, fpr, _ = roc_curve(y_test,pred_test)

lm = LogisticRegression(penalty='l1')

lm.fit(X_train,y_train)
pred_train_lr = lm.predict(X_train)
pred_test_lr = lm.predict(X_test)

tpr_lr, fpr_lr, _ = roc_curve(y_test,pred_test_lr)
print(np.mean((y_train - pred_train_lr))**2)
print(np.mean((y_test - pred_test_lr))**2)

plt.figure(1)
plt.plot([0, 1], [0, 1], 'k--')
plt.plot(fpr, tpr, label='Random Forest')
plt.plot(fpr_lr,tpr_lr,label='Logistic Regression')
plt.xlabel('False positive rate')
plt.ylabel('True positive rate')
plt.title('ROC curve')
plt.legend(loc='best')
plt.show()


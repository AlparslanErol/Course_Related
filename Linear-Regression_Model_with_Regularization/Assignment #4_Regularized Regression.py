#imports libraries
# =============================================================================
import pandas as pd
import math
from sklearn.model_selection import train_test_split
from sklearn.linear_model import ElasticNet
from sklearn.metrics import mean_squared_error
from sklearn import preprocessing
# =============================================================================


# import csv data from Data_3000.csv file
cars = pd.read_csv(r'.\Data_3000.csv', engine = 'python', sep = ';')


#Splitting motor(1.3,1.4,1.5...) from model column
# =============================================================================
Motor = cars['model'].apply(lambda x : x.split(' ')[0])
cars.insert(3,"motor",Motor)
cars.drop(['model'], axis = 1, inplace = True)
cars["motor"] = cars["motor"].astype(float)
# =============================================================================


# Drop ser and marka columns from dataset, because all same type
# =============================================================================
cars = cars.drop('seri', axis = 1)
cars = cars.drop('marka', axis = 1)
# =============================================================================


# dummification for categorical data (yakit, vites, cekis, renk, garanti, kimden)
cars_dum = pd.get_dummies(cars, prefix_sep='_', drop_first=True)


# split output data as y variable and drop it from dataset
y = cars_dum[["fiyat"]].to_numpy()
cars_dum = cars_dum.drop(columns = ["fiyat"])


# split input data as x varible and scale it with X 
# use scaled data X for regularized regression
# use unscaled data x for k-mean
# =============================================================================
x = cars_dum.values
columns = cars_dum.columns
min_max_scaler = preprocessing.MinMaxScaler()
x_scaled = min_max_scaler.fit_transform(x)
cars_dum = pd.DataFrame(x_scaled)
cars_dum.columns = columns

X = cars_dum.to_numpy()
# =============================================================================


# Split train and test data for regularized regression
X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=0.8, test_size=0.2, random_state=42)

print('\n')
print(">>>>>>>>>> REGULARIZED REGRESSION START <<<<<<<<<<")
"""
    ELASTIC NET REGULARIZED REGRESSION MODEL
    For regularized regression, we choosed Elastic Net which combinde L1(Lasso) and 
    L2(Ridge) regularization for regression. 
"""
# =============================================================================
elasticNet = ElasticNet(alpha = 6, l1_ratio = 1, max_iter = 1000000)
elasticNet.fit(X_train, y_train)
print('Training score: {}'.format(elasticNet.score(X_train, y_train)))
print('Test score: {}'.format(elasticNet.score(X_test, y_test)))

y_pred = elasticNet.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
rmse = math.sqrt(mse)
print('RMSE: {}'.format(rmse))
# =============================================================================
print(">>>>>>>>>> REGULARIZED REGRESSION FINISHED <<<<<<<<<<")
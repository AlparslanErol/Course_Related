# -*- coding: utf-8 -*-
# Import Libraries
# =============================================================================
import pandas
from keras.models import Sequential
from keras.layers import Dense
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import confusion_matrix
# Just disables the warning, doesn't enable AVX/FMA
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
# =============================================================================

# Configs
# =============================================================================
num_neuron1 = 8
num_neuron2 = 16
act_function1 = 'relu'
act_function2 = 'sigmoid'
# =============================================================================


# model function
def binary_classification(X_train, X_test, y_train, y_test, num_neurons, act_function, model_num):
    
    print('\n')
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MODEL',model_num,'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<')
    print('Number of Neurons in Model',model_num,'is ..:',num_neurons)
    print('Activation Function in Model',model_num,'is ..:',act_function)
    classifier = Sequential()
    #First Hidden Layer
    classifier.add(Dense(num_neurons, activation= act_function, input_dim=4))
    #Output Layer
    classifier.add(Dense(1, activation='sigmoid'))
    #Compiling the neural network
    classifier.compile(optimizer ='rmsprop',loss='binary_crossentropy', metrics =['accuracy'])
    #Fitting the data to the training dataset
    classifier.fit(X_train,y_train, batch_size=10, epochs=100, verbose=0)
    # evaluate model accuracy
    # find predicted value for test data
    y_pred=classifier.predict(X_test)
    # Threshold = 0.6 for binary classification
    y_pred =(y_pred>0.5)
    # Construct confusion matrix 
    cm = confusion_matrix(y_test, y_pred)
    # Calculate accuracy with given formula ==> (TP+TN)/(TP+TN+FP+FN)
    acc = (cm[0][0]+cm[1][1]) / (cm[0][0]+cm[1][0]+cm[0][1]+cm[1][1])
    print('Model',model_num,'Accuracy is ..:', acc)
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> END <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<')

    
# load dataset
dataframe = pandas.read_excel("PerturbedBanknoteAuthentication.xlsx", header=None)
dataset = dataframe.values

# split input and output columns
X = dataset[:,0:4].astype(float)
Y = dataset[:,4]

# IF YOU WANT TO SCALE INPUT FEATURE, UNCOMMENT THESE LINES
# =============================================================================
#standardizing the input feature
sc = StandardScaler()
X = sc.fit_transform(X)
# =============================================================================

# split train test dataset
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.3)

print('>>>>>>>>>>>> Program is starting... <<<<<<<<<<<<<<<')
# model 1
binary_classification(X_train, X_test, y_train, y_test, num_neuron1, act_function1, 1)

# model 2
binary_classification(X_train, X_test, y_train, y_test, num_neuron1, act_function2, 2)

# model 3
binary_classification(X_train, X_test, y_train, y_test, num_neuron2, act_function1, 3)

# model 4
binary_classification(X_train, X_test, y_train, y_test, num_neuron2, act_function2, 4)
print('>>>>>>>>>>>> Program finished! <<<<<<<<<<<<<<<')

# IMPORT LIBRARIES
# =============================================================================
import seaborn as sns
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import warnings
# =============================================================================


# VERSION CHECK
# =============================================================================
pd.set_option('display.float_format', lambda x: '%.3f' % x)
sns.set(style='white', context='notebook', palette='deep')
warnings.filterwarnings('ignore')
sns.set_style('white')
# =============================================================================


# SET UP DATA
df = pd.read_csv("./hw04_data_set.csv")


# SPLIT DATA TRAIN AND TEST
# =============================================================================
num_train = 150
num_test = 122
train = df[0:num_train]
test = df[num_train:]
# =============================================================================


# SORTING BY ERUPTIONS
# =============================================================================
train = train.sort_values(by = ["eruptions"])
train = train.reset_index(drop=True)
test = test.sort_values(by = ["eruptions"])
test = test.reset_index(drop=True)
train_np_erup = np.array(train["eruptions"])
train_np_wait = np.array(train["waiting"])
test_np_erup = np.array(test["eruptions"])
test_np_wait = np.array(test["waiting"])
# =============================================================================


# CONFIGS
# =============================================================================
widht_param = 0.37
origin_param = 1.5
num_bins = 10
end_point = (origin_param) + (widht_param*num_bins)
bins = np.linspace(origin_param, end_point, num_bins+1)
# =============================================================================


# FUNCTIONS
# =============================================================================
# FUNCTION FOR EVALUATION
def evaluate(data,data1,data2,data3,data4):
    # ROOT MEAN SQUARE ERROR RMSE CALCULATION   
    differences = kernel_smooth(data1,data2,data3,data4) - data["waiting"]                      
    differences_squared = differences ** 2                    
    mean_of_differences_squared = differences_squared.mean()  
    rmse_val = np.sqrt(mean_of_differences_squared)           
    rmse_val = float("{0:.4f}".format(rmse_val))
    # OUTPUT
    print("Kernel Smoother => RMSE is ", rmse_val, " when h is ", widht_param)
    
    
# GAUSSIAN KERNEL FUNCTION TO USE AS KERNEL METHOD
def gaussian_kernel(x, x0, h):
    return np.exp(- 0.5 * np.power((x - x0) / h, 2) )


# IMPLEMENTATION OF KERNEL SMOOTHING
def kernel_smooth(x_test, x_train, y_train, bandwidth, kernel_func=gaussian_kernel):
    return np.array([(kernel_func(x_train, x0, bandwidth).dot(y_train) ) / 
                     kernel_func(x_train, x0, bandwidth).sum() for x0 in x_test])
# =============================================================================
    
    
if __name__ == '__main__':
    
    # PLOTTING
    # =============================================================================
    a = plt.scatter(train["eruptions"], train["waiting"], edgecolors='b')
    b = plt.scatter(test["eruptions"], test["waiting"], color='r')
    plt.plot(test["eruptions"], kernel_smooth(test_np_erup,train_np_erup,train_np_wait,widht_param), linewidth = 3, color = 'k')
    plt.legend((a,b),
       ('train', 'test'),
       scatterpoints=1,
       loc='upper left',
       ncol=3,
       fontsize=10)
    plt.xlabel('Eruption time (min)')
    plt.ylabel('Waiting time to next eruption (min)')
    plt.title('h = 0.37')
    plt.show()
    # =============================================================================
    
    # EVALUATION WITH TEST DATA
    # =============================================================================    
    evaluate(test,test_np_erup,train_np_erup,train_np_wait,widht_param)
    # =============================================================================
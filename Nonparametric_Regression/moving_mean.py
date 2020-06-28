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
#RETURN NUMBER OF INPUTS IN EACH BIN
def bin_(data):
    temp = 0
    binss = np.zeros(num_bins)
    for index, value in enumerate(data["eruptions"]):
        if not((value > (origin_param + (temp * widht_param))) & (value <= (origin_param + ((temp + 1) * widht_param)))):
            temp = temp + 1
            binss[temp] = binss[temp] + 1
        else:
            binss[temp] = binss[temp] + 1
            
    return binss


#RETURN MIDDLE VALUE OF EACH BIN
def binn_mid(data):
    output = np.ceil(bin_(data)/2)
    return output


# DIGITIZE DATA WTIH BIN NUMBERS
def split_bin(data):
    output = np.zeros(len(data))
    number = 1
    temp = 0
    for index, value in enumerate(data["waiting"]):
        output[index] = number
        temp = temp + 1
        if temp == bin_(data)[number - 1]:
            number = number + 1
            temp = 0
            if number == (num_bins + 1):
                break
    return output


# RETURN MEAN OF EACH BIN
def bin_means(data):
    output = [data.waiting[split_bin(data) == i].mean() for i in range(1, len(bins))]
    return output


# ALGORITHM FOR REGRESSOGRAM
def regressogram(data):
    output = np.zeros(len(data))
    number = 1
    temp = 0
    for index, value in enumerate(data["waiting"]):
        output[index] = bin_means(data)[number-1]
        temp = temp + 1
        if temp == bin_(data)[number - 1]:
            number = number + 1
            temp = 0
            if number == (num_bins + 1):
                break
    return output


# FUNCTION FOR EVALUATION
def evaluate(data):
    # ROOT MEAN SQUARE ERROR RMSE CALCULATION   
    differences = moving_avg(data) - data["waiting"]                      
    differences_squared = differences ** 2                    
    mean_of_differences_squared = differences_squared.mean()  
    rmse_val = np.sqrt(mean_of_differences_squared)           
    rmse_val = float("{0:.4f}".format(rmse_val))
    # OUTPUT
    print("Running Mean Smoother => RMSE is ", rmse_val, " when h is ", widht_param)
    

# IMPLEMENTATION OF RUNNING MEAN ALGORITHM
def moving_avg(data):
    output = np.zeros(len(data))
    number = 1
    temp = 0
    tmp = 0
    dummy = 0
    for index, value in enumerate(data.waiting):
        output[index] = (data.waiting[index] + data.waiting[dummy + binn_mid(data)[tmp]])/2
        temp = temp + 1
        if temp == bin_(data)[number - 1]:
            number = number + 1
            temp = 0
            dummy = np.sum(bin_(data)[:tmp+1])
            tmp = tmp + 1
            if number == (num_bins + 1):
                break 
    return output
# =============================================================================
    
    
    
if __name__ == '__main__':
    
    # PLOTTING
    # =============================================================================
    a = plt.scatter(train["eruptions"], train["waiting"], edgecolors='b')
    b = plt.scatter(test["eruptions"], test["waiting"], color='r')
    plt.plot(train["eruptions"],moving_avg(train), linewidth = 3, color = 'k')
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
    evaluate(test)
    # =============================================================================
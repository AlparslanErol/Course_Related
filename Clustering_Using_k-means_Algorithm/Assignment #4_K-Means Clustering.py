#imports libraries
# =============================================================================
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
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
# =============================================================================


print("\n")
print(">>>>>>>>>> K-MEAN CLUSTERING MODEL START <<<<<<<<<<")
"""
    K-MEAN CLUSTERING MODEL
    For clustering, we applied K-Mean clustering which is an unsupervised learning method.
    For clsutering it is important to select number of cluster.
    To select optimal number of cluster, we used Elbow Curve and decide optimal cluster number
    for this model. Unsclaled x data used for k-mean input.
    Because this is an unsupervised method y data is not used.
"""
# =============================================================================
Error =[]
for i in range(2, 8):
    kmeans = KMeans(n_clusters = i, init='k-means++', max_iter=300, n_init=10, random_state=0)
    kmeans.fit(x)
    y_kmeans = kmeans.fit_predict(x)
    Error.append(kmeans.inertia_)
    
    print("K-Mean Clustering Model Price/km and Price/age curves for k = {}".format(i))
    # Plot Price/km and Price/age curves
# =============================================================================
    plt.figure(figsize=(10,8))
    plt.subplot(2,1,1)
    plt.scatter(x[:, 2], y, c = y_kmeans, cmap = 'rainbow')
    plt.xlabel('km')
    plt.ylabel('price')
    plt.title('K-Means, k = {}'.format(i))
    
    plt.subplot(2,1,2)
    plt.scatter(x[:, 1], y, c = y_kmeans, cmap = 'rainbow')
    plt.xlabel('age')
    plt.ylabel('price')
    plt.show()    
# =============================================================================

# Plot Elbow Curve
# =============================================================================
print('\n')    
print('Elbow Curve for k = 2,3,4,5,6,7')
plt.figure(figsize=(10,8))
plt.plot(range(2, 8), Error)
plt.title('Elbow Curve')
plt.xlabel('No of clusters')
plt.ylabel('Cost Function')
plt.show() 
# =============================================================================
# =============================================================================
print('\n')
print(">>>>>>>>>> K-MEAN CLUSTERING MODEL FINISHED <<<<<<<<<<")
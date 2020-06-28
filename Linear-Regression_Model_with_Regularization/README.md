# Linear-Regression_Model_with_Regularization
Yıldız Technical University END3971 Artificial Intelligence &amp; Expert Systems Assignment #4

# Summary
Regularization is a process of introducing additional information in order to solve an ill-posed problem or to prevent overfitting (Wikipedia). One way to regularize is to add a constraint to the loss function:\
Regularized Loss = Loss Function + Constraint\
There are multiple different forms of constraints that we could use to regularize. The three most popular ones are Ridge Regression, Lasso, and Elastic Net.

## Ridge Regression
Ridge regression is also called L2 regularization. It adds a constraint that is a linear function of the squared coefficients.

## Lasso
Lasso is also known as L1 regularization. It penalizes the model by the absolute weight coefficients.

## Elastic Net
Elastic Net is the combination of the L1 regularization and L2 regularization. It can both shrink the coefficients as well as eliminate some of the insignificant coefficients.
 
For regularized regression, we choosed Elastic Net which combinde L1(Lasso) and L2(Ridge) regularization for regression with specs alpha = 6, l1_ratio = 1, max_iter = 1000000.\
For metrics of this regularized regression Training Score, Test Score and RMSE(Root Meam Square Error) are considered.\
Here is our results…\
 Training score: 0.8734856272678422\
Test score: 0.9001003227840508\
RMSE: 3808.6031364157006 


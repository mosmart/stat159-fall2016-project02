# Ridge Regression
## Shrinkage method

# required packages
library(glmnet)
source("../functions/regression-functions.R")

# import train and test data
load("../../data/train-test.RData")

# Step 1: 10-fold cross validation parameters
intercept = FALSE
standardize = FALSE
grid <- 10^seq(10, -2, length = 100)
lambda = grid
alpha = 0 #ridge penalty
x = as.matrix(train[,-c(2:3,12)]) # remove rating and limit because highly correlated with income
y = train[,12]
family = c("gaussian")

# Step 2: 10-fold cross validation (using training data)
set.seed(10)
ridge_cv <- cv.glmnet(x,y,
                      alpha = alpha, intercept=intercept,
                      standardize=standardize, lambda = lambda,
                      family="gaussian")


# Step 2: selecting the best model
ridge_lambda <- ridge_cv$lambda.min
ridge_coef <- coef(ridge_cv, s=ridge_lambda)

# Step 4: plot variable coefficients vs. shrinkage parameter lambda.
png("../../images/ridge-cv.png")
plot(ridge_cv)
dev.off()

# Step 5: compute mse using test data
x_test = as.matrix(test[,-c(2:3,12)])
y_test = test[,12]
ridge_pred = predict(ridge_cv, s = ridge_lambda, newx = x_test) 
ridge_test_mse = mse(ridge_pred,y_test)

# Step 6: full model
x_full <- as.matrix(scaled_credit[,-c(2:3,12)])
y_full = scaled_credit[,12]
ridge_full <- glmnet(x_full,y_full,
                     alpha = alpha, intercept=intercept,
                     standardize=standardize, lambda = ridge_lambda,
                     family="gaussian")

# save objects to file
save(ridge_cv,ridge_lambda,ridge_test_mse, ridge_full, file = "../../data/ridge-cv.RData") 

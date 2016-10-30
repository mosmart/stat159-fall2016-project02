library(testthat)

# Create a prediction for testing
intercept = FALSE
standardize = FALSE
grid <- 10^seq(10, -2, length = 100)
lambda = grid
alpha = 0 #ridge penalty
x_train = as.matrix(mtcars[1:20,-1])
y_train = mtcars[1:20,1]

set.seed(10)
ridge_cv <- cv.glmnet(x_train,y_train,
alpha = alpha, intercept=intercept,
standardize=standardize, lambda = lambda,
family="gaussian")
ridge_lambda <- ridge_cv$lambda.min
x_test = as.matrix(mtcars[21:32,-1])
y = mtcars[21:32,1]
x = predict(ridge_cv, s = ridge_lambda, newx = x_test)

# Get functions to test
source("../functions/regression-functions.R")

# test file
test_file("../tests/test-regression.R")

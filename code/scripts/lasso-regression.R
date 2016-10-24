# LASSO Regression

# required packages
library(glmnet)
source("../functions/regression-functions.R")

# import train and test data
load("../../data/train-test.RData")

# 10-fold cross validation parameters
intercept = FALSE
standardize = FALSE
grid <- 10^seq(10, -2, length = 100)
lambda = grid
alpha = 1
x = as.matrix(train[,-12])
y = train[,12]
family = c("gaussian")

# 10-fold cross validation (using training data)
set.seed(10)
lasso_cv <- cv.glmnet(x,y,
                      alpha = alpha, intercept=intercept,
                      standardize=standardize, lambda = lambda,
                      family="gaussian")


# best model
lasso_lambda <- lasso_cv$lambda.min
lasso_coef <- coef(lasso_cv, s=lasso_lambda)

#plot variable coefficients vs. shrinkage parameter lambda.
png("../../images/lasso-cv.png")
plot(lasso_cv)
dev.off()

# compute mse using test data
x_test = as.matrix(test[,-12])
y_test = test[,12]
lasso_pred = predict(lasso_cv, s = lasso_lambda, newx = x_test) 
lasso_test_mse = mse(lasso_pred,y_test)

# full model
x_full <- as.matrix(scaled_credit[,-12])
y_full = scaled_credit[,12]
lasso_full <- glmnet(x_full,y_full,
                      alpha = alpha, intercept=intercept,
                      standardize=standardize, lambda = lasso_lambda,
                      family="gaussian")

# save objects to file
save(lasso_cv,lasso_lambda,lasso_test_mse, lasso_full, file = "../../data/lasso-cv.RData")


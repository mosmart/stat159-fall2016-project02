# LASSO Regression

# required packages
library(glmnet)

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

# save model outputs from 10k cv
save(lasso_cv, file = "../../data/lasso-cv.RData")

# best model
lasso_lambda <- lasso_cv$lambda.min
lasso_coef <- coef(lasso_cv, s=lasso_lambda)

#plot variable coefficients vs. shrinkage parameter lambda.
png("../../images/lasso-cv.png")
plot(lasso_cv)
dev.off()

# save objects to file
save(lasso_cv,lasso_lambda,lasso_test_mse, file = "../../data/lasso-cv.RData")


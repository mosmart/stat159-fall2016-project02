# Partial Least Squares Regression

# required packages
library(pls)
source("../functions/regression-functions.R")

# import train and test data
load("../../data/train-test.RData")

# 10-fold cross validation (using training data)
set.seed(10)
plsr_cv <- plsr(Balance ~., data = train, validation = "CV")

# best model
plsr_lambda <- min(plsr_cv$validation$PRESS)
plsr_ncomp <- plsr_cv$validation$PRESS

#plot variable coefficients vs. shrinkage parameter lambda.
png("../../images/plsr-cv.png")
validationplot(plsr_cv, val.type = "MSEP")
dev.off()

# compute mse using test data
x_test = as.matrix(test[,-12])
y_test = test[,12]
plsr_pred = predict(plsr_cv, s = plsr_lambda, newx = x_test) 
plsr_test_mse = mse(plsr_pred,y_test)

# full model
plsr_full <- plsr(Balance ~., data = test, ncomp = 8)

# save objects to file
save(plsr_cv,plsr_lambda,plsr_test_mse, plsr_full, file = "../../data/plsr-cv.RData")




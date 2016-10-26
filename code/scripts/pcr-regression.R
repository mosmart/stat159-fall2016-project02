# Principal Components regression
## Dimension reduction method 

# required packages
library(pls)
source("../functions/regression-functions.R")

# import train and test data
load("../../data/train-test.RData")

# Step 1/2: 10-fold cross validation (using training data)
set.seed(10)
pcr_cv <- pcr(Balance ~., data = train, validation = "CV")

# Step 3: best model
pcr_lambda <- min(pcr_cv$validation$PRESS)
pcr_ncomp <- pcr_cv$validation$PRESS

# Step 4: plot variable coefficients vs. shrinkage parameter lambda.
png("../../images/pcr-cv.png")
validationplot(pcr_cv, val.type = "MSEP")
dev.off()

# Step 5: compute mse using test data
x_test = as.matrix(test[,-12])
y_test = test[,12]
pcr_pred = predict(pcr_cv, s = pcr_lambda, newx = x_test) 
pcr_test_mse = mse(pcr_pred,y_test)

# Step 6: full model
pcr_full <- pcr(Balance ~., data = test, ncomp = 8)

# save objects to file
save(pcr_cv,pcr_lambda, pcr_test_mse, pcr_full, file = "../../data/pcr-cv.RData")



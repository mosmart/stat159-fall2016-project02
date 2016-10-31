load('../../data/osl.RData')
load('../../data/ridge-cv.RData')
load('../../data/lasso-cv.RData')
load('../../data/pcr-cv.RData')
load('../../data/plsr-cv.RData')


## Table of regression coefficients for all methods
shrink_coefs <- cbind(matrix(coef(osl_fit)), coef(lasso_full), coef(ridge_full))
shrink_coefs_matrix <- matrix(shrink_coefs, nrow=10, ncol=3)
shrink_coefs_matrix <- shrink_coefs_matrix[-1,]
reduction_coefs <- cbind(matrix(coef(pcr_full)), matrix(coef(plsr_full)))
all_coefs <- cbind(shrink_coefs_matrix, reduction_coefs)

coefs_df <- data.frame(all_coefs)
rownames(coefs_df) <- c('Income', 'Cards', 'Age', 'Education', 'GenderFemale', 'StudentFemale', 'MarriedYes', 'EthnicityAsian', 'EthnicityCaucasian')
names(coefs_df) <- c('OSL', 'Lasso', 'Ridge', 'PCR', 'PLSR')

save(coefs_df, mse_df, file='../../data/regression-results.RData')

## MSE values for regression techniques
mse_values <- data.frame(c(lasso_test_mse, ridge_test_mse, pcr_test_mse, plsr_test_mse))
mse_names <- c('Lasso', 'Ridge', 'PCR', 'PLSR')

mse_df <- mse_values
rownames(mse_df) <- mse_names
colnames(mse_df) <- c('MSE Value')

## Plot official coefficients
coefplot(lasso_full)

lassocoef(lasso_full)

library(glmnet)

barplot(coef(lasso_full))


plot(coefs_df)


save(coefs_df, mse_df, file='../../data/regression-results.RData')

# load required packages
## if you don't have this package, first run: install.packages("stargazer")
library(stargazer)
## if you don't have this package, first run: install.packages("testthat")
library(testthat)
## if you don't have this package, first run: install.packages("glmnet")
library(glmnet)
## if you don't have this package, first run: install.packages("pls")
library(pls)

# Session Info
sink("../../session-info.txt")
sessionInfo()
sink()

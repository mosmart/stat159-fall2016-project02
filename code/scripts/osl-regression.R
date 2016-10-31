# Ordinary Least Squares 

# import dataset
credit_scaled <- read.table('../../data/scaled-credit.csv', header=TRUE, sep=',')

# multi linear regression

osl_fit <- lm(Balance ~., data=credit_scaled[,-c(1,3:4)])
osl_summary_fit <- summary(osl_fit)

## Residual Plot
png('../../images/osl-residual-plot.png')
plot(osl_fit, which=1)
dev.off()

## Scale Location Plot
png('../../images/osl-scale-location.png')
plot(osl_fit, which=3)
dev.off()

## Normal QQ Plot
png("../../images/osl-normal-qq-plot.png")
plot(osl_fit, which=2)
dev.off()

# save objects to file
save(osl_fit, osl_summary_fit, file = "../../data/osl.RData")

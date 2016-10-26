# Ordinary Least Squares 

# import dataset
credit_scaled <- read.table('../../data/scaled-credit.csv', header=TRUE, sep=',')

# multi linear regression

fit <- lm(Balance ~., data=credit_scaled)
summary_fit <- summary(fit)

## Residual Plot
png('../../images/osl-residual-plot.png')
plot(fit, which=1)
dev.off()

## Scale Location Plot
png('../../images/osl-scale-location.png')
plot(fit, which=3)
dev.off()

## Normal QQ Plot
png("../../images/osl-normal-qq-plot.png")
plot(fit, which=2)
dev.off()

# save objects to file
save(fit, summary_fit, file = "../../data/osl.RData")

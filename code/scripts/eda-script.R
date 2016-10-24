# Exploratory Data Analysis (EDA)

# importing the data
credit_full <- read.table('../../data/Credit.csv', header=TRUE, sep=',')

###################

# Quantitative
credit_quantitative <- credit_full[c('Income', 'Limit', 'Rating', 'Cards', 'Age', 'Education', 'Balance')]

# Min, Q1, Median, Mean, Q3, Max
summary <- summary(credit_quantitative)

# Standard Deviations
standard_deviation <- data.frame(sapply(credit_quantitative, function(x) sd(x)))

# Range
range <- data.frame(t(data.frame(sapply(credit_quantitative, function(x) range(x)))))
names(range) = c("min","max")
range$range = range$max - range$min

sd_range <- cbind(standard_deviation, range$range)
names(sd_range) = c('SD', 'Range')

###################

# Qualitative

credit_qualitative <-credit_full[c('Gender', 'Student', 'Married', 'Ethnicity')]

# Frequency

frequency_gender <- table(credit_qualitative$Gender)
frequency_student <- table(credit_qualitative$Student)
frequency_married <- table(credit_qualitative$Married)
frequency_ethnicity <- table(credit_qualitative$Ethnicity)

# Relative Frequency

rel_frequency_gender <- prop.table(frequency_gender)
rel_frequency_student <- prop.table(frequency_student)
rel_frequency_married <- prop.table(frequency_married)
rel_frequency_ethnicity <- prop.table(frequency_ethnicity)

# Barcharts

png('../../images/barchart-gender.png')
barchart_gender <- barplot(rel_frequency_gender, main='Relative Frequency Gender')
dev.off()

png('../../images/barchart-student.png')
barchart_student <- barplot(rel_frequency_student, main='Relative Frequency Student')
dev.off()

png('../../images/barchart-married.png')
barchart_married <- barplot(rel_frequency_married, main='Relative Frequency Married')
dev.off()

png('../../images/barchart-ethnicity.png')
barchart_ethnicity <- barplot(rel_frequency_ethnicity, main='Relative Frequency Ethnicity')
dev.off()

###################

# Correlation Matrix
cor_matrix <- cor(credit_quantitative)

#Scatterplot Matrix
png('../../images/scatterplot-matrix.png')
scatterplot_matrix <- pairs(credit_quantitative, gap=0, main='Scatterplot Matrix')
dev.off()

#Anovas
anova <- aov(Balance ~ Gender + Student + Married + Ethnicity, data=credit_full)
anova_summary <- summary(anova)

#Conditional Boxplots
png('../../images/boxplot-gender.png')
boxplot_gender <- boxplot(Balance ~ Gender, data=credit_full, ylab='Balance', xlab='Gender', main='Conditional Boxplot Balance ~ Gender')
dev.off()

png('../../images/boxplot-student.png')
boxplot_student <- boxplot(Balance ~ Student, data=credit_full, ylab='Balance', xlab='Student', main='Conditional Boxplot Balance ~ Student')
dev.off()

png('../../images/boxplot-married.png')
boxplot_married <- boxplot(Balance ~ Married, data=credit_full, ylab='Balance', xlab='Married', main='Conditional Boxplot Balance ~ Married')
dev.off()

png('../../images/boxplot-ethnicity.png')
boxplot_ethnicity <- boxplot(Balance ~ Ethnicity, data=credit_full, ylab='Balance', xlab='Ethnicity', main='Conditional Boxplot Balance ~ Ethnicity')
dev.off()

###################

# Save the data
sink('../../data/summary-stats.txt')
summary
sd_range
frequency_gender
rel_frequency_gender
frequency_student
rel_frequency_student
frequency_married
rel_frequency_married
frequency_ethnicity
rel_frequency_ethnicity
sink()

sink('../../data/correlation-matrix.txt')
cor_matrix
sink()

sink('../../data/anova.txt')
anova
anova_summary
sink()

# Data Processing

# import dataset
credit <- read.table('../../data/Credit.csv', header=TRUE, sep=',')

###################

# Create Dummy Variables

# dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

# removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ ,-1], Balance = Balance)

###################

# Mean Centering and Standardizing

# scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

# export scaled data
write.csv(scaled_credit, file = "path/of/processed/data/scaled-credit.csv")
# Data Processing

# import dataset
credit <- read.table('../../data/Credit.csv', header=TRUE, sep=',')

# remove row index column
credit <- credit[,-1]

###################

# Create Dummy Variables

# dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

# removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)

###################

# Mean Centering and Standardizing

# scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

# export scaled data
write.csv(scaled_credit, file = "../../data/scaled-credit.csv")

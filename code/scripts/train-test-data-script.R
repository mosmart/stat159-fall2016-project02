# Training and Testing

# importing the data
scaled_credit <- read.table('../../data/scaled-credit.csv', header=TRUE, sep=',')

# remove row index column
scaled_credit <- scaled_credit[,-1]

set.seed(2)
# create training data
train_ids <- sample(1:400, 300, replace = FALSE)
train <- scaled_credit[train_ids,]
test <- scaled_credit[-train_ids,]
test_ids <- as.numeric(factor(row.names(test)))

save(train, test, train_ids, test_ids,scaled_credit, file = "../../data/train-test.RData")

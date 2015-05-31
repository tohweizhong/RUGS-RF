data(imports85)
imp <- imports85

imp <- imp[,-2]  # Too many NAs in normalizedLosses.
imp <- imp[complete.cases(imp), ]
## Drop empty levels for factors
imp[] <- lapply(imp, function(x) if (is.factor(x)) x[, drop=TRUE] else x)

# preparation for cross validation:
# split the dataset into 2 halves,
# 96 samples for training and 97 for testing

num.samples <- nrow(imp) # 193
num.train   <- round(num.samples/2) # 96
num.test    <- num.samples - num.train # 97
num.var     <- ncol(imp) # 25

# set up the indices
set.seed(150715)
idx       <- sample(1:num.samples)
train.idx <- idx[seq(num.train)]
test.idx  <- setdiff(idx,train.idx)

# subset the data
imp.train <- imp[train.idx,]
imp.test  <- imp[test.idx,]

str(imp.train)
str(imp.test)

# take a quick look
hist(imp.train$price)
hist(imp.test$price)

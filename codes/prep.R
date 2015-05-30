# pkgs <- c("kernlab","tree","randomForest","pROC)
# sapply(pkgs,FUN=function(p){
#         if(!require(p)) install.packages(p)
#         require(p)
# })

library(kernlab)
library(tree)
library(randomForest)
library(pROC)

data(spam)
str(spam)
# View(spam)

# preparation for cross validation:
# split the dataset into 2 halves,
# 2300 samples for training and 2301 for testing

num.samples <- nrow(spam) # 4,601
num.train   <- round(num.samples/2) # 2,300
num.test    <- num.samples - num.train # 2,301
num.var     <- ncol(spam) # 58

# set up the indices
set.seed(123)
idx       <- sample(1:num.samples)
train.idx <- idx[seq(num.train)]
test.idx  <- setdiff(idx,train.idx)

# subset the data
spam.train <- spam[train.idx,]
spam.test  <- spam[test.idx,]

str(spam.train)
str(spam.test)

# take a quick look
table(spam.train$type)
table(spam.test$type)

# # one more step: let's take the "answers" and testing data apart
# spam.test.ans <- spam.test$type
# spam.test<-subset(spam.test,select=-type)


# # ===
# 
# 
# index <- sample(1:nrow(spam))
# # example: sample(1:10)
# head(index,20L)
# 
# # taking the first half as training set
# spamtrain <- spam[index[1:floor(dim(spam)[1]/2)], ]
# #column names of the table
# names(spamtrain)
# 
# # see the row name in the table
# View(spamtrain)
# 
# # how many of the emails are spam emails
# table(spamtrain$type)
# 
# # testing set
# spamtest <- spam[index[((ceiling(dim(spam)[1]/2)) + 1):dim(spam)[1]], ]
# View(spamtest)
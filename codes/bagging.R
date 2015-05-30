bg.mod<-randomForest(type ~ ., data=spam.train,
                     ntry = num.var, # try all variables at each split
                     ntree = 500,
                     importance=TRUE)

plot(bg.mod$err.rate[,1], type="l", lwd=3, col="blue",
     main="Bagging: OOB estimate of performance",
     xlab="Number of Trees", ylab="performance")


# let's make some predictions
bg.pred <- predict(bg.mod,
                   subset(spam.test,select=-type), 
                   type="class")
bg.pred.results <- table(bg.pred, spam.test$type)
print(bg.pred.results)
bg.accuracy <- sum(diag((bg.pred.results))) / sum(bg.pred.results)

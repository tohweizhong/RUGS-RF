rf.mod <- randomForest(type ~ ., data=spam.train,
                       ntry = 2,
                       ntree = 500,
                       importance = TRUE)
#variable importance
varImpPlot(rf.mod)

# let's make some predictions
rf.pred <- predict(rf.mod,
                   subset(spam.test,select=-type), 
                   type="class")
rf.pred.results <- table(rf.pred, spam.test$type)
print(rf.pred.results)
rf.accuracy <- sum(diag((rf.pred.results))) / sum(rf.pred.results)

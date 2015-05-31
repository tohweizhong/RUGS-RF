#install.packages("randomForest")
#library(randomForest)

# finally, the random forest model
rf.mod<-randomForest(price ~ ., data = imp.train,
                     mtry = 8, # only difference from bagging is here
                     ntree = 500,
                     proximity = TRUE,
                     importance = TRUE)
beep()

# Out-of-bag (OOB) error rate as a function of num. of trees
plot(rf.mod$mse, type = "l", lwd = 3, col = "blue",
     main = "Random forest: OOB estimate of error rate",
     xlab = "Number of Trees", ylab = "OOB error rate")

# variable importance
varImpPlot(rf.mod,
           main = "Random forest: Variable importance")

# let's make some predictions
rf.pred <- predict(rf.mod,
                   subset(imp.test,select = -price))

plot(rf.pred,imp.test$price)
abline(a=0,b=1)

print(rf.mse <- mean((rf.pred-imp.test$price) ** 2))

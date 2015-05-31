#install.packages("randomForest")
#library(randomForest)

# next, let's build a bagged model
bg.mod<-randomForest(price ~ ., data = imp.train,
                     mtry = num.var-1, # try all variables at each split
                     ntree = 500,
                     proximity = TRUE,
                     importance = TRUE)
beep()

# Out-of-bag (OOB) error rate as a function of num. of trees
# here, the error is the mean squared error,
# not classification error
plot(bg.mod$mse, type = "l", lwd = 3, col = "blue",
     main = "Bagging: OOB estimate of error rate",
     xlab = "Number of Trees", ylab = "OOB error rate")

# variable importance
varImpPlot(bg.mod,
           main = "Bagging: Variable importance")

# let's make some predictions
bg.pred <- predict(bg.mod,
                   subset(imp.test,select = -price))

plot(bg.pred,imp.test$price)
abline(a=0,b=1)

print(bg.mse <- mean((bg.pred-imp.test$price) ** 2))


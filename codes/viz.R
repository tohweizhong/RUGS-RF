varImpPlot(bg.mod)
varImpPlot(rf.mod)

barplot(c(tree.accuracy,
          bg.accuracy,
          rf.accuracy),
        main="Accuracies",
        names.arg=c("Tree","Bagging","Random Forest"))

bg.pred.prob <- predict(bg.mod ,
                        subset(spam.test,select=-type),
                        type="prob")

rf.pred.prob <- predict(rf.mod ,
                        subset(spam.test,select=-type),
                        type="prob")

#plot ROC curve + AUC
plot.roc(spam.test$type,
         bg.pred.prob[,1], col="blue",
         lwd=3, print.auc=TRUE,print.auc.y = 0.3,
         main="Bagging vs. Random forest")

plot.roc(spam.test$type,
         rf.pred.prob[,1], col="red",
         lwd=3, print.auc=TRUE,print.auc.y = 0.2,
         add=TRUE)

plot.roc(spam.test$type,
         log.pred.prob, col="green",
         lwd=3, print.auc=TRUE, print.auc.y = 0.1,
         add=TRUE)
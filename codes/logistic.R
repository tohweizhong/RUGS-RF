log.mod<-glm(type ~ ., data=spam.train,
         family=binomial(link=logit))

log.pred.prob <- predict(log.mod,
                    subset(spam.test,select=-type), 
                    type="response")
# log.pred.results <- table(log.pred, spam.test$type)
# print(log.pred.results)
# log.accuracy <- sum(diag((log.pred.results))) / sum(log.pred.results)

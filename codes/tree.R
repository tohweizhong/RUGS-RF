#install.packages("tree")
library(tree)

tree.mod <- tree(type ~ ., data=spam.train)

plot(tree.mod)
text(tree.mod, cex=0.75)

# let's see if our decision tree requires pruning
cv.prune = cv.tree(tree.mod, FUN = prune.misclass)
plot(cv.prune$size, cv.prune$dev, pch=20, col="red", type="b",
     main="Cross validation to find optimal size of tree",
     xlab="size of tree", ylab="performance")

# Elbow rule suggests a tree size of 5
best.tree.size <- 5


pruned.tree.mod <- prune.misclass(tree.mod, best=best.tree.size)
plot(pruned.tree.mod)
text(pruned.tree.mod, cex=0.75)

# now let's make some predictions
tree.pred <- predict(pruned.tree.mod,
                            subset(spam.test,select=-type), 
                            type="class")
tree.pred.results <- table(tree.predictions, spam.test$type)
print(tree.pred.results)
tree.accuracy <- (tree.pred.results[1,1] + tree.pred.results[2,2]) / sum(tree.pred.results)




tree.mod <- tree(price ~ ., data=imp.train)

plot(tree.mod)
text(tree.mod, cex=0.75)

# let's see if our decision tree requires pruning
cv.prune <- cv.tree(tree.mod, FUN = prune.tree)
plot(cv.prune$size, cv.prune$dev, pch=20, col="red", type="b",
     main="Cross validation to find optimal size of tree",
     xlab="Size of tree", ylab="Deviance")

best.tree.size = 5

pruned.tree.mod <- prune.tree(tree.mod, best=best.tree.size)
plot(pruned.tree.mod)
text(pruned.tree.mod, cex=0.75)


# now let's make some predictions
tree.pred <- predict(tree.mod,
                     subset(imp.test,select=-price), 
                     type="vector")
plot(tree.pred,imp.test$price)
abline(a=0,b=1)

tree.mse <- mean((tree.pred-imp.test$price) ** 2)


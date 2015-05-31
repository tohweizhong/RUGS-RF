barplot(c(tree.mse,
          bg.mse,
          rf.mse),
        main="Accuracies of various models",
        names.arg=c("Tree","Bagging","RF"))


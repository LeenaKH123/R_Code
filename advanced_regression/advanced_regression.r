library(tree)
library(tidyverse)
library(ggplot2)
library(randomForest)
library(caret)
crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F)
head(crimeDate)
set.seed(1000)
# a. create a regression tree model
regression_tree <- tree(Crime~., data = crimeDate)
summary(regression_tree)
plot(regression_tree)
text(regression_tree)
regression_tree$frame
regression_tree$where
# manually compute R2, is this a good measure of the quality of fit? Notice that we only use average of each sheet
yhat_tree <- predict(regression_tree)
plot(yhat_tree, crimeDate$Crime)
# examinning training and CV deviance for different tree sizes, what does this indicate about the quality of fit
prune.tree(regression_tree)$size
prune.tree(regression_tree)$dev
set.seed(1000)
cv.tree(regression_tree)$dev
# example of manually prunning a tree in which we choose to only have 4 leaves
regression_tree_prune <- prune.tree(regression_tree, best = 4)
print(regression_tree_prune)
plot(regression_tree_prune)
text(regression_tree_prune)
# b: creating a random forest tree
random_forest_tree <- randomForest(Crime ~ ., data=crimeDate, importance = TRUE, nodesize = 5, ntree=500)
print(random_forest_tree)
random_forest_prediction <- predict(random_forest_tree, data= crimeDate[, -16])
print(random_forest_prediction)
importance(random_forest_tree)
varImpPlot(random_forest_tree)

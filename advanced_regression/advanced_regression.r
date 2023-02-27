library(tree)
library(tidyverse)
library(ggplot2)
library(randomForest)
# install.packages("tree")
# 
# library(caret)
crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F)
head(crimeDate)
set.seed(1000)
# build the regression model
regression_tree <- tree(Crime~., data = crimeDate)
summary(regression_tree)

rm(list = ls())
germanData = read.table("/home/lilo/rcode/advanced_regression/germancredit.txt", sep = " ")
print(head(germanData))

#notice that we have many categorical predictors
#make the response variable binary in terms of 0 and 1
germanData$V21[germanData$V21==1]<-0
germanData$V21[germanData$V21==2]<-1
print(head(germanData))
#split the data into training and testing sets
germanData_train <- germanData[1:800,]
germanData_test <- germanData[801:1000,]

# create a logistic regression model
germanData_model <- glm(V21~.,family = binomial(link = "logit"),data = germanData_train)
print(germanData_model)
summary(germanData_model)
# important to use type = response here becuase without that we are given predictions of log odds in the default case
yhat <- predict(germanData_model, germanData_test, type="response")
print(yhat)
# Round yhat to get binary predictions from which you can computer an accuracy (classification rate), you may want to try out different thresholds for rounding
# You may also use auc to estimate the quality of fit
library(pROC)
roc(germanData_test$V21, round(yhat))
#Look at different threshold probability values and then compute the cost that corresponds to each threshold
thresh <- 0.8
yhat_thresh <- as.integer(yhat > thresh)
conf_matrix <- as.matrix(table(yhat_thresh, germanData_test$V21))
print(conf_matrix)

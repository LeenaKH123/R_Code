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

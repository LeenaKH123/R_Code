rm(list = ls())
germanData = read.table("/home/lilo/rcode/advanced_regression/germancredit.txt", sep = " ")
print(head(germanData))
#notice that we have many categorical predictors
#make the response variable binary in terms of 0 and 1
germanData$V21[germanData$V21==1]<-0
germanData$V21[germanData$V21==2]<-1

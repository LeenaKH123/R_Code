# # install.packages("pacman")
pacman::p_load(kernlab, kknn)
# step 1: import the dataset
rm(list = ls())
set.seed(200)
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# ****** KKNN ********
library(kknn)
# # Empty data frame
# df<-data.frame()
# # Run a loop for each data point, do not include it in the knn
# # Create a vector with the grount truth and the knn fitted value (fraction of 1)
# for (i in c(1:nrow(credit.data))){
#     m1<-kknn(R1~ .,credit.data[-i,],credit.data[i,],k=3,scale = TRUE)  --> k=10 in the slides, lernel = optimal, its required to vary k, distance = 2
#     df1<-list(as.numeric(credit.data$R1[i]),m1$fitted.values)
#     df<-rbind(df,df1)
# }
# # Give proper column names to the data frame
# names(df)<-c("Ground.Truth","knn.fitted.value")
# # Majority vote - predict class based on knn-predicted fraction i.e. if it is > 0.5
# df$pred<-as.numeric(df$knn.fitted.value>0.5)
# # If ground truth == prediction
# df$correct<-as.numeric(df$Ground.Truth==df$pred)
# # Confusion matrix for this exercise
# confusionMatrix(as.factor(df$pred),as.factor(df$Ground.Truth))

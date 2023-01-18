# install.packages("kknn")
rm(list = ls())
library(kknn)
# step 1: import the dataset
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data.txt', header = FALSE) 
# ****** KKNN ********
# head(CardData)
# print(head(CardData))
 # calculate the accuracy of the model with a function that pass the value of k
 check_accuracy <- function(M){
   predicted <- rep(0,(nrow(CardData)))
   for (i in 1:nrow(CardData)){
      model=kknn(V11~V1+V2+V3+V4+V5+V6+V7+V8+V9+V10,CardData[-i,],CardData[i,],k=M, scale = TRUE) # use scaled data
     predicted[i] <- as.integer(fitted(model) + 0.5)
   }
   accuracy <- sum(predicted == CardData[,11]) / nrow(CardData)
  return(accuracy)
 }

 acc <- rep(0,20) # set up a vector of 20 zeros to start
 for (M in 2:20){
    print(check_accuracy(M)) # test knn with X neighbors
  }

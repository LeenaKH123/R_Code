# install.packages("kknn")
rm(list = ls())
library(kknn)
# step 1: import the dataset
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# ****** KKNN ********
# head(CardData)
# print(head(CardData))
 # calculate the accuracy of the model with a function that pass the value of k
 check_accuracy <- function(M){
   predicted <- rep(0,(nrow(CardData)))
   for (i in 1:nrow(CardData)){
      modelKKNN=kknn(R1~A1+A2+A3+A8+A9+A10+A11+A12+A14+A15,CardData[-i,],CardData[i,],k=M, scale = TRUE) # use scaled data
     predicted[i] <- as.integer(fitted(modelKKNN) + 0.5)
   }
   accuracyequation <- sum(predicted == CardData[,11]) / nrow(CardData)
  return(accuracyequation)
 }

 accvector <- rep(0,20) # set up a vector of 20 zeros to start
 for (M in 2:20){
   accvector[M] <- (check_accuracy(M)) # test knn with X neighbors
  }
  print(accvector)

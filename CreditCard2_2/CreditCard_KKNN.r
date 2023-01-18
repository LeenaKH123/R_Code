# install.packages("kknn")
library(kknn)
# step 1: import the dataset
rm(list = ls())
set.seed(200)
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# ****** KKNN ********
head(CardData)
# print(head(CardData)) --> A1, A2, A3, A8, A9, A10, A11, A12, A14, A15, R1
# calculate the accuracy of the model with a function that pass the value of k
check_accuracy = function(M){
  predicted <- rep(0,(nrow(CardData))) 
  for (i in 1:nrow(CardData)){
    model=kknn(R1~A1+A2+A3+A8+A9+A10+A11+A12+A14+A15,CardData[-i,],CardData[i,],k=M, scale = TRUE)
    predicted[i] <- as.integer(fitted(model)+0.5)
  }
  accuracy = sum(predicted == data[,11]) / nrow(data)
  return(accuracy)
}
acc <- rep(0,30) # set up a vector of 20 zeros to start
# for (M in 1:20){
#   acc(M) = check_accuracy(M) # test knn with X neighbors
# }
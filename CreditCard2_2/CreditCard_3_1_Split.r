# splitting the data into training, validation, and test data sets (pick either KNN or SVM; the other is optional).
# # install.packages("pacman")
pacman::p_load(kernlab, kknn)
# step 1: import the dataset
rm(list = ls())
set.seed(123)
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data.txt', header = FALSE) 
# head(CardData, 5)
# print(head(CardData, 5))
# Splitting the data into training, test and validation
# 70% for training and 15% for test and another 15% for validation
training_data <- sample(nrow(CardData), size = floor(nrow(CardData) * 0.7))
# creating a matrix data set with the training data
creditcard_training <- CardData[training_data,]
# print(creditcard_training) # printing the training data in a matrix
# put the remaining data in another matrix
creditcard_test_validation <- CardData[-training_data,]
# print(creditcard_test_validation) # printing the remaining data in a matrix

# divide the test train data in two halfs
half_test_validate = sample(nrow(creditcard_test_validation), size = floor(nrow(creditcard_test_validation)/2))
# put half_test_validate in two matrices
# validation matrix
creditcard_validation <- creditcard_test_validation[half_test_validate,]
# print("validation matrix is: ")
# print(creditcard_validation)
# Test matrix
creditcard_test <- creditcard_test_validation[-half_test_validate,]
# print("Test matrix is: ")
# print(creditcard_test)
 accuracyfunction <- function(M){
   predicted <- rep(0,(nrow(creditcard_training)))
   for (i in 1:nrow(creditcard_training)){
      modelKKNN=kknn(V11~V1+V2+V3+V4+V5+V6+V7+V8+V9+V10,creditcard_training[-i,],creditcard_training[i,],k=M,kernel="optimal", scale = TRUE) # use scaled data
     predicted[i] <- as.integer(fitted(modelKKNN) + 0.5)
   }
   accuracyequation <- sum(predicted == creditcard_training[,11]) / nrow(creditcard_training)
  return(accuracyequation)
  }
 accvector <- rep(0, 30)
 for (M in 1:30){
   accvector[M] <- (accuracyfunction(M))
  }
# print(accvector)
# calculate accuracy on validation data
# --------------------------------
 accuracyfunction <- function(M){
   predicted <- rep(0,(nrow(creditcard_validation)))
   for (i in 1:nrow(creditcard_validation)){
      modelKKNN=kknn(V11~V1+V2+V3+V4+V5+V6+V7+V8+V9+V10,creditcard_validation[-i,],creditcard_validation[i,],k=M,kernel="optimal", scale = TRUE) # use scaled data
     predicted[i] <- as.integer(fitted(modelKKNN) + 0.5)
   }
   accuracyequation <- sum(predicted == creditcard_validation[,11]) / nrow(creditcard_validation)
  return(accuracyequation)
  }
 accvector <- rep(0, 30)
 for (M in 11:17){
   accvector[M] <- (accuracyfunction(M))
  }
# print(accvector)
# calculate accuracy on test data
# ----------------------------------
 accuracyfunction <- function(M){
   predicted <- rep(0,(nrow(creditcard_test)))
   for (i in 1:nrow(creditcard_test)){
      modelKKNN=kknn(V11~V1+V2+V3+V4+V5+V6+V7+V8+V9+V10,creditcard_test[-i,],creditcard_test[i,],k=12,kernel="optimal", scale = TRUE) # use scaled data
     predicted[i] <- as.integer(fitted(modelKKNN) + 0.5)
   }
   accuracyequation <- sum(predicted == creditcard_test[,11]) / nrow(creditcard_test)
  return(accuracyequation)
  }
 accvector <- rep(0, 30)
 accvector[12] <- (accuracyfunction(12))
 print(accvector)
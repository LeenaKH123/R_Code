# Using the same data set (credit_card_data.txt or credit_card_data-headers.txt) as in Question 2.2, use the ksvm or kknn function to 
# find a good classifier:
# using cross-validation (do this for the k-nearest-neighbors model; SVM is optional); and
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

# 70% training data
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
model1 <- train.kknn(as.factor(V11)~V1+V2+V3+V4+V5+V6+V7+V8+V9+V10, data = creditcard_training, kmax = 70, scale = TRUE)
# print(model1)
# minimial misclassification: 0.1444201
# best kernel: optimal
# best k = 10
# create a vector of zeros with the size of the training data matrix
PredictWithTrainingData <- rep(0,(nrow(creditcard_training)))
# Using the same data set (credit_card_data.txt or credit_card_data-headers.txt) as in Question 2.2, use the ksvm or kknn function to 
# find a good classifier:
# using cross-validation (do this for the k-nearest-neighbors model; SVM is optional); and
# splitting the data into training, validation, and test data sets (pick either KNN or SVM; the other is optional).
# # install.packages("pacman")
pacman::p_load(kernlab, kknn)
# step 1: import the dataset
rm(list = ls())
set.seed(123)
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# head(CardData, 5)
# print(head(CardData, 5))
# Splitting the data into training, test and validation
# 70% for training and 15% for test and another 15% for validation

# 70% training data
training_data <- sample(nrow(CardData), size = floor(nrow(CardData) * 0.7))

# creating a vector with the training data
creditcard_training = creditcard_data[mask_trainingset,] 

# Using the remaining data for test and validation sets by splitting into half
# selecting all rows except rows assigned to training set
remaining_data = creditcard_data[-mask_trainingset,]  

# Half of remaining data is for validation set and half for test set
mask_validationset = sample(nrow(remaining_data), size = floor(nrow(remaining_data)/2))

# validation data set
creditcard_validation = remaining_data[mask_validationset,] 

# test data set
creditcard_test = remaining_data[-mask_validationset,] 

# Now, validation and test set have 131 observations, which is 20% of total 654 observations
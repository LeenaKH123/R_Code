# install.packages("kknn")
library(kknn)
# step 1: import the dataset
rm(list = ls())
set.seed(200)
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# ****** KKNN ********
# step one sample the data
# install.packages('caret')
library(caret)
trainingData <- createDataPartition(y = CardData$R1, p = 0.75, list = F)
# str(trainingData)
# train_data <- data[trainingData, ]
dim(trainingData)

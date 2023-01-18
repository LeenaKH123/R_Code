# install.packages("kknn")
library(kknn)
# step 1: import the dataset
rm(list = ls())
set.seed(200)
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# ****** KKNN ********
# step one sample the data
# install.packages('caret')
head(CardData)
# print(head(CardData)) --> A1, A2, A3, A8, A9, A10, A11, A12, A14, A15, R1

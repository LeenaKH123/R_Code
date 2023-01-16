# install.packages("pacman")
pacman::p_load(kernlab, kknn)
# df <- read.csv('./credit_card_data-headers.txt') -- not working
# step 1: import the dataset
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# print(CardData) -- I have the date
# call ksvm.  Vanilladot is a simple linear kernel.
CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="vanilladot",C=100)
# calculate a1…am
a <- colSums(CardModel@xmatrix[[1]] * CardModel@coef[[1]])
#printing the value of a
cat("a = ", a)
a0 <- CardModel@b
cat("\n")
# printing the value of a0
cat("The value of a0 = ", a0)
cat("\n")
# see what the model predicts
pred <- predict(CardModel,CardData[,1:10])
# pred
# # see what fraction of the model’s predictions match the actual classification
validateaccuracy <- sum(pred == CardData[,11]) / nrow(CardData)
# print accuracy
cat("Accuracy =", validateaccuracy)
cat("\n")
# define a range for c values
cvalues <- as.list(c(10^(-5:5)))
cat("C values range is from: ", min(unlist(cvalues)))
cat(" to: ", max(unlist(cvalues)))

# # install.packages("pacman")
# pacman::p_load(kernlab, kknn)
# # step 1: import the dataset
# CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# # print(CardData) -- I have the date
# # call ksvm.  Vanilladot is a simple linear kernel.
# CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="vanilladot",C=100)
# # calculate a1…am
# a <- colSums(CardModel@xmatrix[[1]] * CardModel@coef[[1]])
# #printing the value of a
# cat("a = ", a)
# a0 <- CardModel@b
# cat("\n")
# # # printing the value of a0
# cat("The value of a0 = ", a0)
# cat("\n")
# # formulate the equation to find y
# # y = -0.001*A1
# #see what the model predicts
# pred <- predict(CardModel,CardData[,1:10])
# # print prediction
# # cat("Prediction =", pred)
# # cat("\n")
# # # see what fraction of the model’s predictions match the actual classification
# validateaccuracy <- sum(pred == CardData[,11]) / nrow(CardData)
# # print accuracy
# cat("Accuracy for c value 100 =", validateaccuracy)
# cat("\n")
# # define a range for c values
# cvalues <- as.list(c(10^(-5:5)))
# cat("C values range is from: ", min(unlist(cvalues)))
# cat(" to: ", max(unlist(cvalues)))
# #running a loop with cvalues
# for (cvaluescounter in cvalues){
#     #print(cvaluescounter) checking this value
#     CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="vanilladot",C=cvaluescounter)
#     pred <- predict(CardModel,CardData[,1:10])
#     validateaccuracy <- sum(pred == CardData[,11]) / nrow(CardData)
#     cat("Accuracy is: ", validateaccuracy)
#     cat(" for C value = ",cvaluescounter )
#     }
# # the model with C value = 0.01 that has the best accuracy
# CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="vanilladot",C=0.01)
# # calculate a1…am
# a <- colSums(CardModel@xmatrix[[1]] * CardModel@coef[[1]])
# #printing the value of a
# cat("a = ", a)
# a0 <- CardModel@b
# cat("\n")
# # # printing the value of a0
# cat("The value of a0 = ", a0)
# cat("\n")
# #----------
#----*** rbfdot kernel
cvalues <- as.list(c(10^(-5:5)))
cat("C values range is from: ", min(unlist(cvalues)))
cat(" to: ", max(unlist(cvalues)))
cat("\n")
#running a loop with cvalues
for (cvaluescounter in cvalues){
    #print(cvaluescounter) checking this value
    CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="rbfdot",C=cvaluescounter)
    pred <- predict(CardModel,CardData[,1:10])
    validateaccuracy <- sum(pred == CardData[,11]) / nrow(CardData)
    cat("\n")
    cat(" with rbfdot kernel Accuracy is: ", validateaccuracy)
    cat(" for C value = ", cvaluescounter)
    cat("\n")
    }
# the model with C value = 1e+05 that has the best accuracy
CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="rbfdot",C = 1e+05)
# calculate a1…am
a <- colSums(CardModel@xmatrix[[1]] * CardModel@coef[[1]])
#printing the value of a
cat("a = ", a)
a0 <- CardModel@b
cat("\n")
# # printing the value of a0
cat("The value of a0 = ", a0)
cat("\n")
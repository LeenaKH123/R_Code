
# # install.packages("pacman")
pacman::p_load(kernlab, kknn)
# step 1: import the dataset
CardData <- read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# print(CardData) -- I have the date
# call ksvm.  Vanilladot is a simple linear kernel.
# CardModel <- ksvm(x=as(CardData[,1:10]),data = CardModel,type="C-svc",kernel="vanilladot",C=100, scaled=TRUE)
CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="vanilladot",C=100)
# print(attributes(CardModel))
# calculate a1…am
a <- colSums(CardModel@xmatrix[[1]] * CardModel@coef[[1]])
#printing the value of a
cat("a = ", a)
a0 <- CardModel@b
cat("\n")
# # printing the value of a0
cat("The value of a0 = ", a0)
cat("\n")
# formulate the equation to find y
# y = -0.001*A1
#see what the model predicts
pred <- predict(CardModel,CardData[,1:10])
# print prediction
# cat("Prediction =", pred)
# cat("\n")
# # see what fraction of the model’s predictions match the actual classification
validateaccuracy <- sum(pred == CardData[,11]) / nrow(CardData)
# print accuracy
cat("Accuracy for c value 100 =", validateaccuracy)
cat("\n")
# define a range for c values
cvalues <- as.list(c(10^(-5:5)))
cat("C values range is from: ", min(unlist(cvalues)))
cat(" to: ", max(unlist(cvalues)))
#running a loop with cvalues
for (cvaluescounter in cvalues){
    #print(cvaluescounter) checking this value
    CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="vanilladot",C=cvaluescounter)
    pred <- predict(CardModel,CardData[,1:10])
    validateaccuracy <- sum(pred == CardData[,11]) / nrow(CardData)
    cat("Accuracy is: ", validateaccuracy)
    cat(" for C value = ",cvaluescounter )
    }
# the model with C value = 0.01 that has the best accuracy
CardModel <- ksvm(x=as.matrix(CardData[,1:10]),y=as.factor(CardData[,11]),scaled=T,type="C-svc",kernel="vanilladot",C=0.01)
# calculate a1…am
a <- colSums(CardModel@xmatrix[[1]] * CardModel@coef[[1]])
#printing the value of a
cat("a = ", a)
a0 <- CardModel@b
cat("\n")
# # printing the value of a0
cat("The value of a0 = ", a0)
cat("\n")
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
# ****** KKNN ********
library(kknn)
# # Empty data frame
# df<-data.frame()
# # Run a loop for each data point, do not include it in the knn
# # Create a vector with the grount truth and the knn fitted value (fraction of 1)
# for (i in c(1:nrow(credit.data))){
#     m1<-kknn(R1~ .,credit.data[-i,],credit.data[i,],k=3,scale = TRUE)  --> k=10 in the slides, lernel = optimal, its required to vary k, distance = 2
#     df1<-list(as.numeric(credit.data$R1[i]),m1$fitted.values)
#     df<-rbind(df,df1)
# }
# # Give proper column names to the data frame
# names(df)<-c("Ground.Truth","knn.fitted.value")
# # Majority vote - predict class based on knn-predicted fraction i.e. if it is > 0.5
# df$pred<-as.numeric(df$knn.fitted.value>0.5)
# # If ground truth == prediction
# df$correct<-as.numeric(df$Ground.Truth==df$pred)
# # Confusion matrix for this exercise
# confusionMatrix(as.factor(df$pred),as.factor(df$Ground.Truth))
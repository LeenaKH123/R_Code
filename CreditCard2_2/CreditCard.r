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
cat("a = ", a)
a0 <- CardModel@b
cat("The value of a0 = ", a0)
# see what the model predicts
pred <- predict(CardModel,CardData[,1:10])
# pred
# # see what fraction of the model’s predictions match the actual classification
# sum(pred == data[,11]) / nrow(data)

# step 2: select the dataset columns
# df <- df[2:4]
# print(df)
# str(df)
# summary(df)
# library(kernlab)
# c.train = df[(1:490), ]
# c.test = df[(1:164), ]
# model = ksvm(data=c.train,
            #  strength = A1+A2,
            #  kernel="vanilladot") 
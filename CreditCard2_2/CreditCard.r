# plot(iris)
# for(i in 1:10){
#     print("this is awesome")
# }

# print(dataset)
# credit_card_data
# credit_card_data-headers
#install.packages("pacman")
pacman::p_load(kernlab, kknn)
# df <- read.csv('./credit_card_data-headers.txt') -- not working
# step 1: import the dataset
df = read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
# step 2: select the dataset columns
df <- df[2:4]
print(df)
# str(df)
# summary(df)
# library(kernlab)
# c.train = df[(1:490), ]
# c.test = df[(1:164), ]
# model = ksvm(data=c.train,
            #  strength = A1+A2,
            #  kernel="vanilladot") 
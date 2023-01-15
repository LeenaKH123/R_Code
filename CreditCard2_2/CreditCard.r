# plot(iris)
# for(i in 1:10){
#     print("this is awesome")
# }

# print(dataset)
# credit_card_data
# credit_card_data-headers
install.packages("pacman")
pacman::p_load(kernlab, kknn)
# df <- read.csv('./credit_card_data-headers.txt') -- not working
df = read.table('/home/lilo/rcode/CreditCard2_2/credit_card_data-headers.txt', header = TRUE) 
print(df)
str(df)
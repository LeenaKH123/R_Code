# plot(iris)
# for(i in 1:10){
#     print("this is awesome")
# }

# print(dataset)
install.packages("pacman")
pacman::p_load(kernlab, kknn)
data <- read.table(file = "\\home\\lilo\\rcode\\CreditCard2_2\\credit_card-headers.txt", header = TRUE, sep=" ")
# dataset = read.csv('/home/lilo/rcode/CreditCard2_2/credit_card_data.txt')
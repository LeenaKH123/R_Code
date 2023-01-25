# Question 4.2 
# The iris data set iris.txt contains 150 data points, each with four predictor 
# variables and one categorical response. The predictors are the width and length of the sepal and petal of 
# flowers and the response is the type of flower. The data is available from the R library datasets and can be
# accessed with iris once the library is loaded. It is also available at the UCI Machine Learning Repository
# (https://archive.ics.uci.edu/ml/datasets/Iris ). The response values are only given to see how well a specific 
# method performed and should not be used to build the model.
# Use the R function kmeans to cluster the points as well as possible.
# Report the best combination of predictors, your suggested value of k, and how well your best clustering predicts flower type.
# plot(iris)

pacman::p_load(kernlab, kknn)
#  library (kernlab) --from office hours
# step 1: import the dataset
rm(list = ls())
set.seed(123)
data <- read.table('/home/lilo/rcode/CreditCard2_2/iris.txt', header = TRUE)
table(data$species)
library(ggplot2)
ggplot(data, aes(sepal_length, sepal_width, color = species)) + geom_point()
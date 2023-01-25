# install.packages('ggplot2')
pacman::p_load(kernlab, kknn)
#  library (kernlab) --from office hours
# step 1: import the dataset
rm(list = ls())
set.seed(123)
# data <- read.table('/home/lilo/rcode/CreditCard2_2/iris.txt', header = TRUE)
# table(data$species)
# flowerdata <- data[training_data,]
# ggplot(data, aes(sepal_length, sepal_width, color = species)) + geom_point()
# cluster_1 <- kmeans(data[, 1:4], centers = 2, nstart = 5)
# cluster_2 <- kmeans(data[, 1:4], centers = 3, nstart = 10)
# cluster_1$tot.withinss
# table(cluster_1$cluster, data$Species)
library(ggplot2)
flowerdata <- iris
p <- ggplot(flowerdata, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point()
# print(p)
cluster_1 <- kmeans(flowerdata[,1:4], center = 2, nstart = 5)
cluster_2 <- kmeans(flowerdata[,1:4], center = 3, nstart = 20)
cluster_3 <- kmeans(flowerdata[,1:4], center = 5, nstart = 15)
table1 <- table(cluster_1$cluster, flowerdata <- iris$Species)
print(table1)
table2 <- table(cluster_2$cluster, flowerdata <- iris$Species)
print(table2)
table3 <- table(cluster_3$cluster, flowerdata <- iris$Species)
print(table3)
library(cluster)
# cluster1plot <- clusplot(iris, cluster_1$cluster, color=T, shade=T, labels=0, lines=0)
cluster2plot <- clusplot(iris, cluster_2$cluster, color=T, shade=T, labels=0, lines=0)
# cluster3plot <- clusplot(iris, cluster_3$cluster, color=T, shade=T, labels=0, lines=0)
# tot.withinss <- vector(mode="character", length=10)
# for (i in 1:10){
#   irisCluster <- kmeans(df[,1:4], center=i, nstart=20)
#   tot.withinss[i] <- irisCluster$tot.withinss
# }
# plot(1:10, tot.withinss, type="b", pch=19)
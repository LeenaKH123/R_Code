library(MASS)
library(ggplot2)
set.seed(1000)
# define the mean and the standard deviation of random data
sigma <- rbind(c(1, -0.7), c(-0.7, 1))
mu <- c(10, 5)
# randomly generate some multivariate data
df <- as.data.frame(mvrnorm(n=1000, mu=mu, Sigma = sigma))
# plot our unscaled data
ggplot(df, aes(x= V1, y=V2)) + geom_point() + coord_fixed() + ggtitle("The unscaled original data")
# correlation coefficient of our data
cor(df)
# scale our data, center the data where we want it
data_scaled <- as.data.frame(scale(df))
# plot our scaled data
ggplot(data_scaled, aes(x= V1, y=V2)) + geom_point() + coord_fixed() + ggtitle("The scaled original data")
# data has been normalised after using mean and standard deviation, mean for centering and standard deviation for scaling
# run PCA and let prcomp do the scaling for us
PCA <- prcomp(df, scale=TRUE)
# plot our transformed data, note how the data has changed
ggplot(as.data.frame(PCA$x), aes(x= PC1, y= PC2)) + geom_point() + coord_fixed() + ggtitle("The data transformed via prcomp")


# crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F) 
# head(crimeDate)
# # crime_model <- lm(Crime ~ ., data = crimeData)

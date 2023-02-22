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
# crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F) 
# head(crimeDate)
# # crime_model <- lm(Crime ~ ., data = crimeData)

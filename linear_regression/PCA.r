library(MASS)
library(ggplot2)
set.seed(1000)
# define the mean and the standard deviation of random data
sigma <- rbind(c(1, -0.7), c(-0.7, 1) )
# crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F) 
# head(crimeDate)
# # crime_model <- lm(Crime ~ ., data = crimeData)
# 
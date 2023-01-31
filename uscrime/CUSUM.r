tempData <- read.table("/home/lilo/rcode/uscrime/temprature.txt", header= TRUE, stringsAsFactors = F)
head(tempData)
summary(tempData)
# install.packages("reshape")
library(reshape)
# use the melt function to transform a wide format into a long format
q3 <- melt(tempData[], id='DAY')
# print(q3)
# boxplot(data=q3, value~variable)
# ------ day stats
# 123 is the number of days we have in the source data, so creating a vector of size 123
day_mean <- rep(0,123)
for (i in 1:123) {
  day_mean[i] <- mean(unlist(tempData[i, 2:21]))
}
df_mean <- data.frame(day = unlist(tempData[0:123,1]), day.mean)
# print(df_mean)
# plot(x = 1:123, df_mean$day.mean,col="purple")
q4 <- melt(tempData[0:20,])
print(q4)
tempratureMean <- aggregate(value~variable, q4, mean)
# print(tempratureMean)
tempratureStandardDev <- aggregate(value~variable, q4, sd)
# print(tempratureStandardDev)
tempratureMedian <- aggregate(value~variable, q4, median)
print(tempratureMedian)
# temp.median <- aggregate(value~variable, meltdata, median)
# yoy.stats <- data.frame(YEAR = temp.mean$variable,
#                        Median = temp.median$value,
#                        MEAN = temp.mean$value,
#                        SD = temp.sd$value)

# print(yoy.stats)

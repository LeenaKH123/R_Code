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
df_mean <- data.frame(day = unlist(tempData[0:123,1]), day_mean)
# print(df_mean)
# plot(x = 1:123, df_mean$day.mean,col="purple")
q4 <- melt(tempData[0:20,])
# print(q4)
tempratureMean <- aggregate(value~variable, q4, mean)
# print(tempratureMean)
tempratureStandardDev <- aggregate(value~variable, q4, sd)
# print(tempratureStandardDev)
tempratureMedian <- aggregate(value~variable, q4, median)
# print(tempratureMedian)
yearlyStatistics <- data.frame(YEAR = tempratureMean$variable, Median = tempratureMedian$value, MEAN = tempratureMedian$value, SD = tempratureStandardDev$value)
# print(yearlyStatistics)
# plot(x = 1996:2015, tempratureMean$value,col="blue", main = "Average temprature of the first 62 days")
# plot(x = 1996:2015, tempratureMedian$value,col="red", main = "Median temprature of the first 62 days")
# install.packages("qcc")
library(qcc)
cusum_matrix <- matrix(0, nrow=ncol(tempData) - 1, ncol=3)
# print(cusum_matrix)
for (i in 1:(ncol(tempData)-1))
{CUSUM_MODEL <- cusum(tempData[,i+1], 
 center = mean(tempratureMean$value), 
 std.dev = mean(tempratureStandardDev$value), 
 decision.interval= 3 * mean(tempratureStandardDev$value),
 se.shift = 0.5 * mean(tempratureStandardDev$value), plot = T, add.stats = T)
   # Index for lower violations
  # This is when temperature starts to cool off
  v.index <- CUSUM_MODEL$violations$lower
  model.cusum.violations[i,] <- c(YEAR = colnames(tempData)[i+1],
                                  Start = tempData[min(v.index),1],
                                  MedianS = tempData[median(v.index),1])
}
print(model.cusum.violations[,1:2])
plot(as.Date(model.cusum.violations[,2],"%d-%B"), x = 1996:2015,
     main = "First day when weather starts cooling off",
     xlab = "Years",
     ylab = "Dates")
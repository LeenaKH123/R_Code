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
cusum_matrix_vio <- matrix(0, nrow=ncol(tempData) - 1, ncol=3)
for (i in 1:(ncol(tempData)-1)){   
  cusum_model <- cusum(tempData[,i+1], 
                            center = mean(tempratureMean$value),
                            std.dev = mean(tempratureStandardDev$value),
                            decision.interval= 4 * mean(tempratureStandardDev$value), 
                            se.shift = 0.4 * mean(tempratureStandardDev$value) ,
                            plot = T,
                            add.stats = T)
  lower_index <- cusum_model$violations$lower
  cusum_matrix_vio[i,] <- c(YEAR = colnames(tempData)[i+1],
                                  Start = tempData[min(lower_index),1],
                                  MedianS = tempData[median(lower_index),1])
}
print(cusum_matrix_vio[,1:2])
plot(as.Date(cusum_matrix_vio[,2],"%d-%B"), x = 1996:2015,
     main = "First day when weather starts cooling",
     xlab = "Years",
     ylab = "Dates")
plot(tempData[,11], x = as.Date(tempData[,1],"%d-%B" ),
     main = "weather starts cooling off",
     xlab = "Date",
     ylab = "Temp")
abline(v=as.Date("23-Sep","%d-%B"), col="red")
average_mean <- mean(tempratureMean$value)
standardDev_mean <- sd(tempratureMean$value)
plot(tempratureMean$value, x = 1996:2015,type="l")
cusum_matrix_vio <- matrix(0, nrow=ncol(tempratureMean) - 1, ncol=3)
cusum_model2 <- cusum(tempratureMean$value,
                     center = average_mean,
                     std.dev = standardDev_mean,
                     decision.interval= 0.75, 
                     se.shift = 0.25, 
                     plot = TRUE)

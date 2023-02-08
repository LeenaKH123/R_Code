tempData <- read.table("/home/lilo/rcode/temp/temprature.txt", header= TRUE, stringsAsFactors = F)
timeseries<-ts(as.vector(unlist(tempData[,2:21])),start=1996,frequency=123)
print(timeseries)
plot(timeseries)
components_dfts <- decompose(timeseries)
library("ggplot2") 
# plot(components_dfts)
set.seed(1)
HW1 <- HoltWinters(timeseries,seasonal="additive")
print(HW1)

set.seed(1)
HW2 <- HoltWinters(timeseries, alpha=0.2, beta=0.1, gamma=0.1)

plot(timeseries, ylab="Temprature", col="black")
lines(HW1$fitted[,1], lty=2, col="#00ffaa")

plot(timeseries, ylab="Temprature", col="black")
lines(HW2$fitted[,1], lty=2, col="red")

set.seed(1)
HW3 <- HoltWinters(timeseries,seasonal="multiplicative")
print(HW3)
plot(timeseries, ylab="Temprature", col="black")
lines(HW3$fitted[,1], lty=2, col="#00ffaa")

par(mfrow=c(1,2))
plot(fitted(HW1))
plot(fitted(HW3))





# head(tempData)
# summary(tempData)
# install.packages("reshape")
# library(reshape)
# q3 <- melt(tempData[], id='DAY')
# df <- data.frame(q3)
# write.csv(df, "/home/lilo/rcode/temp/reshaped.csv")
# print(q3)
# boxplot(data=q3, value~variable)
# timeseries <- ts(q3, start=1996, frequency = 2460)
# print(timeseries)
# plot(timeseries)



# diff approach
# q3 <- as.vector(unlist(tempData[2:21]))
# # print(q3)
# timeseries <- ts(tempData, start=1996, frequency = 123)
# # print(timeseries)
# plot(timeseries)

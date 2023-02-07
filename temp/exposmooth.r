tempData <- read.table("/home/lilo/rcode/temp/temprature.txt", header= TRUE, stringsAsFactors = F)
timeseries<-ts(as.vector(unlist(tempData[,2:21])),start=1996,frequency=123)
plot(timeseries)
components_dfts <- decompose(timeseries)
library("ggplot2") 
# plot(components_dfts)
HW1 <- HoltWinters(timeseries)
print(HW1)
HW2 <- HoltWinters(timeseries, alpha=0.6610618, beta=0, gamma=0.6248076)
plt.plot(timeseries, ylab="Temprature", xlim=c(1996,2018))+
lines(HW1$fitted[,1], lty=2, col="blue")+
lines(HW2$fitted[,1], lty=2, col="red")

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

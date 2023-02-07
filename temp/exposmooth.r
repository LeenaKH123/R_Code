tempData <- read.table("/home/lilo/rcode/temp/temprature.txt", header= TRUE, stringsAsFactors = F)
head(tempData)
summary(tempData)
# install.packages("reshape")
library(reshape)
q3 <- melt(tempData[], id='DAY')
df <- data.frame(q3)
write.csv(df, "/home/lilo/rcode/temp/reshaped.csv")
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

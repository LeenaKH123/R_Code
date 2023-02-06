tempData <- read.table("/home/lilo/rcode/uscrime/temprature.txt", header= TRUE, stringsAsFactors = F)
head(tempData)
summary(tempData)
# install.packages("reshape")
library(reshape)
q3 <- as.vector(unlist(tempData[2:21]))
# print(q3)
timeseries <- ts(q3, start=1996, frequency = 123)
# print(timeseries)

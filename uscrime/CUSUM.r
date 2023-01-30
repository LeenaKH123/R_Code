tempData <- read.table("/home/lilo/rcode/uscrime/temprature.txt", header= TRUE, stringsAsFactors = F)
head(tempData)
summary(tempData)
# install.packages("reshape")
library(reshape)
# use the melt function to transform a wide format into a long format
q3 <- melt(tempData[], id='DAY')
print(q3)
boxplot(data=q3, value~variable)

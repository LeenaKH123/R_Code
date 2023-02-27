tempData <- read.table("/home/lilo/rcode/temp/temprature.txt", header= TRUE, stringsAsFactors = F)
timeseries<-ts(as.vector(unlist(tempData[,2:21])),start=1996,frequency=123)
print(timeseries)
# plot(timeseries)
components <- decompose(timeseries)
plot(components)

set.seed(1)
# first fit
HW1 <- HoltWinters(timeseries,seasonal="additive")
print(HW1)
# second fit, playing with alpha, beta, gamma values
set.seed(1)
HW2 <- HoltWinters(timeseries, alpha=0.2, beta=0.1, gamma=0.1)

# plot(timeseries, ylab="Temprature", col="black")
# lines(HW1$fitted[,1], lty=2, col="#00ffaa")

# plot(timeseries, ylab="Temprature", col="black")
# lines(HW2$fitted[,1], lty=2, col="red")

set.seed(1)
HW3 <- HoltWinters(timeseries,seasonal="multiplicative")
print(HW3)
# plot(timeseries, ylab="Temprature", col="black")
# lines(HW3$fitted[,1], lty=2, col="#00ffaa")

# par(mfrow=c(1,2))
# plot(fitted(HW1))
# plot(fitted(HW3))

HW1$fitted[1:10,]

# predictions
HW1.pred <- predict(HW1, 1440, prediction.interval = TRUE, level=0.95)
#Visually evaluate the prediction
# plot(timeseries, ylab="Temprature")
# lines(HW1.pred[,1], col="red")
# lines(HW1.pred[,2], lty=2, col="orange")
# lines(HW1.pred[,3], lty=2, col="orange")

# predict with multiplicative seasonality
HW3.pred <- predict(HW3, 1440, prediction.interval = TRUE, level=0.95)
#Visually evaluate the prediction
# plot(timeseries, ylab="Temprature")
# lines(HW3.pred[,1], col="red")
# lines(HW3.pred[,2], lty=2, col="orange")
# lines(HW3.pred[,3], lty=2, col="orange")

# forecast
# install.packages('forecast', dependencies = TRUE)
library(forecast)
HW1_for <- forecast(HW1, h=1440, level=c(80,95))
#visualize our predictions:
# plot(HW1_for)
# lines(HW1_for$fitted, lty=2, col="purple")

# forecast evaluation
acf(HW1_for$residuals, lag.max=20, na.action=na.pass)
Box.test(HW1_for$residuals, lag=20, type="Ljung-Box")
hist(HW1_for$residuals)

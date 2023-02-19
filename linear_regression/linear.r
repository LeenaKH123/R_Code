test<-data.frame(M = 14.0,So = 0,Ed = 10.0, Po1 = 12.0,Po2 = 15.5,
                 LF = 0.640, M.F = 94.0,Pop = 150,NW = 1.1,U1 = 0.120,
                 U2 = 3.6, Wealth = 3200,Ineq = 20.1,Prob = 0.04, Time = 39.0)
options(warn=-1)
library(ggplot2)
# install.packages("tidyverse")
library(tidyverse)
library(caret)
crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F) 
head(crimeDate)
# crime_model <- lm(Crime ~ ., data = crimeData)
set.seed(1000)
# as simple linear model
model_1<-lm(Crime~.,data=crimeDate)
summary(model_1)
predict(model_1,test)
range(crimeDate$Crime)
data.frame(summary(model_1)$coef[summary(model_1)$coef[,4] <= .05, 4])
set.seed(1000)
model_2<-lm(Crime~M+Ed+Ineq+Prob,data=crimeDate,x=TRUE,y=TRUE)
summary(model_2)
predict(model_2,test)
# below diagram is a diagnostic for linear regression
qqnorm(crimeDate$Crime)
# cross validation function
# install.packages("DAAG")
library(DAAG)
# perform 4 fold CV with the linear model that was created earlier
set.seed(40)
ls_uscrime_cv <- cv.lm(crimeDate, model_2, m=4)
attributes(ls_uscrime_cv)

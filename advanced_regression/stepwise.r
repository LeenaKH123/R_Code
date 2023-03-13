rm(list = ls())
uscrime <- read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F)
# perform backward elimination, can use the trace argument to suppress the output
model_back <- lm(Crime~., data = uscrime)
step(model_back, direction = "backward")
step(model_back, direction = "backward", trace = 0)
#perform forward selection
model_forward <- lm(Crime~., data =uscrime)
step(model_forward, scope = formula(lm(Crime~.,data = uscrime)), direction = "forward")
#perform stepwise regression
model_both <- lm(Crime~., data = uscrime)
step(model_both, scope = list(lower = formula(lm(Crime~1, data = uscrime)), upper = formula(lm(Crime~.,data = uscrime))), direction = "both")
#notice that the output gives you the coefficients of the final model that it selected, but no p values. At this point, you can still alter your model
# if you wish. Think about how you want to report the quality of your model after variable selection has been performed.
# perform LASSO. The cv.glmnet() function does use some randomization in how it makes the folds for cv, so it is important to set
# the seed for reproducible results. Note that cv.glmnet() automatically generates a sequence of lamdas.
# install.packages("glmnet")
library(glmnet)
set.seed(42)
model_lasso <- cv.glmnet(x=as.matrix(uscrime[,-16]), y=as.matrix(uscrime[,16]), alpha=1, nfolds = 8, nlambda = 20, type.measure = "mse", family="gaussian", standardize=TRUE)
# you can either scale the data before applying LASSO or elastic net and set standardize=FALSE, or let the function do the scaling for you.
# print out the output
print(model_lasso)
plot(model_lasso)
model_lasso$lambda.min
cbind(model_lasso$lambda, model_lasso$cvm, model_lasso$nzero)
coef(model_lasso, s=model_lasso$lambda.min)

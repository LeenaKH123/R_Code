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


rm(list = ls())
uscrime -< read.table()
# perform backward elimination, can use the trace argument to suppress the output
model_back <- lm(Crime~., data = uscrime)
step(model_back, direction = "backward")
step(model_back, direction = "backward", trace = 0)

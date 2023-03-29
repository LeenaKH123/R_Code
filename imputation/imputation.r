rm(list = ls())
ImputationData <- read.table('/home/lilo/rcode/imputation/imputationData.txt', stringsAsFactors = FALSE, header = FALSE, sep = ",")
head(ImputationData)
summary(ImputationData)
# find the missing data
impute_me <- which(ImputationData$V7 == "?")
impute_me

# how much of our data is missing
length(impute_me)/nrow(ImputationData)
# since we want to evenually use this data to classify v11, it is important to check out if the missing data is biased in some way
bcw_clean <- ImputationData[-impute_me,]
bcw_clean
bcw_missing <- ImputationData[impute_me, ]
bcw_missing
table(ImputationData$V11)
table(bcw_clean$V11)
table(bcw_missing$V11)
# mean/mode imputation
# install.packages('mice')
library('mice')
set.seed(101)
mean_impute <- mice(ImputationData, m = 5, meth = 'mean')
#check the values
mean_impute$imp
# imputation using regression 
regression_impute <- mice(ImputationData, m = 5, meth = 'norm.predict')
# check the values
regression_impute$imp
# imputation using perturbation impute
pert_impute <- mice(ImputationData, m = 5, meth = 'norm.nob')
# check the values
pert_impute$imp
# mean impute
mean_bcw <- complete(mean_impute)
mean_bcw
# regression prediction impute
regression_bcw <- complete(regression_impute)
regression_bcw
# pertubation impute
pert_bcw <- complete(pert_impute)
pert_bcw

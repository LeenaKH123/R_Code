# install.packages('outliers')
library(outliers)
crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F) 
# head(crimeDate)
# hist(crimeDate$Crime, breaks = 20)
# which.max(crimeDate$Crime)
# which.min(crimeDate$Crime)
# summary(crimeDate$Crime)
# grubbs.test(crimeDate$Crime, type = 10, opposite = FALSE, two.sided = FALSE)
# grubbs.test(crimeDate$Crime, type = 11, opposite = FALSE, two.sided = FALSE)
grubbs.result <- grubbs.test(crimeDate$Crime)
pvalue <- grubbs.result$p.value
grubbs.result
plot(crimeDate$Crime)

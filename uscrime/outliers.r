crimeDate = read.table("/home/lilo/rcode/uscrime/uscrime.txt", header= TRUE, stringsAsFactors = F) 
head(crimeDate)
grubbs.test(crimeDate[,16], type = 11, opposite = FALSE, two.sided = FALSE )

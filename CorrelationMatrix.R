#Correlation matrix : An R function to do all you need
#Correlation matrix analysis is very useful to study dependences or associations between variables.
install.packages("corrplot")
source("http://www.sthda.com/upload/rquery_cormat.r")
mydata <- mtcars[, c(1,3,4,5,6,7)]
head(mydata)

##Computing the correlation matrix
rquery.cormat(mydata)



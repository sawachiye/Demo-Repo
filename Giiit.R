### Multilinear regression
library(tidyverse)
library(ggplot2)

#view first six lines of mtcars
head(mtcars)
#create new data frame that contains only the variables we would like to use to
data <- mtcars[ , c("mpg", "disp", "hp", "drat")]

#view first six rows of new data frame
head(data)
#Examining the Data
#Before we fit the model, we can examine the data to gain a 
#better understanding of it and also visually assess whether or 
#not multiple linear regression could be a good model to fit to this data.
#To do so, we can use the pairs() function to create a scatterplot 
#of every possible pair of variables:
  
  pairs(data, pch = 18, col = "steelblue")
  
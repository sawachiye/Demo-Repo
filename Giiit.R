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
#From this pairs plot we can see the following:
#mpg and disp appear to have a strong negative linear correlation
#mpg and hp appear to have a strong positive linear correlation
#mpg and drat appear to have a modest negative linear correlation
  
# We we could also use the ggpairs() function from the GGally library 
#install and load the GGally library
install.packages("GGally")
library(GGally)

#generate the pairs plot
ggpairs(data)

#Fitting the Model
#The basic syntax to fit a multiple linear regression model in R is as follows:
#lm(response_variable ~ predictor_variable1 + predictor_variable2 + ..., data = data)  
model <- lm(mpg ~ disp + hp + drat, data = data)
summary(model)

#Checking Assumptions of the Model
#1. The distribution of model residuals should be approximately normal.
#We can check if this assumption is met by creating a simple histogram of residuals:
hist(residuals(model), col = "steelblue")
#Although the distribution is slightly right skewed,
#it isn’t abnormal enough to cause any major concerns.
#2. The variance of the residuals should be consistent for all observations.
#This preferred condition is known as homoskedasticity. 
#Violation of this assumption is known as heteroskedasticity.
#To check if this assumption is met we can create a fitted value vs. residual plot:
#create fitted value vs residual plot
plot(fitted(model), residuals(model))

#add horizontal line at 0
abline(h = 0, lty = 2)

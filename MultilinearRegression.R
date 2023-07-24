####  Multiple Linear Regression in R
library(GGally)

#This guide walks through an example of how to conduct multiple linear regression in R, including:
  #Examining the data before fitting the model
  #Fitting the model
  #Checking the assumptions of the model
  #Interpreting the output of the model
  #Assessing the goodness of fit of the model
  #Using the model to make predictions

#view first six lines of mtcars
head(mtcars)

#In this example we will build a multiple linear regression model that uses mpg as the response variable and disp, hp, and drat as the predictor variables.

#create new data frame that contains only the variables we would like to use to
data <- mtcars[ , c("mpg", "disp", "hp", "drat")]

#view first six rows of new data frame
head(data)

#Examining the Data
#examine the data to gain a better understanding of it and also visually assess whether or not multiple linear regression could be a good model to fit to this data.
#In particular, check if the predictor variables have a linear association with the response variable, 
#which would indicate that a multiple linear regression model may be suitable.

#To do so, we can use the pairs() function to create a scatterplot of every possible pair of variables:
  
pairs(data, pch = 18, col = "steelblue")

#Note that we could also use the ggpairs() function from the GGally library to create a similar plot that contains the actual linear correlation coefficients for each pair of variables:
  
#install and load the GGally library
#install.packages("GGally")
#library(GGally)

#generate the pairs plot
ggpairs(data)

#Fitting the Model
#The basic syntax to fit a multiple linear regression model in R is as follows:
#lm(response_variable ~ predictor_variable1 + predictor_variable2 + ..., data = data)

#Using our data, we can fit the model using the following code:

model <- lm(mpg ~ disp + hp + drat, data = data)

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
#Ideally we would like the residuals to be equally scattered at every fitted value.

#Interpreting the Output of the Model
#Once we’ve verified that the model assumptions are sufficiently met, we can look at the output of the model using the summary() function:
summary(model)

#define the coefficients from the model output
intercept <- coef(summary(model))["(Intercept)", "Estimate"]
disp <- coef(summary(model))["disp", "Estimate"]
hp <- coef(summary(model))["hp", "Estimate"]
drat <- coef(summary(model))["drat", "Estimate"]

#use the model coefficients to predict the value for mpg
intercept + disp*220 + hp*150 + drat*3

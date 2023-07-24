# Linear regressions

##Simple linear regression is a statistical method you can use to understand the relationship between two variables, x and y.
#One variable, x, is known as the predictor variable.
#The other variable, y, is known as the response variable.
#Using linear regression, we can find the line that best “fits” the data
#This line is known as the least squares regression line and it can be used to help us understand the relationships between weight and height.
# ŷ = b0 + b1x
#where:
  #ŷ: The estimated response value
  #b0: The intercept of the regression line
# b1: The slope of the regression line

#create dataset
df <- data.frame(hours=c(1, 2, 4, 5, 5, 6, 6, 7, 8, 10, 11, 11, 12, 12, 14),
                 score=c(64, 66, 76, 73, 74, 81, 83, 82, 80, 88, 84, 82, 91, 93, 89))

#view first six rows of dataset
head(df)

#attach dataset to make it more convenient to work with
attach(df)
#visualise
scatter.smooth(hours, score, main='Hours studied vs. Exam Score')
#create a boxplot to visualize the distribution of exam scores and check for outliers.

#If an observation is an outlier, a tiny circle will appear in the boxplot:
boxplot(score)
#There are no tiny circles in the boxplot, which means there are no outliers in our dataset.

#fit simple linear regression model
model <- lm(score~hours)

#view model summary
summary(model)

#Create Residual Plots

#One of the key assumptions of linear regression is that the residuals of a regression model 
#are roughly normally distributed and are homoscedastic at each level of the explanatory variable. 
#If these assumptions are violated, then the results of our regression model could be misleading or unreliable.
#To verify that these assumptions are met, we can create the following residual plots:
#Residual vs. fitted values plot: This plot is useful for confirming homoscedasticity.

#define residuals
res <- resid(model)

#produce residual vs. fitted plot
plot(fitted(model), res)

#add a horizontal line at 0 
abline(0,0)
#The residuals appear to be randomly scatted around zero and don’t exhibit any noticeable patterns, 
#so this assumption is met.

#Q-Q plot: This plot is useful for determining if the residuals follow a normal distribution
# If the data values in the plot fall along a roughly straight line at a 45-degree angle, then the data is normally distributed:

#create Q-Q plot for residuals
qqnorm(res)

#add a straight diagonal line to the plot
qqline(res) 
#The residuals stray from the 45-degree line a bit, but not enough to cause serious concern. 
#We can assume that the normality assumption is met.
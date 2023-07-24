###Stepwise Regression
#Procedure used to build a regression model from a set of predictor variables by entering and removing predictors in a stepwise manner into the model until there is no statistically valid reason to enter or remove any more.
#The goal of stepwise regression is to build a regression model that includes all of the predictor variables that are statistically significantly related to the response variable.
#stepwise regression procedures in R:
#Forward Stepwise Selection
#Backward Stepwise Selection
#Both-Direction Stepwise Selection

#For each example we’ll use the built-in mtcars dataset:

#view first six rows of mtcars
head(mtcars)

#We will fit a multiple linear regression model using mpg (miles per gallon) as our response variable
#and all of the other 10 variables in the dataset as potential predictors variables.

#For each example will use the built-in step() function from the stats package to perform stepwise selection, which uses the following syntax:
  
 # step(intercept-only model, direction, scope)

#where:
#intercept-only model: the formula for the intercept-only model
#direction: the mode of stepwise search, can be either “both”, “backward”, or “forward”
#scope: a formula that specifies which predictors we’d like to attempt to enter into the model

### Forward Stepwise Selection

#define intercept-only model
intercept_only <- lm(mpg ~ 1, data=mtcars)
summary(intercept_only)

#define model with all predictors
all <- lm(mpg ~ ., data=mtcars)

#perform forward stepwise regression
forward <- step(intercept_only, direction='forward', scope=formula(all), trace=0)
##Note: The argument trace=0 tells R not to display the full results of the stepwise selection. This can take up quite a bit of space if there are a large number of predictor variables.

#view results of forward stepwise regression
forward$anova

#view final model
forward$coefficients


#Here is how to interpret the results:
  
#First, we fit the intercept-only model. This model had an AIC of 115.94345.
#Next, we fit every possible one-predictor model. The model that produced the lowest AIC and also had a statistically significant reduction in AIC compared to the intercept-only model used the predictor wt. This model had an AIC of 73.21736.
#Next, we fit every possible two-predictor model. The model that produced the lowest AIC and also had a statistically significant reduction in AIC compared to the single-predictor model added the predictor cyl. This model had an AIC of 63.19800.
#Next, we fit every possible three-predictor model. The model that produced the lowest AIC and also had a statistically significant reduction in AIC compared to the two-predictor model added the predictor hp. This model had an AIC of 62.66456.
#Next, we fit every possible four-predictor model. It turned out that none of these models produced a significant reduction in AIC, thus we stopped the procedure.

#The final model turns out to be:
  #mpg ~ 38.75 – 3.17*wt – 0.94*cyl – 0.02*hyp

#####  Backward Stepwise Selection

#define intercept-only model
intercept_only <- lm(mpg ~ 1, data=mtcars)

#define model with all predictors
all <- lm(mpg ~ ., data=mtcars)

#perform backward stepwise regression
backward <- step(all, direction='backward', scope=formula(all), trace=0)

#view results of backward stepwise regression
backward$anova

#view final model
backward$coefficients


##### Both-Direction Stepwise Selection
 
#define intercept-only model
intercept_only <- lm(mpg ~ 1, data=mtcars)

#define model with all predictors
all <- lm(mpg ~ ., data=mtcars)

#perform backward stepwise regression
both <- step(intercept_only, direction='both', scope=formula(all), trace=0)

#view results of backward stepwise regression
both$anova

#view final model
both$coefficients

#Here is how to interpret the results:

#First, we fit the intercept-only model.
#Next, we added predictors to the model sequentially just like we did in forward-stepwise selection. However, after adding each predictor we also removed any predictors that no longer provided an improvement in model fit.
#We repeated this process until we reached a final model.
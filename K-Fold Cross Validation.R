###  K-Fold Cross Validation in R (Step-by-Step)
#To evaluate the performance of a model on a dataset, we need to measure how well the predictions made by the model match the observed data.
#One commonly used method for doing this is known as k-fold cross-validation, which uses the following approach:
  
 #1. Randomly divide a dataset into k groups, or “folds”, of roughly equal size.
 #2. Choose one of the folds to be the holdout set. Fit the model on the remaining k-1 folds. Calculate the test MSE on the observations in the fold that was held out.
 #3. Repeat this process k times, using a different set each time as the holdout set.
 #4. Calculate the overall test MSE to be the average of the k test MSE’s.

#The easiest way to perform k-fold cross-validation in R is by using the trainControl() function from the caret library in R.
#This tutorial provides a quick example of how to use this function to perform k-fold cross-validation for a given model in R.

#create data frame
df <- data.frame(y=c(6, 8, 12, 14, 14, 15, 17, 22, 24, 23),
                 x1=c(2, 5, 4, 3, 4, 6, 7, 5, 8, 9),
                 x2=c(14, 12, 12, 13, 7, 8, 7, 4, 6, 5))

#view data frame
df

library(caret)

#specify the cross-validation method
ctrl <- trainControl(method = "cv", number = 5)

#fit a regression model and use k-fold CV to evaluate performance
model <- train(y ~ x1 + x2, data = df, method = "lm", trControl = ctrl)

#view summary of k-fold CV               
print(model)

#Here is how to interpret the output:
  
#No pre-processing occured. That is, we didn’t scale the data in any way before fitting the models.
#The resampling method we used to evaluate the model was cross-validation with 5 folds.
#The sample size for each training set was 8.

#RMSE: The root mean squared error. This measures the average difference between the predictions made by the model and the actual observations. The lower the RMSE, the more closely a model can predict the actual observations.
#Rsquared: This is a measure of the correlation between the predictions made by the model and the actual observations. The higher the R-squared, the more closely a model can predict the actual observations.
#MAE: The mean absolute error. This is the average absolute difference between the predictions made by the model and the actual observations. The lower the MAE, the more closely a model can predict the actual observations.

#Each of the three metrics provided in the output (RMSE, R-squared, and MAE) give us an idea of how well the model performed on previously unseen data.
#In practice we typically fit several different models and compare the three metrics provided by the output seen here to decide which model produces the lowest test error rates and is therefore the best model to use.

#We can use the following code to examine the final model fit:
  
  #view final model
  model$finalModel

#We can use the following code to view the model predictions made for each fold:
  
  #view predictions for each fold
  model$resample
 
#Note that in this example we chose to use k=5 folds, 
  #but you can choose however many folds you’d like. 
  #In practice, we typically choose between 5 and 10 folds because this turns out to be the optimal number of folds that produce reliable test error rates.  
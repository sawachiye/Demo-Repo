###  K-Fold Cross Validation in R (Step-by-Step)
#loading required packages

# package to perform data manipulation
# and visualization
library(tidyverse)

# package to compute
# cross - validation methods
library(caret)

# loading package to
# import desired dataset
install.packages("ISLR")
library(ISLR)
#To evaluate the performance of a model on a dataset, we need to measure how well the predictions made by the model match the observed data.
#One commonly used method for doing this is known as k-fold cross-validation, which uses the following approach:
  
 #1. Randomly divide a dataset into k groups, or “folds”, of roughly equal size.
 #2. Choose one of the folds to be the holdout set. 
    #Fit the model on the remaining k-1 folds. 
   #Calculate the test MSE on the observations in the fold that was held out.
 #3. Repeat this process k times, using a different set each time as the holdout set.
 #4. Calculate the overall test MSE to be the average of the k test MSE’s.

#The easiest way to perform k-fold cross-validation in R is by using the trainControl() function from the caret library in R.
#Example
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
 0
#Note that in this example we chose to use k=5 folds, 
  #but you can choose however many folds you’d like. 
  #In practice, we typically choose between 5 and 10 folds because this turns out to be the optimal number of folds that produce reliable test error rates.  
 
 
 ##### ANOTHER EXAMPLE
 # assigning the complete dataset
 # Smarket to a variable
 dataset <- Smarket[complete.cases(Smarket), ]
 
 # display the dataset with details
 # like column name and its data type
 # along with values in each row
 glimpse(dataset)
 
 # checking values present
 # in the Direction column
 # of the dataset
 table(dataset$Direction)
 
 #Building the model with K-fold algorithm
 #In this step, the trainControl() function is defined to set the value of the K parameter and then the model is developed as per the steps involved in the K-fold technique. 
 #Below is the implementation. 
 
 
 # setting seed to generate a 
 # reproducible random sampling
 set.seed(123)
 
 # define training control which
 # generates parameters that further
 # control how models are created
 train_control <- trainControl(method = "cv",
                               number = 10)
 
 
 # building the model and
 # predicting the target variable
 # as per the Naive Bayes classifier
 model <- train(Direction~., data = dataset,
                trControl = train_control,
                method = "nb")
 
####   Evaluating the accuracy of the model
 #After training and validation of the model, it is time to calculate the overall accuracy of the model. 
 #Below is the code to generate a summary of the model. 
 
 # summarize results of the
 # model after calculating
 # prediction error in each case
 print(model) 

 
 ### Implement the K-fold Technique on Regression
 
 #Step 1: Importing all required packages
  # loading required packages
 
 # package to perform data manipulation
 # and visualization
 library(tidyverse)
 
 # package to compute
 # cross - validation methods
 library(caret)
 
 # installing package to
 # import desired dataset
 install.packages("datarium")
 
 #Step 2: Loading and inspecting the dataset
 #In this step, the desired dataset is loaded in the R environment. 
 #After that, some rows of the data set are printed in order to understand its structure.
 #Below is the code to carry out this task.
 
 # loading the dataset
 data("marketing", package = "datarium")
 
 # inspecting the dataset
 head(marketing)

 #Step 3: Building the model with K-fold algorithm
 #The value of the K parameter is defined in the trainControl() function and
 #the model is developed according to the steps mentioned in the algorithm of the K-fold cross-validation technique. 
 #Below is the implementation. 
 
 # setting seed to generate a 
 # reproducible random sampling
 set.seed(125) 
 
 # defining training control
 # as cross-validation and 
 # value of K equal to 10
 train_control <- trainControl(method = "cv",
                               number = 10)
 
 # training the model by assigning sales column
 # as target variable and rest other column
 # as independent variable
 model <- train(sales ~., data = marketing, 
                method = "lm",
                trControl = train_control)
 
 #Step 4: Evaluate the model performance
 #As mentioned in the algorithm of K-fold that model is tested against every unique fold(or subset) of the dataset and in each case, 
 #the prediction error is calculated and at last, the mean of all prediction errors is treated as the final performance score of the model. 
 #So, below is the code to print the final score and overall summary of the model. 
 
 # printing model performance metrics
 # along with other details
 print(model) 
 
 
 ####  Advantages of K-fold Cross-Validation
 #Fast computation speed.
 #A very effective method to estimate the prediction error and the accuracy of a model.
 
 ### Disadvantages of K-fold Cross-Validation
 #A lower value of K leads to a biased model and a higher value of K can lead to variability in the performance metrics of the model.
 #Thus, it is very important to use the correct value of K for the model (generally K = 5 and K = 10 is desirable).
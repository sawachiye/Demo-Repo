#Cross-Validation in R programming
#The major challenge in designing a machine learning model is to make it work accurately on the unseen data. 
#To know whether the designed model is working fine or not, we have to test it against those data points which were not present during the training of the model.
#These data points will serve the purpose of unseen data for the model, and it becomes easy to evaluate the model’s accuracy. 
#In this, a portion of the data set is reserved which will not be used in training the model. 
#Once the model is ready, that reserved data set is used for testing purposes.
#Values of the dependent variable are predicted during the testing phase and the model accuracy is calculated on the basis of prediction error i.e., 
#the difference in actual values and predicted values of the dependent variable. 
#There are several statistical metrics that are used for evaluating the accuracy of regression models:
#Root Mean Squared Error (RMSE): As the name suggests it is the square root of the averaged squared difference between the actual value and the predicted value of the target variable. It gives the average prediction error made by the model, thus decrease the RMSE value to increase the accuracy of the model.
#Mean Absolute Error (MAE): This metric gives the absolute difference between the actual values and the values predicted by the model for the target variable. If the value of the outliers does not have much to do with the accuracy of the model, then MAE can be used to evaluate the performance of the model. Its value must be less in order to make better models.
#R2 Error: The value of the R-squared metric gives an idea about how much percentage of variance in the dependent variable is explained collectively by the independent variables. In other words, it reflects the relationship strength between the target variable and the model on a scale of 0 – 100%. So, a better model should have a high value of R-squared.
#Some of the most popular cross-validation techniques are

#Validation Set Approach
#Leave one out cross-validation(LOOCV)
#K-fold cross-Validation
#Repeated K-fold cross-validation

# loading required packages

# package to perform data manipulation
# and visualization
library(tidyverse)

# package to compute
# cross - validation methods
library(caret)

# installing package to
# import desired dataset
#install.packages("datarium")

# loading the dataset
data("marketing", package = "datarium")

# inspecting the dataset
head(marketing)


####    Validation Set Approach(or data split)

#In this method, the dataset is divided randomly into training and testing sets. Following steps are performed to implement this technique:
  
#A random sampling of the dataset
#Model is trained on the training data set
#The resultant model is applied to the testing data set
#Calculate prediction error by using model performance metrics

#Below is the implementation of this method:
# R program to implement
# validation set approach

# setting seed to generate a
# reproducible random sampling
set.seed(123)

# creating training data as 80% of the dataset
random_sample <- createDataPartition(marketing $ sales,
                                     p = 0.8, list = FALSE)

# generating training dataset
# from the random_sample
training_dataset <- marketing[random_sample, ]

# generating testing dataset
# from rows which are not
# included in random_sample
testing_dataset <- marketing[-random_sample, ]

# Building the model

# training the model by assigning sales column
# as target variable and rest other columns
# as independent variables
model <- lm(sales ~., data = training_dataset)
summary(model)

# predicting the target variable
predictions <- predict(model, testing_dataset)

# computing model performance metrics
data.frame( R2 = R2(predictions, testing_dataset $ sales),
            RMSE = RMSE(predictions, testing_dataset $ sales),
            MAE = MAE(predictions, testing_dataset $ sales))
#Advantages:
#One of the most basic and simple techniques for evaluating a model.
#No complex steps for implementation.

#Disadvantages:
#Predictions done by the model is highly dependent upon the subset of observations used for training and validation.
#Using only one subset of the data for training purposes can make the model biased.



####  Leave One Out Cross-Validation(LOOCV)

#This method also splits the dataset into 2 parts but it overcomes the drawbacks of the Validation set approach. 
#LOOCV carry out the cross-validation in the following way:
  
#Train the model on N-1 data points
#Testing the model against that one data points which was left in the previous step
#Calculate prediction error
#Repeat above 3 steps until the model is not trained and tested on all data points
#Generate overall prediction error by taking the average of prediction errors in every case

# R program to implement
# Leave one out cross validation

# defining training control
# as Leave One Out Cross Validation
train_control <- trainControl(method = "LOOCV")

# training the model by assigning sales column
# as target variable and rest other column
# as independent variable
model <- train(sales ~., data = marketing,
               method = "lm",
               trControl = train_control)

# printing model performance metrics
# along with other details
print(model)

#Advantages:
# Less bias model as almost every data point is used for training.
#No randomness in the value of performance metrics because LOOCV runs multiple times on the dataset

#Disadvantages:
#Training the model N times leads to expensive computation time if the dataset is large.
#### How to Build Random Forests in R

#When the relationship between a set of predictor variables and a response variable is highly complex, 
#we often use non-linear methods to model the relationship between them.
#One such method is building a decision tree. 
#However, the downside of using a single decision tree is that it tends to suffer from high variance.
#That is, if we split the dataset into two halves and apply the decision tree to both halves, 
#the results could be quite different.

#One method that we can use to reduce the variance of a single decision tree is to build a random forest model, 
#which works as follows:
  
#1. Take b bootstrapped samples from the original dataset.

#2. Build a decision tree for each bootstrapped sample.
#When building the tree, each time a split is considered, 
#only a random sample of m predictors is considered as split candidates from the full set of p predictors. 
#Typically we choose m to be equal to √p.

#3. Average the predictions of each tree to come up with a final model.

#It turns out that random forests tend to produce much more accurate models compared to single decision trees and even bagged models.

#### Step 1: Load the Necessary Packages ####
#First, we’ll load the necessary packages for this example. 
#For this bare bones example, we only need one package:
  
library(randomForest) 

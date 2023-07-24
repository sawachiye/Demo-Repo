# Polynomial Regression in R (Step-by-Step)
#Polynomial regression is a technique we can use when the relationship between a predictor variable and a response variable is nonlinear. 

#This type of regression takes the form:
  
 # Y = β0 + β1X + β2X2 + … + βhXh + ε

#where h is  the “degree” of the polynomial.
#make this example reproducible
set.seed(1)

#create dataset
df <- data.frame(hours = runif(50, 5, 15), score=50)
df$score = df$score + df$hours^3/150 + df$hours*runif(50, 1, 2)

#view first six rows of data
head(data)

#Visualize the Data
library(ggplot2)

ggplot(df, aes(x=hours, y=score)) +
  geom_point()

#data exhibits a bit of a quadratic relationship, 
#which indicates that polynomial regression could fit the data better than simple linear regression.

#Fit the Polynomial Regression Models
#Next, we’ll fit five different polynomial regression models with degrees h = 1…5 
#and use k-fold cross-validation with k=10 folds to calculate the test MSE for each model:

#randomly shuffle data
df.shuffled <- df[sample(nrow(df)),]
head(df.shuffled)
#define number of folds to use for k-fold cross-validation
K <- 10 

#define degree of polynomials to fit
degree <- 5

#create k equal-sized folds
folds <- cut(seq(1,nrow(df.shuffled)),breaks=K,labels=FALSE)

#create object to hold MSE's of models
mse = matrix(data=NA,nrow=K,ncol=degree)

#Perform K-fold cross validation
for(i in 1:K){
  
  #define training and testing data
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- df.shuffled[testIndexes, ]
  trainData <- df.shuffled[-testIndexes, ]
  
  #use k-fold cv to evaluate models
  for (j in 1:degree){
    fit.train = lm(score ~ poly(hours,j), data=trainData)
    fit.test = predict(fit.train, newdata=testData)
    mse[i,j] = mean((fit.test-testData$score)^2) 
  }
}

#find MSE for each degree 
colMeans(mse)
#The model with the lowest test MSE turned out to be the polynomial regression modelwith degree h =2.

#Analyze the Final Model
#Lastly, we can obtain the coefficients of the best performing model:
  
  #fit best model
  best = lm(score ~ poly(hours,2, raw=T), data=df)

#view summary of best model
summary(best)

#We can also plot the fitted model to see how well it fits the raw data:

ggplot(df, aes(x=hours, y=score)) + 
  geom_point() +
  stat_smooth(method='lm', formula = y ~ poly(x,2), size = 1) + 
  xlab('Hours Studied') +
  ylab('Score')

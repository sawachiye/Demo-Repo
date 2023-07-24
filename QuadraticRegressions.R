### Quadratic Regression in R
#when two variables have a quadratic relationship, use quadratic regression to quantify their relationship
#Input the data.
#create data
  data <- data.frame(hours=c(6, 9, 12, 14, 30, 35, 40, 47, 51, 55, 60),
                     happiness=c(14, 28, 50, 70, 89, 94, 90, 75, 59, 44, 27))

#view data 
data

#Visualize the data.
#create scatterplot
plot(data$hours, data$happiness, pch=16)

#fit linear model
linearModel <- lm(happiness ~ hours, data=data)

#view model summary
summary(linearModel)

#Fit a quadratic regression model.
#create a new variable for hours2
data$hours2 <- data$hours^2

#fit quadratic regression model
quadraticModel <- lm(happiness ~ hours + hours2, data=data)

#view model summary
summary(quadraticModel)

#We can use the following code to visualize how well the model fits the data:
  
#create sequence of hour values
hourValues <- seq(0, 60, 0.1)

#create list of predicted happines levels using quadratic model
happinessPredict <- predict(quadraticModel,list(hours=hourValues, hours2=hourValues^2))

#create scatterplot of original data values
plot(data$hours, data$happiness, pch=16)
#add predicted lines based on quadratic regression model
lines(hourValues, happinessPredict, col='blue')


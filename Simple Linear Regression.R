# Simple Linear Regression over datasets - Single Variable
#
# 1. "Ground Water Survey  ->  X Axis - pH Level of Water  Y Axis - Bicarbonate (PPM)" 
#
# 2. "CricketChirps vs Temperature -> X Axis - CricketChirps per Minute  Y Axis - Temperature in Fahrenheit"
#
# 3. "Pizza Franchise -> X Axis - Annual Franchise Fee  Y Axis - Start up Cost"
#
# 4. "Iris Setosa -> X Axis - Sepal Width  Y Axis - Sepal Length
#
# 5. Random Generated Dataset

#-------------------------------------------------------------------------------------
#Dataset 1

mydata1 <- read.csv("GroundWaterSurvey.csv",header = TRUE)

X1 <- mydata1$X
Y1 <- mydata1$Y


relation1 <- lm(Y1~X1)

#jpeg("1Plot.jpg")
plot(X1,Y1,col="blue",main="Ground Water Survey",
     pch = 1,xlab = "pH Level of Water",ylab = "Bicarbonate(PPM) well water")
#dev.off()
#jpeg("1LPlot.jpg")
plot(X1,Y1,col="blue",main="Ground Water Survey",
     abline(lm(Y1~X1)),pch = 1,xlab = "pH Level of Water",ylab = "Bicarbonate(PPM) well water")
#dev.off()


a1 <- data.frame(X1=8.2)
result1 <- predict(relation1,a1)
print(result1)


#----------------------------------------------------------------------------------
#Dataset 2

mydata2 <- read.csv("CricketChirpsvsTemperature.csv",header = TRUE)

X2 <- mydata2$X
Y2 <- mydata2$Y

relation2 <- lm(Y2~X2)

#jpeg("2Plot.jpg")
plot(X2,Y2,col="red",main="Cricket Chirps vs Temperature",
     pch = 4,ylab = "Temperature",xlab = "Cricket Chirps per minute")
#dev.off()
#jpeg("2LPlot.jpeg")
plot(X2,Y2,col="red",main="Cricket Chirps vs Temperature",
     abline(lm(Y2~X2)),pch = 4,ylab = "Temperature",xlab = "Cricket Chirps per minute")
#dev.off()

# Dataset 2

a2 <- data.frame(X2=15.7)
result2 <- predict(relation2,a2)
print(result2)

#-----------------------------------------------------------------------------------------
#Dataset 3


mydata3 <- read.csv("PizzaFranchise.csv",header = TRUE)

X3 <- mydata3$X
Y3 <- mydata3$Y


relation3 <- lm(Y3~X3)

#jpeg("3Plot.jpg")
plot(X3,Y3,col="green",main="Pizza Franchise",
     pch = 9,xlab = "Annual Costs",ylab = "Start up Costs")
#dev.off()
#jpeg("3LPlot.jpg")
plot(X3,Y3,col="green",main="Pizza Franchise",
     abline(lm(Y3~X3)),pch = 9,xlab = "Annual Costs",ylab = "Start up Costs")


a3 <- data.frame(X3=1250)
result3 <- predict(relation3,a3)
print(result3)

#------------------------------------------------------------------------------------------

#Dataset 4

mydata4 <- read.csv("IrisSetosa.csv",header = TRUE)

X4 <- mydata4$X
Y4 <- mydata4$Y


relation4 <- lm(Y4~X4)

#jpeg("4Plot.jpg")
plot(X4,Y4,col="black",main="Iris Setosa",
     pch = 16,ylab = "Sepal Width",xlab = "Sepal Length")
#dev.off()
#jpeg("4LPlot.jpg")
plot(X4,Y4,col="black",main="Iris Setosa",
     abline(lm(Y4~X4)),pch = 16,ylab = "Sepal Width",xlab = "Sepal Length")
#dev.off()


a4 <- data.frame(X4=11)
result4 <- predict(relation4,a4)
print(result4)

#----------------------------------------------------------------------------------

#Random Dataset
X5 <- runif(100, -5, 5)
Y5 <- X5 + rnorm(100) + 3

# fit a linear model
relation5 <- lm( Y5 ~ X5 )

# plot the data and the model


#jpeg("5Plot.jpg")
plot(X5,Y5, col='black', main='Linear regression',pch = 16,xlab = "X",ylab = "Y")
#dev.off()
#jpeg("5LPlot.jpg")
plot(X5,Y5,col="black",main="Linear Regression",
     abline(relation5),pch = 16,xlab = "X",ylab = "Y")
#dev.off()


a5 <-data.frame(X5 = 10.23)
result5 <- predict(relation5,a5)
print(result5)
#----------------------------------------------------------------------------------


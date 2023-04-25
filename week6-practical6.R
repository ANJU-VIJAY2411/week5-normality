str(beaver2)
summary(beaver2)

beaver_data <- beaver2

pairs(beaver_data , 
      labels = colnames(beaver_data),
      main = "beavers dataset correlation plot")


#labels starts with what is assigned with lower value first
beaver_data$new_activity <- factor(beaver_data$activ, labels = c("no", "yes"))
View(beaver_data)


#If we know the temperature we can determine the activity
#activity : dependent variable
#temperature : independent variable


attach(beaver_data)
tapply(temp , new_activity , summary)
par <- opar
plot(beaver_data$new_activity , temp , pch = 19 , col = "blue")

hist(beaver_data$activ, 
     col = "steelblue", 
     main = "frequency chart of temperature")

# visual representation of the chart doesnt give any info

hist(beaver_data$temp, 
     col = "steelblue", 
     main = "Histogram of temperature")

# visual representation of the chart shows that the variable may not be normally distributed

library(lattice)
histogram(~temp | new_activity 
          ,data = beaver_data 
          ,main = "Distribution of beaver activity data"
          ,xlab = "Temp(Degrees)" ,ylab= "Activity")





qqnorm(beaver_data$temp, main = "temperature")
qqline(beaver_data$temp)




qqnorm(beaver_data$activ, main = "temperature")
qqline(beaver_data$activ)

with(beaver_data , qqnorm(temp[new_activity]== "no",
                          qqnorm(temp[new_activity]== "yes",
                          main = "comparing 2 samples of activity data"),
                          xlab = "activity = yes",
                          ylab = "activity = no")



shapiro.test(beaver_data$temp)

normalised_data <- read.csv("NormalData.csv", na = "")

non_normalised_data <- read.csv("NonNormalData.csv", na = "")

str(normalised_data)

# define the plotting region

opar <- par(no.readonly = TRUE)

# display 2 charts in 1 row
par(mfrow = c(1,2))

#create a histogram for both data set 
#histogram for normaly distributed data
hist(normalised_data$x, 
    col = "steelblue", 
    main = "frequency chart of data distribution (Parametric data)")


#create a histogram for 2 
#histogram for non normally distributed data
hist(non_normalised_data$x, 
     col = "steelblue", 
     main = "frequency chart of data distribution (non-Parametric data)")





# plot a q-q plot for both the variables


qqnorm(normalised_data$x, main = "parametric data")
qqline(normalised_data$x)

qqnorm(non_normalised_data$x, main = "non-parametric data")
qqline(non_normalised_data$x)



#shapiro-wilk test for normality
# if the p-value > 0.05 then data is normally distributed
# if p-value < 0.05 then data is not normally distributed

#Note : for shapiro-test , data set should be between 3 - 5000 rows

shapiro.test(normalised_data$x)
shapiro.test(non_normalised_data$x)


#option 4 : kolmogorov- smirnov test
# if the p-value > 0.05 then data is normally distributed
# if p-value < 0.05 then data is not normally distributed


ks.test(normalised_data$x, 'pnorm')
ks.test(non_normalised_data$x, 'pnorm')

# log transaform to convert non parametric data to parametric data

install.packages("moments")
library(moments)
skewness(non_normalised_data$x)

log_non_normalised_data <- log10(non_normalised_data$x)


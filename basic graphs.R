# Bar plots display the distribution of a 
# categorical variable 
# through vertical or horizontal bars.
# In its simplest form, the format of the 
# barplot() function is 
# barplot(height) where height is
# a vector or matrix. If height is a 
# vector, the values determine 
# the heights of the bars in the plot
# and a vertical bar plot is produced. 
# Including the option 
# horiz=T produces a horizontal bar chart
# instead. The "main" option adds a plot title,
# wheras the xlab and 
# ylab options add x-axis and y-axis
# labels, respectively. in the Arthritis 
# study, the variable 
# Improved records the patient outcomes
# for individuals receiving a placebo or 
# drug.
attach(mtcars)
head(mtcars)
library(vcd)
View(Arthritis)
counts <- table(Arthritis$Improved)
counts
barplot(counts, col =c("red", "gold", "blue"),
        main = "Barplot of Improvement of Arthritis Patients",
        xlab = "Improvement Level",
        ylab = "Fequency")
barplot(counts, col =c("red", "gold", "blue"),
        main = "Barplot of Improvement of Arthritis Patients",
        ylab = "Improvement Level",
        xlab = "Fequency", horiz = T)
counts.cyl <- table(cyl)
counts.cylrf <- round(prop.table(counts.cyl),4)*100
barplot(counts.cyl, main = "Barplot for the Number of Cylinders",
        xlab = "Number of Cylinders", ylab = "Frequency",
        col = c("gold","green", "red" ))
head(Arthritis, 2)
Arthritis[Arthritis$Age<60,c(1,3)]
summary(Arthritis)

# Here we see that 28 patients showed marked improvement, 14 showed some improvement, and 42 showed 
# no improvement. To graph the variable counts using a vertical or horizontal bar plot we have the 
# following codes.

barplot(counts,main="Simple Bar Plot", xlab = "Improvement Status", ylab = "Frequency", col = c("red", "darkgreen", "gold")) # simple barplot
barplot(counts, main = "Horizontal Bar Plot", xlab = "Frequency", ylab = "Improvement", horiz = T,col = c("red", "darkgreen", "gold") )

# Stacked and grouped bar plots
# If height is a matrix rather than a vector, the resulting  graph will be a stacked or grouped bar
# plot. If beside=F (the default), then each column of the matrix produces a bar plot, with the values
# in the column giving the heights of stacked "sub-bars." If beside=T, each column of the matrix 
# represents a group, and the values in each column are juxtaposed rather than stacked.

attach(Arthritis)
counts1 <- table(Improved,Treatment)
counts1.mtcars <- table(mtcars$cyl, mtcars$am)
barplot(counts1.mtcars,main = "Stacked Bar Plot", 
        xlab = "Transmission Type", ylab = "Frequency", 
        col = c("red", "yellow", "green"), 
        legend = rownames(counts1.mtcars))

barplot(counts1.mtcars, main = "Grouped Bar Plot", 
        xlab = "Transmission Type", ylab = "Frequency",
        col = c("red", "green", "blue"),
        legend = rownames(counts1.mtcars), beside = T)

warnings()
# Mean bar plots
# Bar plots needn't be based on counts or frequencies. You can create bar plots that represent means,
# medians, standard deviations, and so forth by using the aggregate function and passing the results
# to the barplot() function.

states <- data.frame(state.region, state.x77)
means <- aggregate(states$Illiteracy, by = list(state.region), 
                   FUN=mean)
means
means <- means[order(means$x),]
means
head(states)
# the head() function shows only the first six rows
# of a data frame
dim(states)

barplot(means$x, names.arg = means$Group.1, 
       col = c("red", "blue", "darkgreen", "gold"))
title("Mean Illiteracy Rate")

# there are severak ways to tweak  the appearance of 
# a bar plot. 
# For example, with many bars, bar 
# labels may start to overlap. You can decrease the 
# font size using the cex.names option. Specifying
# values smaller than 1 will shrink the size of 
# the labels. Optionally, the names.arg argument 
# allows you
# specify a character vector of names used to label 
# the bars. You can also use graphical parameters
# to help test spacing.

par(mar=c(5,8,4,2))  # increase the size of the y margin
par(las=2)           # rotates the bar labels 
barplot(counts, main = "Treatment Outcome", 
        horiz = T, cex.names = 0.8,
        names.arg = c("No Improvement", 
                      "Some Improvement", 
                      "Marked Improvement"), 
        col=c("red", "blue", "green"))

# Spinograms
# specialized version of a bar plot; a stacked bar 
# plot is rescaled so that the height of each bar is 1 and
# and the segment heights represent proportions. 
# it can be created through the spine() function 
# of the vcd package.

attach(Arthritis)
counts2 <- table(Treatment, Improved)
spine(counts2, main = "Spinogram Example")
detach(Arthritis)

# PIE Charts
# ubiquitous in the business world, denigrated by
# most statisticians; bar plots are more recommended 
# because 
# people are able to judge length more accurately 
# than volume.
# pie charts are created with the function 
# pie(x, labels) where x is a non-negative numeric 
# vector indicating
# the area of each slice and labels provides a 
# character vector of slice labels.


slices <- c(16,12,10,8,4)
lbls <- c("US", "UK", "Australia", "Germany", "France")

pie(slices, labels = lbls, main = "Simple Pie Chart")

pct <- round(slices/sum(slices)*100)
pct
lbls2 <- paste(lbls, " ", pct, "%", sep = " ")

pie(slices, labels = lbls2, col = rainbow(length(lbls2)),
    main = "Pie chart with percentages", 
    clockwise = F, init.angle = 90)

mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, 
               sep = " ")
pie(mytable, labels = lbls3, 
    main = "Pie Chart from a Table\n (with sample sizes)")

install.packages("plotrix")

library(plotrix)
pie3D(slices, labels = lbls2, explode = 0.1, 
      main = "3D Pie Chart", cex.names = 0.3)


# Histogram
# displays the distribution of a continuous variable 
# by dividing up the range of scores into a 
# specified number
# of bins on the x-axis and displaying the 
# frequency of scores in each bin on the y-axis; 
# can be created with 
# the function hist(x) wher x is a numeric 
# vector of values. the option freq=F creates 
# a plot based on probability
# densities rather than frequencies.

attach(mtcars)
head(mtcars)
hist(mpg, col=c("darkgreen", 'orange', "red"))

hist(mpg, breaks = 12, col = rainbow(5),
     xlab = "Miles Per Gallon", 
     main = "Colored Histogram with 12 bins")

hist(mpg, freq = F, breaks = 12, col = rainbow(5), 
     xlab = "Miles Per Gallon", 
     main = "Histogram, rug plot, density curve")
rug(jitter(mpg))
lines(density(mpg), col = "blue", lwd = 2, lty = 5)

h <- hist(mpg, breaks = 12, col = c("pink", "magenta", "cyan"), 
          xlab = "Miles Per Gallon", 
          main = "Histogram with normal curve and box")      
xfit <- seq(min(mpg), max(mpg),length = 40)
yfit <- dnorm(xfit, mean = mean(mpg), sd = sd(mpg))
yfit <- yfit*diff(h$mids[1:2]*length(mpg))
lines(xfit,yfit, col = "green", lwd = 2)
box()

# kernel density plots
# technically, kernel density estimation is a
# nonparametric method for estimating the 
# probability density
# function of a random variable.. the format 
# for a density plot is 
# plot(density(x)) where x is a numeric vector. 
# Because the plot() begins a new graph, use the 
# lines() function
# when superimposing a density curve on an 
# existing graph.


d <- density(mpg)
plot(d)
plot(d, main = "Kernel Density of Miles per Gallon")
polygon(d, col = "red", border = "blue")
rug(mpg, col = "brown")


# kernel density plots can be used to compare groups.
# this is a highly underutilized approach, 
# probably due to
# a general lack of easily accessible software. 
# fortunately, the sm package fills this gap nicely.
library(sm)
# the sm.density.compare()function in the sm package
# allows you to superimpose the kernel density 
# plots of two
# or more groups. the formate is 
# sm.density.compare(x, factor) where x is a 
# numeric vector and factor is a 
# grouping vcariable.

par(lwd=2)
cyl.f <- factor(cyl, levels = c(4,6,8), 
                labels = c("4 cylinder", 
                           "6 cylinder", "8 cylinder"))
sm.density.compare(mpg, cyl, 
                   xlab = "Miles per Gallon")
title(main = "MPG Distribution by Car Cylinders")
colfill <- c(2:(1+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill = colfill)

# Box Plots
# a box-and-whiskers plot describes the 
# distribution of a continuous variable by 
# plotting its five-number summary:
# the minimum, lower quartile, median, 
# upper quartile, and maximum. it can also 
# display observations that may be considered as outliers
# it can be done using the boxplot(x) function 
# where x is a numeric variable. by default, 
# each whisker extends 
# to the most extreme data point, whcih is no 
# more than the 1.5 times the IQR for the box. 
# values outside this 
# range are depicted as dots. Box plots can be 
# created for individual variables or for 
# variables by group.
# the format is boxplot(formula,data=dataframe) 
# where formula is a formula and dataframe 
# denotes the data frame (or list)
# providing the data. an example of a 
# formula is y~A where a separate box plot for
# numeric variable y is generated
# for each value of categorical variable A. 
# the formula y~A*B would produce a box plot 
# of numeric variable y, for
# each combination of levels in categorical 
# variables A and B. adding varwidth=T will 
# make the box plot widths
# proportional to the square root of their 
# sample sizes; horizontal=T reverses the 
# axis orientation.

# whiskers' length
# if x_i > Q_3 + 1.5IQR, x_i an extreme high
# if x_i < Q1-1.5IQR, x_i an extreme low
# upper adjacent value
# lower adjacent value

attach(mtcars)
boxplot(mpg, col = "violet", main = "Boxplot of Miles per Galon of Cars")

boxplot(mpg~cyl,main = "Car Mileage Data",notch = FALSE, 
        xlab = "Number of Cylinders", 
        ylab = "Miles per Gallon", 
        col=c("red", "blue", "green"))

min(mpg);max(mpg)
quantile(mpg,c(.25, .75))
 # by adding notch=T, you get notched box plots.if two boxes' notches don't overlap, there's strong evidence
# that their medians differ.

boxplot(mpg)
boxplot(mpg~cyl, varwidth = T, col = c("red","yellow","blue"), 
        main = "Car Mileage Data", 
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon")
table(cyl)
# you can produce box plots for more than one 
# grouping factor



cylf <- factor(cyl, levels=c(4,6,8), 
               labels = c("4 C", "6 C", "8 C"))
amf <- factor(mtcars$am, levels = c(0,1), 
              labels = c("auto", "manual"))
attach(mtcars)
boxplot(wt~amf*cylf, varwidth = T, 
        col = c("gold", "darkgreen"), 
        main = "Weight Distribution by Auto Type \n and Number of Cylinders",
        xlab = "Auto Type",
        ylab = "weight (1000 lbs)")
amf
str(mtcars)
View(mtcars)
# Dot plots
# dot plots provide a method of plotting a 
# large number of labeled values on a 
# simple horizontal scale. you create
# them with the dotchart() function, using 
# the format dotchart(x, labels=) where x is 
# a numeric vector and labels 
# specifies a vector that labels each point. 
# You can add a groups option to designate 
# a factor specifying how 
# the elements of x are grouped. If so, the 
# option gcolor controls the color of the 
# groups label and cex controls 
# the size of the labels.

dotchart(mpg, labels = row.names(mtcars), 
         cex = .7, pch = 20, main = "Gas Mileage for Car Models",
         xlab = "Miles Per Gallon")

# dot plots typically become most interesting when 
# they're sorted and grouping factors are 
# distinguished by symbol
# and color.

pj <- mtcars[order(mtcars$mpg),]
pj$cyl <- factor(pj$cyl)
pj$color[pj$cyl==4] <- "red"
pj$color[pj$cyl==6] <- "blue"
pj$color[pj$cyl==8] <- "darkgreen"
dotchart(pj$wt, labels = row.names(pj), 
         cex = 0.7, groups = pj$cyl, 
         gcolor = "gold",
         color = pj$color, pch = 19, 
         main = "Gas Mileage for Car Models\n 
         grouped by cylinder",
         xlab = "Miles Per Gallon")

# \n is used for next line
# in the above example, the data frame mtcars is 
# sorted by mpg (lowest to highest) and saves
# as data frame pj.
# the numeric vector cyl is transformed into a factor. 
# a character vector (color) is added to data frame pj 
# and contains the
# values "red", "blue", or "darkgreen" depending 
# on the value of cyl. In addition, the labels for 
# the data
# pints are taken from the rown names of the 
# data frame. Data points are grouped by number of 
# cylinders. The numbers
# 4, 6, and 8 are printed in black. the color of the 
# points labels are derived from the color vector, 
# and points
# are represendted by filled circles.
# try Hmisc package that offers a dot plot function dotchart2

boxplot(mpg)

plot(mpg,hp, pch=20, col="blue")
getwd()


arthritis <- read.csv(file.choose(), header = T)


sample.data <- c(3,4,4,5,6,6,7,7,8,9,10,11,19,20,21,22,23,24,25,27)
mean(sample.data)
mean(sample.data, trim = .3)
median(sample.data)
boxplot(sample.data)

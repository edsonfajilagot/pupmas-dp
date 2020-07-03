# Based on http://www.r-tutor.com/elementary-statistics/

library(MASS)
painters
painters$School
class(painters$School)
my_painters <- painters

# Freq distribution of qualitative data
school.freq <- table(painters$School)
cbind(school.freq) #to display in table format

comp.freq <- table(painters$Composition)

# Relative frequency
school.relfreq <- school.freq / nrow(painters)

# bar chart
barplot(school.freq)
barplot(school.freq, col=c("red", "blue", "yellow", "green"))
barplot(school.freq, col=rainbow(8))

# pie chart
pie(school.freq)
pie(school.freq, col=rainbow(20))


# apply family!!!
# from https://www.guru99.com/r-apply-sapply-tapply.html

# apply
# sum a matrix over all the columns
m1 <- matrix(c(1:10), nrow=5, ncol=6)
col_sum <- apply(m1, 2, sum)
row_mean <- apply(m1, 1, mean)

# apply on df
df1 <- data.frame(a=c(1:5), b=c(5:1))
col_sum <- apply(df1, 2, sum)
row_sum <- apply(df1, 1, sum)

# lapply, over list or vector or dataframe, returns list
movies <- c("OTJ", "BATMAN", "WWII")
movies_lower <- lapply(movies, tolower)
movies_lower <- unlist(lapply(movies, tolower))

# sapply, same as lappy but return as vector
movies_lower2 <- sapply(movies, tolower)
movies_lower2["OTJ"]

# tapply, apply a function over a subset of a vector
data(iris)
tapply(iris$Sepal.Width, iris$Species, median)

# take group means
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
tapply(x, f, mean)

# find group range
tapply(x, f, range)

require(stats)
groups <- as.factor(rbinom(32, n = 5, prob = 0.4))
tapply(groups, groups, length)
table(groups)

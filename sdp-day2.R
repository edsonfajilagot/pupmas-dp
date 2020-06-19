# creating new variables
# variable_name <- epression
# review of arithmetic operators
# +, -, *, /, raising to a power ^ or ** 
# modulus (x mod y) %% 
20%%7
# integer division %/%
23%/%5
23%%5

sample.df <- transform(sample.df, single.f=sing.f)
math<- scale(math)
eng <- scale(eng)
sci <- scale(sci)
sing.f <- ( math + eng + sci )/3
s.rank <- quantile(sing.f, c(.8, 0.6,.4, .2))
# add a new score to each student using the letters A,B,C,D,E
sample.df$new.grade[sing.f >= s.rank[1]] <- "A"
sample.df$new.grade[sing.f < s.rank[1] & sing.f >= s.rank[2]] <- "B"
sample.df$new.grade[sing.f < s.rank[2] & sing.f >= s.rank[3]] <- "C"
sample.df$new.grade[sing.f <s.rank[3] & sing.f >= s.rank[4]] <- "D"
sample.df$new.grade[sing.f < s.rank[4]] <- "E"
name.new <- strsplit((sample.names), " ")
lastname.new <- sapply(name.new, "[", 2)
firstname.new <- sapply(name.new, "[",1)
sample.df <- cbind(firstname.new,lastname.new, sample.df[,-1])
sample.df <- sample.df[order(lastname.new,firstname.new),]

# using dplyr package
# sample.df <- sample.df %>%
# arrange(gsub(".*\\s", "",sample.df$names))
View(sample.df)
names(sample.df)[1:2] <- c("Firstname", "Lastname")
# sample.df <- rename(sample.df, c(Firstname ="Firstname.new", 
# Lastname = "Lastname.new"))

fix(sample.df)

# Recoding variables
# change a continuous var into a set of categories
# repalce miscoded values with correct values
# create a pass/fail var based on a set of cutoff scores
# we need a logical operator to execute the above
# logical operator:
# <, <=, >, >=, ==, !=, !x (not x), x|y (x or y)
# x&y (x and y), isTRUE(x) - Test if x is TRUE

isTRUE(5>9)

# Renaming variables
# fix(sample.df)
# names(sample.df)[2] <- "new name"
# names(sample.df) <- c("newname1", "newname2",...)
# using the "reshape" library
# sample.df <- rename(sample.df, c(oldname="newname",...))


# Missing values
# in R missing values are denoted by NAs (not available)
# impossible values in R are denoted by NaN (not a number)

ex.miss.v <- c( 5,2,3, NA) 
# to check for missing values, use the function is.na()
is.na(ex.miss.v)
is.na(sample.df[1:5,2:4])
is.numeric(ex.miss.v)
as.character(ex.miss.v)
is.vector(ex.miss.v) # as.vector(object)

# merge datasets
# merge(), rbind()- adding more rows, cbind() - adding more columns
# subsetting data frames, using brackets
# sample.df[1:3,2:4]
# recoding values to missing
# sample.df$math[5] <- NA
# we need to exclude missing values from our anlayses
mean(ex.miss.v, na.rm = TRUE)
# na.omit() - deletes any rows with missing data
# this is to be applied to a data frame.
# na.omit(data_frame)

# selection of variables
# which() function
which(sample.df$Gender == 1, arr.ind = T)
sample.df[sample.df$Gender==1,]
# subset() function
subset(sample.df, math > 25 | sci < 38)


# Random Samples
# sample(x,size=n, replace = T/F, prob=NULL)
x.s <- 1:1000
set.seed(1)
sample(x.s, size=50,replace=F)


# numerical and character functions
# abs(x), sqrt(x), ceiling(x),floor(x), trunc(x), round(x,digits=n)

#statistical functions
# mean(x), median(x), sd(x), var(x), mad(x),
# summary(x), quantile(x,probs), range(x), sum(x), diff(x, lag=n)
#min(x), max(x), scale(x,center=TRUE, scale=TRUE)

summary(ex.miss.v)
max(ex.miss.v, na.rm=T)
min(ex.miss.v, na.rm=T)

# probability functions
# in R, probability functions take the form
# [dpqr]distribution_abbreviation
# beta, binom, cauchy, chisq, exp, f, gamma, geom, hyper, lnorm, logis
# multinom, nbinom, norm,mvnorm,  pois, signrank, t, unif, weibull, wilcox
# Examples:
 # qexp(vector,2), dnorm(1)- default is the standard normal
dnorm(0)
pnorm(0)
rnorm(20)

x.coor <- pretty(c(0,10), 50)
y.coor <- df(x.coor,4,8)
plot(x.coor,y.coor, type = "l", col = "red",
     xlab="Exponential Deviate", ylab="Density")

rnorm(50)



# other useful functions
# length(x), seq(from, to, by), rep(x,n), cut(x,n), pretty(x,n)
seq(1,50.1, by=3)
rep(8, 20)
rep("HI", 10)
cut(1:10, 10)

# applying functions to matrices and data frames
# apply(x, MARGIN, FUN, )
# MARGIN - specifies the dimension of the dataframe or matrix x, 
# 1 for the rows, and 2 for the columns
# example 
set.seed(2)
mydata.h <- matrix(rbinom(60,10,0.45),nrow=15 )
# compute the mean of every column
apply(mydata.h, 2, sd)


# repitition and looping
# for, while, if-else, ifelse, switch

for (i in 1: 10){
  print(mean(mydata.h[i,]))
}

xy <- 1:20
ifelse(xy>10, print("Less than or equal to 10"), print(xy))

# transpose() - reverse the rows and columns of a matrix
# BASIC GRAPHS in R
# bargraphs, boxplots, dotplots, pie charts, histograms

 # bargraphs - applicable for categorical variables
# barplot()
# consider the mtcars dataframe
head(mtcars, 4)
attach(mtcars)
cyl
barplot(cyl)
cyl.t <- table(cyl)
barplot(cyl.t, col = c("red", "yellow", "green"),
        xlab = "Number of Cylinders", ylab = "Frequency",
        main = "Number of Cylinders of Cars")
# we can make also a horizontal barplot
barplot(cyl.t, col = c("red", "yellow", "green"),
        ylab = "Number of Cylinders", xlab = "Frequency",
        main = "Number of Cylinders of Cars", horiz = TRUE)
# stacked and grouped bar plots
twtable <- table(cyl, mtcars$am)
twtable
rownames(twtable)
barplot(twtable,col=c("red","yellow", "blue"), 
        legend=rownames(twtable)) # stacked barplot

# group barplot 
barplot(twtable,col=c("red","yellow", "blue"), 
        legend=rownames(twtable), beside = TRUE)
# spinogram, we need the package "vcd"
library(vcd)
# function is spine
twtable.1 <- table(mtcars$am, cyl)
spine(twtable.1)
 # Pie Charts
slices.pie <- c(12, 9, 19, 5, 29)
slice.lb <- c("USA", "Brzil", "Germany", "Japan", "China")
pie(slices.pie, labels = slice.lb)

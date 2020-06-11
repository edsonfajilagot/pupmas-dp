# statistical data processing
library(dplyr)
sample.sum <- 5+8
log.cons <- TRUE
str.cons <- "Happy Birthday"
7-6
7*12
7^3
((6*6)-7)+12
6/7
infant.weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
infant.age <- c(1,3,5,2,11,9,3,9,12,3)
# computing mean of a vector
mean(infant.weight)
mean(infant.age)
# computing standard deviation
sd(infant.weight)
sd(infant.age)
# computing correlation between two vectors
cor(infant.weight,infant.age)
plot(infant.age,infant.weight, 
     main = "Scatter diagram of Ages and Weights of Ten Infants", 
     col="blue", pch=20, xlab = "Ages of Infants", ylab = "Weights of Infants")
getwd()
# how to list all objects stored in the working directory
ls()
# deleting an object in the wd
install.packages("dplyr")
Yes

# creating a dataset.
# The first step in any data analysis is the creation of a dataset containing
# the information to be studied, in a format that meets your needs. In R,
# this task involves the following:
# selecting a data structure to hold your data
# entering or importing your data into the data structure

# data types in R
# Logical values (TRUE or FALSE); Strings or characters; "Hello World!";
# numeric: 1,2, -5, 4/6

# data structures in R
# Vectors - one dimensional arrays that can hold numeric data, character
# data, or logical data.
# vectors are created using the c() function.
sdp.a <- c(1,2,5,-3,5,6,7,8,9,11)
sdp.b <- c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE,FALSE,FALSE,TRUE,FALSE)
sdp.c <- c("one", "two", "three", "four","five","six","seven","eight",
           "nine", "ten")

# you can refer to elements of a vector using a numeric vector or positions 
# within brackets.
sdp.b[7];sdp.c[c(1,4,8)]
# colon in R has a special function; it can be used to create a sequence 
# of numbers (integers)
1:10
2:34
13:21
sdp.c[3:6]
sdp.c[15] <- "fifteen"
sdp.c

# matrices
# matrix- two dimensional array where each element has the same mode
# matrix(vector,nrow = number_of_rows, ncol = no_of_col, byrow=logical_value,
# dimnames = list(char_vector_rownames, char_vector_colnames))
e.rownames <-c("A", "B", "C","D")
e.colnames <-c("A1", "B2", "C3", "D4", "E6")
sdp.d <- c(11,13,5,6,7,11,10,8,9,5,6,13,15,20,16,22,9,8,13,24)
matrix.sdp <- matrix(sdp.d, nrow=4,
                     dimnames = list(e.rownames,e.colnames))
m1.sdp <- matrix(sdp.d,nrow=3,ncol=3)
m2.sdp <- matrix(sdp.d, nrow=5,ncol=5)
# how to refer to elements of a matrix
matrix.sdp[3,3] # this is the entry in the 3rd row and the 3rd column
matrix.sdp[2,] # this is the second row
matrix.sdp[,4] # this is the 4th column
matrix.sdp[1:3,3:4]

# arrays
# arrays are similar to matrices but can have more than two dimensions
# array(vector,dimensions,dimnames)
sdp.d1 <- c(11,13,5,6,7,11,10,8,9,5,6,13,15,20,16,22,9,8)
dim1
dim2
dim3
array.1 <- array(sdp.d1,c(2,3,3), dimnames = list(dim1,dim2,dim3))
array.1[1,2,3]
array.1[1,2,]
array.1[1]

# data frames
# two dimensional structure; more general than a matrix.
# how to create a data frame?
# data.frame(vec1,vec2,vec3,...)
gender <- c(1,1,2,1,2,2,2,1,2,1,2,2,1,1,2)
math <- c(23,23,25,26,21,19,18,26,27,16,17,20,21,23,27)
eng<- c(89,82,84,89,90,91,80,93,94,81,84,89,90,91,94)
sci <- c(46,43,40,48,42,40,39,45,46,38,36,36,39,40,42)
length(gender)
length(math)
length(eng)
length(sci)
sample.df <- data.frame(gender,math,eng,sci)
sample.df
View(sample.df)
edit(sample.df)
sample.df[,2]
sample.df[11,]
head(sample.df, 7)
tail(sample.df, 3)
attach(sample.df)
sample.df$gender<-factor(sample.df$gender)
str(sample.df)
attach(mtcars)
mtcars[,1]
table(sample.df$gender)

factor() # the function used to force a vector into a factor.
# example: am.factor <- factor(am)
summary(mtcars) #- displays the six-number summary of each vector in a dataframe
str(mtcars) # - displays the data structure; no of obs, no of vectors.
# and the data type in each vector.
round(prop.table(table(am.factor))*100,2)
round(prop.table(table(cyl,am.factor))*100,2)

# list
# lists are the most complex of the R data structures.
# a list is an ordered collection of objects (components)
# it allows us to gather a variety of objects under one name.
# list(object1,object2, object3,..)
gcg <- "My first List"
ecq <- c(3,5,8,2,4,5)
mecq <- matrix(1:10,nrow=5)
megcq <- c("I", "Love", "YOU")
mygcqlist <- list(title=gcg, ncovdr=ecq,mecq,megcq)
mygcqlist[2]
mygcqlist[1]

# how to import csv data files into R.
try.importcsv <- read.csv(file.choose(), header = T)
View(try.importcsv)
try.importcsv
write.csv(sample.df, file="sampledf")
sample.df
sample.df$names <- c("Cleo Castillo", "Larvene Trillana", "Ericka Pambid","JM Borigas", "Lindsay Ahorro", "Ruth Montes", 
                     "Aivan Klarisse", "Abz Miguel", "Jodie Maria", "Ryan Cayabyab", "Carol Banawa", "Karol Magbanwa",
                     "James Paterson", "Harry Roque", "Mocha Uson")

sample.df <- data.frame(sample.df$names,gender,math,eng,sci)


# Assignment
# Add new column Performance indicator (average of all subjects)
library(dplyr)
sample.df <- sample.df %>%
  rowwise() %>%
  mutate(Perf = mean(c(math, eng, sci)))

# Add Letter indicator for Performance indicator
# 91-100: A
# 81-90: B
# 71-80: C
# 61-70: D
# 51-60: E
# 50 and below: F

# Arrange student by lastname and Performance




# Assignment
# Generate dataset
possible_score <- 40:100
math <- sample(possible_score, 15)
eng <- sample(possible_score, 15)
sci <- sample(possible_score, 15)
gender <- sample(1:2, 15, replace = TRUE)
student <- c("Cleo Castillo", "Larvene Trillana", "Ericka Pambid","JM Borigas", "Lindsay Ahorro", "Ruth Montes", 
                     "Aivan Klarisse", "Abz Miguel", "Jodie Maria", "Ryan Cayabyab", "Carol Banawa", "Karol Magbanwa",
                     "James Paterson", "Harry Roque", "Mocha Uson")
class_rec <- data.frame(student,gender,math,eng,sci)

#attach(class_rec)
#class_rec <- within(class_rec, rm(ave)) # drop ave column


# Add new column Performance indicator (average of all subjects)
class_rec <- class_rec %>%
  rowwise() %>%
  mutate(Ave = round(mean(c(math, eng, sci))))


# Add Letter indicator for Performance indicator
# 91-100: A
# 81-90: B
# 71-80: C
# 61-70: D
# 51-60: E
# 50 and below: F
class_rec <- class_rec %>%
  rowwise() %>%
  mutate(Grade = ifelse(Ave %in% 91:100, "A",
                 ifelse(Ave %in% 81:90, "B",
                 ifelse(Ave %in% 71:80, "C",
                 ifelse(Ave %in% 61:70, "D",
                 ifelse(Ave %in% 51:69, "E", "F"))))))

# Arrange student by Lastname and Grade
class_rec <- class_rec %>%
  separate(student, c("Firstname", "Lastname"), sep=" ") %>%
  arrange(Lastname, Grade)


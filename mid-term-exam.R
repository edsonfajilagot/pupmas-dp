# Number 4
# R - three basic data types
# Numeric
my_number <- 6
my_integer <- 6L #add "L" for integer

# Character
my_char1 <- "Hello"

# Logical
my_bool1 <- TRUE
my_bool2 <- T


# Number 5
library(data.table)
s1 <- c("Jessica Roaring", 22, "Atlanta Georgia", 7.75, "UCLA")
s2 <- c("Anthony Hospkin", 21, NA, 8.25, "Harvard Business School")
s3 <- c("Victoria Sanches", 24, "Mexico", 8.0, "UCLA")
s4 <- c("Oliver Gooding", 22, "Wisconsin", 7.5, "University of Wisconsin-Madison")
s5 <- c("Elija Cruz", 23, "Colorado", 8.0, "Harvard Business School")
s6 <- c("Ronald Weasley", 25, "California", 7.5, "UCLA")
s7 <- c("Alexandra Lewis", 24, "Colorado", NA, "University of Wisconsin-Madison")
s8 <- c("Carmina Rodriguez", 25, "New York", 8.25, "Harvard Business School")
s9 <- c("Carol Parkinson", 30, "Ohio", 7.25, "University of Wisconsin-Madison")
s10 <- c("Jonas Jones", 22, "Massachusetts", 8.5, "Harvard Business School")
s11 <- c("Alicia Holders", 22, "Atlanta Georgia", 7.75, "UCLA")
s12 <- c("Anthony Pierce", 21, NA, 8.25, "Harvard Business School")
s13 <- c("Olga Perez", 24, "Mexico", 8.0, "UCLA")

student <- data.table(t(s1))
student <- rbind(student, t(s2))
student <- rbind(student, t(s3))
student <- rbind(student, t(s4))
student <- rbind(student, t(s5))
student <- rbind(student, t(s6))
student <- rbind(student, t(s7))
student <- rbind(student, t(s8))
student <- rbind(student, t(s9))
student <- rbind(student, t(s10))
student <- rbind(student, t(s11))
student <- rbind(student, t(s12))
student <- rbind(student, t(s13))
colnames(student) <- c("name", "age", "addr", "ielts", "school")

# Summarize by school and # of student
number_of_students_per_school <- student[, .N, by=school]

# Summarize by address and # of student
number_of_students_per_addr <- student[, .N, by=addr]

# Average ielts score per school
student$ielts <- as.numeric(student$ielts)
avg_ielts_school <- student[, .(avg_ielts=mean(ielts, na.rm=TRUE)), by=school]




# --- Further check after exam!
# Convert data type of age
student <- student[, age:=as.numeric(age)]

table(student$age)
prop.table(student$age)
with(student, table(age, school))


# freq table
duration <- faithful$eruptions
range(duration)
breaks <- seq(1.5, 5.5, by=0.5)
duration.cut <- cut(duration, breaks, right=FALSE)
duration.freq <- table(duration.cut)


student_age <- student$age
range(student_age)
breaks <- seq(21, 31, by=2)
student_age.cut <- cut(student_age, breaks, right = FALSE)
student_age.freq <- table(student_age.cut)
student_age.freq <- transform(table(student_age.cut)) # to make it df
cbind(student_age.freq)
dt1 <- as.data.table(student_age.freq)
# Note, the interval notation
# [21,23) --> means right open, left closed
# means hold values between 10 and 12, 10 including, but not including 12

dt2 <- transform(student_age.freq, Rel_Freq=prop.table(Freq), Cum_Freq=cumsum(Freq))



#another option
s1 <- list("Jessica Roaring", 22, "Atlanta Georgia", 7.75, "UCLA")
s2 <- list("Anthony Hospkin", 21, NA, 8.25, "Harvard Business School")
dt <- data.table(name="Thomas Edison", age=18, addr="NY", ielts=10.0, school="PUP")
dt <- rbindlist(list(dt, s1))
str(dt)
x <- dt[, .(m=mean(age))]

# or
dta <- data.table(t(s1))
dta <- rbindlist(list(dta, s2))
str(dta)

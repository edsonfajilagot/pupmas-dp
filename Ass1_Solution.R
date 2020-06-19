# Solution to assigment
library(data.table)

gender <- c(1,1,2,1,2,2,2,1,2,1,2,2,1,1,2)
math <- c(23,23,25,26,21,19,18,26,27,16,17,20,21,23,27)
eng<- c(89,82,84,89,90,91,80,93,94,81,84,89,90,91,94)
sci <- c(46,43,40,48,42,40,39,45,46,38,36,36,39,40,42)

sample.df <- data.frame(gender,math,eng,sci)
sample.df$names <- c("Cleo Castillo", "Larvene Trillana", "Ericka Pambid","JM Borigas", "Lindsay Ahorro", "Ruth Montes", 
                     "Aivan Klarisse", "Abz Miguel", "Jodie Maria", "Ryan Cayabyab", "Carol Banawa", "Karol Magbanwa",
                     "James Paterson", "Harry Roque", "Mocha Uson")



# Scale, get the z-score, the different set of measurement
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

sample.df$new.grade2 <- ifelse(sing.f >= s.rank[1], "A","X")

name.new <- strsplit((sample.df$names), " ")
lastname.new <- sapply(name.new, "[", 2)
firstname.new <- sapply(name.new, "[",1)
sample.df <- cbind(firstname.new,lastname.new, sample.df[,-1])


# DT Version
s.dt <- as.data.table(sample.df)
s.dt[, ':='(math_s = scale(math), eng_s=scale(eng), sci_s=scale(sci))]
s.dt[, perf:= (math_s + eng_s + sci_s)/3]
s.rank <- quantile(s.dt$perf, c(.8, 0.6,.4, .2))
s.dt[perf >= s.rank[1], grade:="A"]
s.dt[perf < s.rank[1] & perf >= s.rank[2], grade:="B"]
s.dt[perf < s.rank[2] & perf >= s.rank[3], grade:="C"]
s.dt[perf < s.rank[3] & perf >= s.rank[4], grade:="D"]
s.dt[perf < s.rank[4], grade:="E"]

s.dt[, c("firstname", "lastname") := tstrsplit(names, split=" ")]

# drop colum names
s.dt[, names:=NULL]



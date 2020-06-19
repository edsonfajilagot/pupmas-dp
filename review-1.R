# review 1

library(data.table)

# Create a dataframe
names <- c("Juan", "Frank", "Mary")
salary <- c(200, 230, 400)
employee <- data.frame(names=names, salary=salary)

# Convert df to dt
employee.dt <- as.data.table(employee)

tab.dt <- data.table(x=rep(c("b", "a", "C"), each=3), y=c(1,3,6), v=1:9) 
dim(tab.dt)

# Basic row subset operations
tab.dt[2]
tab.dt[2,]
tab.dt[3:2]
tab.dt[order(y),]
tab.dt[order(y,v),]
tab.dt[y>2,]
tab.dt[y>2 & v>5,]
tab.dt[!2:4,]

# Select, compure columns
tab.dt[,v]
t1 <- tab.dt[, list(y)]
tab.dt[,.(y)]
tab.dt[, sum(v)]

tab.dt[2:4, sum(v)]
tab.dt[y>1, sum(v)]

tab.dt[, sum(v), by=x]
tab.dt[y>1, sum(v), by=x]

# Subset
tab.dt["a", on="x"]
tab.dt[x=="a"]

tab.dt[, z:=42L]
tab.dt[, z:=NULL]
tab.dt[, w:=v*2]
tab.dt[, m:=mean(v), by=x]


# Check df
tab.df <- as.data.frame(tab.dt)
tab.df[2:3,]
tab.df[order(tab.df$v),]


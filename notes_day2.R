library(dplyr)

gender <- c(1,1,2,1,2,2,2,1,2,1,2,2,1,1,2)
math <- c(23,23,25,26,21,19,18,26,27,16,17,20,21,23,27)
eng<- c(89,82,84,89,90,91,80,93,94,81,84,89,90,91,94)
sci <- c(46,43,40,48,42,40,39,45,46,38,36,36,39,40,42)
student <- c("Cleo Castillo", "Larvene Trillana", "Ericka Pambid","JM Borigas", "Lindsay Ahorro", "Ruth Montes", 
             "Aivan Klarisse", "Abz Miguel", "Jodie Maria", "Ryan Cayabyab", "Carol Banawa", "Karol Magbanwa",
             "James Paterson", "Harry Roque", "Mocha Uson")

sample.df <- data.frame(student, gender,math,eng,sci)

#sample.df$math_scaled <- as.vector(scale(math))
#sample.df$eng_scaled <- as.vector(scale(eng))
#sample.df$sci_scaled <- as.vector(scale(sci))
#sample.df$perf <- mean(sample.df$math_scaled, sample.df$eng_scaled, sample.df$sci_scaled)

math_scaled <- scale(math)
eng_scaled <- scale(eng)
sci_scaled <- scale(sci)
perf <- (math_scaled + eng_scaled + sci_scaled) / 3
perf.rank <- quantile(perf, c(0.8, 0.6, 0.4, 0.2))
sample.df <- transform(sample.df, perf = perf)
sample.df$grade[perf >= perf.rank[1]] <- "A" 
sample.df$grade[perf >= perf.rank[2] & perf < perf.rank[1]] <- "B" 


# Adding column in dataframe
# 1
sample.df$gender2[sample.df$gender == 1] <- "Male"
sample.df$gender2[sample.df$gender == 2] <- "Female"

# 2
sample.df$gender3 <- ifelse(sample.df$gender == 1, "Male", "Female")

# 3 dplyr
sample.df <- sample.df %>%
  mutate(gender4 = ifelse(gender == 1, "m", "f"))



#transform(sample.df, Ave = math_scaled + eng_scaled + sci_scaled)
sample.df <- sample.df %>%
  rowwise() %>%
  mutate(Ave = round(mean(c(math_scaled, eng_scaled, sci_scaled)),2)) %>%
  arrange(desc(Ave))


# fix
fix(sample.df)

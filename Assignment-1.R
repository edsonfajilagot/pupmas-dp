# Assignment - 1
library(dplyr)
library(tidyr)


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
  mutate(Ave = round(mean(c(math, eng, sci)),2))


# Add Letter indicator for Performance indicator
# 91-100: A
# 81-90: B
# 71-80: C
# 61-70: D
# 51-60: E
# Below 51: F
#class_rec <- class_rec %>%
#  mutate(Grade = ifelse(Ave %in% 91:100, "A",
#                        ifelse(Ave %in% 81:90, "B",
#                               ifelse(Ave %in% 71:80, "C",
#                                      ifelse(Ave %in% 61:70, "D",
#                                             ifelse(Ave %in% 51:60, "E", "F"))))))


class_rec <- class_rec %>%
  mutate(Grade = ifelse(Ave >= 91, "A",
                         ifelse(Ave >= 81 & Ave < 91, "B",
                                ifelse(Ave >= 71 & Ave < 81, "C",
                                       ifelse(Ave >= 61 & Ave < 71, "D",
                                              ifelse(Ave >= 51 & Ave < 61, "E", "F"))))))



# Arrange student by Grade and Lastname
class_rec <- class_rec %>%
  separate(student, c("Firstname", "Lastname"), sep=" ") %>%
  arrange(desc(Ave), Lastname)


# Add row number
class_rec$row_id <- seq.int(nrow(class_rec))


# Add grouping, first 3 = A, next 3 = B, ....
class_rec <- class_rec %>%
  mutate(Group = ifelse(row_id <= 3, "A",
                        ifelse(row_id > 3 & row_id <= 6, "B",
                               ifelse(row_id > 6 & row_id <= 9, "C",
                                      ifelse(row_id > 9 & row_id <= 12, "D", "E")))))



# Option 2
# Combining all R commands
class_rec <- class_rec %>%
  rowwise() %>%
  mutate(Ave = round(mean(c(math, eng, sci)),2)) %>%
  mutate(Grade = ifelse(Ave >= 91, "A",
                        ifelse(Ave >= 81 & Ave < 91, "B",
                               ifelse(Ave >= 71 & Ave < 81, "C",
                                      ifelse(Ave >= 61 & Ave < 71, "D",
                                             ifelse(Ave >= 51 & Ave < 61, "E", "F")))))) %>%
  separate(student, c("Firstname", "Lastname"), sep=" ") %>%
  arrange(desc(Ave), Lastname) %>%
  mutate(row_id = seq.int(nrow(class_rec))) %>%
  mutate(Group = ifelse(row_id <= 3, "A",
                        ifelse(row_id > 3 & row_id <= 6, "B",
                               ifelse(row_id > 6 & row_id <= 9, "C",
                                      ifelse(row_id > 9 & row_id <= 12, "D", "E")))))
  
  


  



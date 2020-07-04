# Working with R
#Is there any significant difference in the scores in a 20 item quiz in Statistics of the Senior High School students
#when they grouped according to their strand with alpha at 0.05
#data
STEM.scores <- c(20,18,16,15,13,11)
ABM.scores <- c(19, 17,16,16,13) 

#get the sum and mean
sum(STEM.scores)
sum(ABM.scores)
mean(ABM.scores)
mean(STEM.scores)
#square of each scores
SquareSTEM.score <-(STEM.scores)^2
SquareSTEM.score
SquareABM.scores <-(ABM.scores)^2
SquareABM.scores
#sum of squared scores
sum(SquareSTEM.score)
sum(SquareABM.scores)

#Define Null & Alternative Hypothesis
#Ho: the mean of STEM scores is equal to the mean of ABM scores
#Ha: the mean of STEM scores is not equal to the mean of ABM scores

#Calculate Test Statistic
#twosided
#assume not equal variances

boxplot(STEM.scores)
boxplot(ABM.scores)
boxplot(STEM.scores, ABM.scores)

t.test(STEM.scores,ABM.scores, paired = FALSE, var.equal = TRUE)
t.test(STEM.scores, ABM.scores)



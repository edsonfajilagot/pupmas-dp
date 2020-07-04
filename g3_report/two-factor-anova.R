# two-factor anova example

gender <- c(0,0,1,1,0,0,1,1,0,0,1,1)
crowd.size <- c(rep(0,4), rep(2,4), rep(4,4))
reaction.time <- c(8,8,9,11,8,6,15,19,10,8,24,18)

exp.data <- data.frame(gender=as.factor(gender), 
                       crowd=as.factor(crowd.size), 
                       reaction=reaction.time)

attach(exp.data)
# with interaction
anova2.a <- aov(reaction~gender*crowd, data = exp.data)
summary(anova2.a)

# without interaction
anova2.b <- aov(reaction~gender+crowd, data = exp.data)
summary(anova2.b)

# plot
plot(anova2)




# Additional reference: one-factor ANOVA
anova1.a <- aov(reaction~gender, data = exp.data)
summary(anova1.a)

anova1.b <- aov(reaction~crowd, data = exp.data)
summary(anova1.b)

anova1.b2 <- oneway.test(reaction~crowd, data = exp.data)
summary(anova1.b2)

anova1.c <- aov(reaction~crowd + gender, data = exp.data)
summary(anova1.c)

# two-factor anova

gender <- c(0,0,1,1,0,0,1,1,0,0,1,1)
crowd.size <- c(rep(0,4), rep(2,4), rep(4,4))
reaction.time <- c(8,8,9,11,8,6,15,19,10,8,24,18)

exp.data <- data.frame(gender=as.factor(gender), 
                       crowd=as.factor(crowd.size), 
                       reaction=reaction.time)

attach(exp.data)
anova2 <- aov(reaction~gender*crowd, data = exp.data)
summary(anova2)

# plot
plot(anova2)


# one-factor
anova1.a <- aov(reaction~gender, data = exp.data)
summary(anova1.a)

anova1.b <- aov(reaction~crowd, data = exp.data)
summary(anova1.b)

anova1.c <- aov(reaction~crowd + gender, data = exp.data)
summary(anova1.c)

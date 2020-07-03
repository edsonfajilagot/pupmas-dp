
alpha <- 0.01
M <- 68000

Mbar <- 66900
Sdev <- 5500
n <- 30

z <- (Mbar - M)/(Sdev/sqrt(30))
z.alpha = qnorm(alpha) 
pval = pnorm(z) 



alpha = 0.05
tc = -2.2436 #calculated t-stat
t.alpha = qt(alpha, df=13)
pval = pt(tc, df=13) #p-value



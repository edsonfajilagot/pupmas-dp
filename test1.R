library(data.table)


dt <- fread("test1.csv")
dt1 <- dt[, .(G_PLT, LO_STOCKS, LO_BCKLOG, LO_RNGCVR)]
sum(dt1$LO_RNGCVR)

ifelse(dt1[LO_BCKLOG=="X", sum(LO_STOCKS), by=.(G_PLT)] != 0, sum(dt1$LO_RNGCVR))

#1
stocks <- dt1[LO_BCKLOG=="X", sum(LO_STOCKS)]
dt2 <- dt1[, sum(LO_RNGCVR), by=.(G_PLT)]
colnames(dt2) = c("Plant", "ROC")

#or
dt2 <- dt1[, .(roc=sum(LO_RNGCVR)), by=.(G_PLT)]

#2
dt1[LO_BCKLOG=="X", .(sum(LO_STOCKS), ifelse(sum(LO_STOCKS)!=0, sum(LO_RNGCVR), 0)), by=.(G_PLT)]


#3
dt3 <- dt1[LO_BCKLOG=="X", .(stocks=sum(LO_STOCKS), roc=sum(LO_RNGCVR)), by=.(G_PLT)]


#4
dt4 <- dt1[LO_BCKLOG=="X", .(stocks=sum(LO_STOCKS), roc=sum(LO_RNGCVR)), by=.(G_PLT)
           ][,roc:=ifelse(stocks==0, 0, roc)
             ]


# version 1
dt1[, STOCKS:=0][LO_BCKLOG=="X", STOCKS:=LO_STOCKS]
dt1[, RNGCVR:=0][STOCKS!=0, RNGCVR:=LO_RNGCVR]
sum(dt1$RNGCVR)
sum(dt1$STOCKS)

# version 2
dt1[, STOCKS:=ifelse(LO_BCKLOG=="X", LO_STOCKS, 0)]
dt1[, RNGCVR:=ifelse(STOCKS!=0, LO_RNGCVR, 0)]

# Using data frame
dt2 <- as.data.frame(dt1)
dt2$STOCKS2 <- ifelse(dt2$LO_BCKLOG=="X",dt2$LO_STOCKS, 0)
dt2$RNGCVR2 <- ifelse(dt2$STOCKS2!=0,dt2$LO_RNGCVR, 0)
sum(dt2$RNGCVR2)
sum(dt2$STOCKS2)

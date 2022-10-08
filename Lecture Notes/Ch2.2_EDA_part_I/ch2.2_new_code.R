# Control-L: clear your console

ls()

rm(list = ls())

ls()
#######

getwd() #get work directory

setwd("/Users/billhaarlow/Desktop/SML201") #set work directory

#######

x=c(1:7,9,12)

y=seq(2,9,by=1.5)

save("x","y",file="my_new_var.Rdata")

rm(list=ls())

ls()

load(file="my_new_var.Rdata")

seq()

t.ship=read.csv(file="/Users/billhaarlow/Desktop/SML201/titanic.csv")

dim(t.ship)

head(t.ship)
tail(t.ship)

class(t.ship$PassengerId)
str(t.ship)

hist(t.ship$Age,xlab="Ages (in Years)",main="Histogram for passengers on Titanic",breaks=30,freq=F,ylab="Proportion per year")

mean(t.ship$Age,na.rm=T)
summary(t.ship$Age)

mean(c(35,35,50,60,70))
mean(c(42,42,50,55,61))

par(mfrow=c(2,1))
hist(c(35,35,50,60,70),xlim=c(30,70))
hist(c(42,42,50,55,61),xlim=c(30,70))

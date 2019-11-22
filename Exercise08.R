#code for 8.1

library(ggplot2)
#move game data to environment
UWMSUgame <- read.delim("UWvMSU_1-22-13.txt")

#a line graph depicting the cumulative score for each team 
#as a function of time in the game, use plot function 

#1
UW<-UWMSUgame[UWMSUgame$team == "UW",] #subset WU 
UW$total<-rep(0,length(UW$score)) #null vector for total
UW$total[1]<-UW$score[1] #initial
#For loop 
for(i in 2:length(UW$score)){
  UW$total[i]<-UW$score[i]+UW$total[i-1] #create running total for total column; adds everything to previous
}
#Double check equality 
sum(UW$score) == tail(UW$total,n=1)

#2
MSU<-UWMSUgame[UWMSUgame$team == "MSU",] #subset MSU 
MSU$total<-rep(0,length(MSU$score)) #null vector for total
MSU$total[1]<-MSU$score[1] #initial
#For loop 
for(i in 2:length(MSU$score)){
  MSU$total[i]<-MSU$score[i]+MSU$total[i-1] #create running total for total column; adds everything to previous
}
#Double check equality 
sum(MSU$score) == tail(MSU$total,n=1)

#Use this to plot instead of the chuck below
a=ggplot(data=UW,aes(x=time,y=total))+xlab("Time (minutes)")+ylab("Total Points")+
  geom_line(aes(x=time,y=total),colour="darkgreen")+ geom_line(data=MSU,aes(x=time,y=total),colour="firebrick")+theme_minimal()+labs(title="UW vs MSU")
a

#Plot
plot(total ~ time,data=UW,type='l',col='darkgreen', xlab=c("Time (minutes)"), ylab=c("Total Points"))
lines(total ~ time,data=MSU,col ='firebrick')

#make guess my number game 
Guessmynumber <- function(x){
  num <- x
if (num > sample(1:100)) {
  print("Lower")
} else {
  print("Higher")
} else 
  print("Correct!")
}

Guessmynumber(50)

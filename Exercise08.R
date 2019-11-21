#code for 8.1

library(ggplot2)
#move game data to environment
UWMSUgame <- read.delim("UWvMSU_1-22-13.txt")

#a line graph depicting the cumulative score for each team 
#as a function of time in the game, use plot function 

UWscore <- UWMSUgame[,2]=="UW"
MSUscore <- UWMSUgame[,2]=="MSU"
plot(x = time,y = UWMSUgame[,3],type="l", xlab = "score", ylab = "time", main = "Overall score both teams")

#still need to separate teams, have a plot function to manipulate  

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

#Plot
plot(total ~ time,data=UW,type='l',col='darkgreen', xlab=c("Time (minutes)"), ylab=c("Total Points"))
lines(total ~ time,data=MSU,col ='firebrick')
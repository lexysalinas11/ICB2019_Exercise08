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
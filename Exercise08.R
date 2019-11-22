#Alexa Salinas and Camille Mosley (TA: John Huber)
#Exercise 8

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

#plotting with plot
plot(total ~ time,data=UW,type='l',col='darkgreen', xlab=c("Time (minutes)"), ylab=c("Total Points"))
lines(total ~ time,data=MSU,col ='firebrick')

#plotting with ggplot
a=ggplot(data=UW,aes(x=time,y=total))+xlab("Time (minutes)")+ylab("Total Points")+
  geom_line(aes(x=time,y=total),colour="darkgreen")+ geom_line(data=MSU,aes(x=time,y=total),colour="firebrick")+theme_minimal()+labs(title="UW vs MSU")
a

#new code
guessmynum<-function(){ 
  n<-readline(prompt="Guess number between 1 and 100: ") #read lines from input
  n<-as.numeric(n) #creates vector with length equal to n
  if((as.numeric(n)>0)&(as.numeric(n)<=100)){ #specifies # greater than 0 but less than 100
    return(as.numeric(n)) #returns the vector
  }
  else{
    cat("Number must be between 1 and 100!")
    return(guessmynum()) #returns function defined for game variable
  }
}

play<-function(){
  guessmynum<- -100
  while(guessmynum != num){ 
    guess<-guessmynum()
    if (guess == num) #says that if the guess equals valid number... 
    {
      cat("Yahoo! You win!", num, "is right!\n") #we get a winning message
    }
    else if (guess<num) #if guess is less than valid number...
    {
      cat("Shawty, too low. \n") #we get a message prompting us to guess a higher number
    }
    else if(guess>num) #if guess is higher than valid number...
    {
      cat("Try again, sweetie. Too high. \n")
    }
  } 
}

#code for playing game
num<-round(runif(1)*100)
play()

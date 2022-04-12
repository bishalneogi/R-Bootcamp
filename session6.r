# Base plotting

# Using plot() to study to continous variables

ir<-iris
str(ir)












# Syntax
# plot(x=variable to be displayed on x axis, y = variable to be displayed on y axis)

plot(x=ir$Petal.Width,y=ir$Petal.Length)










# Adding xlabels, ylables and title

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"))











# Adding colors, plotting symbols







#Adding colors
plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),col="red")











#Adding different plotting symbol

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=4)








plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=3)

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=4)










#Adding  more options


plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=4,type="p",lwd=2)










# Making a conditional bivariate plot

# Seeing relationship across different species

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),col=ir$Species)














plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),pch=as.numeric(ir$Species),col=ir$Species)










plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),cex=as.numeric(ir$Species))







plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),cex=as.numeric(ir$Species),col=ir$Species)







#Adding a legend

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),pch=as.numeric(ir$Species))
#unique(ir$Species)
legend(0.2,7,c("Setosa","Versicolor","Virginica"),pch=1:3)







plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),ylab=c("Petal Length"),col=ir$Species,pch=as.numeric(ir$Species))

legend(0.2,7,c("Setosa","Versicolor","Verginica"),pch=1:3,col=1:3)

#Studying a continous variable across groups
#Distribution of Sepal lengths across different species



# Univariate Analysis

#Box plots

boxplot(ir$Petal.Length)










summary(ir$Petal.Length) #Mean<Median, negatively skewed







boxplot(ir$Sepal.Width)
summary(ir$Sepal.Width) #Mean>Median, positively skewed

#Improving the asethetics of boxplot
boxplot(ir$Petal.Length,col="red",main="Distribution of Petal length")







plot(x=ir$Species,y=ir$Sepal.Width,xlab="Species",main="Sepal Length across sepcies",col="red")












#Using histograms
hist(ir$Sepal.Width,col="orange")

ir%>%mutate(Width_M_3=ifelse(Sepal.Width>3,'More','less'))->ir



hist(ir$Sepal.Width,col="orange",labels=TRUE)

hist(ir$Sepal.Width,col="orange",freq=FALSE)
hist(ir$Sepal.Width,col="orange",labels=TRUE,freq=FALSE)
lines(density(ir$Sepal.Width))


#Adding multiple plots in single plotting window
par(mfrow=c(1,2))


plot(x=ir$Species,y=ir$Sepal.Width,xlab="Species",main="Sepal Width across sepcies",col="red")
plot(x=ir$Species,y=ir$Sepal.Length,xlab="Species",main="Sepal Length across sepcies",col="red")
dev.off()




mk<-read.csv("./data/DirectMarketing.csv")
library(ggplot2)
#Scatter
p<-ggplot(mk,aes(x=Salary,y=AmountSpent))
p+geom_point(aes(color=Gender))

p<-ggplot(mk,aes(x=AmountSpent))
p+geom_histogram(aes(color=Gender,fill=Gender),alpha=0.50)+facet_grid(Gender~.)

#Dwnsity
p+geom_density(aes(color=Gender,fill=Gender),alpha=0.60)+facet_grid(Gender~.)
p<-ggplot(mk,aes(x=Gender,y=AmountSpent,fill=Gender))
p+geom_boxplot()







library(ggplot2)

#Understand the relationship between Salary and AmountSpent
p<-ggplot(mk,aes(x=Salary,y=AmountSpent))
p+geom_point()













#Understanding the conditional relationship based on Gender
q<-p+geom_point(aes(colour=Gender))

q
















q+xlab("Salary in $")+ylab("Expenditure in $")









#Making a trellis plot for both the genders and fitting a tred line
p+geom_point(aes(colour=Gender))+geom_smooth(aes(colour=Gender))

#Creating a trellis plot
p+geom_point(aes(colour=Gender))+geom_smooth(aes(colour=Gender))+facet_grid(Gender~.)











#Understanding Univaraites
p<-ggplot(mk,aes(x=AmountSpent))
p+geom_histogram()











#Understanding Gender wise distribution
p+geom_histogram(aes(fill=Gender))








#Modifying the position
p+geom_histogram(aes(fill=Gender,colour=Gender),position="stack",alpha=0.3)










#Alternative, draw a trellis plot
p+geom_histogram(aes(fill=Gender))+facet_grid(Gender~.)










#Polishing the graph
p+geom_histogram(aes(fill=Gender,colour=Gender),alpha=0.3)+facet_grid(Gender~.)











#Boxplots
p<-ggplot(mk,aes(y=AmountSpent,x=Gender,fill=Gender))
p+geom_boxplot()









#Density plots
options(scipen=999)
p<-ggplot(mk,aes(x=AmountSpent))
p+geom_density(aes(fill=Gender,colour=Gender),alpha=0.3)















#Conditional density plot
p+geom_density(aes(fill=Gender))










#Improving the plot
p+geom_density(aes(fill=Gender,colour=Gender),alpha=0.4)














#2d counts

p<-ggplot(mk,aes(x=Salary,y=AmountSpent))
p+geom_point(aes)
p+geom_bin2d()


dat1<-read.csv("./data/audit.csv")


#Grammar explained further
options(scipen=999)
library(ggplot2)
p<-ggplot(dat1,aes(x=Age,y=Income))
p+geom_point(aes(color=Gender))

p+geom_point(color="red")#Mapping Vs Fixing a value

#Adjusting scales
p+geom_point(aes(color=Gender))+scale_x_continuous(breaks=seq(0,80,10))

#Other meanings of scale
p+geom_point(aes(size=Gender,color=Income))#Adjust the size of points

p+geom_point(aes(size=Gender,color=Income))+scale_size_discrete(range = c(1,2))

p+geom_point(aes(size=Gender,color=Income))+scale_size_discrete(range = c(1,3))

#Adjust the gradient of the color
p+geom_point(aes(size=Gender,color=Income))+scale_size_discrete(labels=c("F","M"),range = c(1,3))+scale_color_continuous(low="blue",high="red")

#What if I don't want to see the legend corresponding to size?
p+geom_point(aes(size=Gender,color=Income))+scale_size_discrete(labels=c("F","M"),range = c(1,3))+scale_color_continuous(low="blue",high="red")+guides(size=F)

#Can we improve this further?

p+geom_point(aes(size=Gender,color=Income))+scale_size_discrete(labels=c("F","M"),range = c(1,3))+scale_color_continuous(low="blue",high="red")+guides(size=F)+facet_grid(Gender~.)#Anything else we can do?



##ggplot2() corner cases
##ggplot2() make sure what is the datatype of the object you are plotting
VADeaths
p<-ggplot(VADeaths,aes(x=`Rural Male`,y=`Rural Female`))#Why this error?
class(VADeaths)
gp<-data.frame(VADeaths)
gp

p<-ggplot(gp,aes(x=Rural.Male,y=Rural.Female))
p+geom_point()


















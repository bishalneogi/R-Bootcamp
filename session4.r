oj <- read.csv("./data/oj.csv")
#dplyr
library(dplyr)
dat8<-filter(oj,brand=="tropicana")
dim(filter(oj,brand=="tropicana"))



dat9<-filter(oj,brand=="tropicana"|brand=="dominicks")
dim(filter(oj,brand=="tropicana"|brand=="dominicks"))



#Selecting Columns
dat10<-select(oj,brand,INCOME,feat)








dat11<-select(oj,-brand,-INCOME,-feat)







#Creating a new column
dat12<-mutate(oj,logIncome=log(INCOME))




#Arranging data 
dat13<-arrange(oj,INCOME)










dat14<-arrange(oj,desc(INCOME)


dat14<-arrange(oj,-INCOME)





#Group Wise summaries
gr_brand<-group_by(oj,brand)
summarize(gr_brand,mean(INCOME),sd(INCOME))







#Pipelines
#Base R code

mean(oj[oj$INCOME>=10.5,"price"])

#dplyr code
summarize(filter(oj,INCOME>=10.5),mean(price))




oj%>%filter(INCOME>=10.5)%>%summarize(mean(price))



oj%>%filter(price>=2.5)%>%mutate(logIncome=log(INCOME))%>%summarize(mean(logIncome),median(logIncome),sd(logIncome))

#Merging data
##Joins using Merge
df1 = data.frame(CustomerId=c(1:6),Product=c(rep("Toaster",3),rep("Radio",3)))
df2 = data.frame(CustomerId=c(2,4,6),State=c(rep("Alabama",2),rep("Ohio",1)))

merge(x = df1, y = df2, by = "CustomerId", all = TRUE)#Outer join:

merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE)#Left join

merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE)#Right join

merge(x=df1,y=df2,by="CustomerId")#Inner Join/Intersection of both tables

#Missing values
a<-c(1,2,3,4,5,6,NA,NA,NA,7,8,9)
is.na(a)
sum(is.na(a))



air<-airquality
head(air)




sum(is.na(air$Ozone))
sum(is.na(air$Solar.R))



summary(air)


#Imputing Missing values

air$Ozone[is.na(air$Ozone)]<-45

summary(air)





air$Solar.R[is.na(air$Solar.R)]<-mean(air$Solar.R,na.rm=TRUE)
summary(air)


#reshape2()
library(reshape2)
person<-c("Sankar","Aiyar","Singh")
age<-c(26,24,25)
weight<-c(70,60,65)
wide<-data.frame(person,age,weight)
wide










melt(wide,id.vars="person")



melt(wide,id.vars="person",value.name ="Demo_Value" )



melted<-melt(wide,id.vars="person",value.name ="Demo_Value" )








dcast(melted,person~variable,value.var = "Demo_Value")

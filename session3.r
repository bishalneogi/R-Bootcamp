oj <- read.csv("./data/oj.csv")

str(oj)

#dataframe[rows,columns]
oj[1,3]



oj[c(1,2,8,456),c(1,3,6)]





oj[c(1:5),"brand"]


#Logical Subseting

#Selecting only those rows where brand bought is tropicana
dat<-oj[oj$brand=='tropicana',]


oj[,"store"], oj$store, oj[,1]







#Using Or condition, brand bought is tropicana or dominicks
dat1<-oj[oj$brand=='tropicana'|oj$brand=='dominicks',]
head(dat1)












#Using And condition, brand bought is tropicana and no feature advertisement is run
dat2<-oj[oj$brand=='tropicana' & oj$feat==0,]
head(dat2)











#Subsetting using which() operator
index<-which(oj$brand=="dominicks")
head(index)
dat3<-oj[index,]











#Selecting Columns
dat4<-oj[,c("week","brand")]
head(dat4)










#Seleecting+Subsetting
dat5<-oj[oj$brand=='tropicana' & oj$feat==0,c("week","store")]
head(dat5)











#Adding new columns
oj$logInc<-log(oj$INCOME)
dim(oj)











#Revenue Column
head(oj$logmove)
head(exp(oj$logmove))
oj$revenue<-exp(oj$logmove)*oj$price










#Sorting data
numbers<-c(10,100,5,8)
order(numbers)
order(-numbers)










dat6<-oj[order(oj$week),]
head(dat6)
min(oj$week)










dat7<-oj[order(-oj$week),]
head(dat7)
max(oj$week)



##Group by summaries


class(oj$brand)
unique(oj$brand)








#Mean price of juice across brands







#Summarize-Price
#Summarize by-Brand (factor)
#Summarize how-Mean

#Syntax aggregate(variable to be summarized, by=list(variable by which grouping is to be done),function)



aggregate(oj$price,by=list(oj$brand),mean)
class(aggregate(oj$price,by=list(oj$brand),mean))











tapply(oj$price,oj$brand,mean)


class(tapply(oj$price,oj$brand,mean))












#Mean income of people by brand
#Summarize-Income
#Summarize by-Brand
#Summarize how-Mean
aggregate(oj$INCOME,by=list(oj$brand),mean)
class(aggregate(oj$INCOME,by=list(oj$brand),mean))
tapply(oj$INCOME,oj$brand,mean)
class(tapply(oj$INCOME,oj$brand,mean))










#Cross tabulations
# Units of different brands sold based on if feature advertisement was run or not
table(oj$brand,oj$feat)



class(table(oj$brand,oj$feat))











xtabs(oj$INCOME~oj$brand+oj$feat)

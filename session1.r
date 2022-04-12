##----------------------Introduction to R--------------------------------#
setwd("path to data in your system")
#Agenda:Variables,vector,selection of element of vectors,entering data into dataframe

#USe # for writing a comment
p<-5
q<-p+5

#Can do arithmetic operations
pi
sqrt(25)
2^2+5

p<-5

# Items in R are stored as objects
#Setting variables
#Assignment of values to a variable "<-"
x<-5
x< -5 #comparison

# other forms of assignment operator
fun=6
fun<-6

#Over writing a variable
x<-"Hero"

#deleting the variables
rm(x)
x
rm(foo,fun)

#Programatically figuring out objects
ls()

# How to create a vector?
# It consists of either numbers,strings, or logical values but not all of them together.
# It contains only 1 type of class
# Type of variables : Class of the variables (Integer,character,logical)

# c is the combining operator
 x<-5 #it is a numeric vector of 1 element
 x<-c('1','2','-5','6') # numeric vector of 4 elements
 
a<-3
a1<-c(a,a*4,-7*a)

A<-c(1,2,3,NA)
A


string<-c("1","2","2","3","4")
#class gives the data type of vector
class(string)

B<-c('a','b','c',NA)
B
sp<-c(TRUE,FALSE,TRUE) #class is 

class(p)

a1<-c(1,1,1)
a2<-c(2,2,2)
a1+a2

#Vectors shouldn't have mixed type of data
p<-c(1,2,"g")
class(p)
p<-c(TRUE,FALSE,"G")
p<-c(TRUE,FALSE,3)
class(c(TRUE,FALSE,1))


x<-c(1,2,3,4)
class(x)
x1<-c(1.2,2.4,3.5,4.5)
class(x1)

#Vector,working with vectors

# Vector : Most Simplest structure in R .Only one data type

num<-c("a","b","c","d","e")
num
num[1]
num[4]
num[-1]
num[1:2]

#assgining names
names(num)<-c("x1","x2","x3","x4","x5")
names(num)[4]
num["x4"]
num[c("x1","x2")]


length(num)

## Writing loops
# Explain how to use a for, while
# Use apply, tapply, sapply

#Lists : Recursive vectors. Can handle different data types
my.list <- list( name = c("Robert", "Emma"), age = c (65, 54,43),retired = c (TRUE, FALSE))

my.list

my.list$age
my.list["age"]

class(my.list$age)
class(my.list["age"])

my.list[["age"]][2]

my.list[[3]]
my.list [[3]][2]

list(c("Robert", "Emma"), age = c (65, 54),
      retired = c (TRUE, FALSE))

#Why study lists, results of machine learning algorithms/statistical modelling algorithms is a list object
model1<-lm(data1$MYCT~data1$MMIN)

mode(model1)

model1$coefficients
model1$residuals #etc


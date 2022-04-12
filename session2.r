#dataframes
#Each column can be a different Data types. 
#Consider the following vectors : 

product=c("Bag","shoes","belt","belt")

total_price=c(500,1000,150,10000)

color=c("Blue","red","red","blue")

quantity=c(5,2,3,4)

product_details <- data.frame(product,total_price,color,quantity,stringsAsFactors=FALSE)
product_details

class(product_details)

str(product_details)

product_details <- data.frame(product,total_price,color,quantity)


product_details[,2]
product_details[,"total_price"]

product_details[2,]
product_details[2,2]

head(product_details,2)
tail(product_details,2)

##Importing tabular data##

#Checks needed to ensure that data is imported correctly
#1. Delimiter in the file
#2. How missing values are populated in the data


import1<-read.table("./data/sample2.csv",sep=",",header = TRUE)

summary(import1) #Focus on the missing values
str(import1) #Are column data types correct

import2<-read.table("./data/sample1.txt")#Why error

import2<-read.table("./data/sample1.txt",sep="\t")

import2#What is wrong?

import2<-read.table("./data/sample1.txt",sep="\t",header=TRUE)

summary(import2)
str(import2)

import2<-read.table("./data/sample1.txt",sep="\t",header=TRUE,na.strings = c(NA,"Missing",""))

summary(import2)

str(import2)

class(import1)
class(import2)

##Data import is considered successfull: 1.Delimiters are identified correctly, 2.Missing values in the data are recognized as missing (NA)

#Some other sources of tabular data, excel files, sql servers, webpages

library(XLConnect)
file<-readWorksheetFromFile("./data/Data.xlsx",sheet=1)

class(file)

#Getting tables from web pages
#Many web pages contain tabular data as comma separated or tab separated
#UCI Abalone data set
web2<-read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data",header=FALSE)


#Sometimes tabular data is also read in as a list eg an html table imported in R
library(XML)
web3<-readHTMLTable("http://www.inflationdata.com/Inflation/Consumer_Price_Index/HistoricalCPI.aspx?reloaded=true")

class(web3)

#One can save the web page locally and still read in the tables

web4<-readHTMLTable("./data/Historical Consumer Price Index (CPI).html")

class(web4)

#Loading packages: some functionalities are not available under the hood.
library(ggplot2)
library(arules)
data(AdultUCI)
Adult<-AdultUCI


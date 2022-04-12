##Date
fd<-read.csv("./data/Fd.csv")
str(fd)

fd$FlightDate<-as.Date(fd$FlightDate,"%d-%b-%y")

str(fd)


head(months(fd$FlightDate))
unique(months(fd$FlightDate))


head(weekdays(fd$FlightDate))
unique(weekdays(fd$FlightDate))

#Finding time interval

fd$FlightDate[60]-fd$FlightDate[900]

difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "weeks")

difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "days")

difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "hours")


#Subsetting data based on time information
library(dplyr)

#Subset the data for day=Sunday
dim(fd)
fd_s<-fd%>%filter(weekdays(FlightDate)=="Sunday")
dim(fd_s)
#Find the number of flights on Sundays for destination Atlanta
fd%>%filter(weekdays(FlightDate)=="Sunday",DestCityName=="Atlanta, GA")%>%nrow()
#Find the number of flights on Sundays for all cities
fd%>%filter(weekdays(FlightDate)=="Sunday")%>%group_by(DestCityName)%>%summarize(n())
#PISIXct and POSIXlt
date1<-Sys.time()
date1
class(date1)
weekdays(date1)
months(date1)
date2<-as.POSIXlt(date1)
date2
str(date2)
unclass(date2)
date2$wday
date2$zone
date2$hour

## Also show lubridate, glimpse
#String manipulation
a<-"Batman"
substr(a,start=2,stop=6)

nchar(a)
tolower(a)
toupper(a)

b<-"Bat-Man"
strsplit(b,split="-")
c<-"Bat/Man"
strsplit(c,split="/")





paste(b,split=c)

c(b,c)

grep("-",c(b,c))


c(b,c)
grepl("/",c(b,c))

c(c,b)
grepl("/",c(c,b))


b
sub("-","/",b)





d<-"Bat-Ma-n"


sub("-","/",d)


gsub("-","/",d)

data=read.csv("./data/details.csv",stringsAsFactors = FALSE)
pattern="\\d{3}"
grep(pattern,data$details,value=TRUE)
library(stringr)
str_extract(data$details,pattern)
pattern="\\d{3}\\-\\d{3}\\-\\d{4}"
str_extract(data$details,pattern)
str_extract_all(data$details,pattern)

pattern_url="http://www\\.[:alpha:]+\\.com"
str_extract(data$details,pattern_url)


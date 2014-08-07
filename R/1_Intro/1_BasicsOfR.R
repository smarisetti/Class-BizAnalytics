# Basic calculation
8 * 6
2**16

 # Functions
sqrt(2)
abs(-25)
?sqrt

# Variables
SquareRoot2 = sqrt(2)
SquareRoot2
HoursYears <- 365 * 24
HoursYears
# variables are case sensitive
ls()
rm(HoursYears)
ls()

# Vector - series of numbers stored as same object

c(2,3,5,8,13)
# c - create a vector
Country = c("Brazil","China","India","Switzerland","USA")
# Life expentancy in these countries
LifeExpectancy = c(74,76,65,83,79)
Country
LifeExpectancy
c("Brazil",74,"China",76)
# look at the output. All are converted to text.
Country[1]
LifeExpectancy[3]
# Sequence of numbers
Sequence = seq(1,100,2)
Sequence

# Data Frame
Data = data.frame(Country, LifeExpectancy)
Data
# Data frame maintains the data types
# New vector Population
Population = c(199000, 1390000, 1240000, 7997, 318000)
# column binding
Data2 = cbind(Data, Population)
Data2
# cbind - column binding)
# Row binding
Country = c("Australia", "Greece")
LifeExpectancy = c(82,81)
Population = c(23050, 11125)
NewData = data.frame(Country,LifeExpectancy,Population)
NewData
Data3 = rbind(Data2, NewData)
Data3

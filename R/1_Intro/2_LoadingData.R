# We will use WHO.csv data file in this

# Navigate to the location
# CWD - change working director to location where the file is
setwd("~/Box/Professional/ClassesTaken/edX/AnalyticsEdge/1_Intro")
getwd()
WHO = read.csv("WHO.csv")
str(WHO)
summary(WHO)
WHO_Europe = subset(WHO, Region == "Europe")
str(WHO_Europe)
write.csv(WHO_Europe, "WHO_Europe.csv")

ls()
rm(WHO_Europe)
ls()

# Data Analysis
Under15
WHO$Under15
# Mean
mean(WHO$Under15)
# standard deviation
sd(WHO$Under15)
# Statistical Summary
summary(WHO$Under15)
which.min(WHO$Under15)
# it gives the row # in the data frame
WHO$Country[86]
which.max(WHO$Under15)
WHO$Country[124]
plot(WHO$GNI, WHO$Under15)

# Plot creation
# GNI and Fertility
plot(WHO$GNI, WHO$FertilityRate)
Outliers = subset(WHO, GNI > 10000 & FertilityRate > 2.5)
nrow(Outliers) # number of rows
Outliers[c("Country", "GNI", "FertilityRate")]

# Plots: Histogram
hist(WHO$CellularSubscribers)
boxplot(WHO$LifeExpectancy ~ WHO$Region)
boxplot(WHO$LifeExpectancy ~ WHO$Region, xlab = "Region", ylab ="Life Expectancy", main = "Life Expectancy of Countries by Region")

# Summary Tables
table(WHO$Region)
tapply(WHO$Over60, WHO$Region, mean) # GROUP BY function
tapply(WHO$LiteracyRate, WHO$Region, min)
# shows some missing values
# How do we remove the missing values?
tapply(WHO$LiteracyRate, WHO$Region, min, na.rm=TRUE)
# You see no more NA values

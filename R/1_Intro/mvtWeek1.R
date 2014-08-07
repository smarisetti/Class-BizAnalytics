# Using mvt data frame or data set
# How many rows of data (observations) are in this dataset?
nrow(mvt)

# How many variables are in this dataset?
str(mvt)

# Using the "max" function, what is the maximum value of the variable "ID"?
max(mvt$ID)
min(mvt$Beat)
# How many observations have value TRUE in the Arrest variable (this is the number of crimes for which an arrest was made)?
table(mvt$Arrest)
# How many observations have value a LocationDescription value of ALLEY?
table(mvt$LocationDescription)

#let's convert these characters into a Date object in R. 
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))

# This converts the variable "Date" into a Date object in R. 
# Take a look at the variable DateConvert using the summary 
# function.
summary(mvt)
# What is the month and year of the median date in our dataset?
# Enter your answer as "Month Year", without the quotes. 
# (Ex: if the answer was 2008-03-28, you would give the 
# answer "March 2008", without the quotes.)

# Now, let's extract the month and the day of the week, 
# and add these variables to our data frame mvt. 
# We can do this with two simple functions.

mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)

# This creates two new variables in our data frame, 
# Month and Weekday, and sets them equal to the month and 
# weekday values that we can extract from the Date object. 
# Lastly, replace the old Date variable with DateConvert 
# by typing:
mvt$Date = DateConvert
# In which month did the fewest motor vehicle thefts occur?
table(mvt$Month)
# On which weekday did the most motor vehicle thefts occur?
table(mvt$Weekday)

# Each observation in the dataset represents a motor
# vehicle theft, and the Arrest variable indicates 
# whether an arrest was later made for this theft. 
# Which month has the largest number of motor vehicle 
# thefts for which an arrest was made?
table(mvt$Month, mvt$Arrest)

# Visualizing crime trend
hist(mvt$Date, breaks=100)

# For what proportion of motor vehicle thefts in 2001 
# was an arrest made?
table(mvt$Arrest, mvt$Year)
2152/(2152+18517)
# Which locations are the top five locations for motor 
# vehicle thefts, excluding the "Other" category? 
# You should select 5 of the following options.
tail(sort(table(mvt$LocationDescription)))

# Create a subset of your data, only taking observations 
# for which the theft happened in one of these five locations, 
# and call this new data set "Top5".

Top5 = subset(mvt, mvt$LocationDescription == "DRIVEWAY - RESIDENTIAL" | mvt$LocationDescription == "GAS STATION" | mvt$LocationDescription == "ALLEY" | mvt$LocationDescription == "STREET" | mvt$LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)")
str(Top5)

# R will remember the other categories of the 
# LocationDescription variable from the original dataset, 
# so running table(Top5$LocationDescription) will have a 
# lot of unnecessary output. To make our tables a bit nicer 
# to read, we can refresh this factor variable. 
# In your R console, type:
Top5$LocationDescription = factor(Top5$LocationDescription)
str(Top5)
table(Top5$LocationDescription)

# One of the locations has a much higher arrest rate than 
# the other locations. Which is it?

table(Top5$LocationDescription, Top5$Arrest)

# On which day of the week do the most 
# motor vehicle thefts at gas stations happen?
table(Top5$LocationDescription, Top5$Weekday)

USDA = read.csv("USDA.csv")
str(USDA)
summary(USDA)

# Finding High sodium food
USDA$Sodium
which.max(USDA$Sodium)
names(USDA)
USDA$Description[265]

#which are the high sodium foods:
HighSodium = subset(USDA, Sodium > 10000)
nrow(HighSodium)
HighSodium$Description
# How much Sodium level is in Caviar?
match("CAVIAR", USDA$Description)
# gives the index
USDA$Sodium[4154]
USDA$Sodium[match("CAVIAR", USDA$Description)]

#compare this value with mean and median of all data
summary(USDA$Sodium)
sd(USDA$Sodium)
sd(USDA$Sodium, na.rm=TRUE)
# Amount of sodium is larger than one SD of sodium
# Plotting
plot(USDA$Protein, USDA$TotalFat, xlab = "Protein", ylab = "Total Fat", main = "Protein Vs Fat")
hist(USDA$VitaminC)
hist(USDA$VitaminC, xlab="Vitamin C (mg)", main="Vitamin C Levels", xlim=c(0,100), breaks=2000)
boxplot(USDA$Sugar)

---- Plotting ----

USDA = read.csv("USDA.csv")
str(USDA)

# Plotting Scatter Plot
plot(USDA$Protein, USDA$TotalFat)
plot(USDA$Protein, USDA$TotalFat, xlab ="Protien", ylab = "Fat", main = "Protein Vs Fat", col="blue")

# Plotting Histograms

hist(USDA$VitaminC, xlab = "Vitamin C mg", main = "Hisogram of Vitamin C")
# Has less than 200 mg
# Limit x-axis to 0 - 100 mg
hist(USDA$VitaminC, xlab = "Vitamin C mg", main = "Hisogram of Vitamin C", xlim = c(0,100))
hist(USDA$VitaminC, xlab = "Vitamin C mg", main = "Hisogram of Vitamin C", xlim = c(0,100), breaks = 100)
# set the breaks to 2000
hist(USDA$VitaminC, xlab = "Vitamin C mg", main = "Hisogram of Vitamin C", xlim = c(0,100), breaks = 2000)

# Box plot

boxplot(USDA$Sugar, main = "Boxplot of Sugar Levels", ylab = "Sugar gms")
# Average is very low but we have lot of outliers with high levels of sugars


# ---- Adding Variables ----

# Problem: Suppose we want to add a variable to USDA Data
# Frame that takes a value 1 if the food has higher sodium than average, and
# 0 if the food has lower sodium than average

USDA$Sodium[1] > mean(USDA$Sodium, na.rm=TRUE)
USDA$Sodium[50] > mean(USDA$Sodium, na.rm=TRUE)

HighSodium = USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE)
str(HighSodium) # It is logical.
# Converting entries of HighSodium from Logical to Numeric
HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE))
str(HighSodium)
# How to add this vector to USDA Data frame?
USDA$HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE))

# Problem: Let us create a similar vector for Carbohydrates, Proteins,
# Fats and then add them to data frames
str(USDA)
USDA$HighCarbs = as.numeric(USDA$Carbohydrate > mean(USDA$Carbohydrate, na.rm=TRUE))
USDA$HighProtein = as.numeric(USDA$Protein > mean(USDA$Protein, na.rm=TRUE))
USDA$HighFats = as.numeric(USDA$TotalFat > mean(USDA$TotalFat, na.rm=TRUE))


# Understanding the relationship among the data
# Using 'table' and 'tapply' functions

# Table function
table(USDA$HighSodium)
table(USDA$HighFat)
table(USDA$HighSodium, USDA$HighFat)

# tapply function

# tapply(argument1, argument2, argument3)
# SELECT * 
# FROM argument1 
# WHERE ...
# GROUP BY argument2
# HAVING argument3

# Example: We want to compute the average amount of iron sorted by high and
# low protein
SELECT HighProtein, avg(Iron)
FROM
GROUP BY HighProtein
WHERE <rows are NOT NULL>

tapply(USDA$Iron, USDA$HighProtein, mean, na.rm=TRUE)
# Above command groups Iron column using HighProtein variable,
# and calculates the mean of each of those groups.

tapply(USDA$VitaminC, USDA$HighCarbs, summary, na.rm=TRUE)

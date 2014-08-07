USDA = read.csv("1_Intro/USDA.csv")
str(USDA)
summary(USDA)

# Plotting
plot(USDA$Protein, USDA$TotalFat, xlab = "Protein", ylab = "Total Fat", main = "Protein Vs Fat")
hist(USDA$VitaminC)
hist(USDA$VitaminC, xlab="Vitamin C (mg)", main="Vitamin C Levels", xlim=c(0,100), breaks=2000)
boxplot(USDA$Sugar)

# Adding Variables
USDA$Sodium[1] > mean(USDA$Sodium, na.rm=TRUE)
HighSodium = USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE)
str(HighSodium) # It is logical.
# Converting entries of HighSodium from Logial to Numeric
HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE))
str(HighSodium)
# How to add this vector to USDA Data frame?
USDA$HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE))
str(USDA)
USDA$HighCarbs = as.numeric(USDA$Carbohydrate > mean(USDA$Carbohydrate, na.rm=TRUE))
USDA$HighProtein = as.numeric(USDA$Protein > mean(USDA$Protein, na.rm=TRUE))
USDA$HighFats = as.numeric(USDA$TotalFat > mean(USDA$TotalFat, na.rm=TRUE))
table(USDA$HighSodium)
table(USDA$HighFat)
table(USDA$HighSodium, USDA$HighFat)

# Using 'tapply' function
tapply(USDA$Iron, USDA$HighProtein, mean, na.rm=TRUE)
# Above command groups Iron column using HighProtein variable,
# and calculates the mean of each of those groups.

tapply(USDA$VitaminC, USDA$HighCarbs, summary, na.rm=TRUE)

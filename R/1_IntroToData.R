load(url("http://s3.amazonaws.com/assets.datacamp.com/course/dasi/cdc.Rdata"))
# Print the names of the variables:
names(cdc)
mean(cdc$weight)
var(cdc$weight)
median(cdc$weight)
summary(cdc$weight)
# Create the frequency table here:
table(cdc$genhlth)

# Create the relative frequency table here:
table(cdc$genhlth)/20000
# Draw the barplot:
barplot(table(cdc$smoke100))
gender_smokers = table(cdc$gender, cdc$smoke100)
gender_smokers
# Create the subsets:
height_1337 = cdc[1337,5]
weight_111 = cdc[111,6]
first8 = cdc[1:8,3:5]
wt_gen_10_20 = cdc[10:20,6:9]
# Create the subsets:
very_good = subset(cdc,cdc$genhlth == "very good")
age_gt50 = subset(cdc, cdc$age > 50)
under23_and_smoke = subset(cdc, cdc$age < 23 & cdc$smoke100 == 1)
Modeling the Expert



# Read in dataset
quality = read.csv("quality.csv")

# Look at structure
str(quality)

# Table outcome
table(quality$PoorCare)

# for linear regression, we compared our predictions to the baseline method of predicting the average outcome for all data points. In a classification problem, a standard baseline method is to just predict the most frequent outcome for all observation. Since good care is more common than poor care, in this case,we would predict that all patients are receiving good care. If we did this, we would get 98 out of the 131 observations correct, or have an accuracy of about 75%. So our baseline model has an accuracy of 75%. This is what we'll try to beat with our logistic regression model.

# Baseline accuracy
98/131

# Last week, we always gave you the training data set and the testing data set in separate files.This week, we only have one data set.So we want to randomly split our data set into a training set and testing set so that we'll have a test set to measure our out-of-sample accuracy. To do this, we need to add a new package to R.
# Install and load caTools package
install.packages("caTools")
library(caTools)

# Now, let's use this package to randomly split our data into a training set and testing set. We'll do this using a function sample.split which is part of the caTools package. Since sample.split randomly splits your data,it could split it differently for each of us.To make sure that we all get the same split, we'll set our seed.This initializes the random number generator. So type set.seed(88), a number I selected.

# Randomly split data
set.seed(88)
split = sample.split(quality$PoorCare, SplitRatio = 0.75)
split

# Let's take a look at split.There is a TRUE or FALSE value for each of our observations.TRUE means that we should put that observation in the training set, and FALSE means that we should put that observation in the testing set.

# So now let's create our training and testing sets using the subset function. We'll call our training set qualityTrain and use the subset function to take a subset of quality and only taking the observations for which split is equal to TRUE. We'll call our testing set qualityTest and, again, use the subset function to take the observations of quality, but this time those for which split is equal to FALSE.

# Create training and testing sets
qualityTrain = subset(quality, split == TRUE)
qualityTest = subset(quality, split == FALSE)
nrow(qualityTrain)
nrow(qualityTest)

# Now, we are ready to build a logistic regression model using OfficeVisits and Narcotics as independent variables. We'll call our model QualityLog and use the "glm" function for "generalized linear model" to build our logistic regression model.We start by giving the equation we want to build just like in linear regression. We start with the dependent variable, and then the tilde sign, and then the independent variables we want to use separated by the plus sign. We then give the name of the data set we want to use to build the model, in this case, qualityTrain. For a logistic regression model, we need one last argument, which is family=binomial.

# Logistic Regression Model
QualityLog = glm(PoorCare ~ OfficeVisits + Narcotics, data=qualityTrain, family=binomial)

# For a logistic regression model, we need one last argument, which is family=binomial.This tells the glm function to build a logistic regression model.

summary(QualityLog)

# he output looks similar to that of a linear regression model. What we want to focus on is the coefficients table. This gives the estimate values for the coefficients, or the betas, for our logistic regression model. We see here that the coefficients for OfficeVisits and Narcotics are both positive, which means that higher values in these two variables are indicative of poor care as we suspected from looking at the data. We also see that both of these variables have at least one star, meaning that they're significant in our model.

# The last thing we want to look at in the output is the AIC value. This is a measure of the quality of the model and is like Adjusted R-squared in that it accounts for the number of variables used compared to the number of observations. Unfortunately, it can only be compared between models on the same data set. But it provides a means for model selection. The preferred model is the one with the minimum AIC. Now, let's make predictions on the training set. We'll call them predictTrain and use the predict function to make predictions using the model QualityLog, and we'll give a second argument, which is type="response".

# Make predictions on training set
predictTrain = predict(QualityLog, type="response")

# This tells the predict function to give us probabilities.Let's take a look at the statistical summary of our predictions.

# Since we're expecting probabilities, all of the numbers should be between zero and one. And we see that the minimum value is about 0.07 and the maximum value is 0.98.

# Analyze predictions
summary(predictTrain)

# Let's see if we're predicting higher probabilities for the actual poor care cases as we expect. To do this, use the tapply function, giving as arguments predictTrain and then QualityTrain$PoorCare and then mean. This will compute the average prediction for each of the true outcomes. So we see that for all of the true poor care cases, we predict an average probability of about 0.44. And all of the true good care cases, we predict an average probability of about 0.19. So this is a good sign, because it looks like we're predicting a higher probability for the actual poor care cases. Now that we have our model, in the next video, we'll discuss how to assess the accuracy of our predictions. 

tapply(predictTrain, qualityTrain$PoorCare, mean)

# Exercise:
# In R, create a logistic regression model to predict "PoorCare" using the independent variables "StartedOnCombination" and "ProviderCount". Use the training set we created in the previous video to build the model.

QualityLog2 = glm(PoorCare ~ StartedOnCombination + ProviderCount, data=qualityTrain, family=binomial)
summary(QualityLog2)

# What is the coefficient for "StartedOnCombination"?

# 1.95

# StartedOnCombination is a binary variable, which equals 1 if the patient is started on a combination of drugs to treat their diabetes, and equals 0 if the patient is not started on a combination of drugs. All else being equal, does this model imply that starting a patient on a combination of drugs is indicative of poor care, or good care?

# Poor Care (Look at the value of AIC)

# Video 5

# Confusion matrix for threshold of 0.5
table(qualityTrain$PoorCare, predictTrain > 0.5)

# Sensitivity and specificity
10/25
70/74

# Confusion matrix for threshold of 0.7
table(qualityTrain$PoorCare, predictTrain > 0.7)

# Sensitivity and specificity
8/25
73/74

# Confusion matrix for threshold of 0.2
table(qualityTrain$PoorCare, predictTrain > 0.2)

# Sensitivity and specificity
16/25
54/74


# Install and load ROCR package
install.packages("ROCR")
library(ROCR)

# Prediction function
ROCRpred = prediction(predictTrain, qualityTrain$PoorCare)

# Performance function
ROCRperf = performance(ROCRpred, "tpr", "fpr")

# Plot ROC curve
plot(ROCRperf)

# Add colors
plot(ROCRperf, colorize=TRUE)

# Add threshold labels 
plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))

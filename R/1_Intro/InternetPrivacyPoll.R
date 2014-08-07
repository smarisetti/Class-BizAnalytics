poll=read.csv("1_Intro/AnonymityPoll.csv")
summary(poll)
str(poll)

# How many interviewees responded that they use a smartphone?
table(poll$Smartphone)
# How many interviewees responded that they use a smartphone?
# How many interviewees did not respond to the question, resulting in a missing value, or NA, in the summary() output?

table(poll$Sex, poll$Region)
table(poll$State, poll$Region, na.rm=TRUE)

#Which was the state in the South census region with the largest number of interviewees?

# How many interviewees reported neither Internet use nor smartphone use?
table(poll$Smartphone, poll$Internet)
# How many interviewees have a missing value for their Internet use?
summary(poll$Internet)

# obtain a data frame called "limited", which is limited to interviewees who reported Internet use or who reported smartphone use.

limited = subset(poll, poll$Internet == 1 | poll$Smartphone == 1)
str(limited)
summary(limited)
# How many interviewees reported a value of 0 for Info.On.Internet?
table(poll$Info.On.Internet)

# What proportion of interviewees who answered the Worry.About.Info question worry about how much information is available about them on the Internet?
table(poll$Worry.About.Info)
386/(404+386)

# What proportion of interviewees who answered the Anonymity.Possible question who think it is possible to be completely anonymous on the Internet?
table(poll$Anonymity.Possible)
278/(475+278)

# Build a histogram of the age of interviewees. What is the best represented age group in the population?
hist(limited$Age)

plot(limited$Age, limited$Info.On.Internet)

# What is the largest number of interviewees that have exactly the same value in their Age variable AND the same value in their Info.On.Internet variable? 
table(limited$Age, limited$Info.On.Internet)

# "jitter" adds or subtracts a small amount of random noise to the values passed to it, and two runs will yield different results
jitter(c(1,1,1))
# Now use jitter to plot the age and info.on.internet and see the difference in the plot from previous plot.
plot(jitter(limited$Age), jitter(limited$Info.On.Internet))

# obtain the summary of the Info.On.Internet value, broken down by whether an interviewee is a smartphone user.
tapply(limited$Info.On.Internet, limited$Smartphone, summary)
tapply(limited$Tried.Masking.Identity, limited$Smartphone, summary)
table(limited$Tried.Masking.Identity, limited$Smartphone)

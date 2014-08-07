IBM=read.csv("1_Intro/IBMStock.csv")
GE=read.csv("1_Intro/GEStock.csv")
ProcterGamble=read.csv("1_Intro/ProcterGambleStock.csv")
CocaCola=read.csv("1_Intro/CocaColaStock.csv")
Boeing=read.csv("1_Intro/BoeingStock.csv")

IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
GE$Date = as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

plot(CocaCola$StockPrice ~ CocaCola$Date, type="l", col="red")

# Now, let's add the line for Procter & Gamble too. 
# You can add a line to a plot in R by using the lines 
# function instead of the plot function. 
# Keeping the plot for Coca-Cola open, type in your R console:

lines(ProcterGamble$Date, ProcterGamble$StockPrice, col="blue")
abline(v=as.Date(c("1983-01-01")), lwd=2)

plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(IBM$Date[301:432], IBM$StockPrice[301:432], col="purple")
lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col="blue")
lines(GE$Date[301:432], GE$StockPrice[301:432], col="black")
lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col="orange")

abline(v=as.Date(c("2000-03-01")), lwd=2)

tapply(IBM$StockPrice, months(IBM$Date), mean)

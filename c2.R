# Create the sums of steps per date
DFsteps <- tapply(DF$steps, DF$date, FUN=sum, na.rm=TRUE)

# Perform histogram of steps per day
library(ggplot2)
qplot(DFsteps, binwidth=1000, xlab="total number of steps taken each day")

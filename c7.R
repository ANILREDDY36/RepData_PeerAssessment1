# Preparation environment
library(ggplot2)
library(gridExtra)
require(gridExtra)

# Perform histogram of steps per day
plot1 <- qplot(DFsteps, 
               binwidth=1000, 
               ylim=c(0,15),
               main="original", 
               xlab="total number of steps taken each day")

plot2 <- qplot(DFsteps2, 
               binwidth=1000, 
               ylim=c(0,15),
               main="completed", 
               xlab="total number of steps taken each day")

# Plotting 2 plot in grid
grid.arrange(plot1, plot2, ncol=2)

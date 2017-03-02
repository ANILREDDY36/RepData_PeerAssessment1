library(ggplot2)
library(gridExtra)

# Formatting and expanding DF2 by $WD (Weekday in German) an $WDG (WeekDayGroup)
DF2[,2] <- as.Date(DF2[,2])
DF2$WD <- weekdays(DF2[,2])
DF2$WDG <- "week"               # default = "week"

# Filling in the WeekDayGroup in German
for (i in 1:l) {
  if (DF2[i,5] == "Samstag" | DF2[i,5] == "Sonntag") {
    DF2[i,6] <- "weekend"
  }
}

DF2[,6] <- as.factor(DF2[,6])

DF2w <-subset(DF2,DF2[,6]=="week")
DF2we <-subset(DF2,DF2[,6]=="weekend")

# Recreate the means by intervals
averagesW <- aggregate(steps ~ interval, DF2w, FUN=mean)
averagesWe <- aggregate(steps ~ interval, DF2we, FUN=mean)

# prepare the plots
plot1 <- ggplot(data=averagesW, aes(x=interval, y=steps)) +
  geom_line() +
  ylim(0, 250) +
  ggtitle("Weekdays") +
  xlab("5-minute interval") +
  ylab("average number of steps taken")

plot2 <- ggplot(data=averagesWe, aes(x=interval, y=steps)) +
  geom_line() +
  ylim(0, 250) +
  ggtitle("Weekend Days") +
  xlab("5-minute interval") +
  ylab("average number of steps taken")

# use the library "gridExtra"
require(gridExtra)

# plot
grid.arrange(plot1, plot2, ncol=2)
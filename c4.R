library(ggplot2)

# Create the means by intervals
averages <- aggregate(x=list(steps=DF$steps), by=list(interval=DF$interval),FUN=mean, na.rm=TRUE)

ggplot(data=averages, aes(x=interval, y=steps)) +
  geom_line() +
  ggtitle("Time Series: average number of steps") +
  xlab("5-minute interval") +
  ylab("average number of steps taken")

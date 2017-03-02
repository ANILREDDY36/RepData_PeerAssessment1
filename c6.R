# copy of data frame
DF2 <- DF

# add column for copleating index
DF2$CI <- "original"

# number of rows to check
l <- nrow(DF2)

# numbers of NAs
length(which(is.na(DF2$steps)))
# replace NAs by corresponing mean of the same interval --> complete data frame DF2
for (i in 1:l) {
  if (is.na(DF2[i,1])) {
    DF2[i,1] <- averages[averages$interval == DF2[i,3],2]
    DF2[i,4] <- "completed"
  }
}

# numbers of NAs / completed (control)
length(which(is.na(DF2$steps)))
length(which(DF2$CI=="completed"))
# Recreate the sums of steps per date
DFsteps2 <- tapply(DF2$steps, DF2$date, FUN=sum, na.rm=TRUE )

# Recreate the mean and median of steps per date
stepsMean2 <- mean(DFsteps2)
stepsMedian2 <- median(DFsteps2)

c(stepsMean2, stepsMean)
c(stepsMedian2, stepsMedian)

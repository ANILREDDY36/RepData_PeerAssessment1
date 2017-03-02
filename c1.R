if(!file.exists('activity.csv')){
  unzip('activity.zip')
}
DF <- read.csv('activity.csv')
str(DF)
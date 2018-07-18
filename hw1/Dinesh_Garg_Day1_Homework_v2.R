
## Set the working directory
setwd('~/HarvardSummerStudent2018/lessons/1_July16-Intro2R/day1_homework')


## Load the libraries, maps ggplot ggmap, ggthemes, rbokeh, and leaflet
library(maps)
library(ggplot2)
library(ggmap)
library(ggthemes)
library(rbokeh)
library(leaflet)

## Exercises
# 1. Read in diamonds.csv data and call it 'df'
df<-read.csv('diamonds.csv')

# 2. Examine the first 10 rows of data
head(df, 10)

# 3. What is the first value for the 'color' column when looking at head()?
# Answer: E

# 4. Create a new data frame called 'diamonds' by sorting the 'df' object by price and decreasing is FALSE
diamonds <- df[order(df$price, decreasing=F),]

# 5. Examine the last 6 rows by calling 'tail()' on the 'diamonds' data frame.  What is the most expensive diamond in the set?
tail(diamonds)
# Answer: 18823

# 6. Copy and paste the results of the 'summary()' stats for the 'caret' attribute below.  You can use either $ or the index to get the vector
# summary(diamonds$carat)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
# 0.2000  0.4000  0.7000  0.7979  1.0400  5.0100

# Introducing additional functions to try out, don't worry these are straight forward:
?max
?min
?range

# 7. What is the maximum value for the "depth" attribute?
# Answer:79

# 8. What is the minimum value for the "table" attribute?
# Answer: 43

# 9. What is the range of values for the "price" column?
# Answer: 326 18823

# 10. Find the 347th diamond in the data set using row indexing.  Copy paste the single row below.
diamonds[347,]
# carat   cut color clarity depth table price    x    y    z
# 6707   0.3 Ideal     J     VS1  62.2    57   411 4.27 4.28 2.66

# 11. Create a barplot of the diamonds' cut and name it barplot.jpg

jpeg('barplot.jpg')
barplot(table(diamonds$cut) , main="Diamonds : Cut distribution")
dev.off()

# 12. Create a ggplot scatterplot of points with the following aesthetics:
# color = clarity
# x axis = carat
# y axis = price
# point size size = 0.25
# theme = theme_economist_white()
# legend = none

ggplot(df, aes(color=df$clarity)) + geom_point(aes(x=df$carat, y=df$price), size=0.5) + theme_economist_white() + theme(legend.position="none")


# 13. Examine the price distribution by creating a ggplot geom_histogram() instead of a scatter plot layer.  Use the code scaffold below with the following parameters:
# data = diamonds
# type = geom_histogram
# x = price (we are only examining a single attribute here)
# bin width = 100

ggplot(data=diamonds) + geom_histogram(aes(x=df$price), binwidth=100)


#14. What is the class() of the carat vector?  HINT: apply class() as a function to the carat column using $ or index number
# numeric

#15. What is the class of the color vector?
# factor

#16. Read in the WesternCellTowers.csv cell towers as westTowers
westTowers <- read.csv('WesternCellTowers.csv')
westTowers$state<-trimws(westTowers$state, which='both')

#17. Using map() create a state map of 'oregon', 'utah', 'nevada', 'california' & add points() with westtowers$lon,westtowers$lat, col='blue'
map('state', region = c('oregon', 'utah', 'nevada', 'california'))
points(westTowers$lon,westTowers$lat, col='blue')

#18. Load the county map data called counties (HINT: with map_data)
countyData <- map_data('county')
ggplot() +
  geom_polygon(data = countyData, aes(x=long, y = lat, color = region)) +
  coord_fixed(1.3) +
  theme_gdocs() + theme(legend.position="none")

#19. Load the state data called Wstates
allStates <- map_data('state')
ggplot() +
  geom_polygon(data = allStates, aes(x=long, y = lat, color = region)) +
  coord_fixed(1.3) +
  theme_gdocs() + theme(legend.position="none")

#20. Subset counties and allStates into the objects below; add the last state, washington, to the search index
westernCounties <- countyData[countyData$region %in% c("oregon","utah", "california", "washington"),]
westernStates <- allStates[allStates$region %in% c("oregon","utah", "california", "washington") ,]


#21. Using the scaffolding below create a ggplot map of the cell phone towers in the 4 western states.  The first layer will be counties, then add states for a black outline and finally add the points of the westTowers
ggplot(data = westernCounties, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "white", fill = "lightgrey") +
  geom_polygon(data=westernStates, aes(x=long, y=lat, group=group), fill= NA, color='black') +
  geom_point(data=westTowers, aes(x=lon, y=lat, group=1), color='red', alpha=0.15) +
  theme_gdocs()

# End


## Set the working directory
setwd('~/HarvardSummerStudent2018/lessons/1_July16-Intro2R/day1_homework')


## Load the libraries, maps ggplot ggmap, ggthemes, rbokeh, and leaflet
library(maps)
library(ggplot2)
library(ggmap)
library(ggthemes)
library(rbokeh)
library(leaflet)
#install.packages("GGally")
library(GGally)

# load data
df<-read.csv('ToyotaCorolla.csv')

# inspect all the variables
str(df)

# using cor I learnt theat there is a strong -ve correlation in these 2 pairs
cor(df$Price, df$Age_08_04)
# I drew the graph to confirm
plot(df$Price, df$Age_08_04)

# I found this GGally package in which there is a function called ggcorr which helped me find correlations in all pairs of variables
ggcorr(df)

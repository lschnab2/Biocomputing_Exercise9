#Schnabel Biocomputing Exercise 9


#1. This code will set the correct working directory, and load the salinity tolerance of 
#zooplankton data, and save it to a data vector called salinity 

setwd("~/Desktop/IntrotoBiocomputing")

salinity<-read.table("Salinity-Zooplankton-Data.txt",header=TRUE, sep="\t", stringsAsFactors=FALSE)

#load any necessary packages
library(ggplot2)
library(cowplot)

# This produces a scatter plot with a trend line of the two variables in the salinity data with 
#MgCl2 concentration versus percent survival

ggplot(data = salinity, 
       aes(x = MgCl2.Concentration, y = Percent.Survival)) +
  geom_point() + 
  stat_smooth(method="lm") +
  theme_classic()

#2.This code will read data from the text file in the current working directory

setwd("~/Desktop/IntrotoBiocomputing/Biocomputing_Exercise9-master")
data<-read.csv("data.txt", header=TRUE)

#Generates a bar plot of the means of the four populations 
barplot<-ggplot(data, aes(x=region, y=observations)) + 
  geom_bar(stat="summary", fun="mean", fill="green") +
  ylab("mean observations") +
  ggtitle(label="Bar plot of mean observations by region")
barplot

#Generate a scatter plot of all observations 
scatterplot<-ggplot(data, aes(x=region, y=observations)) +
  geom_jitter(width=.3, height=0, alpha=.8,color="blue") +
ggtitle(label="Scatter plot of all observations by region")
scatterplot

# QUESTION: Do the bar and scatter plots tell you different stories? Why?
# ANSWER: Yes, because the barplot displays the mean observations per region, whereas the scatterplot
# shows all the observations per region, and the distribution of the points. Whereas on the barplot, 
# the mean appears to be around 15 observations, and is relatively the same across regions, 
# the mean in the scatter plot looks vastly different across the regions, especially in the south;
# however, there are two clusters where the data is, which is 5 and 25, which would then average 
# to be around 15. The scatter plot thus shows a fuller picture, but requires intuitive processing 
# of the clusters to estimate metrics like the mean of these spatially distributed points 
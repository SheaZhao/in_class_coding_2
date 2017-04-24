# Week 2 labs

## "USArrests" lab ####
# Use the “USArrests” data set to answer the following questions: (this data set
# belongs to the “datasets” library). FYI, Murder and Rape numbers are per
# 100,000. You can find more info about the data set here:
# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/USArrests.html

# load library & data
library(datasets)
library(dplyr)
library(ggplot2)

USArrests <- USArrests

arrests <- USArrests

# examine data

colnames(arrests)
str(arrests)
View(arrests) # rows are by state, but this column has no name


# so first, I'm going to name the column with states, "State"
arrests_2 <- setNames(cbind(rownames(arrests), arrests, row.names = NULL), 
         c("State", "Murder", "Assault", "UrbanPop", "Rape"))

colnames(arrests_2) # just to check that it worked



# 1.) Which state has the highest rate of Murder? How about Rape?

state_by_murderRate <- arrange(arrests_2, desc(Murder), State)
state_by_murderRate # Georgia has the highest murder rate at 17.4 (per 100k)

rape_by_state <- arrange(arrests_2, desc(Rape), State)
rape_by_state # Nevada has the highest instances of rape at 12.2 (per 100k)


# 2.) Which state has the lowest rate of Murder? How about Rape?

# North Dakota has loweest murder rate & as well as the lowest instances of rape
# at 0.8 murders & 0.8 rapes (per 100k), respectively


# 3.) What is the average rate of Rape and Murder in the whole US?

summarise(arrests_2, ave_Murder = mean(Murder), ave_Rape = mean(Rape))
# the average murder rate for the US as a whole is 7.788 (per 100k)
# the average instance of rape for the US as a whole is 21. 232 (per 100k)




# 4.) Use a histogram to show the distribution of Murder rates.



# 5.) Use a plot to investigate if there is any correlation between Murder and Rape rates?



# 6.) Exclude the 3 states from the data set which have the highest rate of Rapes.

rape_by_state$State[1:3]
# Nevada, Alaska, & California have the highest rates

top_3 <- c("Nevada", "Alaska", "California")
minus_top_3 <- filter(rape_by_state, !State %in% top_3)
minus_top_3 # the top 3 states are no longer there




## "chickwts" lab ####

# Use the “chickwts” data set to answer the following questions: You can find more 
# info about the data set here:
# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/chickwts.html


# Plot a boxplot for each feed type to compare their weights.
# For the above boxplots, assign different colors to each boxplot.
# According to the plots, which feed type results in a higher weight in average?
# Which feed type has the highest weight? Which one has the lowest?
# Plot a Violin plot for each feed type to compare the distributions of their weights.


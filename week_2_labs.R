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
View(arrests) # rows are by state, but the state's column has no name


# so first, I'm going to name the column with states, "State"
arrests_2 <- setNames(cbind(rownames(arrests), arrests, row.names = NULL), 
         c("State", "Murder", "Assault", "UrbanPop", "Rape"))

colnames(arrests_2) # just to check that it worked



# 1.) Which state has the highest rate of Murder? How about Rape?

state_murder <- select(arrests_2, -(Assault:Rape))
state_murder # removed variables except for State & Murder

state_by_murderRate <- arrange(state_murder, desc(Murder))
head(state_by_murderRate) # Georgia has the highest murder rate at 17.4 (per 100k)


plot_state_mRate <- ggplot(data = state_murder, aes(x = State, y = Murder)) + 
    geom_bar(stat="identity", position="dodge", fill = "violet") + coord_flip() 

# + scale_x_discrete(limits= state_murder$State) - should put states in order by 
# murder rate, but not working...anyway...

plot_state_mRate # it's a crowded plot, but all 50 states are on there



state_rape <- select(arrests_2, -(Murder:UrbanPop))
state_rape # removed variables except for State & Rape

rape_by_state <- arrange(arrests_2, desc(Rape))
head(rape_by_state) # Nevada has the highest instances of rape at 12.2 (per 100k)

plot_state_rRate <- ggplot(data = state_rape, aes(x = State, y = Rape)) + 
    geom_bar(stat="identity", position="dodge", fill = "blue") + coord_flip()

plot_state_rRate # another crowded plot, but otherwise good




# 2.) Which state has the lowest rate of Murder? How about Rape?

tail(state_by_murderRate)
tail(rape_by_state)

# North Dakota has loweest murder rate & as well as the lowest instances of rape
# at 0.8 murders & 0.8 rapes (per 100k), respectively

state_mRate_scatPlot <- ggplot(state_by_murderRate, aes(Murder, State)) +
    geom_point(size = 1) 

state_mRate_scatPlot # pretty ugly & unhelpful scatter plot
    

state_rRate_scatPlot <- ggplot(rape_by_state, aes(Rape, State)) +
    geom_point(size = 1) 

state_rRate_scatPlot # again, scatter plot not great for this kind of data



# 3.) What is the average rate of Rape and Murder in the whole US?

summarise(arrests_2, ave_Murder = mean(Murder), ave_Rape = mean(Rape))
# the average murder rate for the US as a whole is 7.788 (per 100k)
# the average instance of rape for the US as a whole is 21. 232 (per 100k)


# before graphing murders & rapes for the entire US, I will rearrage the data a 
# little using dplyr:
US_mRate <- select(arrests_2, Murder)
US_mRate

US_rRate <- select(arrests_2, Rape)
US_rRate 

# now make box plots:
US_mRate.boxplot <- boxplot(US_mRate[,1])   
US_mRate.boxplot # very basic boxplot, but it works

US_rRate.boxplot <- boxplot(US_rRate[,1]) # use col 1 b/c only 1 col in US_rRate  
US_rRate.boxplot




# 4.) Use a histogram to show the distribution of Murder rates.

US_mRate.hist <- ggplot(US_mRate, aes(Murder)) + geom_histogram() +
    geom_vline(aes(xintercept=mean(Murder, na.rm=T)),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1)
US_mRate.hist



US_rRate.hist <- ggplot(US_rRate, aes(Rape)) + geom_histogram() +
    geom_vline(aes(xintercept=mean(Rape, na.rm=T)),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1) 
US_rRate.hist




# 5.) Use a plot to investigate if there is any correlation between Murder and Rape rates?

# I want to make a scatter plot looking at the variables of the US as a whole
# so I'm goint to make a data frame w/o the State col

US_all_data <- select(arrests_2, -(State))
head(US_all_data)

# murder vs rape histogram

US_all_data.scatplot <- ggplot(US_all_data, aes(Murder, Rape, colour = "organe")) +
    geom_point() 

US_all_data.scatplot


abline(lm(waiting ~ duration))



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

# libraries are already loaded, load data

chickwts <- chickwts
chickwts # 2 variables - "weight" (grams) & type of "feed"


# 1.) Plot a boxplot for each feed type to compare their weights.


# 2.) For the above boxplots, assign different colors to each boxplot.


# 3.) According to the plots, which feed type results in a higher weight in average?


# 4.) Which feed type has the highest weight? Which one has the lowest?


# 5.) Plot a Violin plot for each feed type to compare the distributions of their weights.


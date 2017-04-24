# load ggplot

library(ggplot2)

mtcars <- mtcars

mpg <- mpg

## examples from class ####

## basic plot - not using ggplot2 ####

plot(mtcars[,1]) # simple plot of points in col 1

hist(mtcars[,1]) # histogram of col 1

boxplot(mtcars[,1]) # boxplot of col 1


## ggplot2 plots ####

ggplot(mpg, aes(hwy)) + geom_histogram() # basic histogram

ggplot(mpg,aes(hwy))+geom_histogram(binwidth=5) # changing the range of each column

ggplot(mpg, aes(hwy)) + geom_histogram(bins = 7) # bins = number of bars

ggplot(mpg, aes(hwy)) + geom_histogram(binwidth = 5, color = 'red', fill = 'green') 
# fill & outline colors

ggplot(mpg, aes(hwy)) + geom_histogram(binwidth = 5, color = 'red', fill = 'green') + 
    ggtitle("Distribution of Hwy mpg") # adding a title

ggplot(mpg,aes(hwy)) + geom_histogram(binwidth=5,color="red",fill ="blue") +
    theme(text = element_text(size=15)) # changing label size

ggplot(mpg,aes(hwy)) + geom_histogram(binwidth=5,color="red",fill="blue") +
    xlab("Hwy mpg") + ylab("Frequency") # changing label name

ggplot(mpg,aes(hwy)) + geom_histogram(binwidth=5,color="red",fill="blue") +
    ylim(0,125) # can change x or y axis scale w/ xlim or ylim

ggplot(mpg, aes(hwy)) + 
    geom_histogram(binwidth = 5, color = 'red', fill = 'green') + 
    ggtitle("sample") +
    theme_bw() # change theme - background


ggplot(mpg, aes(hwy)) + 
    geom_density(color = 'red', fill = 'green') + 
    ggtitle("sample") +
    theme_bw() # desity plot - smoothed distribution


ggplot(mpg,aes(manufacturer)) + geom_bar(fill= "violet") # one variable bar graph


ggplot(mpg,aes(cty,hwy))+geom_point(color="green",size=7) # two varible scatter plot


ggplot(mpg,aes(class,hwy,color=class))+geom_point() 
# compare distributions - scatter plot where x is a character variable


# for the sake of the following examples, I'm making a bigger data set with more 
# variables below:
newMPG=rbind(mpg,mpg,mpg,mpg,mpg,mpg)
newMPG$hwy=newMPG$hwy+runif(nrow(newMPG),min=0,max=1)

ggplot(newMPG,aes(class,hwy,color=class))+geom_point() 
# same data, just more of it. but now that we have lots of overlap, we can use geom_jitter

ggplot(newMPG,aes(class,hwy,color=class))+geom_jitter() 
# jitter introduces random noise that seperates our points & allows us to view 
# the distribution more clearly

ggplot(mpg,aes(class,hwy))+geom_boxplot() # 2 variable box plot

ggplot(mpg,aes(class,hwy,color=class))+geom_boxplot() # w/ colors by class of x

ggplot(mpg,aes(class,hwy,fill=class))+geom_boxplot() # W/ fill by class of x

ggplot(mpg,aes(class,hwy)) + 
    geom_violin(scale = "area",color = "blue", fill = "gray") # violin plot

ggplot(mpg,aes(cty,hwy,color=class))+geom_point(size=7) # colorful scatter plot

ggplot(mpg,aes(fl,fill=class))+geom_bar()
# bar graph for discrete values - multicolor by class w/ layered bars



# Three Variables Heatmap:
x=c(1,1,1,2,2,2,3,3,3)
y=c(1,2,3,1,2,3,1,2,3)
z=c(1,4,4,2,3,6,6,1,8)
myData=data.frame(X=x,Y=y,Z=z)
ggplot(myData,aes(X,Y,fill=Z))+geom_tile()



## Plot.ly ####
# for making interaactive graphics - get ideas:  https://plot.ly/r/

install.packages("plotly")

library(plotly)

d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x = ~carat, y = ~price, color = ~carat,
          size = ~carat, text = ~paste("Clarity: ", clarity))



                                         
                                         
                                         
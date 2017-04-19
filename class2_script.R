# load ggplot

library(ggplot2)

mtcars <- mtcars

mpg <- mpg

ggplot(mpg, aes(hwy)) + geom_histogram()

ggplot(mpg, aes(hwy)) + geom_histogram(bins = 7) # bins = number of bars

ggplot(mpg, aes(hwy)) + geom_histogram(binwidth = 5, color = 'red', fill = 'green') # colors


ggplot(mpg, aes(hwy)) + geom_histogram(binwidth = 5, color = 'red', fill = 'green') + ggtitle("sample")

ggplot(mpg, aes(hwy)) + 
    geom_histogram(binwidth = 5, color = 'red', fill = 'green') + 
    ggtitle("sample") +
    theme_bw()


ggplot(mpg, aes(hwy)) + 
    geom_density(color = 'red', fill = 'green') + 
    ggtitle("sample") +
    theme_bw()






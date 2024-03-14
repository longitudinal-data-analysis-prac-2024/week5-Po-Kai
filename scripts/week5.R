# clean up environment and load

rm(list=ls())  

library(tidyverse)

## PROBLEM 1 ##

> visualizing your data is important!
> summary statistics can be highly misleading, and simply plotting the data can reveal a lot more!
> Lets look at the Anscombe’s Quartet data. There are four different data sets.
> Anscombe, F. J. (1973). "Graphs in Statistical Analysis". American Statistician. 27 (1): 17–21. doi:10.1080/00031305.1973.10478966. JSTOR 2682899.

anscombe_quartet = readRDS("anscombe_quartet.rds")

# let's explore the dataset 
str(anscombe_quartet)

# what does the function str() do? 


# let's check some summary statistics:

anscombe_quartet %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )

# what do the summary statistics tell us about the different datasets? 

# let's plot the data with ggplot:

require(ggplot2)

 ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)

#save the plot

ggsave("anscombe_quartet.png", width = 20, height = 20, units = "cm")

# what do the plots tell us about the different datasets? 
# describe the relationship between x and y in the different datasets. 

# would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset?

# what conclusions can you draw for the plots and summary statistics? 




## PROBLEM 2 ##

# load in the datasaurus dataset
datasaurus_dozen = readRDS("datasaurus_dozen.rds")

# explore the dataset 
str(datasaurus_dozen)

datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )
# how many rows and columns does the datasaurus_dozen file have? 
3 columns 1846 rows
# plot the dataset 
require(ggplot2)

 ggplot(datasaurus_dozen, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
 
# calculate the correlations and summary statistics for x and y in all datasets: 

# save the plot 
 
ggsave("datasaurus_dozen.png", width = 20, height = 20, units = "cm")

# what conclusions can you draw for the plots and summary statistics? 
You cant thoroughly understand the data by just looking at the summary statistics.
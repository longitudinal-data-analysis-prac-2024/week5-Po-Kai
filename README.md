---
title: "week5"
output: html_document
date: "2024-02-08"
---

```{r setup1, include=FALSE}
# clean up environment and load

rm(list=ls())  

library(tidyverse)

anscombe_quartet = readRDS("dataset\anscombe_quartet.rds")
```

Let's explore the dataset

```{r explore1}
 
str(anscombe_quartet)
```

## what does the function str() do?
The function str allows us to inspect the data. 

```{r summary statistics1}
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
```
## what do the summary statistics tell us about the different datasets?
They share similar means of x and y

```{r plot&save 1}
require(ggplot2)

 ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
 
#save the plot

ggsave("anscombe_quartet.png", width = 20, height = 20, units = "cm")
```

## what do the plots tell us about the different datasets? 
I... don't know?

## describe the relationship between x and y in the different datasets. 
data1 to data3 are mostly linear just slightly tilted, but data 4 is just a y axis

# would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset?
No, not in data4

## what conclusions can you draw for the plots and summary statistics? 
You cant thoroughly understand the data by just looking at the summary statistics.

```{r setup2, include=FALSE}
# load in the datasaurus dataset
datasaurus_dozen = readRDS("datasaurus_dozen.rds")
```

Let's explore the dataset

```{r explore2}
# explore the dataset 
str(datasaurus_dozen)

```

Let's check some summary statistics:

```{r summary statistics2}


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
```

## how many rows and columns does the datasaurus_dozen file have? 
3 columns 1846 rows

Let's plot the data set and save

```{r plot&save 2}
# plot the dataset 
require(ggplot2)

 ggplot(datasaurus_dozen, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
 
# save the plot 
ggsave("datasaurus_dozen.png", width = 20, height = 20, units = "cm")
```

## calculate the correlations and summary statistics for x and y in all datasets: 
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

## what conclusions can you draw for the plots and summary statistics? 
You cant thoroughly understand the data by just looking at the summary statistics.

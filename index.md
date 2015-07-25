---
title       : Developing Data Products
subtitle    : Shiny App
author      : sensaven
job         : 
framework   : landslide        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



Developing Data Products - Shiny App Mean Predictor
========================================================


--- .class #id 

## Input Data Description

It uses the galton dataset provided in UsingR package which consists tabulated data set used by Galton in 1885 to study the relationship between a parent\'s height and their childrens

```r
library(UsingR)
summary(galton)
```

```
##      child           parent     
##  Min.   :61.70   Min.   :64.00  
##  1st Qu.:66.20   1st Qu.:67.50  
##  Median :68.20   Median :68.50  
##  Mean   :68.09   Mean   :68.31  
##  3rd Qu.:70.20   3rd Qu.:69.50  
##  Max.   :73.70   Max.   :73.00
```

--- 
## Usage - Input

The user scrolls the sliderbar so as to guess the average height of the parents

```r
library(shiny)
sliderInput('avg', '',value = 70, min = 64, max = 73, step = 0.05,)
```

--- 
## Usage - Output


A histogram of the distribution of the parents' heights appears and the values of the following parameters:               
* Average: The value that the user has selected in the slidebar.
* p-value: The p-value of the t-test that was conducted against the alternative hypothesis that the mean is not equal to the input mean.
* t-statistic: The t-statistic of the t-test described above.
* Mean Squared Error: The MSE of the difference of the input vs the real mean 

The R-code to create the histogram was the following:

```r
 hist(galton$parent, xlab='Parent height', col='firebrick1',main='Exploratory Data Analysis',xlim=c(64,74),ylim=c(0,250))
```

--- 
## Usage - t-test Example

If, for example, the user gave as an input the value **70**, the analysis to be done would be the following:


```r
 t.test(galton$parent,mu=70)
```

```
## 
## 	One Sample t-test
## 
## data:  galton$parent
## t = -28.835, df = 927, p-value < 2.2e-16
## alternative hypothesis: true mean is not equal to 70
## 95 percent confidence interval:
##  68.19304 68.42334
## sample estimates:
## mean of x 
##  68.30819
```



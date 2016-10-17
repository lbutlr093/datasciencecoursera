x <- matrix(rnorm(200), 20, 10)                   ## create a sample matrix of 200 random normal values
                                                  ## with 20 rows and 10 columns

apply(x, 2, mean)                                 ## using the 'apply' function takes the mean of '2'
                                                  ## meaning the mean of each column.

apply(x, 1, sum)                                  ## this works the same thing as above, but takes the
                                                  ## sum of each row instead.

## Replacements for the first few functions above
rowSums = apply(x, 1, sum)

rowMeans = apply(x, 1, mean)

colSums = apply(x, 2, sum)

colMeans = apply(x, 2, mean)


apply(x, 1, quantile, probs = c(0.25, 0.75))      ## return the 25th and 75th percentile of each row


s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))   ## mean of each listed column by month

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))   ## simplify into a table

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
                                                  ## remove NA values before computing the mean



## Car examples
library(datasets)                                 ## loading the datasets library
data(mtcars)                                      ## bringing in the mtcars dataset

tapply(mtcars$hp, mtcars$cyl, mean)               ## finding mpg based on the number of cylinders
sapply(split(mtcars$mpg, mtcars$cyl), mean)       ## same functionality

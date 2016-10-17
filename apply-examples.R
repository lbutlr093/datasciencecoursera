x <- matrix(rnorm(200), 20, 10) ## create a sample matrix of 200 random normal values
                                ## with 20 rows and 10 columns

apply(x, 2, mean)               ## using the 'apply' function takes the mean of '2'
                                ## meaning the mean of each column.

apply(x, 1, sum)                ## this works the same thing as above, but takes the
                                ## sum of each row instead.
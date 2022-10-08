
#######################################################
#  Week 0 Exercises         ####################
#######################################################


#################### Objective
# Learning how to set up a script file in R
# Installing & loading a package
# Getting help with the help manual
# extract elements from a vector
# Understand logical arguments
# Learn how to save R-script files



#################### Precept demo 

# Pound sign (#) is used at the beginning of the comments.  Therefore, 
# R will treat anything that is after a pound sign and before the line 
# break as code; i.e., pretty much all the lines in green color here
# are comments. 


#### Learning how to set up a script file in R and some basic functions:
# getwd(), setwd(), objects()
# Find out what these functions do:
# c(), seq()



# This is how you check and set up the directory for your file
getwd() # check directory
setwd("/Users/daisyhuang/Documents/Teaching/SML201_Fall2019/Precept/Precept0")
# set directory
getwd() # check directory again and see what happened
# A directory is a folder
# If you produce any graphs with this script file, the graphs will be saved
# to your directory by default.
# In the future, the dataset that you will read in for this file should also
# be placed in the directory that you set.



# This is how you check what R objects are available in your environment
objects() # `character(0)` means there is no R objects in your environment now
ls() # `objects()` and `ls()` are equivalent
# Here is an example:
a = 1:3
objects() # This shows that the object/variable `a` is in your environment.
rm(list=objects()) # rm() removes all variables that are assigned to the argument `list`
# since objects() returns the names of all the variables in your environment, 
# `rm(list=objects())` removes all the variables in your environment.

# `rm(list=ls())` and `rm(list=objects())` are equivalent

# If you want to remove just one variable, you can use rm(`variable_name`); e.g.,
a = 1:3 # create the variable `a` for the example
ls() # `a` is in the environment
rm(a) # delete the variable `a` from the environment
a



#### Create a vector
b <- 1:10 # this creates the vector `b`
b # check to see the vector
d = c(3, 5, 7) # another way to create a vector
d



#### use seq() to create a sequence
seq()
?seq #look up the help manual to see how to use the function `seq()` 
seq(1, 10, by = 2) # create a sequence of numbers from 1 to 10 with increment 2

seq(to=10, from =2, length=5) # create a sequence of numbers from 1 to 10 with 
# length 5; R will figure out the increment

# input arguments don't have to be listed in the order that shows on
# the help manual as long as you type out their names too
my.seq = seq(to=10, from =2, length=5) 
my.seq
length(my.seq) # confirm that the length is 5


seq(from =2, by=.5, length=5)
# Note that R will figure out the end-value for you in this case. Why?


#### Installing & loading a package
# Demo on how to install and load the package "babynames"
# Show that one can just use the lower-right panel for the installation
# or use the function 
# install.packages("babynames", dependencies=T)
# It's good to use install.packages() if you have a lot of packages to install

# You can access the help page of the package by
# clicking the name of the package on the `Packages` tab 
# on the lower-right panel


# How to access the dataset `births` in the package `babynames`
# Load the package `babynames`
library(babynames)
# now you have access to the dataset `births` since 
# the dataset is in the package `babynames`

# How to find out the dimensions of a dataset
dim(births)

# look at the first 6 rows (by default, `head()` looks at the first 6 rows) of `births`
head(births)

# look at the first 8 rows (by setting `n = 8`) of `birth`
head(births, n=8)

# look at the last 6 rows (by default of `head()`) of `births`
tail(births)

# look at the first 3 rows (by setting `n = 3`) of `birth`
tail(births, n=3)

# Extract out the column `year` from the dataframe `birth`
births$year
class(births$year) # What kind of R object is the column `year`? 
length(births$year)


##############################################
# The rest of the demo is optional
##############################################

#### Read in a .csv file
# Here we want to read in the Titanic dataset.  
# This dataset is in csv (i.e., comma-separated values) format--we 
# know this because the file has a `.csv` extension.  
# The function to read in data in csv file is read.csv().
?read.csv
t.ship = read.csv(file = '/Users/daisyhuang/Documents/Teaching/SML201_Fall2019/Precept/Precept0/titanic.csv')

#### Extraction from a data frame
t.ship[2,3] # extract out the element on the 2nd row and 3rd column

t.ship$Survived # extract out the column `Survived`
t.ship[,2] # extract out the column `Survived` which is the 2nd column

head(t.ship$Survived) # look at the first 6 elements in the `Survived` column.
surv = t.ship$Survived 
# assign the column `Survived` to a variable called `surv`

surv[3:15] # extract out the 3rd to 15th elements
surv[2:4] # extract out 2nd to 4th elements
surv[3:15][2:4] # extract out 2nd to 4th elements of the vector `surv[3:15]`


?mean # `mean()` returns the average of the elements in an R object
?sum  # `sum()` returns the sum of the elements in an R object
t.ship$Survived == t.ship[,2]
t.ship$Survived != t.ship[,2]
length()
# How do you check if t.ship$Survived and t.ship[,3] have 
# exactly the same vector?  I.e., the corresponding elements 
# in both vector match exactly?
# Hint: t.ship$Survived == t.ship[,3] will return a logical vector
# with TRUE and FALSE and R can do arithmetic on an object with
# TRUE and FALSE elements; R will treat TRUE as 1 and FALSE as 0


#################### Exercises

# 1. Create a vector with integers 1, 2,...365, and name this vector as "days".
# Provide the code that you used for this question below:
days=1:365

# 2. How do you extract out the even numbers in `days`?
# Hint: you can extract elements in a vector by using indices; e.g.,
# for a vector `v`
v = c(8, 10, 78, 19)
v[c(2,4)] # will extract out the 2nd and the 4th elements of `v`
# Provide the code that you used for this question below:


# 3. We will use the dataset 'airquality' in the package "datasets". 
#    "datasets" is a built-in package in R so it should be already
#    installed and loaded when you launch Rstudio.

#    (a) How big is the dataset 'airquality'?  What is the object type of
#        the dataset?  Verify your answers with the info on the help manual.
# The dataset 'airquality' has 918 observations (153 observations for 6 different variables).
# The object type is a data frame.
#    (b) Look at the first 10 rows and last 5 rows of the 'airquality'.  
#    (c) Extract out the column "Ozone" from 'airquality' and assign this column
#        to a vector called "oz".  
#    (d) How long is "oz"?  Verify this with your answer to part (a).
# oz is 153 observations
#    (e) What day does the first observation in oz correspond to?
# The first observation in oz is from Tuesday, May 1, 1973. This was found in the 'Details' section of Help.
# Provide the code that you used for this question below:
dim(airquality)
head(airquality,n=10)
tail(airquality,n=5)
airquality$Ozone
oz=airquality$Ozone
length(oz)

# 4. Install and load the `rmarkdown` package.
# Provide the code that you used to load the package below:
install.packages("rmarkdown", dependencies = T)

# 5. Please fill out the Background Survey (https://forms.gle/91t5qtzjR9Wvgatw7).


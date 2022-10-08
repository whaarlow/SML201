
#######################################################
# Precept 1 Exercise Answers       ####################
#######################################################

#################### Objective
# Learn how to use these functions:  *, /, + , -, 
# sqrt(), abs(), %%, %/%, %*%, c(), rep()
# Subsetting with []
# Subsetting with logical arguments
########################################################


#################### Precept demo (feel free to repeat anything from the lecture)


#################### This part of the demo should help you understand the following 
# Understand what these functions do:
# *, /, + , -, sqrt(), abs(), 
# %%, %/%
# Understand the difference between * and %*%
# c(), rep()
# Learn construction, concatenation, extraction and assignment techniques
#########################################################

######## Understand what *, /, + , -, sqrt(), abs() do:
# Important to know: R does vectorized calculations 

# *
2*4
c(-5, -1, 10)*2 # note that every element in the vector is multiply by 2
c(-5, -1, 10)*c(1, 2, 5) # the corresponding elements are being multiplied
# so, -5*1, -1*2, 10*5

# /
9/3
c(-5, -1, 10)/2
c(-5, -1, 10)/c(1, 2, 5)

# +
2*4 + 9/3
c(-5, -1, 10)+c(1, 2, 5)

# -
2*4 - 9/3
c(-5, -1, 10)-c(1, 2, 5)


# abs
abs(-10) # this takes the absolute value of (-10)
abs(c(-5, -1, 10)) # this takes the absolute value of each element in the vector

# sqrt
sqrt(9)
sqrt(abs(c(-5, -1, 10))) 
# this takes the square root of each element in the vector

######## Understand what %%, %/% do:
9%/%4 # this returns the quotient
9%%4 # this returns the remainder
# Note: 2 x 4 + 1 =9, so 2 is the quotient and 1 is the remainder

######## Understand what %*% does:
m = matrix(1:6, ncol=2)
# Explain the difference between %*% and *:
m * c(1,2,3)
m * c(1,2) # recycling rule
m %*% c(1,2)
# m %*% c(1,2,3) will give you an error; why?

#### Understand logical arguments
# You can extract out the elements in a vector with True and False arguments; e.g.,
(1:4)[c(T,T,F,T)]
# this is equivalent to (1:4)[c(TRUE,TRUE,FALSE,TRUE)];
# note that there is no quotation marks around the TRUE and FALSE.

# the double equal sign (==) means "to check if two elements are equal"; e.g.,
(1:4)==3
# The exclamation mark means negation, e.g.,
!((1:4)==3)
# You should check to see if the following return a result that is expected:
(1:4)[!((1:4)==3)]
# the vertical bar means "or":
(1:4)[(1:4)==3|(1:4)==4]
# Note that we can also use the >=, <=, >, < operations in a similar way; e.g.,
a = 1:4
a[a >= 3]

######## Understand what c() does

# `c()` for vectors
# Use `c()` to concatenation the input arguments into a vector 
c(-5, -1, 10)
c(c(-5, -1, 10), 10:7) # c() can also be used to concatenate 
# elements in multiple vectors into one vector.
# Note that the resulting object is just one single vector.




#################### Exercises

# 1. Last week you created the vector `days`:

days = 1:365

# and extract out the even days; now do this in a different way.

# How would you use the definition of even numbers (i.e., an 
# even number is an integer that is divisible by 2) and a logical
# argument to extract out the even numbers in "days"?
days[days%%2==0]

# 2. Suppose that the vector `days` represents the 365 days in a 
#    particular year and suppose that the first day in the year is Wednesday. 
#    What day will the last day of the year be?  Answer this question in  
#    two ways:
#    (a) Use the function %%
days%%7  # The last day of the year is also Wednesday
#    (b) Use the function rep(); use ?rep to get the help manual for the function.
rep(1:7,len=365) # The last day of the year is still Wednesday

# 3. Last week you created the `oz` vector:

oz = airquality$Ozone

#    Store the values in "oz" that correspond to weekdays to a new vector "oz.weekday",
#    and the values correspond to weekends to a new vector "oz.weekend".
#    Hint: Remember that you can find out the info about the dataset on its 
#    help manual page.
oz.weekday=(oz)[c(T,T,T,T,F,F,T)]
oz.weekend=(oz)[!c(T,T,T,T,F,F,T)]

# 4. (Hypothetical) In Course A is a course where its course grade solely depends on 
#    midterm and final exam scores.  There are 3 midterms and 1 final exam in this 
#    course.  Midterm 1 weighs 10%, midterm 2 and 3 weigh 20% each and the final
#    weighs 50%.  All scores are in the range of 0 and 100.  
#    This means that the formula to calculate the score for the course for a student is
#    course_score = a*midterm1 + b*midterm2 + c*midterm3 + d*final

#    (a) What should the values for a, b, c and d be?  Write out the formula with
#        the numeric values that you chose for a, b, c and d.
course_score = .1*midterm1 + .2*midterm2 + .2*midterm3 + .5*final
#    There are 400 students in this course and you have their midterm and final
#    exam scores.  
#    (b) Think about how you would calculate the course scores in R for all these 
#        400 students? Answer this question in two ways:
#           (i) If you make use of vectorized calculations
#           (ii) If you make use of matrix multiplications

#    Mary, Jen and Sam are three students in this course and
#    receive the following scores:
#    Mary: Midterm 1: 78, Midterm 2: 86, Midterm 3: 85, Final: 91
#    Jen:  Midterm 1: 98, Midterm 2: 95, Midterm 3: 91, Final: 96
#    Sam:  Midterm 1: 91, Midterm 2: 94, Midterm 3: 90, Final: 92

#    (c) Implement the methods that you have in part (b) for
#        Mary, Jen and Sam. Verify that you have the same answers
#        with both methods.  Also, verify you have the correct
#        answer for Mary by calculate Mary's course score by 
#        plugging her exam scores in the formula--this is a common 
#        technique used to check that your code is correct.
midterm1=c(78,98,91)
midterm2=c(86,95,94)
midterm3=c(85,91,90)
final=c(91,96,92)
course_score = .1*midterm1 + .2*midterm2 + .2*midterm3 + .5*final
course_score
[1] 87.5 95.0 91.9

w=matrix(c(.1,.2,.2,.5),nrow=4,ncol=1)
w # w = weight
     [,1]
[1,]  0.1
[2,]  0.2
[3,]  0.2
[4,]  0.5
t=matrix(c(78,86,85,91,98,95,91,96,91,94,90,92),nrow=3,ncol=4,byrow=T)
t # t = test score
     [,1] [,2] [,3] [,4]
[1,]   78   86   85   91
[2,]   98   95   91   96
[3,]   91   94   90   92
t %*% w
     [,1]
[1,] 87.5
[2,] 95.0
[3,] 91.9
# Mary's course score is 87.5 in both results.
#####################################################################
# The following is part of Problem Set 1; answers to the problem(s)
# will not be provided in the precept exercise answer keys.
# If you are not sure about your solutions, please ask help from 
# your preceptors.
#####################################################################

# 5. Getting familiar with the dataset `babynames` in the package `babynames`.


## Part a
# What kind of R object is the dataset `babynames`? 



## Part b
# How many rows and columns does `babynames` have?



## Part c
# Recall that for any built-in datasets (or datasets from a package) you 
# can read about the information about the dataset on its help manual.  
# Look at the help manual page for `babynames` and make sure that you 
# understand the definitions of the variables in `babynames`.  Read all the information
# about the dataset.
# What command line do you use to access the help manual page of `babynames`?  
# List the names of the variables along with their 
# definitions/meanings--it is okay to just copy and paste the definitions.  



## Part d
# What are the data types of the variables in `babynames`?



## Part e
# What is the range of the values for the column `n` in `babynames` 
# (i.e., what are the smallest and the largest values)? 
# Do you see any names with `n=1` in the dataset?  
# Does this mean that for every baby that was born in a particular 
# year there was always at least one other baby born in the same 
# year sharing the same name?



## Part f
# What are the earliest and the latest years the dataset `babynames` records?

# monotone

**Test, Check, Verify, Investigate the Monotonic Properties of Numeric Vectors**

This package provides several efficient functions for testining, checking, 
verify and investigating the monotonic properties of numeric vectors. 
Function **monotonicity** gives the monotonic properties of the vector, while 
a family of 'is_*' function can be used to test if a numeric vector is 
(strictly) increasing, decreasing, neither or constant. 

## install 

Install using the standard methods 

    install.packages('monotone')
     
    # -OR-
     
    devtools::install_github( "decisionpatterns/monotone")

## Usage 

    x <- 1:5
    monotoniciy(x)   
     
    is_increasing(x)  
    

### monotonicity


### is_*


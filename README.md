# monotone

**Test, Check, Verify, Investigate the Monotonic Properties of Numeric Vectors**

**monotone** provides several functions for testing/checking/verify/investigating the monotonic properties of vectors. The 'is_[strictly_]*' family of functions test vectors for 'monotonic', 'increasing', 'decreasing', 'sorted' properties; 'is_constant' and 'is_incremental' test for the degree of monotonicity. `monotoniciy` reports the degree of monotonicty.   

## install 

Install using the standard methods 

    install.packages('monotone')
     
    # -OR-
     
    devtools::install_github( "decisionpatterns/monotone")


## Usage 

The usage of the packages is probably best demonstrated by a few examples:

    x <- 1:5
    is_monotonic(x) # TRUE
    is_strictly_monotonic(x) # TRUE
    
    is_increasing(x) # TRUE    
    is_strictly_increasing(x) # TRUE
    
    is_decreasing(x) # FALSE
    is_strictly_decreasing(x) # FALSE
    
    is_sorted(x) # TRUE
    is_strictly_sorted(x) # TRUE 
    
    is_constant(x) # FALSE
    is_incremental() # TRUE
    
    monotonicity(x)  #  2 - strictly increasing
    

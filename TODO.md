# TODO

 - [ ] Add step_size function for reporting step size for incremental vectors.
 
 - [-] Should this become a vplyr (vector) plyr packages for arbitrary 
       properties and tests about vectors with unifying way to handle na.values?
       
       Probably not. these are not manipulation routines like dplyr, but rather tests
        

 - See base::is.unsorted.  There can be many uses of this but can probably 
   for example 3:0 is unsorted 
 
 - [?] change `na.action` arguments to `pre` (pre-processing) also make this 
   an option arguments
   
 - Add 
   - [ ] is_non_increasing 
   - [ ] is_non_strictly_increasing 
 
 - [ ] Should is_incremental when applied to non-numerics: 
   - error (current)
   - return FALSE
   - return FALSE with warning
   
 - [LOW:switch to base::is.unsorted] 
   is(_strictly)_[increasing|decreasing) and is_sorted should:
   - be implemented in cpp
   - be efficient by comparing sequence of values
   - [x] support all types
   
  - [ ] Provide options for 'monotonicity' to report "increasing"
    , "strictly_increasing", etc. maybe as a factor.
        
     1:10 %>% monotonicty() 
   
 - Performance not ....
#' Instead of  using diff, \code{is_increasing} and \code{is_decreasing} uses 
#' \code{cummax} and \code{cummin} respectively for efficiency. See the 
#' stackoverflow reference for timings and an explanation.


# CLOSED 

 - [x] Should most of the functionality of the package be moved to use 
   [base::is.unsorted()] as this seems to be a fast/standard method?

 - [x] Should we support *not_* functions?  
       NO. This is confusing using `%>% not()` is cleaner
       
 - [x] Should the argument be `na.rm` rather than `na.action` to match
   [base::is.unsorted(). 
   Are there other types of na.actions that can be applied.

 - What to  with ----- vectors (e.g. constants) vs /\__/ (non-monotonic)
   - [x] Add is_constant 
   

# TODO

 - See base::is.unsorted.  There can be many uses of this but can probably 
   for example 3:0 is unsorted 
 
 - [?] change `na.action` arguments to `pre` (pre-processing) also make this 
   an option arguments
   
 - Add 
   - [ ] is_non_increasing 
   - [ ] is_non_strictly_increasing 
 
 - What to do with ----- vectors (e.g. constants) vs /\__/ (non-monotonic)
   - [x] Add is_constant 
   
 - Should is_incremental when applied to non-numerics: 
   - error (current)
   - return FALSE
   - return FALSE with warning
   
 - is(_strictly)_[increasing|decreasing) and is_sorted should:
   - be implemented in cpp
   - be efficient by comparing sequence of values
   - support all types
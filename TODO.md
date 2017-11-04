# TODO

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
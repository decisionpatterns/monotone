#' @title 
#' 
#' monotonicity
#' 
#' @description 
#' 
#' Access the monotonicity of a numeric vector 
#' 
#' @param x numeric vector
#' @param na.action function to handle \code{NA} values 
#' (default:\code{\link[stats]{na.omit}})
#' @param ... additional arguments passed to \code{na.action}
#' 
#' @details 
#' 
#' \code{monotonicty} determines the monotonicy (first derivative) of a numeric 
#' vector as one of:
#' 
#'  - stictly increasing, 
#'  - increasing / montonically increasing / non-decreasing, 
#'  - decreasing / monotonically decreasing / non-increasing, 
#'  - strictly decreasing, or  
#'  - constant  
#' 
#' Monotonicity tests, e.g. [is_increasing] are more efficient at testing.
#' 
#' @return integer;
#' 
#'   - **2** : stictly increasing 
#'   - **1** : increasing / montonically increasing / non-decreasing
#'   - **0** : not-monotone 
#'   - **-1**: decreasing / monotonically decreasing / non-increasing 
#'   - **-2**: strictly decreasing 
#'   - **`NA`**:` contains only `NA`s all `na.action` did not 
#'      resolve all `NA`s 
#'
#' @references
#'   http://en.wikipedia.org/wiki/Monotonic_function
#'   http://stackoverflow.com/questions/13093912/how-to-check-if-a-sequence-of-numbers-is-monotonically-increasing-or-decreasing
#'         
#' @examples
#'   monotonicity( 1:3 )      # 2  
#'   monotonicity( c(1,1,3) ) # 1 
#'   monotonicity( c(1,0,1) ) # 0  "No monotonicity, does not apply constant"
#'   monotonicity( c(3,1,1) ) # -1
#'   monotonicity( 3:1 )      # -2
#'   
#' @md
#' @rdname monotonicity
#' @export

monotonicity <- function( x, na.action=na.omit, ... ) { 
  
  # if( ! is.numeric(x) ) stop( "monotonicity can only be determined for numeric vectors.")
  
  x <- na.action(x)
  x. <- diff( x )
  
  # EXCEPTIONS:
  if( is.logical(x.) && length(x.) == 0 ) return( as.integer(NA) )
  if( any( is.na(x.) ) ) return( as.integer(NA) )  
   
  # NB, Order matters, the more stringent the criteria comes first
  # if( all( x. == 0 ) )  return(0L)  # constant
  
  if( all( x. >  0  ) ) return(2L)  # stricty increasing 
  if( all( x. >=  0 ) ) return(1L)  # monotonically incresing

  if( all( x. < 0  ) )  return(-2L) # monotonically decreasing     
  if( all( x. <= 0 ) )  return(-1L) # strictly decreasing 
  
  return(0)
  
}

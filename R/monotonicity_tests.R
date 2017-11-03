#' @title Monotonicity tests
#' 
#' @description 
#' 
#' Test numeric vector for increasing, decreasing, strictly increasing, 
#' non-decreasing, non-increasing, constant properties
#' 
#' @param x numeric vector or one that can be coerced to one.
#' @param na.action function or NULL; action to perform on input to handle the
#'        missing values
#' @param step integer; step-size for increment or NULL; See details.
#' 
#' @details 
#' 
#' Instead of  using diff, \code{is_increasing} and \code{is_decreasing} uses 
#' \code{cummax} and \code{cummin} respectively for efficiency. See the 
#' stackoverflow reference for timings and an explanation.
#'
#' @return 
#'   logical or NA 
#'   
#' @examples 
#'   
#'   is.constant( c(1,2,3) )
#'   is.constant( rep(3,5) )
#' 
#'   is_increasing( 1:10 )                  # TRUE
#'   is_increasing( c(1,2,1,3) )            # FALSE
#'   
#'   is_increasing( c(1,NA,2,3) )           # NA 
#'   is_increasing( c(1,NA,2,3), na.omit )  # TRUE
#' 
#' @import na.actions
#' @rdname tests
#' @export

is_increasing <- function(x, na.action=na.omit, zero.action=zero.pass) { 
  
  if( ! is.numeric(x) ) stop( "monotonicity can only be determined for numeric vectors.")
  
  x <- na.action( zero.action(x) ) 
  all( x == cummax(x) )

} 

#' @rdname tests
#' @export 
is.increasing <- function(...) { 
  warning( "is.increasing is deprecated, use is_increasing instead")  
  is_decreasing(...)
}
   


#' @rdname tests
#' @export 
is_decreasing <- function(x, na.action=na.omit, zero.action=zero.pass) { 
 
  if( ! is.numeric(x) ) stop( "monotonicity can only be determined for numeric vectors.")
  x. <- na.action( zero.action(x) ) 
  all( x == cummin(x) )

} 

#' @rdname tests
#' @export 
is.decreacing <- function(...) { 
  warning( "is.decreasing is deprecated, use is_decreasing instead")  
  is_decreasing(...)
}
   


#' @rdname tests
#' @export

is_constant <- function( x, na.action=na.omit ) {
  
  if( all( is.na(x) ) ) return(NA)
  if( ! is.numeric(x) ) stop( "monotonicity can only be determined for numeric vectors.")
  
  if( ! is.null(na.action) ) x <- na.action(x)
  
  all( x == x[1] )
}


#' @rdname tests
#' @export 
is.constant <- function(...) { 
  warning( "'is.constant' will be removed. Use 'is_constant' instead.")  
}


#' @rdname tests
#' @export 
is_strictly_increasing <- function( x, na.action=na.omit ) {
  
  if( all( is.na(x) ) ) return(NA)
  if( ! is.numeric(x) ) stop( "monotonicity can only be determined for numeric vectors.")
  
  if( ! is.null(na.action) ) x <- na.action(x)
  
  all( diff(x) > 0 )
  
}
  





#' @rdname tests
#' @export 
is_strictly_decreasing <- function ( x, na.action=na.omit ) {
    
  if( all( is.na(x) ) ) return(NA)
  if( ! is.numeric(x) ) stop( "monotonicity can only be determined for numeric vectors.")
  
  if( ! is.null(na.action) ) x <- na.action(x)
  
  all( diff(x) < 0 )
  
}


#' @rdname tests
#' @export 
is_monotonoc <- function(x, na.action=na.omit ) 
  is_increasing(x,na.action) || is_decreasing(x,na.actions)



#' @rdname tests
#' @export 
is_strictly_monotonic <- function(x, na.action=na.omit) 
  is_strictly_increasing(x,na.action) || is_strictly_decreasing(x,na.actions)
  


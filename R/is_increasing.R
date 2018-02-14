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
#' @seealso 
#'  * [base::diff()]
#'  
#' @examples 
#'   
#'   is_constant( c(1,2,3) )
#'   is_constant( rep(3,5) )
#' 
#'   is_increasing( 1:5 )                   # TRUE
#'   is_increasing( c(1,2,1,3) )            # FALSE
#'   
#'   is_increasing( c(1,NA,2,3) )           # NA 
#'   is_increasing( c(1,NA,2,3), na.omit )  # TRUE
#'
#'   is_monotonic( 1:5 )                    # TRUE
#'   is_monotonic( -5:5 )                   # TRUE
#'   is_monotonic( 5:-5 )                   # TRUE
#'   is_monotonic( c(1,5,3))                # FALSE
#'   
#' @import na.actions 
#' @importFrom coercion can_be
#' @rdname tests
#' @rdname tests
#' @export

is_increasing <- function(x, na.action=na.omit, zero.action=zero.pass) { 
  
  x <- na.action( zero.action(x) ) 
  all( x[2:length(x)] >= x[1:(length(x)-1)] )

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
 
  x <- na.action( zero.action(x) ) 
  all( x[2:length(x)] <= x[1:(length(x)-1)] )
  
} 

#' @rdname tests
#' @export 
is.decreacing <- function(...) { 
  warning( "is.decreasing is deprecated, use is_decreasing instead")  
  is_decreasing(...)
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

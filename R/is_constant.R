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

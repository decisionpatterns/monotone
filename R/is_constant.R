#' @rdname tests
#' @export

is_constant <- function( x, na.rm=TRUE ) {
  
  if( all( is.na(x) ) ) return(NA)
  
  if( na.rm )
    x <- na.omit(x)
  
  all( x == x[1] )
  
}

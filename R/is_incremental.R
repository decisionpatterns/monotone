# is_incremental 
# 
# Test if a field is incrementally increasing or decreasing
#
# @param x numeric 
#' @param step integer; step size for `is_incremental`. (Default: 1)` 
# @param na.rm logical; whether to omit `NA` values. (Default: TRUE)
# 
#' @details 
#' 
#' `is_incremental` determines if x is incremental, i.e. monotonic and equally 
#' spaced. 
#' 
#' `is_uniform` is a wrapper around `is_incremental` with `step=NULL`
#' 
#' @return 
#'   logical 
#'   
#' @examples 
#' 
#'   is_incremental(1:5 )
#'   is_incremental( c(1,2,5))
#'   
#'   is_incremental(1:5, step=NULL)
#'   is_uniform(1:5)
#'
#' @rdname tests
#' @md    
#' @export 

is_incremental <- function(x, step=1, na.rm=TRUE  ) { 

  if( all( is.na(x) ) ) return(NA)
  
  # if( ! is.null(na.action) ) x <- na.action(x)
  if( na.rm ) x <- na.omit(x)
  
  d <- diff(x)
  if( is.null(step) ) 
    return( all(d == d[[1]]) ) else
    return( all(d == step ) )
  
}


#' @rdname tests
#' @export 

is_uniform <-  function(x, step=1, na.rm=TRUE )
  is_incremental( x ,step=step, na.rm=na.rm )

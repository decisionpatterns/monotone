#' is_incremental 
#' 
#' Test if a field is incrementally increasing or decreasing
#'
#' @param x numeric 
#' @param step integer; step size for increment
#' @param na.action NULL or function to pre-process data
#' 
#' @details 
#' 
#' `is_incremental` determines if x is incremental, i.e. ordered and equally 
#' spaced.
#' 
#' `is_uniform` is a wrapper around `is_incremental` with `step=NULL`
#' 
#' @return 
#'   logical 
#'   
#' @seealso 
#'  - [tests]
#'     
#' @examples 
#' 
#'   is_incremental(1:5 )
#'   is_incremental( c(1,2,5))
#'  
#' @md    
#' @export 

is_incremental <- function(x, step=1, na.action=NULL  ) { 

  if( all( is.na(x) ) ) return(NA)
  if( ! is.null(na.action) ) x <- na.action(x)
  
  d <- diff(x)
  if( is.null(step) ) 
    return( all(d == d[[1]]) ) else
    return( all(d == step ) )
  
}


#' @rdname is_incremental
#' @export 

is_uniform <- function(...) 
  is_incremental( step=NULL )
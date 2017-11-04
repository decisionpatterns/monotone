#' @rdname tests
#' @export 
is_monotonic <- function(x, na.action=na.omit ) 
  is_increasing(x,na.action) || is_decreasing(x,na.action)



#' @rdname tests
#' @export 
is_strictly_monotonic <- function(x, na.action=na.omit) 
  is_strictly_increasing(x,na.action) || is_strictly_decreasing(x,na.actions)
  
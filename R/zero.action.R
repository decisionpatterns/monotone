#' zero.action
#' 
#' Action to take on zero.valued variables, similar to 
#' \code{\link[stats]{na.action}}
#' 
#' @param object an R object, typically a numeric vector
#' 
#' @seealso \code{\link[stats]{na.action}}

zero.action <- function(object, ... ) UseMethod("zero.action")

#' @rdname zero.action
#' @export 
zero.pass <- function( object, ... ) object 

#' @rdname zero.action
#' @export 
zero.omit <- function( object, ... ) object[ object != 0 ]

#' @rdname zero.action
#' @export zero.replace
zero.replace <- function( object, value, ... ) { 
  object[ object == 0 ] <- value 
  return(object)
}

#' @details 
#' 
#' [is_sorted()] is a alias for [is_monotonic()] and [is_strictly_sorted()] is
#' an alias for [is_strictly_monotonic()].
#' 
#' @rdname tests
#' @md
#' @export   

is_sorted <- is_monotonic


#' @rdname tests
#' @md
#' @export   

is_strictly_sorted <- is_strictly_monotonic


#' @rdname tests
#' @md
#' @export   

is_unsorted <- function(...) ! is_monotonic(...) 


#' @rdname tests
#' @md
#' @export  

is_strictly_unsorted <- function(...) ! is_strictly_monotonic(...) 


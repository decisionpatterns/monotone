#' is_sorted
#' 
#' detemines whether a vector is sorted.
#' 
#' @param x 
#' @param decreasing logical; whether the sorting is de
#' @details 
#' 
#' Returns `TRUE` if `x` is sorted.
#' 
#' @seealso
#'  
#'   - [is_increasing()]
#'   - [base::is.unsorted()]
#'   
#' @examples 
#' 
#'   is_sorted(1:10)
#'   is_sorted(-5:5)
#'   is_sorted(5:-5)
#'   
#'   is_sorted( letters )
#'   is_sorted( rev(letters) )
#'   
#' @md
#' @export   

is_sorted <- function(x) {
 
  all( x == sort(x) ) || all( x == sort(x) )

}

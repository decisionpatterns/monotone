#' @details 
#' 
#' `is_[strictly_]monotonic` determine the sort properties of `x`. 
#' 
#' 
#' This differes from [base::is.unsorted()] which should more properly be called
#' `is.increasing` since `base::is.unsorted(3:1) == TRUE`; `3:1` is obviously 
#' sorted. 
#' 
#' @note
#'   The behavior of this package is The functions [base::is.unsorted()] is perhaps misnamed and should properly be
#'   names `is_not_increasing` since `base::is.unsorted(3:1) == TRUE` after all
#'   vector 3,2,1 is sorted but not increasing.  
#' 
#' @seealso
#'   * [base::is.unsorted()]
#'   
#' @examples 
#' 
#'   is_monotonic( 1:3 )
#'   is_strictly_monotonic(1:3)
#'   
#'   is_monotonic( c(1,3,2) )
#'   is_strictly_monotonic( c(1,3,2) )
#'   
#'   is_sorted(1:3)
#'   is_sorted(c(1,3,2))   
#'   
#'   lets <- letters[1:3]
#'   is_monotonic( lets )
#'   is_monotonic( c('a', 'c', 'b') )
#'   
#'   is_sorted(1:10)
#'   
#'   is_sorted(-5:5)
#'   is_sorted(5:-5)
#'   
#'   is_sorted( letters )
#'   is_sorted( rev(letters) )
#'   
#' @rdname tests
#' @export 


is_monotonic <- function(x, na.rm = TRUE )
  ! base::is.unsorted( x, na.rm=na.rm, strictly=FALSE )  || 
   ! base::is.unsorted( rev(x), na.rm=na.rm, strictly=FALSE )   # See Note
  

#' @rdname tests
#' @export

is_strictly_monotonic <- function(x, na.rm = TRUE )
  ! base::is.unsorted( x, na.rm=na.rm, strictly=TRUE ) || 
    ! base::is.unsorted( rev(x), na.rm=na.rm, strictly=TRUE ) # See Note


#' @title Monotonicity Tests
#' 
#' @description 
#' 
#' Tests vectors for (strictly) increasing, decreasing, monotonic and 
#' constant properties 
#' 
#' @param x vector
#' @param na.rm function or NULL; action to perform on input to handle the
#'        missing values
#' 
#' @param ... used for passing default arguments 
#' 
#' @details 
#' 
#' Tests to various monotone properties of vectors. 
#'
#' @return 
#'   logical or NA. (NB: NA is returned because it is a logical vector and this is 
#'   needed to put these results cleanly in tables.) 
#'
#' @seealso 
#'  * [base::diff()]
#'  
#' @examples 
#'   
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
#' @rdname tests
#' @export

is_increasing <- function(x, na.rm=TRUE ) 
  ! base::is.unsorted(x, na.rm=TRUE, strictly=FALSE ) 
  


#' @rdname tests
#' @export 
is_strictly_increasing <- function( x, na.rm=na.omit ) 
  ! base::is.unsorted(x, na.rm=TRUE, strictly=TRUE )
  

#' @rdname tests
#' @export 
is_decreasing <- function(x, na.rm=na.omit ) 
  ! base::is.unsorted( rev(x), na.rm=TRUE, strictly=FALSE ) 
  

#' @rdname tests
#' @export 
is_strictly_decreasing <- function ( x, na.rm=na.omit ) 
  ! base::is.unsorted( rev(x), na.rm=TRUE, strictly=TRUE )
  

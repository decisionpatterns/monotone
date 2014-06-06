#' monotonicity
#' 
#' Determine the monotonicity of a numeric vector as:
#'   stictly increasing, 
#'   increasing / montonically increasing / non-decreasing, 
#'   decreasing / monotonically decreasing / non-increasing, 
#'   strictly decreasing, or  
#'   constant 
#' 
#' @param x numeric vector
#' @param na.action function to handle \code{NA} values 
#' (default:\code{\link[stats]{na.omit}})
#' @param ... additional arguments passed to \code{na.action}
#' 
#' \code{monotonicty} determines the monotonicy of a numeric vector. Instead of 
#' using diff, this function uses \code{cummax} and \code{cummin} functions for
#' efficiency. See the stackoverflow reference for timings and an explanation.
#' 
#' @return integer;
#'      \code{2}  \tab for stictly increasing 
#'      \code{1}  \tab increasing / montonically increasing / non-decreasing
#'      \code{0}  \tab constant 
#'      \code{-1} \tab decreasing / monotonically decreasing / non-increasing 
#'      \code{-2} \tab strictly decreasing 
#'      \code{NA} \tab contains only \code{NAs} or \code(na.action) did not 
#'      resolve all \code{NA}s 
#'
#' @references
#'   http://en.wikipedia.org/wiki/Monotonic_function
#'   http://stackoverflow.com/questions/13093912/how-to-check-if-a-sequence-of-numbers-is-monotonically-increasing-or-decreasing
#'         
#'
#' @examples
#'   monotonicity( 1:3 )      # 2  
#'   monotonicity( c(1,1,3) ) # 1 
#'   monotonicity( c(1,0,1) ) # 0
#'   monotonicity( c(3,1,1) ) # -1
#'   monotonicity( 3:1 )      # -2
#'   
#'   is.constant(1:5)  # false
#'   is.constant(NA)
#'   
#' @export
#' @include zero.action.R
#' @rdname monotonicity

monotonicity <- function( x, na.action=na.omit, zero.action=I, ... ) { 
  
  x <- na.action(x)
  x. <- diff( x )
  if( is.logical(x.) && length(x.) == 0 ) return( as.integer(NA) )
  
  if( any( is.na(x.) ) ) return( as.integer(NA) )  
   
  # The order matters.  The more stringent the criteria comes first
  if( all( x. >  0  ) )       return(2L) # stricty increasing 
  # if( all( x == cummax(x) ) ) return(1L) # monotonically incresing
  if( all( x. >=  0 ) )       return(1L) # monotonically incresing
  
  if( all( x. < 0  ) )        return(-2L) # monotonically decreasing 
  # if( all( x == cummin(x) ) ) return(-1L) # strictly decreasing 
  if( all( x <= 0 ) )         return(-1L) # strictly decreasing 
  
  # if( all( x. == x[[1]] )) return(0L)      # constant
  
  return(0)
  
}


#' @rdname monotonicity
#' @export is.incresaing
#' @examples
#'   is.increasing( 1:10 )                  # TRUE
#'   is.increasing( c(1,2,1,3) )            # FALSE
#'   
#'   is.increasing( c(1,NA,2,3) )           # NA 
#'   is.increasing( c(1,NA,2,3), na.omit )  # TRUE
#'  
#' @include monotonicity.R 
is.increasing <- function(x, type="increasing", na.action=na.omit, zero.action=zero.pass) { 
 
  x <- na.action( zero.action(x) ) 
  all( x == cummax(x) )

} 

#' @rdname monotonicity
#' @export is.incresaing
is.decreasing <- function(x, type="increasing", na.action=na.omit, zero.action=zero.pass) { 
 
  x. <- na.action( zero.action(x) ) 
  all( x == cummin(x) )

} 


   
#' @return 
#'   \code{monotonicity} returns:
#'      \code{2}  \tab for stictly increasing 
#'      \code{1}  \tab increasing / montonically increasing / non-decreasing
#'      \code{0}  \tab constant 
#'      \code{-1} \tab decreasing / monotonically decreasing / non-increasing 
#'      \code{-2} \tab strictly decreasing 
#'      \code{NA} \tab contains only \code{NAs} or \code(na.action) did not 
#'      resolve all \code{NA}s 
#'       
#'   function (also increasing and non-decreasing), \code{-1} for a monotoni
#'    whether \code{x} is constant but returns
#'   \code{NA} if all of \code{x} is entirely \code{NA} 




#' @return 
#'   \code{is.constant} returns logical whether \code{x} is constant but returns
#'   \code{NA} if all of \code{x} is entirely \code{NA} 
#' @aliases is.constant

is.constant <- function( x, na.action=na.omit ) {}
#   if( all( is.na(X) ) ) return NA
#   x <- na.action(x)
#   all( x == x[1] )
# }  
#   
  
is.strictly.increasing <- function( x, ... ) {}
  
is.strictly.decreasing <- function () {} 
  
montonicities <- function() {} 
  


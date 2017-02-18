## Put comments here that give an overall description of what your
## functions do

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

cacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
        x <<- y
       inv <<- NULL
    }
     get <- function() x
     setinverse <- function(inverse) inv <<- inverse
     getinverse <- function() inv
     list(set=set,
          get=get,
          setinverse=setinverse,
          getinverse=getinverse)
}

# This function computes the inverse of the matrix that
# is passed to it as an argument created by the cacheMatrix above.
# The function will either cache the inverse or calculate the inverse.

cacheSolve <- function(x, ...) {
   inv <- x$getinverse()
   if(!is.null(inv)){
   message("getting cached data")
   return(inv)
   }
   matrix <- x$get()
   inv <- solve(matrix,...)
   x$setinverse(inv)
   inv
}
             
## Testing function I create
solve_matrix <- cacheMatrix(matrix(1:4, 2, 2))
solve_matrix$get()
solve_matrix$getinverse()
cachesolve(solve_matrix)

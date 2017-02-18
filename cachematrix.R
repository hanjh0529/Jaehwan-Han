## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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

## Write a short comment describing this function

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


## Two Functions that create a special object that saves a matrix and then cache its inverse

## Function that creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    
    x <<- y
    inv <<- NULL
    
  }
  
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}


## Function that computes the inverse of the special matrix created before. If the inverse of the matrix has already 
## been calculated and the matrix hasn't change, it should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  
  inv <- x$getinverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
    
  }
  data <- x$get()
  inv <- solve(mat, ...)
  x$setinverse(inv)
  inv
}

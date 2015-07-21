## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinvert <- function(invert) m <<- invert
  getinvert <- function() m
  list(set = set, get = get, setinvert = setinvert, getinvert = getinvert)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getinvert()
  if(!is.null(m)){
    message("getting cacahed data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinvert(m)
  return(m)
  ## Return a matrix that is the inverse of 'x'
}

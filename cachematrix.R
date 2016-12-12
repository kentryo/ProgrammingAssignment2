## Check for submission
## The function was modified from Dr. Peng's mean caching function.
## The function was devided into two parts. The first part is to get and store the original data and the inversed matrix.
## The second part is to validate if the matrix inversion had been caculated or not and caculate the matrix inversion if not caculated before.

## The "makeCacheMatrix" function is to get and store the original and inversed matrix data.
## The function has a list of a function. Set and get is to store the original matrix. setinvert and get invert is to store the inversed matrix.

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


## The "cacheSolve" is to calculate the matrix inverse. First, the function test if the maxtrix inverse had been caculated or not.
## If the inverse had been calculated, the function will get the inverse from cache, otherwise will caculate the inverse.

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

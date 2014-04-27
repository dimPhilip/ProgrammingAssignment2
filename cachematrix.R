## Put comments here that give an overall description of what your
## functions do
    #Together, these functions take a square matrix and return the matrix inverse.
    #For a newly input matrix, the actual inversion is carried out, returned, and
    #stored away ("cached") for sebsequent calls, saving computation time during
    #subsequemt calls.

## Write a short comment describing this function
    #Function makes a list whose elments are functions to:
      #set: "set" the matrix x into a scope level outside of the function ("cache")
      #get: "get" the matrix previously cached with "set"
      #setInverse: "set" the inverse of matrix x into a scope level outside of
                  #the function (cache)
      #getInverse: "get" the matrix inverse cached with "setInverse"
    #For consistancy of style, curly brackets "{}" are used for all functions,
    #including ones that can be written on a single lines.

makeCacheMatrix <- function(x = matrix()) {
  mi <- NULL
  set <- function(y) {
    x <<- y
    mi <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) {
    mi <<- solve
  }
  getInverse <- function() {
    mi
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
    #Function takes makeCacheMatric(some square matrix) as an arguement and
    #returns the cached inverse of the matrix if it is available, otherwise
    #it calculates, stores the result for future use ("caches"), and returns
    #the matrix inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mi <- x$getInverse()
  if(!is.null(mi)) {
    message("getting cached data")
    return(mi)
  }
  matrix <- x$get()
  mi <- solve(matrix)
  x$setInverse(mi)
  mi
}

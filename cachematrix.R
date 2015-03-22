
## two functions - first one takes matrix, defines functions and associates 
## them with the matrix environment so that once the inverse of the matrix 
## is computed and cached by the second function it can subsequently be referenced 
## and pulled from cache and will be computed again only if the matrix has changed 

## takes the matrix as input and associates the list of functions
makeCacheMatrix <- function(x = matrix()) {
  
  # initializes variable mi to hold inverse matrix  
  mi <- NULL
  
  set <- function(y) {
    
    # assigns the passed in values to the nanmed matrix in the calling environment
    x <<- y  
    
    # clears variable 'mi' if new matrix if defined
    mi <<- NULL
    
  }
  
  # defines function that returns the matrix
  get <- function() x
  
  # defines function that assigns the inverse matrix to 'mi' 
  setinverse <- function(myinverse) mi <<- myinverse
  
  # defines function that returns the inverse matrix
  getinverse <- function() mi
  
  # returns the functions defined above as a named list
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  

}


## function looks for inverse of matrix returned by makeCacheMatrix 
## if inverse was previously computed (and matrix was unchanged) it returns the cached inverse 
## otherwise, it computes and stores the inverse

cacheSolve <- function(x, ...) {
  
  # calls the getinverse function associated with previously defined matrix to retrieve the cached inverse 
  mi <- x$getinverse()
  
  # tests to see if the inverse has been computed and cached
  if(!is.null(mi)) {
    
    # if 'mi' has a value, displays the message indicating that the cached value is being retrieved
    # and then returns the previously computed inverse
    message("getting cached data")
    return(mi)
  }
  
  # if the inverse has not been cached, retrieves the matrix and stores in 'data'
  data <- x$get()
  
  # computes inverse for 'data' and stores in 'mi'
  mi <- solve(data, ...)
  
  # passes the newly computed inverse to the setinverse function to be cached
  x$setinverse(mi)
  
  # returns the newly computed inverse
  mi
}

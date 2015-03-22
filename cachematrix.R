
## creates a matrix, defines functions and associates them with the matrix environment
## so that once the inverse of the matrix is calculated it is cached and 
## and can be referenced in subsequent code rather than calculating again

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


## looks for inverse of matrix returned my makeCacheMatrix and compares matrix
## if matrix is unchanged and inverse previously computed, it returns cached inverse 
## otherwise, computes and stores the inverse

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
  
  # returns the inverse
  mi
}

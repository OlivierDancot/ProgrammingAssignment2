## This is a Coursera Assignement 2 for R-Programming Course.
## Pair of functions that cache the inverse of a matrix 
## Here we go !
  
## Creates a special matrix object that can cache its inverse 
makeCacheMatrix <- function( m = matrix() ) { 

## Init 
  i <- NULL 
  
  
## Set matrix 
  set <- function( matrix ) { 
    m <<- matrix 
    i <<- NULL 
  } 
  
 ## Get matrix 
  get <- function() { 
    
## Return the matrix 
    m 
  } 
  
  
## Now I set the inverse of the matrix 
  setInverse <- function(inverse) { 
    i <<- inverse 
  } 
  
## Get the inverse of the matrix 
  getInverse <- function() { 
    
## And I return the inverse property 
    i 
  } 
  
## Then I return a list  
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse) 
} 

## I compute the inverse of the matrix returned by "makeCacheMatrix". If the inverse has already been calculated then the "cachesolve" should retrieve the inverse from the cache. 
cacheSolve <- function(x, ...) { 
  
## I return a matrix that is the inverse of 'x' 
  m <- x$getInverse() 
  
## I just return the inverse if its already set 
  if( !is.null(m) ) { 
    message("getting cached data") 
    return(m) 
  } 
  
## I get the matrix from our object 
  data <- x$get() 
  
## Calculate the inverse using matrix multiplication 
  m <- solve(data) %*% data 
  
## I Set the inverse to the object 
  x$setInverse(m) 
  
## Finnaly I return the matrix 
  m 
} 

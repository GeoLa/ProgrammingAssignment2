## Put comments here that give an overall description of what your
## functions do

## This functions creates a 'special' matrix and sets up the get and set functions:
# 1. set the value of a matrix
# 2. get the value of a matrix
# 3. set the value of the inverse matrix using solve
# 4. get the value of the inverse matrix using solve


makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
        
}


## This functions calculates the inverse matrix of the "special matrix
## But first checks if the inverse has already been calculated 
## If it has been calculated it returns the inverse from the cache and skips the calculation

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setsolve(m)
        m
}

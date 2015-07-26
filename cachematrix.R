## These functions enable to store the inverse of a matrix.

## This function reads a matrix, and creates a list object that can store the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
		## create the cacheInverse empty variable
        cacheInverse <- NULL
		## cache the matrix
        get <- x
		## put the matrix' inverse into the cache 
        setinverse <- function(inverse) cacheInverse <<- inverse
		## returns the matrix' inverse from the cache
        getinverse <- function() cacheInverse
        ## creates the list
        list(get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## This function checks the cache for the matrix' inverse
## and get the inverse from the cache if it is already calculated
## or calculates the inverse

cacheSolve <- function(x, ...) {
		## read the cache for the matrix' inverse        
		m <- x$getinverse()
		## if the cache is not null, then print out a message and return the cached inverse
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        ## if the cache is null, then calculate the inverse
        m <- solve(x$get)
		## and calls the function thet loads the inverse matrix into the cache
        x$setinverse(m)
        m
}

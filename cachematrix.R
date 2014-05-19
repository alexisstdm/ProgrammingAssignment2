## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function uses the variable environment behavior for implement the object 
## functionality. This kind of object is used for storing the matrix information
## and the inverse when it is calculated.
makeCacheMatrix <- function(x = matrix()) {
	m_inverse <- NULL;
	set <- function(y){
		x <<- y;
		m_inverse <<- NULL;
	}
	get <- function() x;
	setinverse <- function(inverse) m_inverse <<- inverse; 
	getinverse <- function() m_inverse;
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse);
}


## Write a short comment describing this function

## This function calculates the inverse for the matrix if it is not yet calculated 
## before
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inverse <- x$getinverse();
	if (!is.null(inverse)) {
		message("getting cached data");
		return(inverse)
	}

	matrix_aux <- x$get();
	inverse <- solve(matrix_aux, ...)
	x$setinverse(inverse);
	inverse;
}

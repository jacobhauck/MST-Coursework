import numpy as np


class LinearDependenceError(BaseException):
    """Exception class that is raised to indicate linearly dependent input vectors
    """
    pass
    

def gram_schmidt(a, eps_d=1e-10):
    """
    Perform the Gram-Schmidt orthogonalization process on the columns of
    a matrix, returning orthogonalized vectors as the columns of a new matrix.
    
    :param a: n x m matrix with linearly independent columns. Raises 
        SingularMatrixError if columns of a are linearly dependent or almost
        linearly dependent (see eps_d).
    :param eps_d: Tolerance for approximate linear independence (minimum norm of
        the computed orthogonal columns). Default = 10^{-10}
    :return: n x m matrix b whose columns are orthogonal (orthonormal, if 
        normalize == True) vectors obtained by performing Gram-Schmidt 
        orthogonalization on the columns of a.
    """
    
    # ==== Input Validation ====
    
    # Ensure input has the correct data type
    a = np.array(a, dtype=float)
    assert len(a.shape) == 2
    
    # Early check for linear dependence
    if a.shape[1] > a.shape[0]:
        raise LinearDependenceError('Matrix has linearly dependent columns '
                                    '(more columns than rows)')
    
    # ==== Run Gram-Schmidt process ====
    
    # Initialization
    
    # The first step for each column is copying the corresponding column from a,
    # so we initialize the output equal to a. Since we already copied the input
    # with np.array(), we can use that memory for our output matrix
    b = a
    
    # Normalize the first column of b
    norm = np.linalg.norm(b[:, 0])
    
    # Check for approximate linear dependence before possible divide-by-zero
    if norm < eps_d:
        raise LinearDependenceError('Matrix has linearly dependent or almost '
                                    'linearly dependent columns because first '
                                    'column is almost 0')
    b[:, 0] /= norm
    
    # Iteration
    for col in range(1, a.shape[1]):
        # Recall that b[:, col] == a[:, col] because of initialization
        
        # Subtract out previous orthonormal columns
        b[:, col] -= b[:, :col] @ (b[:, :col].T @ b[:, col])
        
        # Normalize new column
        norm = np.linalg.norm(b[:, col])
        
        # Check for approximate linear dependence before possible divide-by-zero
        if norm < eps_d:
            raise LinearDependenceError('Aborting orthogonalization; matrix has '
                                        'linearly dependent or almost linearly '
                                        'dependent columns')
        b[:, col] /= norm
    
    # Return orthogonal columns
    return b


# Test example
if __name__ == '__main__':
    # Set RNG seed for reproducible results
    np.random.seed(2024)
    
    print('Test 1: random square matrix')
    a = np.random.random((5, 5))
    print('Input matrix')
    print(a)
    print()
    print('Orthonormalized matrix')
    b = gram_schmidt(a)
    print(b)
    print()
    print('Implementation worked?', np.allclose(b.T @ b, np.eye(5)))
    print()
    
    print('Test 2: random non-square matrix')
    a = np.random.random((5, 3))
    print('Input matrix')
    print(a)
    print()
    print('Orthonormalized matrix')
    b = gram_schmidt(a)
    print(b)
    print()
    print('Implementation worked?', np.allclose(b.T @ b, np.eye(3)))
    print()
    
    print('Test 3: random matrix with too many columns')
    a = np.random.random((3, 5))
    print('Input matrix')
    print(a)
    print()
    try:
        gram_schmidt(a)  # should raise an error
    except LinearDependenceError as e:
        print(e)
    print()
    
    print('Test 4: matrix with first column 0')
    a = np.array([
        [0, 1, 2],
        [0, 3, 4],
        [0, 5, 6]
    ])
    print('Input matrix')
    print(a)
    print()
    try:
        gram_schmidt(a)  # should raise an error
    except LinearDependenceError as e:
        print(e)
    print()
    
    print('Test 5: singular matrix')
    a = np.array([
        [1, 2, -1],
        [2, 5, -3],
        [3, 3, 0]
    ])
    print('Input matrix')
    print(a)
    print()
    try:
        gram_schmidt(a)  # should raise an error
    except LinearDependenceError as e:
        print(e)

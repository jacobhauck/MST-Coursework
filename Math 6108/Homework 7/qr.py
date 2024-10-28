"""QR decomposition
"""
import numpy as np


class SingularMatrixError(BaseException):
    """Exception class that is raised to indicate a singular input matrix
    """
    pass
    

def qr(a, eps_d=1e-10):
    """
    Perform QR decomposition on the given matrix a, returning the matrices
    u and t such that a = ut, where u is orthogonal, and t is upper-triangular.
    
    :param a: Nonsingular n x n matrix. Raises SingularMatrixError if a is 
        singular or almost singular
    :param eps_d: Tolerance for approximate singularity independence (minimum 
        norm of the computed orthogonal columns). Default = 10^{-10}
    :return: n x n matrix u whose columns are orthogonal and n x n 
        upper-trianguler matrix t such that a = ut.
    """
    
    # ==== Input Validation ====
    
    # Ensure input has the correct data type
    a = np.array(a, dtype=float)
    assert len(a.shape) == 2
    assert a.shape[0] == a.shape[1]  # matrix must be square
    
    # ==== Run Gram-Schmidt process while recording inner products ====
    
    # Initialization
    
    # The first step for each column is copying the corresponding column from a,
    # so we initialize the output equal to a. Since we already copied the input
    # with np.array(), we can use that memory for our output matrix
    u = a
    
    # Initialize the upper-triangular matrix with zeros so we don't have to worry
    # about setting the lower part to 0 manually.
    t = np.zeros_like(a)
    
    # Normalize the first column of u, saving the norm as the upper-left
    # entry of t
    t[0, 0] = np.linalg.norm(u[:, 0])
    
    # Check for approximate linear dependence before possible divide-by-zero
    if t[0, 0] < eps_d:
        raise SingularMatrixError('Matrix is singular or almost singular '
                                  'because first column is almost 0')
    u[:, 0] /= t[0, 0]
    
    # Iteration
    for col in range(1, a.shape[1]):
        # Recall that u[:, col] == a[:, col] because of initialization
        
        # Save inner products in t[:, col]
        t[:col, col] = u[:, :col].T @ u[:, col]
        
        # Subtract out previous orthonormal columns
        u[:, col] -= u[:, :col] @ t[:col, col]
        
        # Normalize new column, and save the norm as the current
        # diagonal element of t
        t[col, col] = np.linalg.norm(u[:, col])
        
        # Check for approximate linear dependence before possible divide-by-zero
        if t[col, col] < eps_d:
            raise SingularMatrixError('Aborting QR factorization. Matrix has '
                                      'linearly dependent or almost linearly '
                                      'dependent columns.')
        u[:, col] /= t[col, col]
    
    # Return orthogonal columns u and corresponding inner-product matrix t
    return u, t


# Test example
if __name__ == '__main__':
    # Set RNG seed for reproducible results
    np.random.seed(2024)
    
    print('Test 1: random square matrix')
    a = np.random.normal(size=(5, 5))
    print('Input matrix (a)')
    print(a)
    try:
        print()
        print('Orthogonal factor (u)')
        u, t = qr(a)
        print(u)
        print()
        print('Upper-triangular factor (t)')
        print(t)
        print()
        print('u is orthogonal?', np.allclose(u.T @ u, np.eye(5)))
        print('a = ut?', np.allclose(u @ t, a))
    except SingularMatrixError:
        print('Bad luck! You randomly chose a singular matrix')
    print()
    
    print('Test 2: matrix with too many rows')
    a = np.random.random((5, 3))
    print('Input matrix (a)')
    print(a)
    print()
    try:
        qr(a)
    except AssertionError:  # Should fail validation assertion
        print('Matrix was the wrong size')
    print()
    
    print('Test 3: matrix with first column 0')
    a = np.array([
        [0, 1, 2],
        [0, 3, 4],
        [0, 5, 6]
    ])
    print('Input matrix (a)')
    print(a)
    print()
    try:
        qr(a)  # should raise an error
    except SingularMatrixError as e:
        print(e)
    print()
    
    print('Test 4: singular matrix')
    a = np.array([
        [1, 2, -1],
        [2, 5, -3],
        [3, 3, 0]
    ])
    print('Input matrix (a)')
    print(a)
    print()
    try:
        qr(a)  # should raise an error
    except SingularMatrixError as e:
        print(e)
    print()

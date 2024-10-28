"""Projection onto a subspace spanned by two vectors
"""
import numpy as np

import gs


class ZeroVectorsError(BaseException):
    """Error to be raised when zero vectors are provided to proj2
    """


def proj2(x1, x2, x, eps_d=1e-10):
    """
    Find the orthogonal projection of a vector onto the subspace spanned
    by two given vectors.
    
    :param x1: (n) vector
    :param x2: (n) vector. x1 and x2 span the projection subspace. At least
        one of x1, x2 must be nonzero
    :param x: (n) vector to project onto the subspace
    :param eps_d: tolerance for detecing linear dependence and nonzero
        condition for x1 and x2
    :return: projection of x onto the subspace spanned by x1 and x2. Raises
        ZeroVectorsError if x1 and x2 are both 0 (or within tolerance eps_d
        of 0 in norm)
    """
    # ==== Input validation =====
    x1, x2 = np.array(x1, dtype=float).flatten(), np.array(x2, dtype=float).flatten()
    x = np.array(x, dtype=float).flatten()
    assert len(x1) == len(x2) == len(x)
    
    # ==== Construct u ====
    # Build input matrix a for gram_schmidt by stacking columnwise (axis=1)
    a = np.stack([x1, x2], axis=1)
    
    # Try to run gram_schmidt, catching possible LinearDependenceError
    try:
        u = gs.gram_schmidt(a, eps_d=eps_d)
    except gs.LinearDependenceError as e:
        # x1 and x2 are linearly dependent
        n1 = np.linalg.norm(x1)
        if n1 > eps_d:
            # Use u = x1 / norm(x1) if x1 is nonzero
            u = x1 / n1
        else:
            # Try to use u = x2 / norm(x2)
            n2 = np.linalg.norm(x2)
            if n2 > eps_d:
                u = x2 / n2
            else:
                raise ZeroVectorsError('Input vectors x1 and x2 were both (almost) 0')
    
    # ==== Projection formula ====
    return u @ u.T @ x


# Test example
if __name__ == '__main__':
    x1 = (1, 0, 1)
    x2 = (1, 1, 0)
    x = (1, 2, 3)
    print('Test with')
    print(f'x1 = {x1}')
    print(f'x2 = {x2}')
    print(f'x = {x}')
    z = proj2(x1, x2, x)
    print(f'Projection = {z}')
    
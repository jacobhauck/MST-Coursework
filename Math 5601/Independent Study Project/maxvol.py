from typing import Optional
from numpy.typing import NDArray

import numpy as np
import scipy


def maxvol(
        a: NDArray[np.float64],
        initial_rows: Optional[NDArray[np.int64]] = None,
        delta: float = 1e-2,
        max_iter: int = 100
) -> Optional[NDArray[np.int64]]:
    """
    :param a: An n x r matrix of rank r.
    :param initial_rows: A set of row indices in the matrix a giving us
    an initial nonsingular r x r submatrix. Uses Gaussian elimination to
    choose an initial set of rows if initial_rows is None.
    :param delta: delta-dominance delta value.
    :param max_iter: Maximum number of maxvol iterations.
    :return: Row indices of a delta-dominant submatrix of a. None if
    convergence fails to occur within max_iter iterations.
    """
    # input validation
    n, r = a.shape
    assert r <= n

    # In the edge case that a is square, the best we can do is return a
    # itself (that is, the submatrix rows are all the rows).
    if n == r:
        return np.arange(r)

    # Initialize a nonsingular submatrix.
    # We only track the rows of the submatrix, as we do
    # not need the submatrix itself in the algorithm, and we can always
    # retrieve the submatrix from the original matrix using the row indices.
    if initial_rows is None:
        # Use Gaussian elimination with partial pivoting to get rows
        # of a nonsingular submatrix. This operation is O(nr^2).
        p = scipy.linalg.lu(a, p_indices=True)[0]

        # Nonsingular submatrix rows are packed into the first r indices,
        submat_rows = p[:r]
        # and other rows are in the remaining indices.
        other_rows = p[r:]
    else:
        # Use given rows of a.
        submat_rows = np.array(initial_rows, dtype=int)
        # Get other rows of a.
        other_rows_set = set(range(n)).difference(map(int, submat_rows))
        other_rows = np.array(tuple(other_rows_set))
    
    # Get initial z = a[other_rows] @ (a[submat_rows])^{-1}.
    # Use np.linalg.solve to avoid computing matrix inverse.
    # Note that this operation is O(nr^2).
    z = np.linalg.solve(a[submat_rows].T, a[other_rows].T).T

    for _ in range(max_iter):
        # Get rows to swap by finding the maximum modulus element of z.
        i_rel, j = np.unravel_index(np.argmax(np.abs(z)), z.shape)
        max_mod_el = z[i_rel, j]

        # Stop if the current submatrix is delta-dominant.
        if np.abs(max_mod_el) < 1 + delta:
            return submat_rows
        
        # Update z.
        right = z[i_rel].copy()
        right[j] -= 1.

        z[i_rel, :] = 0.
        z[i_rel, j] = 1.

        z -= z[:, j : j+1] @ (right[None] / max_mod_el)

        # Update row index sequences.
        temp = submat_rows[j]
        submat_rows[j] = other_rows[i_rel]
        other_rows[i_rel] = temp
    
    # Default return value is None.


def pseudo_skeleton(a, r, rtol=1e-2, max_iter=100, delta_mv=1e-2, max_iter_mv=100):
    col_indices = np.arange(r)
    current_approx = np.zeros_like(a)

    for _ in range(max_iter):
        # row cycle
        q = np.linalg.qr(a[:, col_indices])[0]
        row_indices = maxvol(q, delta=delta_mv, max_iter=max_iter_mv)

        # col cycle
        q = np.linalg.qr(a[row_indices, :].T)[0]
        col_indices = maxvol(q, delta=delta_mv, max_iter=max_iter_mv)

        left = a[:, col_indices]
        right = np.linalg.solve(q[col_indices].T, q.T)
        next_approx = left @ right

        cauchy_error = np.linalg.norm(current_approx - next_approx)
        if cauchy_error < rtol * np.linalg.norm(current_approx):
            return row_indices, col_indices, left, right

        current_approx = next_approx


def truncated_svd(a, r):
    m, n = a.shape
    assert r <= min(m, n)

    u, d, vt = np.linalg.svd(a, full_matrices=False)
    return u[:, :r] * d[None, :r], vt[:r]

import numpy as np


def maxvol(a, initial_rows, delta=1e-2, max_iter=100):
    """
    :param a: An n x r matrix
    :param initial_rows: a set of row indices in the matrix a giving us
    an initial nonsingular r x r submatrix
    :param delta: tolerance for maximal element
    """
    r = a.shape[1]

    # permute rows of a so that initial_rows are the upper rows
    # Since the only modifications to a we will make are swapping rows,
    # we will just store the permutation of the rows of a in the index arrays
    # (upper_rows, lower_rows), and modify these instead of modifying a
    # directly, which is slightly more efficient.
    upper_rows = initial_rows

    # get lower rows of a
    lower_rows = np.array(set(range(r)).difference(map(int, upper_rows)))

    # get initial lower part z of a @ (a[uppper_rows])^{-1}.
    # upper part is I by construction
    z = a[lower_rows] @ np.linalg.inv(a[upper_rows])

    for _ in range(max_iter):
        # get rows to swap by searching for maximum modulus element of z
        i_rel, j = np.unravel_index(np.argmax(np.abs(z)), z.shape)
        
        # stop if we have a large enough volume submatrix
        if np.abs(z[i_rel, j]) < 1 + delta:
            break
        
        # update lower part of a @ a_sq_inv. Upper part is always I
        ell = z[:, j]
        ell[i_rel] += 1.

        r = z[i_rel]
        r[j] -= 1.

        z -= ell[:, None] @ (r[None, :] / z[i_rel, j])

        # update permutation of rows of a instead of a itself
        temp = lower_rows[i_rel]
        lower_rows[i_rel] = upper_rows[j]
        upper_rows[j] = temp

    return upper_rows, lower_rows

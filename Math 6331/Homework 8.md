# Homework 8

## 4.20

### (b)

To find the stable subspace for the system, we first need to find the eigenvalues and generalized eigenvectors of
$$
A = \left[\begin{matrix}.1&1&0\\ 0&.1&1\\ 0&0&2\end{matrix}\right]
$$
$A$ is an upper-triangular matrix, so the eigenvalues are on the diagonal: $\lambda_1 = .1$ with multiplicity $m_1 = 2$, and $\lambda_2 = 2$ with multiplicity $m_2 = 1$ are the eigenvalues. The generalized eigenvector corresponding to $\lambda_1$ is $E_1 = \{v \mid (A-I\lambda_1)^{m_1}v = 0\}$. We have
$$
(A-I\lambda_1)^{m_1}v = 0 \implies \left[\begin{matrix}0&1&0\\ 0&0&1 \\ 0&0&1.9\end{matrix}\right]^2v = 0 \implies v_3 = 0
$$
so $E_1 = \{v \mid v_3 = 0\}$. Since the other eigenvalue has $|\lambda_2| = 2> 1$, $E_1$ is the only generalized eigenvector corresponding to an eigenvalue with modulus less than 1, so the stable subspace for the system is just $E_1 = \{v \mid v_3 = 0\}$.

## 4.21

Let $u(0) \notin E_1$ from 4.20 (b). Then we must have $u(0) =v$, where $v_3 \ne 0$. Suppose that
$$
u(t) = \left[\begin{matrix}u_1(t)\\ u_2(t)\\ u_3(t)\end{matrix}\right]
$$Then for all $t \ge 0$
$$
|u(t+1)| \ge |u_3(t+1)| = 2|u_3(t)|
$$
It follows by induction that $|u(t)| \ge |u_3(0)|\cdot2^t = |v_3|\cdot2^t$. Since $|v_3| > 0$, it follows that
$$
\lim_{t\to\infty} |u(t)| = \infty
$$

## 4.25

### (a)

The eigenvalues and eigenvectors of
$$
A = \left[\begin{matrix}7&4\\3&6\end{matrix}\right]
$$
are $\lambda_1 = 10$, and $\lambda_2 = 3$, with corresponding eigenvectors
$$
v_1 = \left[\begin{matrix}4\\3\end{matrix}\right],\qquad v_2 =\left[\begin{matrix}-1\\1\end{matrix}\right]
$$
Therefore, the origin is an _unstable source_, and the phase plane diagram looks like the sketch in Figure 1.

![4.25 (a) Phase Plane Diagram](4.25a.png)

## 4.26

### (a)

The eigenvalues of
$$
A = \left[\begin{matrix}-2 & -1 \\ 5 &2\end{matrix}\right]
$$
are $\lambda_1 = i$ and $\lambda_2 = -i$. Since $|\lambda_1|=1= |\lambda_2|$, the origin is a _center_. Furthermore, when $u_1 = 0$ and $u_2 =1$, we have $\Delta u_1 = -1$, so solutions move in a counterclockwise direction about the origin. Therefore, the phase plane diagram looks like the sketch in Figure 2.

![4.26 (a) Phase Plane Diagram](4.26a.png)

## 4.27

### (b)

The eigenvalues and eigenvectors of
$$
A = \left[\begin{matrix}4&3\\-9&-\frac{13}{2}\end{matrix}\right]
$$
are $\lambda_1 = -\frac{1}{2}$ and $\lambda_2 = -2$, with corresponding eigenvectors
$$
v_1 = \left[\begin{matrix}2\\-3\end{matrix}\right],\qquad v_2 = \left[\begin{matrix}1\\-2\end{matrix}\right]
$$
Therefore the origin is a _saddle with two reflections_, and the phase plane diagram looks like the sketch in Figure 3.

![4.27 (b) Phase Plane Diagram](4.27b.png)

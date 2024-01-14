# Final Project

## Part 1

Let $f: \textbf{R}^2 \to \textbf{R}$ be defined by
$$
f(x) = \frac{1}{2}x^TQx - b^Tx + c
$$
where $Q$ is positive definite with eigenvalues
$$
0 < m = \lambda_1 \le \lambda_2 =L
$$
Define the sequence $\{x^k\}$ recursively by
$$
x^{k+1} = x^k - \alpha \nabla f(x^k) + \beta(x^{k} - x^{k-1})
$$
with $x^{-1} = x^0$ some vectors in $\textbf{R}^2$. Set
$$
\alpha =\frac{4}{\big(\sqrt{L} + \sqrt{m}\big)^2}, \qquad \beta = \frac{\sqrt{L} - \sqrt{m}}{\sqrt{L} + \sqrt{m}}
$$

### Problem 1

As we computed in Homework 3., $\nabla f(x) = Qx - b$, and $f(x)$ has a unique minimizer $x^*$ that satisfies the equation $Qx^* = b$. Then
$$
x^{k+1} - x^* = x^k - x^* -\alpha Q(x^k-x^*) + \beta(x^k-x^* - (x^{k-1} - x^*))
$$
Set
$$
w^k = \left[\begin{matrix}x^k - x^* \\ x^{k-1} - x^*\end{matrix}\right], \qquad T = \left[\begin{matrix}(1+\beta)I - \alpha Q & -\beta I \\I & 0\end{matrix}\right]
$$
then
$$
w^{k+1} = Tw^k
$$

### Problem 2

Since $Q$ is positive definite, it has a spectral decomposition
$$
Q = U \Lambda U^T
$$
where $U$ is an orthogonal matrix, and
$$
\Lambda = \left[\begin{matrix}\lambda_1 & 0 \\ 0 & \lambda_2 \end{matrix}\right]
$$
Define
$$
\mathcal{U} = \left[\begin{matrix}U & 0 \\ 0 & U\end{matrix}\right]
$$
Then $\mathcal{U}$ is also orthogonal, and
$$
\begin{aligned}
T &= \left[\begin{matrix}U & 0\\ 0 & U\end{matrix}\right]\left[\begin{matrix}(1+\beta)I - \alpha \Lambda & -\beta I \\ I & 0\end{matrix}\right]\left[\begin{matrix}U & 0 \\ 0 & U\end{matrix}\right]^T \\\\
&= \mathcal{U}\left[\begin{matrix}1+\beta - \alpha \lambda_1 & 0 & -\beta & 0 \\ 
0 & 1 + \beta - \alpha \lambda_2 & 0 & -\beta \\
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0\end{matrix}\right]\mathcal{U}^T \\\\
&= \mathcal{U}\,\Pi \left[\begin{matrix}1 + \beta - \alpha \lambda_1 &-\beta & 0 & 0 \\
1 & 0 & 0 & 0\\
0 & 0 & 1 + \beta - \alpha \lambda_2 & -\beta \\
0 & 0 & 1 & 0\end{matrix}\right] \Pi^T\,\mathcal{U}^T
\end{aligned}
$$
where
$$
\Pi = \left[\begin{matrix}1 & 0 & 0 & 0 \\ 
0 & 0 & 1 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 0 & 1\end{matrix}\right]
$$
is the orthogonal matrix that swaps rows 2 and 3 when multiplied on the left; note that this means that $\Pi^T$ swaps _columns_ 2 and 3 when multiplied on the right, from which the last equality follows. Multiplying by $\Pi^T\,\mathcal{U}^T$ on the left and $\mathcal{U}\,\Pi$ on the right, we see that $T$ is similar to the block diagonal matrix
$$
D = \left[\begin{matrix}T_1 & 0 \\ 0 & T_2\end{matrix}\right] = \left[\begin{matrix}1 + \beta - \alpha \lambda_1 & -\beta & 0 &0 \\
1 & 0 & 0 & 0 \\
0 & 0 & 1 + \beta -\alpha\lambda_2 & -\beta \\
0 & 0 & 1 & 0\end{matrix}\right]
$$
because
$$
(\mathcal{U}\,\Pi)^T\,T\,(\mathcal{U}\,\Pi) = \left[\begin{matrix}1 + \beta - \alpha \lambda_1 &-\beta & 0 & 0 \\
1 & 0 & 0 & 0\\
0 & 0 & 1 + \beta - \alpha \lambda_2 & -\beta \\
0 & 0 & 1 & 0\end{matrix}\right] = D
$$
and $\mathcal{U} \,\Pi$ is orthogonal and therefore invertible.

### Problem 3

Since $T$ is similar to $D$, it has the same eigenvalues, and since $D$ is block diagonal, its eigenvalues are the union of the eigenvalues of the diagonal blocks $T_1$ and $T_2$. Let $\mu_{ij}$ be the $j$th eigenvalue of $T_i$. Then $\mu_{ij}$ is a root of the characteristic polynomial
$$
\det(T_i - I\mu) = ((1 + \beta - \alpha \lambda_i) - \mu)(-\mu) + \beta
$$
or
$$
\mu^2 -(1 + \beta - \alpha \lambda_i)\mu +\beta
$$
which has roots
$$
\mu_{ij} = \frac{1 + \beta - \alpha \lambda_i}{2} \pm \frac{1}{2}\sqrt{(1 + \beta - \alpha \lambda_i)^2 - 4\beta}
$$
where $j=1,2$ corresponds to choosing $+$ or $-$ in the $\pm$.

### Problem 4

For the given values
$$
\alpha =\frac{4}{\big(\sqrt{L} + \sqrt{m}\big)^2}, \qquad \beta = \frac{\sqrt{L} - \sqrt{m}}{\sqrt{L} + \sqrt{m}}
$$
the discriminant $D_i = (1 + \beta - \alpha \lambda_i)^2 - 4\beta$ in the expression for $\mu_{ij}$ is always nonpositive. Indeed, if $\kappa = \frac{L}{m}$, then $\kappa \ge 1$, and
$$
\begin{aligned}
&&1  &\le 2\sqrt{\kappa - 1} + \sqrt{\kappa}\\
&\implies& 1 + \sqrt{\kappa}&\le 2\big(\sqrt{\kappa - 1} + \sqrt{\kappa}\big) \\
&\implies& 1 &\le 2\frac{\sqrt{\kappa - 1} + \sqrt{\kappa}}{1 + \sqrt{\kappa}} \\
&\implies& \kappa - (\kappa - 1) &\le 2\frac{\sqrt{\kappa - 1} + \sqrt{\kappa}}{1 + \sqrt{\kappa}} \\
&\implies& \big(\sqrt{\kappa} + \sqrt{\kappa - 1}\big)\big(\sqrt{\kappa} - \sqrt{\kappa - 1}\big) &\le 2\frac{\sqrt{\kappa - 1} + \sqrt{\kappa}}{1 + \sqrt{\kappa}} \\
&\implies& \sqrt{\kappa} - \sqrt{\kappa - 1} &\le \frac{2}{1 + \sqrt{\kappa}}
\end{aligned}
$$
Likewise,
$$
\begin{aligned}
&& 1 &\le \sqrt{\kappa} \\
&\implies& 2 &\le 1 + \sqrt{\kappa} \\
&\implies& \frac{2}{1+\sqrt{\kappa}} &\le 1 \le \sqrt{\kappa} +\sqrt{\kappa - 1}
\end{aligned}
$$
Together, these inequalities imply that
$$
\begin{alignedat}{3}
&& -\sqrt{\kappa} - \sqrt{\kappa - 1} &\le -\frac{2}{1+\sqrt{\kappa}} & &\le \sqrt{\kappa - 1} - \sqrt{\kappa} \\
&\implies& -\sqrt{\kappa - 1} &\le \sqrt{\kappa} - \frac{2}{1+\sqrt{\kappa}}& &\le \sqrt{\kappa - 1} \\
&\implies& -\sqrt{L - m} & \le \sqrt{L} - \frac{2m}{\sqrt{L} + \sqrt{m}}& &\le\sqrt{L-m} \\
&\implies& -\sqrt{\beta} & \le \frac{\sqrt{L}}{\sqrt{L} + \sqrt{m}} - \frac{2m}{(\sqrt{L} + \sqrt{m})^2}& & \le \sqrt{\beta}
\end{alignedat}
$$
since
$$
\frac{\sqrt{L-m}}{\sqrt{L} + \sqrt{m}} = \sqrt{\frac{\big(\sqrt{L}-\sqrt{m}\big)\big(\sqrt{L} + \sqrt{m}\big)}{\big(\sqrt{L} + \sqrt{m}\big)^2}} = \sqrt{\frac{\sqrt{L} - \sqrt{m}}{\sqrt{L} + \sqrt{m}}} = \sqrt{\beta}
$$Hence,
$$
\left|\frac{2\sqrt{L}}{\sqrt{L} + \sqrt{m}} - \alpha m\right| \le 2\sqrt{\beta}
$$
Since $2\sqrt{L} = \sqrt{L} + \sqrt{m} + \sqrt{L} - \sqrt{m}$, we obtain
$$
\left(1 + \beta - \alpha m\right)^2 \le 4\beta
$$
That is, $D_1 \le 0$ (because $\lambda_1 = m$).

We can prove that $D_2 \le 0$ in a similar manner. Going back to $\kappa \ge 1$, we can deduce that
$$
1 - \frac{1}{\kappa} \ge 0
$$
Thus,
$$
1 \le \sqrt{\kappa} + \sqrt{\kappa -1},\qquad 1\le 1 + \sqrt{1 - \frac{1}{\kappa}}
$$
so
$$
\begin{aligned}
&& 1 &\le \big(\sqrt{\kappa} + \sqrt{\kappa -1 }\big)\left(1 + \sqrt{1 - \frac{1}{\kappa}}\right) \\
&\implies& \sqrt{\kappa} - \sqrt{\kappa - 1}&\le (\kappa - (\kappa - 1))\left(1 + \sqrt{1 - \frac{1}{\kappa}}\right) \\
&\implies& \sqrt{\kappa} &\le 1 + \sqrt{1 -\frac{1}{\kappa}} + \sqrt{\kappa - 1} \\
&\implies& 2\sqrt{\kappa} &\le 1 + \sqrt{\kappa} + \sqrt{1 - \frac{1}{\kappa}} + \sqrt{\kappa - 1} \\
&\implies& 2\sqrt{\kappa} &\le \big(\sqrt{\kappa} + 1\big)\left(1 + \sqrt{1-\frac{1}{\kappa}}\right) \\
&\implies& \frac{2\sqrt{\kappa}}{\sqrt{\kappa} + 1} &\le1 +\sqrt{1-\frac{1}{\kappa}} \\
&\implies&\frac{2}{1 + \sqrt{\frac{1}{\kappa}}} &\le 1 + \sqrt{1 - \frac{1}{\kappa}}
\end{aligned}
$$
On the other hand, since $\frac{1}{\kappa} \le 1$, we must have
$$
1 + \sqrt{\frac{1}{\kappa}} \le 2 \implies \frac{2}{1 + \sqrt{\frac{1}{\kappa}}} \ge 1 \ge 1 - \sqrt{1 - \frac{1}{\kappa}}
$$
Hence,
$$
\begin{alignedat}{3}
&& 1 - \sqrt{1-\frac{1}{\kappa}} &\le \frac{2}{1 + \sqrt{\frac{1}{\kappa}}}& &\le 1 + \sqrt{1 - \frac{1}{\kappa}} \\
&\implies& -\sqrt{1 - \frac{1}{\kappa}} &\le 1 - \frac{2}{1 + \sqrt{\frac{1}{\kappa}}}& & \le \sqrt{1 - \frac{1}{\kappa}} \\
&\implies& -\sqrt{L - m} &\le \sqrt{L} - \frac{2L}{\sqrt{L} + \sqrt{m}}& &\le \sqrt{L - m} \\
&\implies& -\sqrt{\beta} & \le \frac{\sqrt{L}}{\sqrt{L} + \sqrt{m}} - \frac{2L}{(\sqrt{L} + \sqrt{m})^2}& &\le \sqrt{\beta}
\end{alignedat}
$$
Hence,
$$
\left|\frac{2\sqrt{L}}{\sqrt{L} + \sqrt{m}} - \alpha L\right| \le 2\sqrt{\beta}
$$
Since $2\sqrt{L} = \sqrt{L} + \sqrt{m} + \sqrt{L} - \sqrt{m}$, we obtain
$$
(1 + \beta - \alpha L)^2 \le 4\beta
$$
This shows that $D_2 \le 0$.

### Problem 5

Since $D_1 \le 0$ and $D_2 \le 0$, the eigenvalues $\mu_{ij}$ are all complex, we can find $|\mu_{ij}|^2$ by summing the squares of the real and imaginary parts. Noting that the imaginary part of $\mu_{ij}$ is $\frac{1}{2}\sqrt{-D_i}$, we obtain
$$
|\mu_{ij}|^2 = \frac{(1+ \beta - \alpha \lambda_i)^2}{4} - \frac{D_i}{4} = \beta
$$
Therefore, $|\mu_{ij}| = \sqrt{\beta}$, for all $i,j \in \{1,2\}$. As pointed out in Problem 3, the eigenvalues of $T$ are $\{\mu_{ij}\}$, so $\rho(T) = \sqrt{\beta}$. Since
$$
\sqrt{\beta} = \left(\frac{\sqrt{L} - \sqrt{m}}{\sqrt{L} + \sqrt{m}}\right)^\frac{1}{2} = \left(1 - \frac{2\sqrt{m}}{\sqrt{L} + \sqrt{m}}\right)^\frac{1}{2} = \left(1 - \frac{2}{1 + \sqrt{\kappa}}\right)^\frac{1}{2}
$$
we can use the Binomial Theorem to approximate
$$
\rho(T) = \sqrt{\beta} \approx 1 - \frac{1}{1 + \sqrt{\kappa}} \approx 1 - \kappa^{-\frac{1}{2}}
$$
if $\kappa \gg 1$.

## Part 2

### Problem 6

Let $f : \textbf{R}^d \to\textbf{R}$ be defined by
$$
f(x) = \frac{1}{n}\sum_{i=1}^n f_i(x)
$$
Suppose that we approximate the gradient $\nabla f(x)$ by the random function $g$ defined by
$$
g(x) = \frac{1}{|S|}\sum_{i\in S} \nabla f_i(x) + \varepsilon_i
$$
where $\varepsilon_i \sim \mathcal{N}(0, \sigma^2 I)$ are i.i.d. random variables, and $S = \{1,2,\dots,n\}$. Then
$$
g(x) = \nabla f(x) + \frac{1}{n}\sum_{i=1}^n \varepsilon_i
$$
so
$$
\textbf{E}\left[\lVert g(x) - \nabla f(x)\rVert^2\right] = \textbf{E}\left[\left\lVert\frac{1}{n}\sum_{i=1}^n \varepsilon_i\right\rVert^2\right] = \frac{1}{n^2}\sum_{i,j=1}^n \textbf{E}\left[\varepsilon_i^T \varepsilon_j\right]
$$
Since the $\{\varepsilon_i\}$ are independent and have mean $0$, it follows that $\textbf{E}\left[\varepsilon_i^T\varepsilon_j\right] = 0$ if $i \ne j$. Thus,
$$
\textbf{E}\left[\lVert g(x) - \nabla f(x)\rVert^2\right] = \frac{1}{n^2}\sum_{i=1}^n \textbf{E}[\lVert\varepsilon_i\rVert^2] = \frac{1}{n}\sum_{j=1}^d \textbf{E}\left[\varepsilon_{ij}^2\right]
$$
Since each $\varepsilon_{ij} \sim \mathcal{N}(0, \sigma^2)$, we must have $\textbf{E}[\varepsilon_{ij}^2] = \text{Var}[\varepsilon_{ij}] + (\textbf{E}[\varepsilon_{ij}])^2$ by using the shortcut rule for variance, and since $\text{Var}[\varepsilon_{ij}] = \sigma^2$, and $\textbf{E}[\varepsilon_{ij}] = 0$, we obtain
$$
\textbf{E}\left[\lVert g(x) - \nabla f(x)\rVert^2\right] = \frac{d}{n}\sigma^2 = \frac{d}{|S|}\sigma^2
$$

### Problem 7

Writing $g(x)$ as $(g(x) - \nabla f(x)) + \nabla f(x)$, and using the previous result, we get
$$
\begin{aligned}
\textbf{E}\left[\lVert g(x)\rVert^2\right] &= \textbf{E}\left[\lVert g(x) - \nabla f(x)\rVert^2\right] + 2 \textbf{E}[\langle g(x) - \nabla f(x), \nabla f(x)\rangle] + \textbf{E}\left[\lVert\nabla f(x)\rVert^2\right] \\
&= \lVert\nabla f(x)\rVert^2 + \frac{d}{|S|}\sigma^2 + 2\left\langle \textbf{E}[g(x)] - \nabla f(x), \nabla f(x)\right\rangle
\end{aligned}
$$
Using the fact that $\textbf{E}[\varepsilon_i] = 0$, we get $\textbf{E}[g(x)] = \nabla f(x)$; it follows that
$$
\textbf{E}\left[\lVert g(x)\rVert^2\right] = \lVert\nabla f(x)\rVert^2 + \frac{d}{|S|}\sigma^2
$$

### Problem 8

Now suppose that we use the gradient estimate
$$
g(x) = \nabla f(x) + \frac{1}{s}\sum_{j=1}^s \xi_j
$$
where $\xi_j \sim \mathcal{N}(0,\sigma^2 I)$ are i.i.d random variables. Then
$$
\begin{aligned}
\textbf{E}\left[\lVert g(x)\rVert^2\right] &= \textbf{E}\left[\lVert\nabla f(x)\rVert^2\right] + 2\textbf{E}\left[\left\langle \nabla f(x), \frac{1}{s}\sum_{j=1}^s \xi_j\right\rangle\right] + \textbf{E}\left[\left\lVert \frac{1}{s}\sum_{j=1}^s\xi_j\right\rVert^2\right] \\
&= \lVert\nabla f(x)\rVert^2 + 2\left\langle\nabla f(x), \frac{1}{s}\sum_{j=1}^s\textbf{E}[\xi_j]\right\rangle + \frac{1}{s^2}\sum_{j,k=1}^s\xi_j^T \xi_k
\end{aligned}
$$
Now, we have $\textbf{E}[\xi_j] = 0$ for $j=1$ to $s$, and, since $\xi_j$ and $\xi_k$ are independent for $j\ne k$ and both have mean 0, we must have $\textbf{E}[\xi_j^T \xi_k] = 0$. Therefore,
$$
\textbf{E}\left[\lVert g(x)\rVert^2\right] = \lVert\nabla f(x)\rVert^2 + \frac{1}{s^2}\sum_{j=1}^s \lVert\xi_j\rVert^2 = \lVert\nabla f(x)\rVert^2 + \frac{1}{s} \sum_{i=1}^d \xi_{ij}^2
$$
Now, since each $\xi_{ij} \sim \mathcal{N}(0, \sigma^2)$, we can use the variance shortcut formula again to obtain $\textbf{E}[\xi_{ij}^2] = \text{Var}[\xi_{ij}] + (\textbf{E}[\xi_{ij}])^2 = \sigma^2$. Thus,
$$
\textbf{E}\left[\lVert g(x) \rVert^2\right] = \lVert \nabla f(x)\rVert^2 + \frac{d}{s}\sigma^2
$$

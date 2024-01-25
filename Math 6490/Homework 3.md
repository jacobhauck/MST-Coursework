# Homework 3

## 1.

Let $f(x) = \frac{1}{2}x^TQx - b^Tx + c$, where $Q \prec 0$ is a positive definite matrix with eigenvalues $0 < m = \lambda_n \le \lambda_{n-1} \le \dots \le \lambda_1 = L$, where $m$ is the strong convexity constant for $f$, and $L$ is the Lipschitz constant for $\nabla f$.

Then the $i$th component of $\nabla f$ is
$$
\begin{aligned}
\lbrack\nabla f(x)\rbrack_i &=\frac{\partial f}{\partial x_i} = \frac{\partial}{\partial x_i} \left[\frac{1}{2}\sum_{j=1}^n \sum_{k=1}^nx_jQ_{jk}x_k - \sum_{j=1}^nb_jx_j + c\right]\\
&=\frac{1}{2}\sum_{j=1}^n\sum_{k=1}^n \left[Q_{jk}x_k\delta_{ij} + x_jQ_{jk}\delta_{ik}\right] - b_i \\
&=\frac{1}{2}\sum_{k=1}^n Q_{ik}x_k + \frac{1}{2}\sum_{j=1}^nQ_{ji}x_j - b_i\\
&= \frac{1}{2}[Qx]_i + \frac{1}{2}[Q^Tx]_i - b_i = [Qx]_i - b_i = [Qx - b]_i
\end{aligned}
$$
where $\delta$ is the Kronecker delta function. The last equation follows from the symmetry of $Q$. Therefore, $\nabla f(x) = Qx - b$.

Since $f$ is $m$-strongly convex, it must have a unique minimizer $x^*$. Furthermore, $f$ is continuously differentiable everywhere, so by the Extreme Value Theorem, we have $\nabla f(x^*) = 0$, that is, $Qx^* - b = 0$. This implies that $Qx - b= 0$ has at least one solution, $x = x^*$.

Suppose that $y^*$ is another solution of $Qx - b=0$. Then 
$$
Q(x^*  - y^*) = 0 = 0 \cdot (x^* - y^*)
$$
If $x^* - y^* \ne 0$, then $0$ must be an eigenvalue of $Q$; however, we assumed that the eigenvalues of $Q$ are all greater than $0$, so $x^* = y^*$, that is, the minimizer $x^*$ of $f$ is the unique solution of $Qx - b = 0$.

## 2.

Let
$$
T = \left[\begin{matrix}(1+\beta)(I-\alpha Q) & -\beta(I-\alpha Q)\\ I & 0\end{matrix}\right]
$$
and let $U$ be an orthogonal matrix such that $U^T Q U = \Lambda = \left[\begin{matrix}\lambda_1 & 0 \\ 0 & \lambda_2\end{matrix}\right]$. Define
$$
\Pi = \left[\begin{matrix}1&0&0&0 \\ 0&0&1&0 \\ 0&1&0&0 \\ 0&0&0&1 \end{matrix}\right]
$$
Note that $\Pi = \Pi^T$, and the action of $\Pi$ on a matrix $A$ from the **left** is to swap __rows__ $2$ and $3$, and the action of $\Pi$ on a matrix $A$ from the __right__ is to swap __columns__ $2$ and $3$. Let
$$
T_i = \left[\begin{matrix}(1+\beta)(1-\alpha\lambda_i) & -\beta(1-\alpha\lambda_i) \\ 1 & 0\end{matrix}\right]
$$
Then 
$$
\Pi \left[\begin{matrix}U&0\\0&U\end{matrix}\right]^T T\left[\begin{matrix}U&0\\ 0& U\end{matrix}\right]\Pi^T = \text{diag}(T_1,T_2)
$$
because
$$
\begin{aligned}
\Pi \left[\begin{matrix}U&0\\0&U\end{matrix}\right]^T &T \left[\begin{matrix}U&0\\ 0& U\end{matrix}\right]\Pi^T \\\\
&\quad\text{(using $\Pi^T = \Pi$)}
\\\\
&= \Pi\left[\begin{matrix}U^T&0\\0&U^T\end{matrix}\right]\left[\begin{matrix}(1+\beta)(I-\alpha Q) & -\beta(I-\alpha Q)\\ I & 0\end{matrix}\right]\left[\begin{matrix}U&0\\0&U\end{matrix}\right]\Pi\\\\
&=\Pi\left[\begin{matrix}(1+\beta)(U^T-\alpha U^TQ) & -\beta(U^T-\alpha U^TQ) \\ U^T & 0\end{matrix}\right]\left[\begin{matrix}U&0\\0&U\end{matrix}\right]\Pi \\\\
&= \Pi \left[\begin{matrix}(1+\beta)(U^TU - \alpha U^TQU) & -\beta(U^TU - \alpha U^TQU)\\ U^TU &0\end{matrix}\right] \Pi \\\\
&= \Pi\left[\begin{matrix}(1+\beta)(I - \alpha\Lambda) & -\beta(I - \alpha \Lambda) \\ I & 0\end{matrix}\right] \Pi \\\\
&= \Pi\left[\begin{matrix}(1+\beta)(1 - \alpha\lambda_1) & 0 & -\beta(1 - \alpha\lambda_1) & 0 \\ 0 & (1+\beta)(1-\alpha\lambda_2) &0&-\beta(1-\alpha\lambda_2)\\ 1 & 0 &0 &0 \\0&1&0&0\end{matrix}\right]\Pi \\\\
&\quad\text{($\Pi$ acting on the \textbf{right} swaps \textbf{columns} 2 and 3)}
\\\\
&= \Pi\left[\begin{matrix}(1+\beta)(1 - \alpha\lambda_1) & -\beta(1 - \alpha\lambda_1) & 0& 0 \\ 0 & 0&(1+\beta)(1-\alpha\lambda_2) &-\beta(1-\alpha\lambda_2)\\ 1 & 0 &0 &0 \\0&0&1&0\end{matrix}\right] \\\\
&\quad\text{($\Pi$ acting on the \textbf{left} swaps \textbf{rows} 2 and 3)}
\\\\
&= \left[\begin{matrix}(1+\beta)(1 - \alpha\lambda_1) & -\beta(1 - \alpha\lambda_1) & 0& 0 \\ 1 & 0 &0 &0 \\ 0 & 0&(1+\beta)(1-\alpha\lambda_2) &-\beta(1-\alpha\lambda_2)\\ 0&0&1&0\end{matrix}\right] \\\\
&= \left[\begin{matrix}T_1 & 0 \\ 0& T_2\end{matrix}\right] = \text{diag}(T_1,T_2)
\end{aligned}
$$

## 3.

Let $\rho_k \ge 0$, $\rho_0 = 0$ be defined recursively by
$$
\rho_k^2 = \frac{(1-\rho_k^2)^2}{(1-\rho_{k-1}^2)^2}
$$
for $k \ge 1$. Then $1 - \rho_k^2 \le \frac{2}{k+2}$ for all $k$. 

_Proof_. Let $a_k = 1-\rho_k^2$. Then the above implies that $a_0 = 1$, and
$$
a_k = 1 - \frac{a_k^2}{a_{k-1}^2}
$$
for $k \ge 1$. We show that $a_k \le \frac{2}{k+2}$ for all $k$. To start, $a_0 = 1 \le \frac{2}{0+2} = 1$. Now assume for induction that $a_k \le \frac{2}{k+2}$ for some $k \ge 0$. Then
$$
\frac{a_{k+1}^2}{1-a_{k+1}}=a_k^2 \le \frac{4}{(k+2)^2}
$$
or
$$
a_{k+1}^2 + \frac{4}{(k+2)^2}a_{k+1} - \frac{4}{(k+2)^2} \le 0
$$
Since the function $f(x) = x^2 + \frac{4}{(k+2)^2}x - \frac{4}{(k+2)^2}$, is a parabola opening upward, the only way that $f(x) \le 0$ is if $x$ is less than or equal to the largest root of $f(x) = 0$, that is, $f(x) \le 0$ implies that
$$
x \le -\frac{2}{(k+2)^2} + \frac{2}{k+2}\sqrt{\frac{1}{(k+2)^2} + 1}
$$
Therefore,
$$
a_{k+1} \le \frac{2}{k+2}\left[-\frac{1}{k+2} + \sqrt{\frac{1}{(k+2)^2}  +1}\;\right]
$$
For every integer $k \ge 0$, we have $k^2 \le 2k^2$, $6k \le 10k$, and $9 \le 13$, so
$$
\begin{alignedat}{2}
&k^2 + 6k + 9 &\;&\le 2k^2 + 10k + 13 \\\\
\implies & (k+3)^2 &&\le 2(k+2)(k+3)+1 \\\\
\implies & (k+3)^2(1+(k+2)^2) &&\le (k+3)^2(k+2)^2 + 2(k+2)(k+3) + 1\\\\
&  && \le \big((k+3)(k+2) +  1\big)^2\\\\
\implies & \frac{1}{(k+2)^2}+1 && \le \frac{1}{(k+3)^2}\left(k+3 + \frac{1}{k+2}\right)^2\\\\
\implies & \sqrt{\frac{1}{(k+2)^2}+1}&& \le \frac{k+ 2 + \frac{1}{k+2}+1}{(k+2)\left(1 + \frac{1}{k+2}\right)} \\\\
&&& \le \frac{1}{k+2} + \frac{1}{1 + \frac{1}{k+2}}\\\\
\implies & -\frac{1}{k+2} + \sqrt{\frac{1}{(k+2)^2} + 1} && \le \frac{k+2}{k+3}
\end{alignedat}
$$
This shows that
$$
a_{k+1} \le \frac{2}{k+2}\cdot\frac{k+2}{k+3} = \frac{2}{k+3}
$$
Thus, it follows that $1-\rho_k^2 = a_k \le \frac{2}{k+2}$ for all $k$ by mathematical induction.
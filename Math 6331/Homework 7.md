# Homework 7

## 4.7

Let $u(t) = \left[\begin{matrix}y(t)\\ y(t+1)\end{matrix}\right]$. The problem is equivalent to
$$
u(t+1) = \left[\begin{matrix}0&1\\ -2&-3 \end{matrix}\right]u(t),\qquad u(0) = \left[\begin{matrix}-1\\7\end{matrix}\right]
$$
The solution of this equation is
$$
u(t) = A^tu(0), \qquad A = \left[\begin{matrix}0&1\\-2&-3\end{matrix}\right]
$$
We can use the Putzer Algorithm (Theorem 4.2) to calculate $A^t$. The eigenvalues of $A$ are $\lambda_1 = -1$ and $\lambda_2 = -2$. Set $M_0 = I$ and $M_1 = A - I\lambda_1$, that is,
$$
M_1 = \left[\begin{matrix}-\lambda_1 & 1\\ -3 & -2-\lambda_1\end{matrix}\right] = \left[\begin{matrix}1 & 1\\ -2 & -2\end{matrix}\right] 
$$
Next, we want to find $c(t) = \left[\begin{matrix}c_1(t)\\c_2(t)\end{matrix}\right]$ such that
$$
c(t+1) = \left[\begin{matrix}-1&0\\1&-2\end{matrix}\right]c(t),\qquad c(0) = \left[\begin{matrix}1\\0\end{matrix}\right]
$$
This implies that $c_1(t) = (-1)^t$, and $c_2(t+1) + 2c_2(t)= (-1)^t$, or
$$
(E+1)(E+2)c_2(t) = 0
$$
so that $c_2(t) = a \cdot(-1)^t + b \cdot(-2)^t$. To satisfy the equation we need $a=\frac{1}{-1 +2} = 1$. To satisfy the initial condition, we need $b = -a = -1$. Thus,
$$
c(t) = \left[\begin{matrix}(-1)^t \\ (-1)^t - (-2)^t\end{matrix}\right]
$$
Therefore, by the Putzer Algorithm,
$$
\begin{aligned}
A^t &= c_1(t)M_0 + c_2(t)M_1 \\\\
&= (-1)^t\left[\begin{matrix}1&0\\0&1\end{matrix}\right] + ((-1)^t - (-2)^t)\left[\begin{matrix}1&1\\-2&-2\end{matrix}\right]\\\\
&= \left[\begin{matrix}2\cdot(-1)^t-(-2)^t&(-1)^t-(-2)^t\\ 2\cdot (-2)^t - 2\cdot(-1)^t& 2\cdot(-2)^t - (-1)^t\end{matrix}\right]
\end{aligned}
$$

Now we can compute
$$
\begin{aligned}
u(t) &= A^tu(0) = \left[\begin{matrix}2\cdot(-1)^t-(-2)^t&(-1)^t-(-2)^t\\ 2\cdot (-2)^t - 2\cdot(-1)^t& 2\cdot(-2)^t - (-1)^t\end{matrix}\right]\left[\begin{matrix}-1\\7\end{matrix}\right] \\
&= \left[\begin{matrix}5\cdot(-1)^t -6 \cdot(-2)^t\\ 12\cdot(-2)^t -5\cdot(-1)^t\end{matrix}\right]
\end{aligned}
$$

Finally, we obtain $y(t)$ by taking the first component of $u(t)$, that is,
$$
y(t) = 5\cdot(-1)^t - 6 \cdot (-2)^t
$$

## 4.8

### (a)

Let
$$
A = \left[\begin{matrix}2&2\\2&-1\end{matrix}\right]
$$
The eigenvalues of $A$ are $\lambda_1 = 3$ and $\lambda_2 = -2$. Using the Putzer Algorithm to find $A^t$, we set $M_0 = I$ and $M_1 = A - I\lambda_1$. Next, we need to find $c(t) = \left[\begin{matrix}c_1(t)\\ c_2(t)\end{matrix}\right]$ such that
$$
c(t+1) = \left[\begin{matrix}3&0\\1&-2\end{matrix}\right]c(t),\qquad c(0) = \left[\begin{matrix}1\\0\end{matrix}\right]
$$
This gives $c_1(t) = 3^t$, and $c_2(t+1) + 2c_2(t) = 3^t$, or $(E-3)(E+2)c_2(t) = 0$, which implies that $c_2(t) = a3^t + b(-2)^t$. We need $5a = 1$, or $a = \frac{1}{5}$, to satisfy the original equation for $c_2(t)$. We also need $a =-b$ to satisfy the initial condition. Thus, $c_2(t) = \frac{1}{5}(3^t - (-2)^t)$.

By the Putzer Algorithm, $A^t$ is given by
$$
\begin{aligned}
A^t &= c_1(t)M_0 + c_2(t) M_1 = 3^t\left[\begin{matrix}1&0\\0&1\end{matrix}\right] + \frac{1}{5}(3^t-(-2)^t)
\left[\begin{matrix}-1 &2\\2&-4\end{matrix}\right] \\\\
&= \frac{1}{5}\left[\begin{matrix}4\cdot3^t+(-2)^t & 2\cdot3^t-2\cdot(-2)^t\\ 2\cdot3^t-2\cdot(-2)^t & 3^t + 4\cdot(-2)^t
\end{matrix}\right]
\end{aligned}
$$

## 4.9

### (a)

Let
$$
A = \left[\begin{matrix}6&-2\\-2&9\end{matrix}\right]
$$
We can write the system as
$$
u(t+1) = Au(t),\qquad u(0) = \left[\begin{matrix}2\\1\end{matrix}\right]
$$
The solution of this system is $u(t) = A^tu(0)$. We can compute $A^t$ using the Putzer Algorithm. The eigenvalues of $A$ are $\lambda_1 = 5$ and $\lambda_2 = 10$. Set $M_0 = I$ and $M_1 = A - I\lambda_1$. We need to find $c(t) = \left[\begin{matrix}c_1(t)\\ c_2(t)\end{matrix}\right]$ such that
$$
c(t+1) = \left[\begin{matrix}5&0\\1&10\end{matrix}\right]c(t),\qquad c(0) = \left[\begin{matrix}1\\0\end{matrix}\right]
$$
This gives $c_1(t) = 5^t$, and $c_2(t+1) - 10 c_2(t) = 5^t$, or $(E-5)(E-10)c_2(t) = 0$. Then $c_2(t) = a\cdot 5^t + b\cdot 10^t$. To satisfy the equation we need $-5a = 1$ or $a = -\frac{1}{5}$. To satisfy the initial condition we need $a = -b$. Thus, $c_2(t) = \frac{1}{5}(10^t - 5^t)$.

By the Putzer Algorithm,
$$
\begin{aligned}
A^t &= c_1(t) M_0 + c_2(t)M_1 = 5^t\left[\begin{matrix}1&0\\0&1\end{matrix}\right] + \frac{1}{5}(10^t - 5^t)\left[\begin{matrix}1&-2\\-2&4\end{matrix}\right] \\\\
&= \frac{1}{5}\left[\begin{matrix}10^t + 4\cdot5^t & 2\cdot5^t - 2\cdot10^t\\ 2\cdot5^t - 2\cdot10^t & 4\cdot10^t + 5^t\end{matrix}\right]
\end{aligned}
$$
Then
$$
\begin{aligned}
u(t) &= A^tu(0) = \frac{1}{5}\left[\begin{matrix}10^t + 4\cdot5^t & 2\cdot5^t - 2\cdot10^t\\ 2\cdot5^t - 2\cdot10^t & 4\cdot10^t + 5^t\end{matrix}\right] \left[\begin{matrix}2 \\ 1\end{matrix}\right]\\
&= 5^t\cdot\left[\begin{matrix}2\\ 1\end{matrix}\right]
\end{aligned}
$$

## 4.12

### (a)

Let
$$
A = \left[\begin{matrix}2&2\\2&-1\end{matrix}\right]
$$
We can write the system as
$$
u(t+1) = Au(t) + \left[\begin{matrix}0\\1\end{matrix}\right],\qquad u(0) = \left[\begin{matrix}0\\0\end{matrix}\right]
$$
To apply Theorem 4.3 (Variation of Constants Formula), we need to first find $A^t$. Fortunately, we already found it in 4.8 (a):
$$
A^t = \frac{1}{5}\left[\begin{matrix}4\cdot3^t+(-2)^t & 2\cdot3^t-2\cdot(-2)^t\\ 2\cdot3^t-2\cdot(-2)^t & 3^t + 4\cdot(-2)^t
\end{matrix}\right]
$$
Then by the Variation of Constants Formula,
$$
\begin{aligned}
u(t) &= A^tu(0) + \sum_{s=0}^{t-1}A^{t-s-1}\cdot\left[\begin{matrix}0\\1\end{matrix}\right] \\\\
&= \sum_{s=0}^{t-1}\frac{1}{5}\left[\begin{matrix}4\cdot3^{t-s-1}+(-2)^{t-s-1} & 2\cdot3^{t-s-1}-2\cdot(-2)^{t-s-1}\\ 2\cdot3^{t-s-1}-2\cdot(-2)^{t-s-1} & 3^{t-s-1} + 4\cdot(-2)^{t-s-1}
\end{matrix}\right]\left[\begin{matrix}0\\1\end{matrix}\right]  \\\\
&= \sum_{s=0}^{t-1}\frac{1}{5}\left[\begin{matrix}2\cdot3^{t-1}\cdot\left(\frac{1}{3}\right)^s + (-2)^t\cdot\left(-\frac{1}{2}\right)^s \\ 3^{t-1}\cdot\left(\frac{1}{3}\right)^s +(-2)^{t+1}\cdot \left(-\frac{1}{2}\right)^s\end{matrix}\right] = \\\\
&=\frac{1}{5}\left[\begin{matrix}-3^t\cdot\left(\frac{1}{3}\right)^s-\frac{2}{3}\cdot(-2)^t\cdot\left(-\frac{1}{2}\right)^s \\ -\frac{1}{2}\cdot3^t\cdot\left(\frac{1}{3}\right)^s - \frac{2}{3}\cdot(-2)^{t+1}\cdot\left(-\frac{1}{2}\right)^s\end{matrix}\right]_0^t = \frac{1}{5}\left[\begin{matrix}-1 - \frac{2}{3} + 3^t + \frac{2}{3}\cdot(-2)^t \\ -\frac{1}{2} + \frac{4}{3} + \frac{1}{2}\cdot3^t - \frac{4}{3}\cdot(-2)^t\end{matrix}\right] \\\\
&= \left[\begin{matrix}-\frac{1}{3} + \frac{1}{5}\cdot3^t + \frac{2}{15}\cdot(-2)^t \\ \frac{1}{6} + \frac{1}{10}\cdot3^t - \frac{4}{15}\cdot(-2)^t\end{matrix}\right] 
\end{aligned}
$$

## 4.14

### (a)

Let
$$
A = \left[\begin{matrix}.9&.2\\-.1&.6\end{matrix}\right]
$$
Then by Theorems 4.4 and 4.5, all solutions of $u(t+1) = Au(t)$ converge to the origin as $t\to\infty$ if and only if $r(A) < 1$. To find $r(A)$, we need the eigenvalues of $A$, which are $\lambda_1 = 0.8$ and $\lambda_2 = 0.7$. Thus, $r(A) = \max\{|0.8|, |0.7|\} = 0.8 < 1$, and all solutions of $u(t+1)=Au(t)$ converge to the origin as $t \to \infty$.

## 4.16

### (b)

Let
$$
A = \left[\begin{matrix}2&1\\4&2\end{matrix}\right], \qquad u(t) = \left[\begin{matrix}4^t\\2\cdot4^t\end{matrix}\right]
$$
Then
$$
Au(t) = \left[\begin{matrix}2\cdot4^t + 2\cdot4^t\\ 4\cdot4^t + 4\cdot4^t\end{matrix}\right] = \left[\begin{matrix}4^{t+1}\\ 2\cdot4^{t+1}\end{matrix}\right] = u(t+1)
$$
and $|u(t)| = 4^t|u(0)|$, which diverges to $\infty$ as $t \to \infty$ (note that $|u(0)| = \sqrt{5}\ne 0$). Therefore, given any $C>0$, there exists $t$ such that $|u(t)| > C|u(0)|$. Hence, equation (4.13) does not hold for this solution of $u(t+1)= Au(t)$.
## 4.30

Let
$$
\Phi(t) = \frac{1}{2^{t+1}}\left[\begin{matrix}
(\sqrt{3})^t + (-\sqrt{3})^t & (\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1}\\
(\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1} & (\sqrt{3})^t + (-\sqrt{3})^t
\end{matrix}\right]
$$
Then
$$
\begin{aligned}
\det(\Phi(t)) &= \frac{1}{2^{2t+2}}\big([(\sqrt{3})^t+(-\sqrt{3})^t]^2 - [(\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1}]^2\big)\\
&= \frac{1}{2^{2t+2}}\big(3^t + 2\cdot(-3)^t + 3^t - 3\cdot(3^t - 2 \cdot(-3)^t + 3^t)\big) \\
&= \frac{3^t}{2^{2t+1}}(1 + (-1)^t - 3\cdot(1 - (-1)^t)) \\
&= \frac{3^t}{2^{2t+1}}(-2+4\cdot(-1)^t) \ne 0
\end{aligned}
$$
for all $t$, so $\Phi(t)$ is nonsingular for all $t$. Furthermore, $\Phi(t)$ satisfies the corresponding matrix equation
$$
U(t+1) = \left[\begin{matrix}0 & \frac{2+(-1)^t}{2} \\ \frac{2+(-1)^t}{2} & 0\end{matrix}\right]U(t)
$$
because
$$
\begin{aligned}
\Phi(t+1) &= \frac{1}{2^{t+2}}\left[\begin{matrix}(\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1} & (\sqrt{3})^{t+2} + (-\sqrt{3})^{t+2} \\ (\sqrt{3})^{t+2} + (-\sqrt{3})^{t+2} & (\sqrt{3})^{t+1} +  (-\sqrt{3})^{t+1}\end{matrix}\right]
\end{aligned}
$$
and
$$
\small
\begin{aligned}
\left[\begin{matrix}0 & \frac{2+(-1)^t}{2} \\ \frac{2+(-1)^t}{2} & 0\end{matrix}\right]\Phi(t) &= \frac{1}{2^{t+2}}\left[\begin{matrix}(2+(-1)^t)\big((\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1}\big) & (2+(-1)^t)\big((\sqrt{3})^t + (-\sqrt{3})^t\big) \\ (2+(-1)^t)\big((\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1}\big) & (2+(-1)^t)\big((\sqrt{3})^t + (-\sqrt{3})^t\big)\end{matrix}\right]\\\\
&= \frac{1}{2^{t+2}}\left[\begin{matrix}(\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1} & 3\cdot(\sqrt{3})^t + 3\cdot(-\sqrt{3})^t \\ 3\cdot(\sqrt{3})^t + 3\cdot(-\sqrt{3})^t & (\sqrt{3})^{t+1} + (-\sqrt{3})^{t+1}\end{matrix}\right] = \Phi(t+1)
\end{aligned}
$$
Therefore, $\Phi(t)$ is a fundamental matrix for the system
$$
u(t+1) = \left[\begin{matrix}0 & \frac{2+(-1)^t}{2} \\ \frac{2+(-1)^t}{2} & 0\end{matrix}\right]u(t)
$$

## 4.33

Note that the minimal period of 
$$
A(t) = \left[\begin{matrix}0 & \cos\frac{2\pi t}{3} \\ -\sin\frac{2\pi t}{3} & 0\end{matrix}\right]
$$
is $p = 3$. Then we can compute the Floquet multipliers of the system as the eigenvalues of
$$
C = A(0)A(1)A(2) = \left[\begin{matrix}0 & 1 \\ 0 & 0\end{matrix}\right]\cdot\left[\begin{matrix}0 & -\frac{\sqrt{3}}{2} \\ -\frac{1}{2} & 0\end{matrix}\right] \cdot\left[\begin{matrix}0 & -\frac{\sqrt{3}}{2} \\ \frac{1}{2} & 0\end{matrix}\right] = \left[\begin{matrix}0 & \frac{\sqrt{3}}{4} \\ 0 & 0\end{matrix}\right]
$$
Obviously, the eigenvalues of $C$, and the Floquet multipliers of the system, are $\mu_1 = \mu_2 = 0$. Since $|\mu_1| < 1$ and $|\mu_2| < 1$, every solution $y(t)$ of the system approaches $0$ as $t \to \infty$.

## 4.36

### (b)

Let $f(u) = u - u^2$. If $u$ is a periodic point of period 1 of $f$, then $u = u - u^2$, so $u = 0$ is the only periodic point of $f$ with period $1$.

Note that $f^1(u) = f(u) = u - u^2 - c_1(u)$, where $c_1(u) = 0 \ge 0$ for all $u$. Suppose for induction that $f^n(u) = u - u^2 - c_n(u)$ for some $n \ge 1$, where $c_n(u) \ge 0$ for all $u$. Then 
$$
f^{n+1}(u) = f^n(u) - (f^n(u))^2 = u - u^2 - c_n(u) - (f^n(u))^2 = u- u^2 - c_{n+1}(u)
$$
where $c_{n+1}(u) = c_n(u) + (f^n(u))^2 \ge 0$ for all $u$.

Thus, by mathematical induction, it follows that for all $n \ge 1$, $f^n(u) = u - u^2 - c_n(u)$, where $c_n(u) \ge 0$ for all $u$.

Now suppose that $u$ is a periodic point of $f$ with period $n > 1$. Then $f^n(u)=u$, which implies that $u^2 = -c_n(u) \le 0$. On the other hand, $u^2 \ge 0$. Therefore, $u = 0$. Since $0$ has period 1, it follows that $f$ has no periodic points with period $n > 1$.

## 4.38

### (a)

As the staircase method shown in Figure 1 shows, solutions with $u(0) \in (-1, 1)$ approach $0$ as $t\to\infty$; solutions with $u(0) = \pm 1$ approach $1$ as $t\to\infty$; finally, solutions with $|u(0)| > 1$ approach $\infty$ as $t \to\infty$.

![Staircase Method for 4.38 (a)](4.38a.png)

### (b)

As the staircase method shown in Figure 2 shows, solutions with $u(0) \in (-1,1)$ approach $0$ as $t\to\infty$; solutions with $u(0) = 1$ approach $1$ and solutions with $u(0) = -1$ approach $1$ and $-1$ as $t\to\infty$; finally, solutions with $u(0) > 1$ approach $\infty$, and solutions with $u(0) < -1$ approach $-\infty$ as $t \to\infty$.

![Staircase method for 4.38 (b)](4.38b.png)

## 4.42

For $f(u) = u$, the trivial solution to the equation $u(t+1) = f(u(t)) = u(t)$ is clearly stable but not asymptotically stable because all solutions have the form $u(t) = \text{constant}$. 

Since $u - u^3 < u$ when $u > 0$ and $u - u^3 > u$ when $u < 0$, the staircase method for $f(u) = u - u^3$ looks like that in Figure 3. Note that $f(1) = f(-1) = 0$. This and the staircase method show that $u(t) \to 0$ as $t\to\infty$ if $u(0) \in [-1,1]$. On the other hand, the staircase method shows that if $|u(0)| > 1$, then $|u(t)| \to \infty$ as $t\to\infty$; although, $u(t)$ itself does not approach $\pm \infty$ as $t\to\infty$. This means that the trivial solution is locally asymptotically stable but not globally asymptotically stable.

![Staircase method for $f(u) = u-u^3$](4.42-1.png)

Since $u + u^3 > u$ when $u > 0$, and $u + u^3 < u$ when $u < 0$, the staircase method for $f(u) = u + u^3$ looks like that in Figure 4. As the staircase method shows, $u(t) \to\infty$ if $u(0) > 0$, and $u(t) \to -\infty$ if $u(0) < 0$. This means that the trivial solution is unstable.

![Staircase method for $f(u)=u+u^3$](4.38b.png)
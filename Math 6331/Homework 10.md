# Homework 10

## 4.44

Let
$$
f(u) = \begin{cases}
\frac{1}{u} & u \ne 0 \\
0 & u = 0
\end{cases}
$$
and
$$
V(u) = \frac{u^2}{1+u^4}
$$
Then

- $V(u) = 0$ if $u= 0$
- $V(u) > 0$ if $u \ne 0$ because $u^2 > 0$ whenever $u \ne 0$, and $1 + u^4 > 0$ for all $u$.
- $V(f(u)) - V(u) = \frac{\frac{1}{u^2}}{1 + \frac{1}{u^4}} - \frac{u^2}{1+u^4} = 0 \le 0$ for all $u \ne 0$, and $V(f(0)) - V(0) = V(0) - V(0) \le 0$

Thus, $V$ is a Liapunov function for $f$ at $0$.

Let $\varepsilon > 0$ and $\delta > 0$ be given. Let $u(t)$ be defined by $u(t+1) = f(u(t))$ and $u(0)=u_0$, where $0 < |u_0| < \min\{\delta, 1/\varepsilon\}$. Then $|u(0)| < \delta$, but since $|u(0)| < \frac{1}{\varepsilon}$, it follows that $|u(1)| = \frac{1}{|u(0)|} > \varepsilon$. This implies that the fixed point $0$ of $u(t+1) = f(u(t))$ is unstable.

This does not contradict Theorem 4.18 because Theorem 4.18 requires that $f$ be continuous on some ball around the fixed point, but in our case $f$ is not continuous at the fixed point $0$, so it cannot be continuous on any ball containing $0$.

## 4.45

Let $V(u) = u_1^2 + u_2^2$. Then 

- $V(0) =0$
- $V(u) > 0$ if $u\ne 0$

and
$$
\begin{aligned}
V(f(u)) - V(u) &= \alpha^2u_1^{2n} + \beta^2u_2^{2n} - u_1^2 - u_2^2\\
&= u_1^2\left(\alpha^2u_1^{2(n-1)} - 1\right) + u_2^2\left(\beta^2u_2^{2(n-1)} -1\right)\\
&< 0
\end{aligned}
$$
if $\alpha^2u_1^{2(n-1)} - 1 < 0$ and $\beta^2u_2^{2(n-1)} - 1 < 0$. If $\alpha$ or $\beta$ is $0$, then the corresponding inequality is trivially satisfied. Otherwise, we need
$$
|u_1| < |\alpha|^{\frac{1}{1-n}},\qquad |u_2| < |\beta|^\frac{1}{1-n}
$$
Thus, $V$ is a strict Liapunov function for $f$ at $0$, so the fixed point $0$ of $u(t+1) = f(u(t))$ is locally asymptotically stable. 

Let $B$ be the largest ball containing $0$ such that every $u \in B$ satisfies the above inequalities (taking the corresponding righthand sides to be $\infty$ when $\alpha,\beta = 0$). Then for a solution $u(t)$ with $u(0)\in B$, we must have $V(u(1)) - V(u(0)) < 0$, which implies that $|u(1)| < |u(0)|$ (since $V(u) = |u|^2$). Then $u(1) \in B$. 

Suppose for induction that $u(t) \in B$ for some $t \ge 1$. Then $V(u(t+1)) - V(u(t)) < 0$, implying that $|u(t+1)| < |u(t)|$, so $u(t+1) \in B$. Then $u(t) \in B$ for all $t$ by induction.

Since $f$ is continuous everywhere, we can use Corollary 4.1 of Theorem 4.18 to conclude that every solution starting at a point in $B$ converges to the origin.

## 4.48

### (a)

Let
$$
f(u) = \left[\begin{matrix}\frac{\alpha u_2}{1+u_1^2} \\ \frac{\beta u_1}{1+u_2^2}\end{matrix}\right]
$$
Now let $V(u) = u_1^2 + u_2^2$. Then

- $V(0) = 0$
- $V(u) > 0$ if $u \ne 0$

and
$$
\begin{aligned}
V(f(u)) - V(u) &= \frac{\alpha^2u_2^2}{(1+u_1^2)^2} + \frac{\beta^2u_1^2}{(1+u_2^2)^2} - u_1^2 - u_2^2 \\
& \le (\beta^2 - 1)u_1^2 + (\alpha^2 - 1)u_2^2 \\
& <0
\end{aligned}
$$
if $\beta^2 < 1$ and $\alpha^2 < 1$. Therefore, the origin is an asymptotically stable fixed point of $u(t+1) =f(u(t))$.

## (b)

Keeping $f$ and $V$ from before, set $\omega(u) = (1 - \beta^2)u_1^2 + (1- \alpha^2)u_2^2$. Then $V$ is bounded below by $0$, and
$$
V(f(u)) \le -\omega(u)
$$
for all $u$, and if $\alpha^2 < 1$ and $\beta^2 < 1$, then $\omega(u) \ge 0$ for all $u$. Using Theorem 4.19 with $D =\textbf{R}^2$, we obtain that $\omega(u(t)) \to 0$ as $t\to \infty$ for any solution $u(t)$ of $u(t+1) = f(u(t))$.   Then
$$
\gamma |u(t)|^2 \le \omega(u(t))
$$
where $0 < \gamma \le \min\{1-\beta^2, 1-\alpha^2\}$. This implies that $|u(t)| \to 0$ as $t \to \infty$. Since $u(t)$ was an arbitrary solution, it follows that the origin is asymptotically stable.

## 4.49

First, we need to find the fixed points of
$$
f(u) = \left[\begin{matrix}2u_1-\frac{2u_1u_2}{1+u_1} \\ \frac{2u_1u_2}{1+u_1}\end{matrix}\right]
$$
If $f(u) = u$, then we need $u_1 = \frac{2u_1u_2}{1+u_1}$, and $u_2 = \frac{2u_1u_2}{1+u_1}$. Then $u_1 = u_2$, and either $u_1 = u_2 = 0$ or $1 + u_1 = 2u_2$, which implies that $u_1 = u_2 = 1$. Thus, the two fixed points of $f$ are
$$
u^1 = \left[\begin{matrix}0\\0\end{matrix}\right], \qquad u^2 = \left[\begin{matrix}1\\1\end{matrix}\right]
$$
Furthermore, the Jacobian of $f$ is
$$
J(u) = \left[\begin{matrix}2 -\frac{2u_2}{(1+u_1)^2} & -\frac{2u_1}{1 + u_1} \\ \frac{2u_2}{(1+u_1)^2} & \frac{2u_1}{1+u_1}\end{matrix}\right]
$$
Evaluating the Jacobian at $u^1$ gives
$$
J(u^1) = \left[\begin{matrix}2 & 0 \\ 0 & 0\end{matrix}\right]
$$
which has eigenvalues $0$ and $2$, so $r(J(u^1)) = 2 > 1$, which implies that $u^1$ is an unstable fixed point.

Evaluating the Jacobian at $u^2$ gives
$$
J(u^2) = \left[\begin{matrix}\frac{3}{2} & -1 \\ \frac{1}{2} & 1\end{matrix}\right]
$$
The characteristic equation of this matrix $\lambda^2 - \frac{5}{2}\lambda + 2= 0$, which has roots
$$
\lambda = \frac{5}{4} \pm \frac{1}{2}\sqrt{\frac{25}{4} - 8}
$$
Since $\frac{25}{4} - 8 < 0$, the real part of both roots is $\frac{5}{4}$, and $|\lambda| \ge |\text{Re}(\lambda)| = \frac{5}{4} >1$, that is, the modulus of both eigenvalues is greater than 1. Therefore, $r(J(u^2)) > 1$, which implies that the fixed point $u^2$ is unstable.
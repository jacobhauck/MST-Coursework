# Homework 2

## 1. 

Let $f: \textbf{R}^n \to \textbf{R}$ be twice continuously differentiable. Then $f$ is $m$-strongly convex if and only if $\nabla^2f(x) \succeq mI$ for all $x \in \textbf{R}^n$.

_Proof_. Say that $f$ has property $P(m)$ if and only if
$$\tag{$P(m)$}
f(y) \ge f(x) + \nabla f(x)^T(y-x) + \frac{m}{2} \lVert x- y\rVert^2\quad \text{for all $x,y\in \textbf{R}^n$}
$$
We prove that for $f \in C^2$
$$
\text{$f$ is $m$-strongly convex} \iff \text{$f$ has property $P(m)$} \iff \text{$\nabla^2f \succeq mI$ on $\textbf{R}^n$}
$$
The result clearly follows from this chain of equivalences.

### $f$ is $m$-strongly convex $\implies$ $f$ has property $P(m)$

Let $x,y \in \textbf{R}^n$. Since $f$ is $m$-strongly convex,
$$
f((1-\alpha) x + \alpha y) \le (1-\alpha) f(x) + \alpha f(y) - \frac{m}{2}\alpha(1-\alpha)\lVert x - y\rVert^2
$$
for all $\alpha \in [0,1]$. Since $f$ is $C^2$, we can also use Taylor's Theorem to write
$$
f((1-\alpha)x + \alpha y) - f(x) = \alpha\nabla f(x)^T(y-x) + O(\alpha^2)
$$
Combining with the strong convexity inequality gives
$$
\alpha (f(y) - f(x)) - \frac{m}{2}\alpha(1-\alpha)\lVert x-y\rVert^2 \ge \alpha\nabla f(x)^T(y-x) + O(\alpha^2)
$$
for any $\alpha \in [0,1]$. Then, for any $0 < \alpha \le 1$, we have
$$
f(y) - f(x) - \frac{m}{2}(1-\alpha)\lVert x - y\rVert^2 \ge \nabla f(x)^T(y-x) + O(\alpha)
$$
Taking the limit as $\alpha \to 0$ of both sides finally results in
$$
f(y) - f(x) \ge \nabla f(x)^T(y-x) + \frac{m}{2}\lVert x-y\rVert^2
$$
that is, $f$ has the property $P(m)$.

### $f$ has property $P(m)$ $\implies$ $f$ is $m$-strongly convex

Let $x, y\in \textbf{R}^n$, and let $\alpha \in [0,1]$. Set $z = (1-\alpha)x + \alpha y$. Then using the fact that $f$ has the property $P(m)$ gives
$$
f(x) \ge f(z) + \nabla f(z)^T(x - z) + \frac{m}{2}\lVert x- z \rVert^2
$$
and
$$
f(y) \ge f(z) + \nabla f(z)^T(y-z) + \frac{m}{2}\lVert y -z \rVert^2
$$
These are the same as
$$
\begin{aligned}
f(x) &\ge f(z) + \alpha \nabla f(z)^T(x-y) + \alpha^2\frac{m}{2}\lVert x - y\rVert^2 \\
f(y) &\ge f(z) + (1-\alpha)\nabla f(z)^T(y-x) + (1-\alpha)^2\frac{m}{2}\lVert x- y\rVert^2
\end{aligned}
$$
Multiplying the top equation by $(1-\alpha)$ and the bottom by $\alpha$ and adding them together gives
$$
(1-\alpha) f(x) + \alpha f(y) \ge f(z) + \alpha(1-\alpha)(\alpha + (1-\alpha))\frac{m}{2}\lVert x - y\rVert^2
$$
from which it follows that
$$
f((1-\alpha)x + \alpha y) \le (1-\alpha)f(x) + \alpha f(y) - \frac{m}{2}\alpha(1-\alpha)\lVert x- y\rVert^2
$$
that is, $f$ is $m$-strongly convex.

### $\nabla^2f \succeq mI$ on $\textbf{R}^n$ $\implies$ $f$ has property $P(m)$

If $\nabla^2f(x) \succeq mI$ for all $x \in \textbf{R}^n$, then the eigenvalues of $\nabla^2f(x)$ are $\ge m$. This implies that for any $v \in \textbf{R}^n$, $v^T \nabla^2f(x) v \ge m\lVert v\rVert^2$.

Let $x, y\in \textbf{R}^n$. Then, by the (higher-order) Mean Value Theorem, there exists $t\in[0,1]$ such that
$$
\begin{aligned}
f(y) &= f(x) + \nabla f(x)^T(y-x) +\frac{1}{2}(y-x)^T\nabla^2f(x+t(y-x))(y-x)\\
&\ge f(x) + \nabla f(x)^T(y-x) +\frac{m}{2}\lVert x- y\rVert^2
\end{aligned}
$$
Thus, $f$ has the property $P(m)$.

### $f$ has property $P(m)$ $\implies$ $\nabla^2f \succeq mI$ on $\textbf{R}^n$

Let $x \in \textbf{R}^n$. Given $\varepsilon > 0$, we can use the continuity of $\nabla^2f$  at $x$ to choose $\delta > 0$ such $\lVert x - y \rVert < \delta$ implies that $\left\lVert\nabla^2f(y) - \nabla^2f(x)\right\rVert < \varepsilon$, which in turn implies that
$$
\left\lVert \nabla^2f(x+\beta(y-x)) - \nabla^2f(x)\right\rVert < \varepsilon
$$
for all $\beta \in [0,1]$ and any $y \in\textbf{R}^n$ such that $\lVert x- y\rVert < \delta$.

Since $f$ is $C^2$, we can write
$$
\begin{aligned}
f(y) - f(x) = {}&\nabla f(x)^T(y-x) + \frac{1}{2}(y-x)^T\nabla^2f(x)(y-x)\\
&{}+{}\int_0^1\int_0^\gamma(y-x)^T\left(\nabla^2f(x + \beta(y-x)) - \nabla^2f(x)\right)(y-x)\;\text{d}\beta\;\text{d}\gamma
\end{aligned}
$$
for all $y$. Using the continuiuty of $\nabla^2f$ together with the fact that $f$ has property $P(m)$, we obtain
$$
\frac{m}{2}\lVert x  - y\rVert^2 \le \frac{1}{2}(y-x)^T\nabla^2f(x)(y-x) + \frac{1}{2}\varepsilon\lVert x- y\rVert^2
$$
for all $y$ such that $\lVert x - y \rVert < \delta$. Then, for $x \ne y$, we can divide by $\lVert x-y  \rVert^2$ to obtain
$$
m \le u^T \nabla^2f(x)u + \varepsilon
$$
for any unit vector $u \in \textbf{R}^n$. Since $\varepsilon > 0$ was arbitrary, this shows that $m \le u^T \nabla^2f(x)u$ for any unit vector $u$. 

On the other hand, $\lambda \ge u^T \nabla^2f(x) u \ge m$ for any eigenvalue $\lambda$ of $\nabla^2f(x)$ and any unit vector $u$. Thus, all eigenvalues of $\nabla^2f(x)$ are $\ge m$, that is, $\nabla^2f(x) \succeq mI$ for all $x \in \textbf{R}^n$.

## 2.

Consider the $j$-th component of $\delta^{[l]}_j$, and use the chain rule, viewing $C$ as a function of $a^{[l+1]}$, which is itself a function of $z^{[l]}_j$:
$$
\begin{aligned}
\delta^{[l]}_j = \frac{\partial C}{\partial z_j^{[l]}} &= \sum_i \frac{\partial a^{[l+1]}_i}{\partial z^{[l]}_j}\frac{\partial C}{\partial a^{[l+1]}_i}\\
&=\sigma'\Big(z^{[l]}_j\Big)\frac{\partial C}{\partial a^{[l+1]}_j}= \left[\sigma'\left(z^{[l]}\right)\right]_j\frac{\partial C}{\partial a^{[l+1]}_j}
\end{aligned}
$$
where $\frac{\partial a^{[l+1]}_i}{\partial z^{[l]}_j}$ can be easily evaluated by observing that $a^{[l+1]}_i$ depends only $z^{[l]}_i$, so the derivative is nonzero only when $i=j$, and in this case it is equal to $\sigma'\left(z^{[l]}_j\right) = \left[\sigma'\left(z^{[l]}\right)\right]_j$ by definition.

Viewing $C$ as a function of $z^{[l+1]}$, which is a function of $a^{[l]}_j$, we can use the chain rule to obtain
$$
\frac{\partial C}{\partial a^{[l+1]}_j} = \sum_i \frac{\partial z^{[l+1]}_i}{\partial a^{[l+1]}_j}\frac{\partial{C}}{\partial z^{[l+1]}_i} = \sum_i \frac{\partial z^{[l+1]}_i}{\partial a^{[l+1]}_j}\delta^{[l+1]}_i
$$
Using the definition of $z^{[l+1]}_i$, we can write
$$
z^{[l+1]}_i = \sum_k W^{[l+1]}_{ik}a^{[l+1]}_k
$$
which implies that $\frac{\partial z^{[l+1]}_i}{\partial a^{[l+1]}_j} = W^{[l+1]}_{ij}$, so
$$
\frac{\partial C}{\partial a^{[l+1]}_j} = \sum_i W^{[l+1]}_{ij}\delta^{[l+1]}_i = \left[\left(W^{[l+1]}\right)^T\delta^{[l+1]}\right]_j
$$
Therefore,
$$
\delta^{[l]}_j= \left[\sigma'\left(z^{[l]}\right)\right]_j\left[\left(W^{[l+1]}\right)^T\delta^{[l+1]}\right]_j = \left[\sigma'\left(z^{[l]}\right)\circ \left(W^{[l+1]}\right)^T\delta^{[l+1]}\right]_j
$$
that is,
$$
\delta^{[l]} = \sigma'\left(z^{[l]}\right)\circ \left(W^{[l+1]}\right)^T\delta^{[l+1]}
$$

## 3. 

Assuming that the function $f$ is bounded below, it follows that the sequence $\{f(x^k)\}$ is bounded below. Moreover, the assumed inequality implies that the sequence $\{f(x^k)\}$ is decreasing. Therefore, $\{f(x^k)\}$ converges. Then the sequence $\{a_k\}$ defined by
$$
a_k = \lVert \nabla f(x^k) \rVert \le \frac{f(x^k) - f(x^{k+1})}{C}
$$
converges to $0$ because $f(x^k) - f(x^{k+1}) \to 0$ by the Cauchy criterion. Hence, the sequence $\{\nabla f(x^k)\}$ converges to $0$ also.

If there is a subsequence $x^{k_n} \to \bar{x}$ as $n \to \infty$, then, by the continuity of $\nabla f$ (which is implied by the Lipschitz assumption on $\nabla f$), it follows that
$$
\nabla f(\bar{x})=\lim_{n\to\infty}\nabla f(x^{k_n}) = 0
$$

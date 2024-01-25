# Homework 1

## 1.

Suppose that $\boldsymbol{v} = \left(\begin{matrix}1\\-1\end{matrix}\right)$. Then by definition
$$
\begin{aligned}
g_\mathcal{W}(\boldsymbol{x}) &= \boldsymbol{v}^T\sigma\left(W\boldsymbol{x}\right) = \left(\begin{matrix}1&-1\end{matrix}\right)\sigma(W\boldsymbol{x})\\
&=\left(\begin{matrix}1&-1\end{matrix}\right)\left(\begin{matrix}\sigma\left(\boldsymbol{w}^T\boldsymbol{x}\right)\\\sigma\left(\boldsymbol{u}^Tx\right)\end{matrix}\right)\\
&=\sigma\big(\langle\boldsymbol{w}, \boldsymbol{x}\rangle\big) - \sigma\big(\langle\boldsymbol{u}, \boldsymbol{x}\rangle\big)
\end{aligned}
$$
where $W = \left(\begin{matrix}\boldsymbol{w}^T\\\boldsymbol{u}^T\end{matrix}\right)$. If $n = 1$ and $y_1 = -1$, then the loss function $L_S(\mathcal{W})$ can be written as
$$
\begin{aligned}
L_S(\mathcal{W}) = L_S(\boldsymbol{w}, \boldsymbol{u}) &= \max(1-y_1g_\mathcal{W}(\boldsymbol{x}_1), 0)\\
&= \max\big(1 + \sigma\big(\langle\boldsymbol{w}, \boldsymbol{x}_1\rangle\big) - \sigma\big(\langle\boldsymbol{u}, \boldsymbol{x}_1\rangle\big), 0\big)
\end{aligned}
$$

## 2.

Using the result from 1. and the assumption that $\boldsymbol{w}_1=\boldsymbol{w}_2 = \boldsymbol{u}_1 = \boldsymbol{x}_1$, and $\boldsymbol{u}_2 = \boldsymbol{x}_2$,
$$
\begin{aligned}
L_S\left(\frac{\boldsymbol{w}_1+\boldsymbol{w}_2}{2},\frac{\boldsymbol{u}_1 + \boldsymbol{u}_2}{2}\right) &= L_S(\boldsymbol{x}_1, 0) = \max\big(1 + \sigma\big(\langle\boldsymbol{x}_1, \boldsymbol{x}_1\rangle\big) - \sigma\big(\langle 0, \boldsymbol{x}_1\rangle\big), 0\big)\\
&=\max(1+\sigma(\lVert\boldsymbol{x}_1\rVert^2) - \sigma(0),0) = 1 + \lVert \boldsymbol{x}_1\rVert^2
\end{aligned}
$$
since $\sigma(\lVert\boldsymbol{x}_1\rVert^2) = \lVert\boldsymbol{x}_1\rVert^2$, and $\sigma(0) = 0$. On the other hand,
$$
\begin{aligned}
\frac{1}{2}&L_S(\boldsymbol{w}_1 \boldsymbol{u}_1) + \frac{1}{2}L_S(\boldsymbol{w}_2, \boldsymbol{u}_2) = \frac{1}{2}L_S(\boldsymbol{x}_1, \boldsymbol{x}_1) + \frac{1}{2}L_S(\boldsymbol{x}_1, -\boldsymbol{x}_1)\\
&= \frac{1}{2}\max(1+\sigma(\langle\boldsymbol{x}_1,\boldsymbol{x}_1\rangle) - \sigma(\langle\boldsymbol{x}_1,\boldsymbol{x}_1\rangle),0) + \frac{1}{2}\max(1+\sigma(\langle\boldsymbol{x}_1,\boldsymbol{x}_1\rangle) - \sigma(\langle-\boldsymbol{x}_1,\boldsymbol{x}_1\rangle),0)\\
&=\frac{1}{2}+\frac{1}{2}\max(1+\sigma(\lVert\boldsymbol{x}_1\rVert^2) - \sigma(-\lVert\boldsymbol{x}_1\rVert^2),0)\\
&=1+\frac{1}{2}\lVert\boldsymbol{x}_1\rVert^2
\end{aligned}
$$
since the ReLU function $\sigma$ is zero for negative inputs and the identity for positive inputs. Then because of the assumption $\lVert\boldsymbol{x}_1\rVert > 0$,
$$
L_S\left(\frac{\boldsymbol{w}_1+\boldsymbol{w}_2}{2},\frac{\boldsymbol{u}_1 + \boldsymbol{u}_2}{2}\right) =1 + \lVert\boldsymbol{x}_1\rVert^2 > 1 + \frac{1}{2}\lVert\boldsymbol{x}_1\rVert^2 = \frac{1}{2}L_S(\boldsymbol{w}_1, \boldsymbol{u}_1) + \frac{1}{2}L_S(\boldsymbol{w}_2, \boldsymbol{u}_2)
$$
so $L_S$ is not convex.

## 3.

Let $x, y\in\textbf{R}^n$ and $0 < \alpha \le 1$. Define $z = (1-\alpha)x + \alpha y$, so that $z - x = \alpha(y-x)$. Since $f$ is convex, we can write
$$
(1-\alpha)f(x) + \alpha f(y) \ge f(z) \implies \alpha(f(y)-f(x)) \ge f(z) - f(x)
$$
$\nabla f$ is continuous because $f \in C^1$, so for $\varepsilon > 0$, there exists $\delta > 0$ such that $\lVert w- x\rVert < \delta$ implies that $\lVert \nabla f(w) - \nabla f(x) \rVert < \varepsilon$. Then we can choose $\alpha$ small enough that $\gamma \lVert y - x\rVert < \delta$ for all $\gamma \in [0,\alpha]$, meaning that
$$
\begin{aligned}
f(z) - f(x) &= \int_0^\alpha \nabla f(x+\gamma(y-x))^T(y-x)\;\text{d}\gamma \\
&= \int_0^\alpha \nabla f(x)^T\gamma(y-x)\;\text{d}\gamma + \int_0^\alpha (\nabla f(x + \gamma (y-x)) - \nabla f(x))^T(y-x)\;\text{d}\gamma\\
&\ge \nabla f(x)^T\alpha(y-x) - \int_0^\alpha \varepsilon\lVert y- x\rVert\;\text{d}\gamma\\
&\ge \nabla f(x)^T\alpha(y-x) - \varepsilon\alpha \lVert y - x\rVert
\end{aligned}
$$
Combining this with the convexity inequality above gives
$$
\alpha(f(y) - f(x)) \ge \alpha\nabla f(x)^T(y-x) - \varepsilon\alpha\lVert y-x\rVert
$$
or, dividing by $\alpha > 0$,
$$
f(y) \ge f(x) + \nabla f(x)^T(y-x) -\varepsilon\lVert y- x\rVert
$$
which implies that 
$$
f(y) \ge f(x) + \nabla f(x)^T(y-x)
$$
because $\varepsilon > 0$ was arbitrary.
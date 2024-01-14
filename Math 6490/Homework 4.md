# Homework 4

## 1.

Let
$$
f(x) = \frac{1}{n}\sum_{i=1}^n f_i(x)
$$
and let $1 \le m \le n$. Define
$$
g(x, B_k) = \frac{1}{m}\sum_{i \in B_k} \nabla f_i(x)
$$
where the $B_k \subset \{1,2,\dots,n\}$ form an i.i.d. sequence of size-$m$ minibatches sampled uniformly at random. Then $g(x, B_k)$ is an unbiased estimator of $\nabla f(x)$ for all $x$ and all $k$.

_Proof_. Let $P_m$ be the set of all size-$m$ subsets of $\{1,2,\dots,n\}$. Since $B_k$ is sampled uniformly at random from $P_m$, it must have probability mass function $p(B) = \frac{1}{|P_m|}$ for all $B \in P_m$.

Then for any $x$ and any $k$,
$$
\begin{aligned}
\textbf{E}\left[g(x, B_k)\right] &= \sum_{B\in  P_m}p(B)g(x,B) \\
&= \sum_{B \in P_m}\frac{1}{|P_m|}\cdot\frac{1}{m}\sum_{i \in B} \nabla f_i(x)
\end{aligned}
$$
The total number of terms in this sum is $|P_m| \cdot m$, and by symmetry it is clear that $\nabla f_i(x)$ appears in the same number of terms for all $i$; let this number of terms be $T$. Then $Tn = m|P_m|$, so $T = \frac{m|P_m|}{n}$, and we get
$$
\textbf{E}[g(x,B_k)] = \frac{1}{m|P_m|}\sum_{i=1}^n T\nabla f_i(x) = \frac{1}{n}\sum_{i=1}^n\nabla f_i(x) = \nabla f(x)
$$

## 2.

We use the shortcut formula for covariance
$$
\text{Cov}(g(x, B_k)) = \textbf{E}\left[g(x, B_k)\cdot g(x,B_k)^T\right] - \textbf{E}\left[g(x, B_k)\right]\cdot\textbf{E}\left[g(x,B_k)\right]^T
$$
Using the result from problem 1. gives
$$
\text{Cov}(g(x,B_k)) = \textbf{E}\left[g(x, B_k) \cdot g(x, B_k)^T\right] - \nabla f(x) \cdot \nabla f(x)^T
$$
Define $G_{ij} = \nabla f_i(x) \nabla f_j(x)^T$. Focusing on the first term, we have 
$$
\begin{aligned}
\textbf{E}\left[g(x, B_k)\cdot g(x, B_k)^T\right] &= \frac{1}{m^2}\textbf{E}\left[\sum_{(i,j) \in B_k^2} G_{ij}\right] = \frac{1}{m^2} \sum_{B \in P_m}\sum_{(i,j)\in B^2} p(B)G_{ij} \\\\
&= \frac{1}{m^2|P_m|}\left[\sum_{B \in P_m}\sum_{\substack{(i,j)\in B^2\\ i\ne j}} G_{ij} + \sum_{B \in P_m}\sum_{i\in B}G_{ii}\right]
\end{aligned}
$$
As in problem 1., each $G_{ii}$ appears $T = \frac{m|P_m|}{n}$ times in the second sum. In the first sum, each $G_{ij}$ appears the same number of times by symmetry; let this number be $L$. The total number of terms in the first sum is $m(m-1)|P_m|$, and there are $n(n-1)$ products $G_{ij}$, so $n(n-1)L = m(m-1)|P_m|$, and $L = \frac{m(m-1)|P_m|}{n(n-1)}$. Thus,
$$
\begin{aligned}
\textbf{E}\left[g(x, B_k)\cdot g(x, B_k)^T\right] &=\frac{1}{m^2}\left[\frac{m(m-1)}{n(n-1)}\sum_{i \ne j}G_{ij} + \frac{m}{n}\sum_{i=1}^nG_{ii}\right]\\
&=\frac{m-1}{mn(n-1)}\sum_{i,j=1}^nG_{ij} +\left(\frac{1}{mn}-\frac{m-1}{mn(n-1)}\right)\sum_{i=1}^n G_{ii} \\
\end{aligned}
$$
As for the second term in the covariance, we get
$$
\begin{aligned}
\nabla f(x) \nabla f(x)^T &= \frac{1}{n^2}\sum_{i,j=1}^n G_{ij}
\end{aligned}
$$
Therefore,
$$
\begin{aligned}
\text{Cov}(g(x,B_k)) &= \left(\frac{1}{mn} - \frac{m-1}{mn(n-1)}\right)\sum_{i=1}^n G_{ii} + \left(\frac{m-1}{mn(n-1)} - \frac{1}{n^2}\right)\sum_{i,j=1}^nG_{ij}
\end{aligned}
$$
Since
$$
\frac{1}{mn} - \frac{m-1}{mn(n-1)}= \left(\frac{1}{m} - \frac{1}{n}\right)\frac{1}{n-1}
$$
and
$$
\begin{aligned}
\frac{m-1}{mn(n-1)} - \frac{1}{n^2} &= \frac{1}{n}\left(\frac{n(m-1) - m(n-1)}{mn(n-1)}\right) = \frac{1}{n}\frac{m-n}{mn(n-1)}\\
&= \left(\frac{1}{n} - \frac{1}{m}\right)\frac{1}{n(n-1)}
\end{aligned}
$$
we have
$$
\begin{aligned}
\text{Cov}(g(x,B_k)) &= \left(\frac{1}{m} - \frac{1}{n}\right)\left[\frac{1}{n-1}\sum_{i=1}^n G_{ii} - \frac{1}{n(n-1)}\sum_{i,j=1}^n G_{ij}\right] \\
&= \left(\frac{1}{m}- \frac{1}{n}\right) \Sigma_0(x)
\end{aligned}
$$
where
$$
\Sigma_0(x) = \frac{1}{n-1}\sum_{i=1}^n(\nabla f(x) - \nabla f_i(x))(\nabla f(x) - \nabla f_i(x))^T
$$
This follows from the fact that
$$
\begin{aligned}
\Sigma_0(x) &= \frac{1}{n-1}\sum_{i=1}^n\nabla f(x) \nabla f(x)^T - 2\nabla f_i(x)\nabla f(x)^T + \nabla f_i(x)\nabla f_i(x)^T \\
&= \frac{1}{n-1}\sum_{i=1}^n G_{ii} + \frac{n}{n-1}\nabla f(x)\nabla f(x)^T - \frac{2}{n-1}\sum_{i=1}^n\nabla f_i(x) \cdot\frac{1}{n}\sum_{j=1}^n \nabla f_j(x)\\
&= \frac{1}{n-1}\sum_{i=1}^n G_{ii} + \frac{1}{n(n-1)}\sum_{i,j=1}^n G_{ij} - \frac{2}{n(n-1)}\sum_{i,j=1}^n G_{ij} \\
&= \frac{1}{n-1}\sum_{i=1}^n G_{ii} - \frac{1}{n(n-1)}\sum_{i,j=1}^n G_{ij}
\end{aligned}
$$

## 3.

If $f \in C^2$ is $m$-strongly convex, then the _curvature condition_ holds:
$$
(x-y)^T(\nabla f(x) - \nabla f(y)) > 0
$$
for all $x, y \in \text{dom}(f)$ such that $x \ne y$.

_Proof_. Since $f \in C^2$, we may use Taylor's Theorem to write
$$
\nabla f(x) - \nabla f(y) = \int_0^1 \nabla^2f(y + \gamma (x-y))(x-y)\;\text{d}\gamma
$$
Multiplying by $(x-y)^T$ on the left on both sides gives
$$
(x-y)^T(\nabla f(x) - \nabla f(y)) = \int_0^1 (x-y)^T\nabla^2 f(y+\gamma(x-y))(x-y)\;\text{d}\gamma
$$
Since $f$ is $m$-strongly convex, we must have $z^T\nabla^2f(x) z \ge m\lVert z\rVert^2$ for all $x \in \text{dom}(f)$ and all $z \in \textbf{R}^n$. Then
$$
(x-y)^T(\nabla f(x) - \nabla f(y)) \ge \int_0^1 m\lVert x-y\rVert^2\;\text{d}\gamma > 0
$$
because $x \ne y$, and $m > 0$.
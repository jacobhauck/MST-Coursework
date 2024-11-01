# Homework 1

## Rudin 6.1

Let $\alpha$ be increasing on $[a,b]$ and continuous at $x_0 \in [a,b]$. Suppose that $f(x_0) = 1$ and $f(x) = 0$ when $x \ne x_0$. Then $f \in \mathscr{R}(\alpha)$ and $\int_a^b f\;\text{d}\alpha=0$.

*Proof*. Let $\varepsilon > 0$ be given. Since $\alpha$ is continuous at $x_0$, there exists $\delta > 0$ such that $|x-x_0| <\delta\implies |\alpha(x) - \alpha(x_0)| < \varepsilon$. Let $P = \{y_0, y_1, y_2, y_3\}$ be a partition of $[a,b]$ such that $0 <|y_1 - x_0| < \delta$ and $0<|y_2 -x_0| < \delta$.

Then we have $\Delta \alpha_2 < 2\varepsilon$, and $M_1 = M_3 = 0$, and $M_2 = 1$. This implies that
$$
U(P,f,\alpha) = M_2\Delta \alpha_2 < 2\varepsilon
$$
On the other hand, we have $m_i = 0$ for $i=1,2,3$. This implies that
$$
L(P,f,\alpha) = 0
$$
Hence,
$$
0 = L(P,f,\alpha) \le \int_a^b f\;\text{d}\alpha \le U(P,f,\alpha) < 2\varepsilon
$$
Since $\varepsilon$ was arbitrary, we conclude that $f\in \mathscr{R}(\alpha)$ and $\int_a^b f \;\text{d}\alpha = 0$.

## Rudin 6.2

Suppose $f(x) \ge 0$ for $x\in[a,b]$ and $f$ is continuous on $[a,b]$, and $\int_a^b f(x) \;\text{d}x = 0$. Then $f = 0$.

*Proof*. Suppose on the contrary that $f(x^*) = y > 0$ for some $x^* \in [a,b]$. Using the continuity of $f$, choose $\delta$ such that $|x - x^*| <  \delta$ implies that $|f(x) - f(x^*)| = |f(x) - y| < \frac{y}{2}$. If $x^* = a$ or $x^*=b$, then by the continuity of $f$, there is another point $x^{**}\in(a,b)$ so that $f(x^{**}) > 0$, so we may assume that $x^* \in(a,b)$.

Let $P = \{x_0, x_1=x^*, x_2, x_3\}$ be a partition of $[a,b]$ such that $\Delta x_2 < \delta$. Then for all $x \in [x_1, x_2]$, we have $|x - x^*| < \delta$ and, consequently, $|f(x) - y| < \frac{y}{2}$, which implies that $f(x) > \frac{y}{2}$. Therefore, $m_2 \ge \frac{y}{2} > 0$. 

On the other hand, since $f(x) \ge 0$ for all $x \in [a, b]$, we must have $m_i \ge 0$ for $i =1,3$ as well. Thus,
$$
L(P, f) = \sum_{i=1}^3 m_i\Delta x_i \ge m_2\Delta x_2 > 0
$$
This would imply that
$$
0 < L(P, f) \le \int_a^b f(x) \;\text{d}x = 0
$$
This is a contradiction, so the assumption $f(x^*) > 0$ is false, that is, $f(x^*) \le 0$. This shows that $f(x^*) =  0$, but $x^*\in[a,b]$ was arbitrary, so $f = 0$ identically.

## Rudin 6.3

Define three functions $\beta^1,\beta^2, \beta^3$ as follows: $\beta^j(x) = 0$ if $x < 0$ and $\beta^j(x) = 1$ if $x > 0$ for $j=1,2,3$; and $\beta^1(0) = 0$, $\beta^2(0) = 1$, and $\beta^3(0)=\frac{1}{2}$. Let $f$ be bounded on $[-1, 1]$.

### (a)

$f \in \mathscr{R}(\beta^1)$ if and only if $f(0+) = f(0)$, and then
$$
\int f\;\text{d}\beta^1 = f(0)
$$
_Proof_. 

#### "If"

Suppose that $f(0+) = f(0)$. Then given $\varepsilon > 0$, there exists $\delta > 0$ such that $0 < x < \delta$ implies that $|f(x) - f(0)| < \varepsilon$.

Let $P = \{x_0, x_1=0, x_2, x_3\}$ be a partition of $[-1, 1]$ such that $0 < x_2 < \delta$. Then $\Delta \beta^1_2 = 1$, and $\Delta \beta^1_i = 0$ if $i \ne 2$. Therefore,
$$
U(P, f) - L(P, f) = M_2 - m_2 \le 2\varepsilon
$$
since 
$$
\begin{aligned}
M_2 - m_2 &= \sup_{x,y\in[x_1, x_2]} |f(x) - f(y)|\\
&\le \sup_{x,y\in[x_1,x_2]}\Big[|f(x) - f(0)| + |f(y) - f(0)|\Big]\\
&\le 2\varepsilon
\end{aligned}
$$
This implies that $f \in \mathscr{R}(\beta^1)$ since $\varepsilon$ was arbitrary.

#### The integral

Note that
$$
\begin{aligned}
M_2 &= \sup_{x\in[x_1, x_2]}f(x) \le f(0) + \sup_{x \in[x_1,x_2]}|f(x) - f(0)|\\
&\le f(0) + \varepsilon
\end{aligned}
$$
and
$$
\begin{aligned}
-m_2 &= \sup_{x\in[x_1, x_2]}\Big[-f(x)\Big] \le -f(0) + \sup_{x\in[x_1,x_2]}|f(x) - f(0)| \\
&\le -f(0) + \varepsilon
\end{aligned}
$$
so that $m_2 \ge f(0) - \varepsilon$.

In the above we have $L(P,f) = m_2$ and $U(P, f) = M_2$. Therefore
$$
f(0) - \varepsilon \le m_2 \le \int f\;\text{d}\beta^1 \le M_2 \le f(0) + \varepsilon
$$
which implies that
$$
\left|\int f \;\text{d}\beta^1 - f(0)\right| \le \varepsilon
$$
This proves that
$$
\int f\;\text{d}\beta^1 = f(0)
$$
because $\varepsilon>0$ was arbitrary.

#### "Only if"

Suppose that $f \in \mathscr{R}(\beta_1)$. Then for $\varepsilon >0$ there exists a partition $P$ of $[-1, 1]$ such that
$$
U(P, f) - L(P, f) < \varepsilon
$$
Assume that $0 \in P$ (if not, replace $P$ by a refinement containing $0$, which still satisfies the above inequality), say, $x_{i-1} = 0$. Then we have $\Delta \beta^1_j = 0$ for all $j \ne i$, and $\Delta \beta^1_i = 1$. Thus, the inequality reduces to
$$
M_i - m_i < \varepsilon
$$
Choose $\delta = \Delta x_i$; then $0 < x < \delta$ implies that $|f(x) - f(0)| < \varepsilon$, as $f(x)$ and $f(0)$ are between $m_i$ and $M_i$ (because $x \in [x_{i-1},x_i]$). This means that $f(0+) = f(0)$ by definition.

### (b)

Similar to part (a), we have $f \in \mathscr{R}(\beta^2)$ if and only if $f(0-) = f(0)$, and then
$$
\int f \;\text{d}\beta^2 = f(0)
$$
_Proof_. 

#### "If"

Suppose that $f(0-) = f(0)$. Then given $\varepsilon > 0$, there exists $\delta > 0$ such that $-\delta < x < 0$ implies that $|f(x) - f(0)| < \varepsilon$.

Let $P = \{x_0, x_1, x_2=0, x_3\}$ be a partition of $[-1, 1]$ such that $-\delta < x_1 < 0$. Then $\Delta \beta^2_2 = 1$, and $\Delta \beta^2_i = 0$ if $i \ne 2$. Therefore,
$$
U(P, f) - L(P, f) = M_2 - m_2 \le 2\varepsilon
$$
by the same reasoning from (a). This implies that $f \in \mathscr{R}(\beta^2)$ since $\varepsilon$ was arbitrary.

#### The integral

In the above we have $L(P,f) = m_2$ and $U(P, f) = M_2$. Therefore (by the same reasoning from (a))
$$
f(0) - \varepsilon \le m_2 \le \int f\;\text{d}\beta^2 \le M_2 \le f(0) + \varepsilon
$$
which implies that
$$
\int f\;\text{d}\beta^2 = f(0)
$$
because $\varepsilon>0$ was arbitrary.

#### "Only if"

Suppose that $f \in \mathscr{R}(\beta_2)$. Then for $\varepsilon >0$ there exists a partition $P$ of $[-1, 1]$ such that
$$
U(P, f) - L(P, f) < \varepsilon
$$
Assume that $0 \in P$ (if not, replace $P$ by a refinement containing $0$, which still satisfies the above inequality), say, $x_{i} = 0$. Then we have $\Delta \beta^2_j = 0$ for all $j \ne i$, and $\Delta \beta^2_i = 1$. Thus, the inequality reduces to
$$
M_i - m_i < \varepsilon
$$
Choose $\delta = \Delta x_i$; then $-\delta < x < 0$ implies that $|f(x) - f(0)| < \varepsilon$, as $f(x)$ and $f(0)$ are between $m_i$ and $M_i$ (because $x \in [x_{i-1},x_i]$). This means that $f(0-) = f(0)$ by definition.

### (c)

$f \in \mathscr{R}(\beta^3)$ if and only if $f$ is continuous at $0$.

_Proof_. 

#### "If"

Suppose that $f$ is continuous at $0$. Then $f \in \mathscr{R}(\beta^1)$ and $f \in \mathscr{R}(\beta^2)$ by (a) and (b). Therefore $f \in \mathscr{R}(\beta^3)$ because $\beta^3 = \frac{\beta^1 +\beta^2}{2}$.

#### "Only if"

Suppose that $f \in \mathscr{R}(\beta^3)$. Let $\varepsilon > 0$. Then there exists a partition $P$ of $[-1,1]$ such that
$$
U(P,f) - L(P, f) < \varepsilon
$$
Let $Q$ be a refinement of $P$ containing $0$, say $x_i = 0$. Then
$$
U(Q, f) - L(Q,f) \le U(P,f) - L(P,f) < \varepsilon
$$
Since $\Delta \beta^3_i = \Delta \beta^3_{i+1} = \frac{1}{2}$, and $\Delta \beta^3_j = 0$ for all $j \notin \{i, i+1\}$, the inequality reduces to
$$
M_i - m_i + M_{i+1} - m_{i+1} < 2\varepsilon
$$
$M_j \ge m_{j}$ for all $j$, so the above implies that
$$
M_i - m_i < 2\varepsilon \qquad M_{i+1} - m_{i+1} < 2\varepsilon
$$
If we choose $\delta < \min\{\Delta x_i, \Delta x_{i+1}\}$, then $|x| < \delta$ implies that $x \in [x_{i-1}, x_i]$ or $x\in[x_i, x_{i+1}]$, so that either
$$
\begin{aligned}
|f(x) - f(0)| &\le M_i - m_i < 2\varepsilon\\
&\text{or}\\
|f(x) - f(0)| &\le M_{i+1} - m_{i+1} < 2\varepsilon
\end{aligned}
$$
so that $|f(x) - f(0)| < 2\varepsilon$ in any case. Therefore, $f$ is continuous at $0$.

### (d)

If $f$ is continuous at $0$, then
$$
\int f \;\text{d}\beta^1 = \int f \;\text{d}\beta^2 = \int f \;\text{d}\beta^3 = f(0)
$$
_Proof_. By the previous parts, if $f$ is continuous at $0$, then
$$
\int f \;\text{d}\beta^1 = f(0) = \int f\;\text{d}\beta^2
$$
and
$$
\int f \;\text{d}\beta^3 = \int f \;\text{d}\left(\frac{\beta^1 + \beta^2}{2}\right) = \frac{1}{2}\int f\;\text{d}\beta^1 + \frac{1}{2}\int f\;\text{d}\beta^2 = f(0)
$$

## Rudin 6.4

Let $f(x) = 0$ for all irrational $x$ and $f(x) = 1$ for all rational $x$. Then $f \notin \mathscr{R}$ on any interval $[a,b]$.

_Proof_. Let $P$ be a partition of an interval $[a,b]$, $a< b$. Then $m_i = 0$ and $M_i =1$ for all $i$ because each subinterval $[x_{i-1},x_i]$ contains both rational and irrational numbers. Thus,
$$
L(P,f) = 0 \qquad U(P,f)=b-a
$$
Choose $\varepsilon = \frac{b-a}{2}$. Since $P$ above was arbitrary there is no partition $P$ of $[a,b]$ such that
$$
U(P,f) - L(P,f) < \varepsilon
$$that is, $f \notin \mathscr{R}$.

## Rudin 6.5

Suppose that $f$ is a bounded real function on $[a,b]$ and $f^2 \in \mathscr{R}$. It does not necessarily follow that $f \in \mathscr{R}$.

Consider, for example, a function $f$ defined by $f(x) = 1$ if $x$ is rational and $f(x) = -1$ if $x$ is irrational. Then $f^2 = 1$, which is continuous and therefore integrable on $[a,b]$. On the other hand, if $g$ is the function from 6.4, then $f = 2 g - 1$, so $f \in \mathscr{R}$ implies $g \in\mathscr{R}$, but we know that $g \notin\mathscr{R}$, so it follows that $f \notin\mathscr{R}$.

On the other hand, if we know instead that $f^3 \in \mathscr{R}$, then it _does_ follow that $f \in \mathscr{R}$. This is because the function $c^{-1}(x) = x^{\frac{1}{3}}$ is continuous everywhere, and it is the inverse of $c(x) = x^3$. This implies that $c^{-1}\circ f^3 = c^{-1}\circ c \circ f = f$, and the continuity of $c^{-1}$ combined with the integrability of $f^3$ therefore implies that $f \in \mathscr{R}$.

## Rudin 6.7

Suppose that $f$ is a function on $(0, 1]$ and $f \in \mathscr{R}$ on $[c, 1]$ for all $c > 0$. Define
$$
\int_0^1f(x)\;\text{d}x = \lim_{c\to0}\int_c^1f(x)\;\text{d}x
$$
if the limit exists and is finite.

### (a)

Let $f \in \mathscr{R}$ on $[0,1]$. Then the definition above agrees with the integral of $f$ on $[0,1]$.

_Proof_. Let $\varepsilon >0$ be given. Let $I = \lim_{c\to 0}\int_c^1f(x)\;\text{d}x$. Then given $\varepsilon > 0$ there exists $\delta >0$ such that $c < \delta$ implies
$$
\left|I - \int_c^1f(x)\;\text{d}x\right| < \varepsilon
$$
Or, equivalently,
$$
\left|I - \int_0^1f(x)\;\text{d}x + \int_0^c f(x)\;\text{d}x\right| < \varepsilon
$$
which implies that
$$
\left|I - \int_0^1 f(x)\;\text{d}x\right| <\left|\int_0^c f(x)\;\text{d}x\right| + \varepsilon
$$
Since $f$ is integrable on $[0,1]$, it must be bounded. Let $|f(x)| \le M$ for all $x \in [0,1]$. Then the above inequality becomes
$$
\left|I - \int_0^1 f(x)\;\text{d}x\right| < Mc + \varepsilon
$$
This inequality holds for any $\varepsilon > 0$ and any sufficiently small $c>0$. This implies that
$$
I = \int_0^1f(x)\;\text{d}x
$$

### (b)

Let $f: (0,1] \to \mathbb{R}$ be defined by
$$
f(x) = \frac{(-1)^{n(x)}}{x}
$$
where $n(x)$ is the unique positive integer $n$ such that $x \in \left(\frac{1}{n + 1}, \frac{1}{n}\right]$. Then the imporoper integral $\int_0^1 f$ exists, but the improper integral $\int_0^1|f|$ does not.

_Proof_. For a given $0 < c < 1$, let $N$ be the largest positive integer such that $c < \frac{1}{N}$. Then $f \in \mathscr{R}$ on $[c,1]$ because it is a piecewise continuous function, and
$$
\begin{aligned}
\int_c^1 f &= (-1)^N\int_{c}^\frac{1}{N}\frac{1}{x}\;\text{d}x + \sum_{n=1}^{N-1}(-1)^n\int_\frac{1}{n+1}^\frac{1}{n}\frac{1}{x}\;\text{d}x\\ &= R + \sum_{n=1}^{N-1}(-1)^na_n
\end{aligned}
$$
where $R = (-1)^N \int_c^\frac{1}{N}\frac{1}{x}\;\text{d}x$ and $a_n = \ln\left(1+\frac{1}{n}\right)$ (take the sum to be $0$ when $N = 1$). Then

- $\{a_n\}$ is decreasing and $a_n \to 0$ as $n \to \infty$;
- $\sum_{n=1}^\infty (-1)^n a_n$ converges by the Alternating Series Test to some number $S$;
- $|R| \le \int_\frac{1}{N+1}^\frac{1}{N}\frac{1}{x}\;\text{d}x = a_N$.

Given $\varepsilon > 0$, choose $c$ so that $N$ is large enough to make $a_N < \varepsilon$ and so that
$$
\left|S - \sum_{n=1}^{N-1}(-1)^na_n\right| < \varepsilon
$$
Then it follows that
$$
\left|S - \int_c^1f\right| = \left|S - R - \sum_{n=1}^{N-1}(-1)^na_n\right| < 2\varepsilon
$$
Therefore $\int_c^1 f \to S$ as $c \to 0$, that is, $\int_0^1 f = S$.

On the other hand, $|f(x)| = \frac{1}{x}$, which has antiderivative $\ln(x)$ on any interval $[c,1]$, where $c > 0$. Therefore,
$$
\lim_{c\to 0}\int_c^1|f| = \lim_{c\to 0}\big[-\ln(c)\big] = \infty
$$
so $\int_0^1|f|$ does not exist.

## Rudin 6.8

Suppose that $f \in \mathscr{R}$ on $[a,b]$ for all $b > a$, where $a$ is fixed. Define
$$
\int_a^\infty f(x)\;\text{d}x = \lim_{b\to\infty}\int_a^bf(x)\;\text{d}x
$$
if this limit exists (and is finite). If $f(x) \ge 0$ and $f$ is decreasing on $[1, \infty)$ then
$$
\int_1^\infty f(x)\;\text{d}x
$$
exists if and only if
$$
\sum_{n=1}^\infty f(n)
$$
converges.

_Proof_. Since $f(x) \ge 0$, it follows that $g(N)=\int_1^N f(x)\;\text{d}x$ is an increasing function of $N$.

### Integral converges implies series converges

Suppose that the integral $I = \int_1^\infty f(x)\;\text{d}x$ converges. This and the fact that $g$ is increasing imply $g(N) \le I$ for any $N > 1$. 

Let $N > 1$ be an integer, and let $P = \{1,2,\dots, N\}$ be a partition of $[1,N]$. Then $m_n = f(n + 1)$ because $f$ is decreasing, and therefore
$$
\sum_{n=2}^N f(n) = L(P, f) \le \int_1^Nf(x)\;\text{d}x \le I
$$
Thus, the $N$th partial sum of the series is bounded above by $I + f(1)$. On the other hand, the terms of the series are nonnegative, so the partial sums are increasing. Therefore, the series converges.

### Series converges implies integral converges

Suppose that $\sum_{n=1}^\infty f(n)$ converges. Then the partial sums are bounded, say by $M$. Let $N > 1$ be an integer and let $P = \{1, 2, \dots, N\}$ be a partition of $[1,N]$. Then $M_n = f(n)$ because $f$ is decreasing, and therefore
$$
g(N) \le U(P, f) = \sum_{n=1}^{N-1}f(n) \le M
$$
Since $g$ is increasing and bounded above, it must have a limit; that is, the improper integral converges.

## Rudin 6.10

Let $p$ and $q$ be positive real numbers such that
$$
\frac{1}{p} + \frac{1}{q} = 1
$$

### (a) 

If $u \ge 0$ and $v \ge0$, then
$$
uv \le \frac{u^p}{p} + \frac{v^q}{q}
$$
Equality holds if and only if $u^p = v^q$.

_Proof_.

#### Lemma

Let $f \in C^1([a,b])$ be strictly increasing. Then $f$ is invertible with strictly increasing inverse $f^{-1} \in C^1([f(a), f(b)])$, and
$$
\int_a^bf(x)\;\text{d}x + \int_{f(a)}^{f(b)}f^{-1}(x)\;\text{d}x = bf(b) - af(a)
$$
because we can change variables $y = f^{-1}(x)$ in the second integral to write it as
$$
\int_{f(a)}^{f(b)}f^{-1}(x)\;\text{d}x = \int_a^bxf'(x)\;\text{d}x
$$
and then use integration by parts to obtain
$$
\int_{f(a)}^{f(b)}f^{-1}(x)\;\text{d}x = \Big.xf(x)\Big|_a^b - \int_a^b f(x)\;\text{d}x
$$
from which the claim follows.

#### Inequality

Define $f(x) = x^{p-1}$. Then $f \in C^1([0,\infty))$ and $f$ is strictly increasing. Thus, $f$ has a strictly increasing $C^1$ inverse on $[0, \infty)$. In fact, simple algebra shows that $\frac{1}{p-1}=q-1$, so $f^{-1}(x) = x^\frac{1}{p-1} = x^{q-1}$. 

Assume without loss of generality that $f(u) \le v$; if not, then $f^{-1}(v) \le u$ because $f$ is increasing, so, without altering the content of the claim to be proven, we could relabel the variables $p \leftrightarrow q$ and $u \leftrightarrow v$, in which case $f$ would become $f^{-1}$ and we would have $f(u) \le v$. 

Define the function $\phi$ as follows:
$$
\phi(x) = \begin{cases}
f^{-1}(x) & 0 \le x \le f(u)\\
u & f(u) < x
\end{cases}
$$
Then

1. $\phi$ is continuous on $[0, \infty)$;
2. $\phi = f^{-1}$ on $[0, f(u)]$;
3. $\phi(x) \le f^{-1}(x)$ for all $x \ge 0$ because $f^{-1}$ is increasing.

Applying the Lemma and the above facts gives
$$\tag{A}
\begin{aligned}
\int_0^v\phi &= \int_0^{f(u)}f^{-1} + \int_{f(u)}^vu\;\text{d}x\\
&= uf(u) - \int_0^uf + u(v-f(u))\\
&= uv - \int_0^u f
\end{aligned}
$$
On the other hand,
$$\tag{B}
\int_0^v \phi \le \int_0^vf^{-1}
$$
Applying the FTC gives
$$
\int_0^u f = \int_0^u x^{p-1}\;\text{d}x = \frac{u^p}{p}\qquad\int_0^vf^{-1} = \int_0^vx^{q-1}\;\text{d}x = \frac{v^q}{q}
$$
Combining all of the preceding results together shows that
$$
uv \le \int_0^u f + \int_0^v f^{-1} = \frac{u^p}{p} + \frac{u^q}{q}
$$

#### Equality

Suppose that $uv = \frac{u^p}{p} + \frac{v^q}{q}$. Then by $(\text{A})$ we have $\int_0^v \phi = \frac{v^q}{q}$, that is, equality holds in $(\text{B})$. If $g = f^{-1} - \phi$, then we have $g(x) \ge 0$ for all $x \in [f(u), v]$ by 3., but equality in $(\text{B})$ and 2. together imply that
$$
\int_{f(u)}^vg = 0
$$
Then exercise 6.2 implies that $g(x) =0$, that is, $\phi(x) = f^{-1}(x)$, for all $x \in [f(u), v]$. The only way this can be true given the definition of $\phi$ and the fact that $f^{-1}$ is _strictly_ increasing is if $f(u) = v$, or $u^{p-1} = v$. If this is the case, then substitution for $v$ yields
$$
u^p = \frac{u^p}{p} + \frac{v^q}{q}
$$
or
$$
u^p\left(1-\frac{1}{p}\right) = \frac{1}{q}v^q
$$
which implies that $u^p = v^q$.

Conversely, if $u^p = v^q$, then $u = v^\frac{q}{p}$, and 
$$
\begin{aligned}
uv &= v^{\frac{q}{p}+1}=v^{q\left(\frac{1}{p}+\frac{1}{q}\right)} = v^q = v^q\left(\frac{1}{p} + \frac{1}{q}\right)\\
&= \frac{u^p}{p} + \frac{v^q}{q}
\end{aligned}
$$

### (b)

If $f,g \in \mathscr{R}(\alpha)$ and $f \ge 0$, $g \ge 0$, and
$$
\int_a^b f^p \;\text{d}\alpha = 1 = \int_a^b g^q\;\text{d}\alpha
$$
then
$$
\int_a^b fg\;\text{d}\alpha \le 1
$$
_Proof_. By part (a), we have $(fg)(x) \le \frac{f(x)^p}{p} + \frac{g(x)^q}{q}$ for all $x \in [a,b]$, so
$$
\int_a^b fg \;\text{d}\alpha \le \int_a^b\left[\frac{f^p}{p} + \frac{g^q}{q}\right]\;\text{d}\alpha = \frac{1}{p} + \frac{1}{q} = 1
$$

### (c)

If $f, g\in \mathscr{R}(\alpha)$ are functions on $[a, b]$, then $fg$, $|f|^p$, and $|g|^q$ are in $\mathscr{R}(\alpha)$, and
$$
\left|\int_a^bfg\;\text{d}\alpha\right| \le \left[\int_a^b|f|^p\;\text{d}\alpha\right]^\frac{1}{p}\cdot\left[\int_a^b |g|^q\;\text{d}\alpha\right]^\frac{1}{q}
$$
_Proof_. Define
$$
F = \frac{|f|}{\left[\int_a^b|f|^p\;\text{d}\alpha\right]^\frac{1}{p}} \qquad
G = \frac{|g|}{\left[\int_a^b|g|^q\;\text{d}\alpha\right]^\frac{1}{q}}
$$
Then $\int_a^b F^p\;\text{d}\alpha =1$ and $\int_a^b G^q \;\text{d}\alpha = 1$, so by part (b)
$$
\begin{aligned}
\left|\int_a^bfg\;\text{d}\alpha\right| &\le \int_a^b|f||g|\;\text{d}\alpha\\
&=\left[\int_a^b|f|^p\;\text{d}\alpha\right]^\frac{1}{p}\cdot\left[\int_a^b|g|^q\;\text{d}\alpha\right]^\frac{1}{q}\cdot\int_a^bFG\;\text{d}\alpha\\
& \le \left[\int_a^b|f|^p\;\text{d}\alpha\right]^\frac{1}{p}\cdot\left[\int_a^b|g|^q\;\text{d}\alpha\right]^\frac{1}{q}
\end{aligned}
$$

### (d)

#### The integral from 6.7

Let $f$, $g$ be functions on $(0,1]$ such that $f, g\in\mathscr{R}$ on $[c, 1]$ for all $0 < c < 1$. Then $fg$, $|f|^p$, and $|g|^q$ are functions on $(0,1]$ that are integrable on $[c,1]$ for all $0 < c < 1$, and
$$
\left|\int_0^1fg\;\right| \le \left[\int_0^1|f|^p\;\right]^\frac{1}{p}\cdot\left[\int_0^1|g|^q\;\right]^\frac{1}{q}
$$
where the integrals are taken in the manner defined in exercise 6.7, assuming that all of the improper integrals exist and are finite.

_Proof_. Let $\varepsilon > 0$ be given. Then by the definition of the improper integral and the continuity of the functions $(\cdot)^\frac{1}{p}$ and $(\cdot)^\frac{1}{q}$ there exists $0 < c < 1$ such that
$$
\begin{gathered}
\int_0^1fg \le \int_c^1fg + \varepsilon\\ \left[\int_c^1|f|^p\right]^\frac{1}{p}\le \left[\int_0^1|f|^p\right]^\frac{1}{p} + \varepsilon \qquad \left[\int_c^1|g|^q\right]^\frac{1}{q} \le \left[\int_0^1|g|^q\right]^\frac{1}{q} + \varepsilon
\end{gathered}
$$
Then by (c)
$$
\begin{aligned}
\left|\int_0^1fg\;\right| &\le \left|\int_c^1 fg\;\right| + \varepsilon \le \left[\int_c^1|f|^p\;\right]^\frac{1}{p}\cdot\left[\int_c^1 |g|^q\;\right]^\frac{1}{q} + \varepsilon\\
&\le \left(\left[\int_0^1|f|^p\;\right]^\frac{1}{p}+\varepsilon\right)\cdot\left(\left[\int_0^1 |g|^q\;\right]^\frac{1}{q}+\varepsilon\right) + \varepsilon\\
&\le \left[\int_0^1|f|^p\;\right]^\frac{1}{p}\cdot\left[\int_0^1 |g|^q\;\right]^\frac{1}{q} + M\varepsilon + \varepsilon^2
\end{aligned}
$$
where $M > 0$ is number depending on $f$ and $g$ but not $\varepsilon$. The conclusion follows because $\varepsilon$ was arbitrary.

#### The integral from 6.8

Let $f$, $g$ be functions on $[a,b]$ for all $b > a$, where $a$ is fixed. Then
$$
\left| \int_a^\infty fg \;\right|\le \left[\int_a^\infty|f|^p\;\right]^\frac{1}{p}\cdot\left[\int_a^\infty|g|^q\;\right]^\frac{1}{q}
$$
where the integrals are taken in the sense defined in 6.8, asssuming that all of the improper integrals exist and are finite.

_Proof_. Let $\varepsilon > 0$ be given. Then by the definition of the improper integral and the continuity of the functions $(\cdot)^\frac{1}{p}$ and $(\cdot)^\frac{1}{q}$ there exists $b > a$ such that
$$
\begin{gathered}
\int_a^\infty fg \le \int_a^b fg + \varepsilon\\ \left[\int_a^b|f|^p\right]^\frac{1}{p}\le \left[\int_a^\infty|f|^p\right]^\frac{1}{p} + \varepsilon \qquad \left[\int_a^b|g|^q\right]^\frac{1}{q} \le \left[\int_a^\infty|g|^q\right]^\frac{1}{q} + \varepsilon
\end{gathered}
$$
Then by (c)
$$
\begin{aligned}
\left|\int_a^\infty fg\;\right| &\le \left|\int_a^b fg\;\right| + \varepsilon \le \left[\int_a^b|f|^p\;\right]^\frac{1}{p}\cdot\left[\int_a^b |g|^q\;\right]^\frac{1}{q} + \varepsilon\\
&\le \left(\left[\int_a^\infty|f|^p\;\right]^\frac{1}{p}+\varepsilon\right)\cdot\left(\left[\int_a^\infty |g|^q\;\right]^\frac{1}{q}+\varepsilon\right) + \varepsilon\\
&\le \left[\int_a^\infty|f|^p\;\right]^\frac{1}{p}\cdot\left[\int_a^\infty |g|^q\;\right]^\frac{1}{q} + M\varepsilon + \varepsilon^2
\end{aligned}
$$
where $M > 0$ is number depending on $f$ and $g$ but not $\varepsilon$. The conclusion follows because $\varepsilon$ was arbitrary.


## Rudin 6.11

Let $\alpha$ be an increasing function on $[a,b]$. For $u \in \mathscr{R}(\alpha)$, define
$$
\lVert u\rVert_2 = \left[\int_a^b |u|^2\;\text{d}\alpha\right]^{\frac{1}{2}}
$$
Then for $f, g, h \in \mathscr{R}(\alpha)$
$$
\lVert f - h\rVert_2 \le \lVert f -g \rVert_2 + \lVert g - h\rVert_2
$$
_Proof_. Let $p = 2 = q$ from 6.10. Then 6.10 (c) imlies that for any $u,v \in \mathscr{R}(\alpha)$
$$
\int_a^b uv \;\text{d}\alpha \le \lVert u \rVert_2\lVert v\rVert_2
$$
This, and the fact that $u$ and $v$ are real-valued imply that
$$
\begin{aligned}
\lVert u + v \rVert_2^2 &= \int_a^b|u + v|^2\;\text{d}\alpha = \int_a^b (u^2 + 2uv + v^2)\;\text{d}\alpha\\
&\le \lVert u\rVert_2^2 + 2 \lVert u\rVert_2\lVert v\rVert_2 + \lVert v\rVert_2^2 = (\lVert u\rVert_2 + \lVert v \rVert_2)^2
\end{aligned}
$$
which furthermore implies that $\lVert u + v \rVert_2 \le \lVert u \rVert_2 + \lVert v \rVert_2$. Since $f- h = (f-g) + (g-h)$, the above implies that
$$
\lVert f - h\rVert_2 \le \lVert f -g \rVert_2 + \lVert g - h\rVert_2
$$

## Rudin 6.15

Suppose that $f$ is a real, continuously differentiable function on $[a,b]$ such that $f(a) = 0 = f(b)$, and 
$$
\int_a^bf^2(x)\;\text{d}x = 1
$$
Then
$$
\int_a^bxf(x)f'(x)\;\text{d}x = -\frac{1}{2}
$$
and
$$
\int_a^b[f'(x)]^2\;\text{d}x \cdot\int_a^b x^2f^2(x)\;\text{d}x > \frac{1}{4} 
$$
_Proof_. First, we can apply integration by parts to $\int_a^b xf(x)f'(x)\;\text{d}x$ to obtain
$$
\begin{aligned}
\int_a^bxf(x)f'(x)\;\text{d}x &= \Big.xf^2(x)\Big|_a^b - \int_a^b f(x)(f(x) + xf'(x))\;\text{d}x\\
&= -1 - \int_a^b xf(x)f'(x)\;\text{d}x
\end{aligned}
$$
which implies that $\int_a^b xf(x)f'(x)\;\text{d}x = -\frac{1}{2}$. Second, using 6.10 (c) with $p = 2 = q$ gives
$$
\frac{1}{4} = \left|\int_a^b [f'(x)]\cdot[xf(x)]\;\text{d}x\right|^2 \le \int_a^b [f'(x)]^2\;\text{d}x \cdot \int_a^bx^2f^2(x)\;\text{d}x
$$This inequality implies in particular that $\int_a^b [f']^2 > 0$. Therefore, if the inequality were an equality, we would have
$$
\begin{aligned}
\int_a^b \left(xf(x) + \frac{f'(x)}{2\int_a^b[f']^2}\right)^2\;\text{d}x &= 
\int_a^bx^2f^2(x)\;\text{d}x - \frac{1}{4\int_a^b [f']^2}\\
&= \frac{1}{\int_a^b[f']^2}\left(\int_a^b [f'(x)]^2\;\text{d}x\cdot\int_a^b x^2f^2(x)\;\text{d}x - \frac{1}{4}\right) = 0
\end{aligned}
$$
which implies that $\left(xf(x) + \frac{f'(x)}{2\int_a^b [f']^2}\right)^2 = 0$ for all $x \in [a,b]$ by exercise 6.2. From this we see that $f$ would solve the following linear ODE with continuous coefficients:
$$
y'(x) = -2\lambda xy(x)
$$
where $\lambda = \int_a^b[f']^2$. By the existence and uniqueness theorem for linear ODEs with continuous coefficients, it follows that
$$
f(x) = Ce^{-\lambda x^2}
$$
for some constant $C$. Then $f(a) = 0$ implies that $f = 0$, so that $\int_a^b f^2 =0$, contradicting one of our assumptions. Therefore, the inequality must be strict.

## Rudin 6.17

Suppose that $\alpha$ is increasing on $[a,b]$, $g$ is continuous, and $g(x) = G'(x)$ for $a \le x \le b$. Then
$$\tag{1}
\int_a^b\alpha(x)g(x) \;\text{d}x = G(b)\alpha(b) - G(a)\alpha(a) - \int_a^b G \;\text{d}\alpha
$$
_Proof_. Consider the following hypothesis.
$$\tag{H}
\text{Equation $(1)$ is true when both $\alpha$ and $g$ are nonnegative on $[a,b]$}.
$$
Then set $\beta = \alpha + \gamma$, and set $f = g + h$, and $F(x) = G(x) + hx$, where $\gamma$ and $h$ are large enough that $\beta$ and $f$ are nonnegative on $[a,b]$. Then $F' = f$, and $(H)$ implies that
$$
\int_a^b\beta(x)f(x)\;\text{d}x = F(b)\alpha(b) - F(a)\alpha(a) - \int_a^b F\;\text{d}\beta
$$
It is a straightforward computation to verify that this implies $(1)$ if
$$\tag{2}
\int_a^b\alpha(x)\;\text{d}x = b\alpha(b) - a\alpha(a) - \int_a^bx \;\text{d}\alpha
$$
But the function $p(x) = 1$ and the weight $\beta$ satisfy the hypotheses of $(H)$, so $(H)$ also implies that
$$
\int_a^b \beta(x)\;\text{d}x = b\beta(b) - a\beta(a) - \int_a^bx\;\text{d}\beta
$$
from which $(2)$ follows immediately.

Thus, $(H)$ implies our desired result, so we may assume without loss of generality that both $\alpha$ and $g$ are nonnegative on $[a,b]$.

Note that $\alpha \in \mathscr{R}$ because it is increasing and bounded, so $\alpha g\in\mathscr{R}$. Thus, we can find a partition $P$ such that
$$
\begin{gathered}
U(P, \alpha g) - \varepsilon \le \int_a^b\alpha(x)g(x)\;\text{d}x \le L(P, \alpha g) + \varepsilon\\ 
U(P, g, \alpha) - \varepsilon \le \int_a^b G \;\text{d}\alpha \le L(P, g, \alpha) + \varepsilon
\end{gathered}
$$
and $\Delta x_i$ is small enough that $|g(t) - g(s)| < \varepsilon$ for all $t,s \in [x_{i-1}, x_i]$ for all $i =1$ to $n$ (by the uniform continuity of $g$).

By the MVT there are $t_i \in [x_{i-1},x_i]$ such that $g(t_i)\Delta x_i = G(x_i) - G(x_{i-1})$. This implies that
$$
\begin{aligned}
A &= \sum_{i=1}^n \alpha(x_i)g(t_i)\Delta x_i = \sum_{i=1}^n \alpha(x_i) (G(x_i) - G(x_{i-1}))\\
&= \alpha(b)G(b)-\alpha(a)G(a) - \sum_{i=1}^nG(x_{i-1})\Delta \alpha_i\\
&= C - B
\end{aligned}
$$
where $C = \alpha(b)G(b) - \alpha(a)G(a)$, and $B = \sum_{i=1}^n G(x_{i-1})\Delta \alpha_i$. 

It is easy to see that $L(P, G, \alpha) \le B \le U(P, G, \alpha)$ becase $G(x_{i-1})$ is between the $\inf$ and $\sup$ of $G$ on each interval $[x_{i-1},x_i]$. On the other hand, since $\alpha$ and $g$ are both nonnegative, and $\alpha$ is increasing, we have
$$
\inf_{x\in[x_{i-1},x_i]}\alpha(x)g(x) \le \alpha(t_i)g(t_i) \le \alpha(x_i)g(t_i)
$$
while, using the fact that $t_i\in[x_{i-1},x_i]$ implies that $g(x_i) \ge g(t_i) - \varepsilon$,
$$
\begin{aligned}
\sup_{x\in[x_{i-1},x_i]}\alpha(x)g(x) &\ge \alpha(x_i)g(x_i) \\
&\ge\alpha(x_i)g(t_i) - \varepsilon \alpha(x_i) 
\\&\ge\alpha(x_i)g(t_i) - \varepsilon\alpha(b)
\end{aligned}
$$
Thus,
$$
L(P, \alpha g) \le A \le U(P, \alpha g) + \varepsilon\alpha(b)(b-a)
$$
from which we conclude that
$$
\begin{aligned}
L(P, \alpha g) + L(P, g, \alpha) \;\le\; C \;\le\; U(P, \alpha g) + U(P, g, \alpha) + \varepsilon\alpha(b)(b-a)
\end{aligned}
$$
because $A + B = C$. Then
$$
\begin{gathered}
\int_a^b \alpha(x)g(x)\;\text{d}x + \int_a^b G\;\text{d}\alpha - 2\varepsilon \\\\\le C \le\\\\ \int_a^b\alpha(x)g(x)\;\text{d}x + \int_a^b G\;\text{d}\alpha + \varepsilon(2 + \alpha(b)(b-a))
\end{gathered}
$$
from which the claim follows, as $\varepsilon$ was arbitrary.

## Rudin 6.18

Let $\gamma_1, \gamma_2, \gamma_3$ be curves in the complex plane, defined on $[0,2\pi]$ by
$$
\gamma_1(t) = e^{it}\qquad \gamma_2(t) = e^{2it}\qquad \gamma_3(t) = e^{2\pi it\sin\left(\frac{1}{t}\right)}
$$
Then each curve has the same range, $\gamma_1$ and $\gamma_2$ are rectifiable with lengths $2\pi$ and $4\pi$, and $\gamma_3$ is not rectifiable.

_Proof_. Viewing these curves as curves in $\mathbb{R}^2$, we have
$$
\gamma_1(t) = \left[\begin{matrix}\cos(t)\\ \sin(t)\end{matrix}\right]\qquad
\gamma_2(t) = \left[\begin{matrix}\cos(2t)\\ \sin(2t)\end{matrix}\right]\qquad
\gamma_3(t) = \left[\begin{matrix}\cos\left(2\pi t\sin\left(\frac{1}{t}\right)\right)\\ \sin\left(2\pi t\sin\left(\frac{1}{t}\right)\right)\end{matrix}\right]
$$
Clearly $|\gamma_1| = |\gamma_2| = |\gamma_3| = 1$, so the range of each curve is a subset of the unit circle. Each curve has the form $\gamma_j(t) = \left[\begin{matrix}\cos(g_j(t))\\\sin(g_j(t))\end{matrix}\right]$ for $j=1,2,3$. Given $(x,y)$ in the unit circle and any $\ell \in \mathbb{R}$, there exists a $\theta \in [\ell, \ell + 2\pi)$ such that $\cos(\theta) = x$ and $\sin(\theta) = y$, so if the range of $g_j$ contains $[\ell,\ell + 2\pi)$, then the range of $\gamma_j$ must be equal to the unit circle.

The range of $g_1(t) = t$ is $[0,2\pi] \supset [0,2\pi)$, and the range of $g_2(t) = 2t$ is $[0,4\pi]\supset [0,2\pi)$, so the unit circle is the range of $\gamma_1$ and $\gamma_2$. Let $t_1 = \frac{2}{3\pi}$ and $t_2 = \frac{16}{\pi}$. Then $\pi >3$ implies that $t_2 < 6 < 2\pi$, and clearly $0 < t_1 < t_2$, so $[t_1, t_2] \subset [0,2\pi]$. Also, $g_3$ is continuous on $[t_1, t_2]$, so the range of $g_3$ contains $[g_3(t_1), g_3(t_2)]$ by the Intermediate Value Theorem. We have $g_3(t_1) = -\frac{4}{3} < -\frac{\pi}{3}$; $g_3(t_2)$ is a little trickier. Clearly, $25\cdot 81 < 56 \cdot 137$, so
$$
\begin{aligned}
{} &\quad 25\cdot 81+137\cdot81 &&< 56\cdot137 + 81\cdot137\\
\implies&\quad 2\cdot 81^2 &&<137^2\\
\implies&\quad2+\sqrt{2} &&<\frac{289}{81}\\
\implies&\quad \sqrt{\frac{1}{2}+\frac{\sqrt{2}}{4}} && < \frac{17}{18}\\
\implies&\quad\frac{1}{2}-\frac{1}{2}\sqrt{\frac{1}{2}+\frac{\sqrt{2}}{4}}&&>\frac{1}{36}\\
\implies&\quad \sqrt{\frac{1}{2}-\frac{1}{2}\sqrt{\frac{1}{2}+\frac{\sqrt{2}}{4}}} &&> \frac{1}{6}
\end{aligned}
$$
where the last quantity on the left is $\sin \left(\frac{\pi}{16}\right)$ by two applications of the half-angle identity. Therefore, $g_3(t_2) > \frac{16}{3} > \frac{5\pi}{3}$ because $\pi < 3 + \frac{1}{5}$. Thus, the range of $g_3$ contains $\left[-\frac{\pi}{3}, \frac{5\pi}{3}\right]$, which implies that the range of $\gamma_3$ is the unit circle.

Since $\gamma_1$ and $\gamma_2$ are clearly $C^1$ curves, they are rectifiable, and we have
$$
\Lambda(\gamma_1) = \int_0^{2\pi}\lVert\gamma_1'\rVert = \int_0^{2\pi}1 = 2\pi
$$
since $\lVert\gamma_1'\rVert = 1$, and
$$
\Lambda(\gamma_2) = \int_0^{2\pi}\lVert\gamma_2'\rVert = \int_0^{2\pi}2 = 4\pi
$$
since $\lVert\gamma_2'\rVert = 2$.

Now let $N \ge 1$ be an integer, and consider the partition
$$
P_N = \left\lbrace0, \frac{2}{(2N+1)\pi}, \frac{2}{(2(N-1) + 1)\pi}, \dots, \frac{2}{\pi}, 2\pi \right\rbrace
$$
of $[0, 2\pi]$. Then
$$
\Lambda(P_N, \gamma_3) \ge \sum_{n=1}^N\lVert\gamma_3(t_n) - \gamma_3(t_{n-1})\rVert
$$
where $t_n = \frac{2}{(2n+1)\pi}$.

For any $a, b$, the following trigonometric identities hold
$$
\begin{aligned}
4\sin^2(b) &= 4\cos^2(a)\sin^2(b) + 4\sin^2(a)\sin^2(b) \\
&= [\cos(\alpha) - \cos(\beta)]^2 + [\sin(\alpha) - \sin(\beta)]^2
\end{aligned}
$$
where $2a = \alpha + \beta$ and $2b = \alpha - \beta$.

Taking $\alpha = 2\pi t_n \sin\left(\frac{1}{t_n}\right)$ and $\beta = 2\pi t_{n-1}\sin\left(\frac{1}{t_{n-1}}\right)$ and noting that $\sin\left(\frac{1}{t_n}\right) = (-1)^n$, we can compute
$$
\begin{aligned}
\lVert\gamma_3(t_n) - \gamma_3(t_{n-1})\rVert &= 2\left|\sin\left(\frac{2}{2n+1} + \frac{2}{2n-1}\right)\right|\\
&=2\left|\sin\left(\frac{4n}{4n^2 -1}\right)\right|
\end{aligned}
$$
By Taylor's Theorem, there exists $K$ large enough so that $n > K$ implies that
$$
\sin\left(\frac{4n}{4n^2-1}\right) \ge \frac{4n}{4n^2-1} - M\left(\frac{4n}{4n^2-1}\right)^3
$$
for some constant $M > 0$ not depending on $n$ or $K$. Therefore, if we take $N \ge K$,
$$
\Lambda(P_N, \gamma_3) \ge \sum_{n=K}^N \frac{4n}{4n^2-1} - M\left(\frac{4n}{4n^2-1}\right)^3
$$
Since the series $\sum_{n=K}^\infty \left(\frac{4n}{4n^2-1}\right)^3$ converges and the series $\sum_{n=K}^\infty \frac{4n}{4n^2-1}$ diverges to infinity, it follows that $\Lambda(P_N, \gamma_3) \to \infty$ as $N \to \infty$. Thus, $\gamma_3$ is not rectifiable.

## Supplementary 1

Let $f(x) = 0$ for $x \in [0, 1]$ and $f(x) = 1$ for $x \in (1,2]$, and let $\alpha = f$. Then $f \in \mathscr{R}$, but $f \notin \mathscr{R}(\alpha)$.

_Proof_. 

#### $f \in \mathscr{R}$

Let $\varepsilon >0$ be given. Let $P = \{x_0, x_1=1, x_2, x_3\}$ be a partition of $[0, 2]$ such that $\Delta x_2 < \varepsilon$. Then we have
$$
\begin{aligned}
m_1 &= 0 & M_1 &= 0\\
m_2 &= 0 & M_2 &= 1\\
m_3 &= 1 & M_3 &= 1\\
\end{aligned}
$$
Thus,
$$
U(P,f) - L(P,f) = \Delta x_2 < \varepsilon
$$
which implies that $f \in \mathscr{R}$.

#### $f \notin \mathscr{R}(\alpha)$

Let $P$ be a partition of $[0, 2]$, and let $Q$ be a refinement of $P$ containing $1$, say, $x_{i-1} = 1$. Then $\Delta \alpha_i = 1$ and $\Delta \alpha_j = 0$ for all $j \ne i$. On the other hand, we have $M_i - m_i = 1$. Therefore,
$$
U(P, f) - L(P, f) \ge U(Q, f) - L(Q, f) = 1
$$
This implies that $f \notin \mathscr{R}(\alpha)$ since $P$ was arbitrary.

## Supplementary 2

### (a)

Let $f(x) = 1$ if $x$ is rational and $f(x) = 0$ if $x$ is irrational for $x \in [0,1]$. Then $f \notin \mathscr{R}$.

_Proof_. Let $g$ be the function from Rudin 6.4 above. Then $g =  1- f$, so $f\in\mathscr{R}\implies g\in \mathscr{R}$. But we showed in Rudin 6.4 that $g \notin \mathscr{R}$. Therefore $f \notin \mathscr{R}$.

### (b)

Let $\alpha$ be an increasing function on $[0,1]$. Then $f \in \mathscr{R}(\alpha)$ if and only if $\alpha$ is a constant function.

_Proof_. Suppose that $f \in \mathscr{R}(\alpha)$. Then given $\varepsilon > 0$ there exists a partition $P$ of $[0,1]$ such that
$$
U(P,f,\alpha) - L(P,f,\alpha) < \varepsilon
$$
The density of both rational and irrational numbers implies that both occur in each interval $[x_{i-1},x_i]$, so $m_i = 0$ and $M_i = 1$. Then 
$$
U(P,f,\alpha) - L(P,f,\alpha) = \sum_{i=1}^n\Delta \alpha_i = \alpha(1) - \alpha(0) < \varepsilon
$$
Therefore, $\alpha(1) = \alpha(0)$ because $\alpha(1) \ge \alpha(0)$ and $\varepsilon$ was arbitrary. Since $\alpha$ is increasing on $[0,1]$, it follows that $\alpha(x) = \alpha(0)$ for all $x \in [0,1]$, that is, $\alpha$ is a constant function.

On the other hand, every bounded function is integrable with respect to constant weight functions, so $f\in\mathscr{R}(\alpha)$ if $\alpha$ is a constant function.

## Supplementary 3

Let $f(x) = 1$ if $x$ is rational and $f(x) = -1$ if $x$ is irrational for $x \in [0,1]$. Then $f \notin \mathscr{R}$ because if it were, then $\frac{f+1}{2}$, the function from the previous problem, would be integrable.

On the other hand, it is obvious that $|f| = 1$, which is continuous and therefore integrable.

## Supplementary 4

Let $I = I^+$ be defined by
$$
I(x) = I^+(x) = \begin{cases}
0 & x < 0\\
1 & x \ge 0
\end{cases}
$$

### (a)

If $a < s \le b$, $f$ is bounded on $[a,b]$, $f$ is continuous at $s$, and $\alpha(x) = I^+(x-s)$, then
$$
\int_a^b f\;\text{d}\alpha = f(s)
$$
_Proof_. Let $\varepsilon > 0$ be given. Since $f$ is bounded and continuous at $s$, and $\alpha$ is continuous everywhere but $s$, we have $f \in \mathscr{R}(\alpha)$. Furthermore, there exists $\delta > 0$ such that $|x - s| <\delta$ implies that $|f(x) - f(s)| < \varepsilon$. 

Suppose $s < b$. Let $P = \{x_0, x_1, x_2=s, x_3\}$ be a partition of $[a,b]$ such that $\Delta x_2 < \delta$. Then $\Delta \alpha_2 = 1$, and $\Delta \alpha_i = 0$ for $i \ne 2$, and
$$
L(P,f,\alpha) = m_2 \qquad U(P,f,\alpha)=M_2
$$
Since $x \in [x_1, x_2]$ implies that $|x - s| < \delta$, it follows that $f(x) < f(s) + \varepsilon$ and $f(x) > f(s) - \varepsilon$ for all $x \in [x_1,x_2]$, which implies that $M_2 \le f(s) + \varepsilon$ and $m_2 \ge f(s) - \varepsilon$. Then
$$
f(s) - \varepsilon \le L(P,f,\alpha) \le \int_a^b f\;\text{d}\alpha \le U(P,f,\alpha) \le f(s) + \varepsilon
$$
Therefore, $\int_a^b f\;\text{d}\alpha = f(s)$ because $\varepsilon$ was arbitrary.

If $s = b$, then consider the partition $P = \{x_0, x_1, x_2\}$ such that $\Delta x_2 < \delta$. Then a virtually identical argument to the one above shows that $\int_a^b f\;\text{d}\alpha = f(s)$.

### (b)

Suppose $c_n \ge 0$ for $n=1,2,\dots,N$ and $s_1, \dots, s_N$ are distinct points in $(a,b]$, and
$$
\alpha(x) = \sum_{n=1}^N c_n I^+(x-s_n)
$$
Let $f$ be continuous on $[a,b]$. Then
$$
\int_a^bf\;\text{d}\alpha = \sum_{n=1}^N c_nf(s_n)
$$
_Proof_. Since each of $I^+(x-s_n)$ is increasing and continuous everywhere but $s_n$, and $f$ is continuous on $[a,b]$, we have $f \in \mathscr{R}(\alpha_n)$, where $\alpha_n = I^+(x-s_n)$. Then, because $c_n \ge 0$, we also have $f \in \mathscr{R}(c_n\alpha_n)$ and $f \in\mathscr{R}(\alpha)$, and 
$$
\int_a^b f\;\text{d}\alpha = \sum_{n=1}^Nc_n\int_a^bf(x)\;\text{d}I^+(x-s_n)=\sum_{n=1}^Nf(s_n)
$$
by part (a) of this problem.

### (c)

Suppose that $c_n \ge 0$ for $n=1,2,\dots$, $\sum_{n=1}^\infty c_n$ converges, and $s_1, s_2, \dots$ is a sequence of distinct points in $(a,b]$, and
$$
\alpha(x) = \sum_{n=1}^\infty c_nI^+(x-s_n)
$$
Let $f$ be continuous on $[a,b]$. Then
$$
\int_a^b f\;\text{d}\alpha = \sum_{n=1}^\infty c_nf(s_n)
$$
_Proof_. The convergence of $\sum_{n=1}^\infty c_n$ ensures that $\alpha$ is defined for each $x \in [a,b]$ by the comparison test. It is clear that $\alpha$ is increasing. Since $f$ is continuous, we have $f \in \mathscr{R}(\alpha)$.

Let $\varepsilon > 0$ be given. There is some $K$ such that $N > K$ implies
$$
\sum_{n=N+1}^\infty c_n< \varepsilon
$$
Define $\alpha_1$ and $\alpha_2$ by
$$
\alpha_1(x) = \sum_{n=1}^N c_nI^+(x-s_n)\qquad \alpha_2(x) = \sum_{n=N+1}^\infty c_nI^+(x-s_n)
$$
Then $\alpha = \alpha_1 + \alpha_2$. Clearly, $\alpha_1$ and $\alpha_2$ are also defined for all $x$ and are both increasing, so $f\in\mathscr{R}(\alpha_1)$ and $f\in \mathscr{R}(\alpha_2)$. Moreover, $\alpha_2(b) -\alpha_2(a) =\sum_{n=N+1}^\infty c_n < \varepsilon$. Therefore,
$$
\begin{aligned}
\left|\int_a^b f\;\text{d}\alpha -\int_a^bf\;\text{d}\alpha_1\right| &=  \left|\int_a^bf\;\text{d}\alpha_2\right| \\
&\le M(\alpha_2(b) - \alpha_2(a)) \le M\varepsilon
\end{aligned}
$$
where $M = \sup_{x\in[a,b]}|f(x)|$. By part (b), we have $\int_a^b f \;\text{d}\alpha_1 = \sum_{n=1}^N c_nf(s_n)$, so
$$
\left|\int_a^bf \;\text{d}\alpha - \sum_{n=1}^Nc_nf(s_n)\right| \le M\varepsilon
$$
for all $N > K$. Therefore, since $\varepsilon >0$ was arbitrary and the series $\sum_{n=1}^\infty c_nf(s_n)$ is absolutely convergent by comparison with the convergent series $\sum_{n=1}^\infty Mc_n$, we can conclude that
$$
\int_a^b f\;\text{d}\alpha = \sum_{n=1}^\infty c_nf(s_n)
$$

## Supplementary 5

For $x \in \mathbb{R}$ let $\lbrack x\rbrack$ denote the integer part of $x$, that is
$$
\lbrack x\rbrack = \sup\; \{k \in \mathbb{Z} \mid k \le x\}
$$
Then for $n \in \mathbb{N}$, and $\alpha(x) = \lbrack x\rbrack$, use part (c) of the problem 4 to obtain
$$
\int_0^n x\;\text{d}\alpha = \sum_{i=1}^n i = \frac{n(n+1)}{2} 
$$
because $\alpha(x) = \lbrack x\rbrack = \sum_{i=1}^nI^+(x-i)$ on $[0, n]$.

## Supplementary 6

Let $f(x) = x^2$, and define $\alpha$ as follows:
$$
\alpha(x) = \begin{cases}
0 & x < 2 \\
\frac{2}{3}x - 1 & 2 \le x < 3 \\
1 & 3 \le x
\end{cases}
$$
Since $f$ is continuous, we have $f \in \mathscr{R}(\alpha)$ on $[0,3]$. This means that $f\in\mathscr{R}(\alpha)$ on $[0,2]$ and $[2,3]$ as well, and
$$
\int_0^3f\;\text{d}\alpha = \int_0^2f\;\text{d}\alpha + \int_2^3f\;\text{d}\alpha
$$
On $[0,2]$, we have $\alpha(x) = \frac{1}{3}I^+(x- 2)$, so by 4. (b)
$$
\int_0^2 f\;\text{d}\alpha = \frac{f(2)}{3} = \frac{4}{3}
$$
On $[2,3]$, we have $\alpha(x) = \frac{2}{3}x - 1$ (since $\frac{2}{3}3 -1 = 1$, which agrees with the definition of $\alpha(3)$ above). Then $\alpha' = \frac{2}{3}$, so $\alpha' \in \mathscr{R}$ and $f\alpha' \in\mathscr{R}$ on $[2,3]$, which implies that
$$
\int_2^3f\;\text{d}\alpha = \int_2^3f\alpha' = \int_2^3\frac{2}{3}x^2\;\text{d}x = \left.\frac{2}{9}x^3\right|_2^3 = \frac{38}{9}
$$
by the FTC. Thus,
$$
\int_0^3 f\;\text{d}\alpha = \frac{38}{9} + \frac{4}{3} = \frac{46}{9}
$$

## Supplementary 7

### (a)

If $\alpha(x) = x^2$, then $\alpha$ is increasing on $[0,1]$, and $\alpha'(x) = 2x$, so $\alpha' \in \mathscr{R}$, and $f\alpha' \in \mathscr{R}$ if $f(x) = x$. Therefore,
$$
\int_0^1f\;\text{d}\alpha = \int_0^1x\;\text{d}\left(x^2\right) = \int_0^12x^2\;\text{d}x=\left.\frac{2x^3}{3}\right|_0^1 = \frac{2}{3}
$$
by the FTC.

### (b)

If $\alpha(x) = \sin(x)$, then $\alpha$ is increasing on $\left[0,\frac{\pi}{2}\right]$, and $\alpha'(x) =\cos(x)$, so $\alpha' \in \mathscr{R}$, and $f\alpha' \in \mathscr{R}$ if $f = \sin$. Therefore,
$$
\begin{aligned}
\int_0^{\frac{\pi}{2}} f\;\text{d}\alpha &= \int_0^\frac{\pi}{2}\sin(x)\;\text{d}\left(\sin(x)\right) = \int_0^{\frac{\pi}{2}}\sin(x)\cos(x)\;\text{d}x\\
&= \int_0^\frac{\pi}{2}\frac{1}{2}\sin(2x)\;\text{d}x = -\left.\frac{\cos(2x)}{4}\right|_0^\frac{\pi}{2} = \frac{1}{2}
\end{aligned}
$$
by the FTC.

## Supplementary 8

I'm not sure if you meant to type $o$ instead of $0$ in the lower limit, but I am going to assume that you did, and that $o < 5$. Let $\alpha_1(x) = x$ and $\alpha_2(x) = \lbrack x \rbrack$. Then $\alpha_1(x) + \alpha_2(x) = x + \lbrack x \rbrack$, and $\alpha_1$ and $\alpha_2$ are both increasing on $[o, 5]$. $f(x) = x^2$ is continuous on $[o,5]$ and, hence, $f \in \mathscr{R}(\alpha_1)$, and $f \in\mathscr{R}(\alpha_2)$. Therefore,
$$
\int_o^5x^2\;\text{d}(\alpha_1(x) + \alpha_2(x)) = \int_o^5x^2\;\text{d}x + \int_o^5x^2\;\text{d}\alpha_2
$$
Note that $\alpha_2(x) = \lbrack o \rbrack + \sum_{i=\lbrack o \rbrack + 1}^5 I^+(x-i)$ on $[o,5]$. The constant $\lbrack o \rbrack$ can be ignored, so by Supplementary 4
$$
\begin{aligned}
\int_o^5x^2\;\text{d}\alpha_2 = \sum_{i=\lbrack o\rbrack + 1}^5 i^2 =  55 - \frac{\lbrack o \rbrack(\lbrack o \rbrack + 1)(2\lbrack o \rbrack + 1)}{6}
\end{aligned}
$$
On the other hand,
$$
\int_o^5x^2\;\text{d}x = \left.\frac{x^3}{3}\right|_o^5 = \frac{125}{3} - \frac{o^3}{3}
$$
by the FTC. Therefore,
$$
\int_o^5x^2\;\text{d}(x + \lbrack x \rbrack) = \frac{290}{3} - \frac{o^3}{3} - \frac{\lbrack o \rbrack(\lbrack o \rbrack + 1)(2\lbrack o \rbrack + 1)}{6}
$$
In particular, if $o = 0$, then the integral is $\frac{290}{3}$.

## Supplementary 9

Let $\alpha$ be strictly increasing on $[a,b]$, and let $f \in \mathscr{R}(\alpha)$ on $[a,b]$. Suppose that $f(x) \ge 0$ for all $x \in [a,b]$, and $f$ is continuous at a point $c \in [a,b]$, and $f(c) > 0$. Then
$$
\int_a^bf\;\text{d}\alpha > 0
$$
_Proof_. Let $y=  f(c) > 0$. Since $f$ is continuous at $c$, choose $\delta > 0$ such that $|f(x) - f(c)| < \frac{y}{2}$. Then $|x - c| < \delta$ implies that $f(x) > \frac{y}{2}$.

Let $P = \{x_0, x_1,x_2,x_3\}$ be a partition of $[a,b]$ such that $c \in[x_1, x_2]$, and $\Delta x_2 < \delta$. Then:

- $f(x) \ge 0$ implies that $m_i \ge 0$ for all $i$, so $m_i\Delta \alpha_i \ge 0$ for all $i$.
- $x \in [x_1, x_2]$ implies that $|x -c| < \delta$, so $m_2 \ge \frac{y}{2}$.

Thus,
$$
L(P,f,\alpha) = \sum_{n=1}^3 m_i \Delta\alpha_i \ge \frac{y}{2}\Delta \alpha_2 > 0
$$
since $\Delta \alpha_2 > 0$ as a consequence of $\alpha$ being _strictly_ increasing. Therefore,
$$
\int_a^b f\;\text{d}\alpha \ge L(P, f, \alpha) > 0
$$

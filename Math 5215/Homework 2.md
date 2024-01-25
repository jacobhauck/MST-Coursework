# Homework 2

## Royden-Fitzpatrick 27

The set of rational numbers $\mathbb{Q}$ is neither open nor closed. 

_Proof_. For any $r>0$ the open interval $(-r,r)$ containing $0 \in \mathbb{Q}$ also contains $\frac{\sqrt{2}}{n} \notin \mathbb{Q}$ for any integer $n$, which means that $(-r,r) \not\subset \mathbb{Q}$. This implies that $\mathbb{Q}$ is not open.

On the other hand, $\overline{\mathbb{Q}} = \mathbb{R} \ne \mathbb{Q}$, so $\mathbb{Q}$ is not closed.

## Royden-Fitzpatrick 29

Let $A = (0,1)$ and $B=\{1\}$. Then $A \cap B = \varnothing$, but $\overline{A} \cap \overline{B} = \{1\} \ne \varnothing$ because $\overline{A} = [0,1]$, and $\overline{B} = \{1\}$.

## Royden-Fitzpatrick 30

### (i)

The set $E'$ of accumulation points of a set $E$ is closed.

_Proof_. We show that the complement of $E'$ is open. Suppose that $x \notin E'$. Then $x$ is not a closure point of $E\setminus \{x\}$, so there is an open interval  $I_x \ni x$ that is disjoint from $E \setminus \{x\}$. 

Let $y \in I_x$, $y \ne x$. Then there is an open interval $I_y \subset I_x$ containing $y$ but not $x$. Since $I_x$ is disjoint from $E \setminus \{x\}$, $I_y$ is also disjoint from $E\setminus\{x\}$. Thus $I_y$ contains no points of $E$ except possibly $x$, and by construction $I_y$ also does not contain $x$. Therefore, $I_y$ is  disjoint from $E$ and, furthermore, from $E \setminus \{y\}$. This implies that $y$ is not a closure point of $E \setminus \{y\}$, so $y \notin E'$.

Thus, $y \notin E'$ for all $y \in I_x$ such that $y \ne x$. Since $x \notin E'$, also, it follows that $I_x$ contains no points of $E'$. This shows that $x$ is not a closure point of $E'$. Since $x$ was an arbitrary element of the complement of $E'$, it follows that the complement of $E'$ is open, and $E'$ is closed.

### (ii)

$\overline{E} = E \cup E'$.

_Proof_. Let $x \in \overline{E}$. Then every neighborhood of $x$ contains points of $E$. There are two possibilities: either every neighborhood of $x$ contains points of $E$ other than $x$, in which case $x \in E'$, or else $x \in E$, and there is a neighborhood of $x$ containing no points of $E$ other than $x$. Then either $x \in E'$ or $x \in E$, that is $\overline{E} \subseteq E \cup E'$.

On the other hand, if $x \in E \cup E'$, then either $x \in E \subseteq \overline{E}$ or $x \in E'$, which implies that every neighborhood of $x$ contains points of $E$, that is, $x \in \overline{E}$. Hence, $E \cup E' \subseteq \overline{E}$, and therefore $\overline{E} = E \cup E'$.

## Rodyen-Fitzpatrick 31

A set $E$ is countable if it consists entirely of isolated points.

_Proof_. Let $E$ consist entirely of isolated points. Then for each $x \in E$ there exists an open interval $I_x = (a_x, b_x)$ containing no points of $E$ other than $x$. For all $x \in E$, define $I_x' = \big(x - \frac{x-a_x}{2}, x + \frac{b_x - x}{2}\big) = (a_x', b_x') \subset I_x$. Then $I_x' \cap I_y' \ne \varnothing$ implies that $x= y$.

To see why, suppose that $x, y \in E$, and $x \ne y$. Without loss of generality, assume that $x < y$. Then $y \notin I_x$ implies that $b_x \le y$, and $x \notin I_y$ implies that $a_y \ge x$. Thus, $y - a_y \le y - x$, and $b_x - x \le y - x$. Then 
$$
b_x' \le x + \frac{y-x}{2} =\frac{y+x}{2},\qquad a_y'\ge y - \frac{y-x}{2} = \frac{y+x}{2}
$$
or, $b_x' \le a_y'$. Then $I_x' \cap I_y' = \varnothing$. This shows that $I_x' \cap I_y' \ne \varnothing$ implies that $x=y$ by contrapositive.

There is a rational number $q(x)$ in the interval $I_x'$ for each $x \in E$. The map $q :E \to \textbf{Q}$ is a injection. In fact, if $q(x) = q(y)$, then $I_x' \cap I_y' \ne \varnothing$, so $x = y$ by the above. Thus, $|E| \le |\textbf{Q}|$, that is, $E$ is countable.

## Royden-Fitzpatrick 35

The collection of Borel sets is the smallest $\sigma$-algebra containing all closed sets.

_Proof_. Let $\mathcal{B}$ be the collection of Borel sets, and let $\mathcal{C}$ be a $\sigma$-algebra containing the closed sets. If $U$ is open, then $U\in\mathcal{B}$ by definition, and $U^C$ is closed, so $U^C \in \mathcal{C}$ by hypothesis. Because $\mathcal{B}$ and $\mathcal{C}$ are $\sigma$-algebras, it follows that $U^C \in \mathcal{B}$, and $U = \left(U^C\right)^C \in \mathcal{C}$.

$U$ was arbitrary, so $\mathcal{B}$ contains all closed sets, and $\mathcal{C}$ contains all open sets. Therefore, $\mathcal{B} \subseteq \mathcal{C}$ because $\mathcal{B}$ is the smallest $\sigma$-algebra containing all open sets. On the other hand, $\mathcal{C}$ was arbitrary, so $\mathcal{B}$ is also the smallest $\sigma$-algebra containing all closed sets.

## Royden-Fitzpatrick 36

The collection of Borel sets is the smallest $\sigma$-algebra containing all intervals of the form $[a,b)$, where $a <b$.

_Proof_. Let $\mathcal{B}$ be the collection of Borel sets, and let $\mathcal{C}$ be a $\sigma$-algebra containing all intervals of the form $[a,b)$, where $a < b$. Given any $a < b$, we have the open sets $(a,b) \in \mathcal{B}$ and $(-\infty, a) \cup (a, \infty) \in \mathcal{B}$ by definition (Royden-Fitzpatrick's definition, anyway). Then $\{a\} = ((-\infty,a)\cup(a,\infty))^C \in \mathcal{B}$, and $[a,b) = \{a\}\cup(a,b) \in \mathcal{B}$ because $\mathcal{B}$ is a $\sigma$-algebra. Thus, $\mathcal{B}$ contains all intervals of the form $[a,b)$.

On the other hand, given $a < b$, there is an integer $N > 0$ such that $a + \frac{1}{N} < b$. Then for all $n \ge N$ we have $\left[a + \frac{1}{n},b\right) \in \mathcal{C}$ by definition, and since $\mathcal{C}$ is a $\sigma$-algebra, it follows that
$$
(a,b) = \bigcup_{n=N}^\infty\left[a+\frac{1}{n},b\right) \in \mathcal{C}
$$
Therefore, $\mathcal{C}$ contains all open intervals, and because every open set in $\mathbb{R}$ is a countable union of open intervals, it follows that $\mathcal{C}$ contains all open sets. Therefore, $\mathcal{B} \subseteq \mathcal{C}$ by definition. This shows that $\mathcal{B}$ is the smallest $\sigma$-algebra of sets containing all intervals of the form $[a,b)$, where $a<b$.

## Royden-Fitzpatrick 37

All open sets are $F_\sigma$ sets.

_Proof_. Let $U$ be an open set. Then
$$
U = \bigcup_{n=1}^\infty(a_n,b_n)
$$
where $a_n < b_n$, and all of the intervals in the union are disjoint. Then for each $n \ge 1$ there is some $K_n$ such that $k \ge K_n$ implies that $a_n + \frac{1}{k} < b_n - \frac{1}{k}$, so that $\left[a_n + \frac{1}{k}, b_n - \frac{1}{k}\right] \subseteq (a_n, b_n)$. On the other hand,
$$
(a_n,b_n) = \bigcup_{k=K_n}^\infty \left[a_n+\frac{1}{k}, b_n-\frac{1}{k}\right]
$$
so
$$
U = \bigcup_{n=1}^\infty\bigcup_{k=K_n}^\infty\left[a_n+\frac{1}{k}, b_n -\frac{1}{k}\right]
$$
which is a countable union of closed sets. That is, $U$ is an $F_\sigma$ set.

## Royden-Fitzpatrick 41

For any sequence $\{a_n\}$ of real numbers, $\lim\inf a_n \le \lim\sup a_n$.

_Proof_. Let $\{a_n\}$ be a sequence of real numbers. Then
$$
\inf_{k \ge n} a_k \le \sup_{k \ge n} a_k
$$
because the $\inf$ of a set is always less than or equal to the $\sup$. Taking the limit as $k\to \infty$ on both sides gives $\lim\inf a_n \le \lim\sup a_n$.

## Royden-Fitzpatrick 42

Suppose that $a_n > 0$ and $b_n \ge 0$ for all $n$. Then
$$
\lim\sup\left[a_n \cdot b_n\right] \le (\lim\sup a_n)\cdot(\lim\sup b_n)
$$
as long as the right hand side is not of the form $0\cdot\infty$.

_Proof_. $a_n > 0$ for all $n$ implies that $\sup_{k\ge n} a_k >0$, and therefore $\lim\sup a_n \ge 0$. Similar reasoning shows that $\lim\sup b_n \ge 0$. If the product of the two is not of the form $0\cdot\infty$, then there are three possibilities:

- Both are $\infty$
- One is $\infty$ and the other is finite and positive
- Both are finite and nonnegative

In the first two cases, the right hand side is $\infty$, so the inequality is trivially true.

Now assume that both $\lim\sup a_n$ and $\lim\sup b_n$ are finite and nonnegative. Let $\varepsilon > 0$ be given; we can choose $K$ large enough that $a_k \le \varepsilon + \lim\sup a_n$ and $b_k \le \varepsilon + \lim\sup b_n$ for all $n \ge N$. 

Let $0 \le a \le a'$, and $0 \le b \le b'$. It is easy to see that $ab \le a'b \le a'b'$. By the above, if $k \ge K$, then we can apply this fact with $a = a_k \ge 0$, $a' = \varepsilon + \lim\sup a_n \ge a_k = a$, and $b = b_k\ge 0$, $b' = \varepsilon + \lim\sup b_n \ge b_k = b$. Thus, for all $k \ge K$,
$$
a_k b_k \le (\lim\sup a_n)\cdot(\lim\sup b_n) + \varepsilon (\lim \sup a_n + \lim\sup b_n) + \varepsilon^2
$$
So, if $m \ge K$, then
$$
\sup_{k \ge m} [a_k\cdot b_k] \le (\lim\sup a_n)\cdot(\lim\sup a_n) + \varepsilon(\varepsilon + \lim \sup a_n + \lim\sup b_n)
$$
Taking the limit as $m \to \infty$ gives
$$
\lim\sup[a_n\cdot b_n] \le (\lim \sup a_n)\cdot(\lim\sup b_n) + \varepsilon(\varepsilon + \lim\sup a_n + \lim\sup b_n)
$$
But $\varepsilon > 0$ was arbitrary; hence,
$$
\lim\sup[a_n \cdot b_n] \le (\lim\sup a_n)\cdot(\lim\sup b_n)
$$

## Royden-Fitzpatrick 45

Let $\{a_n\}$ be a sequence of real numbers.

### (i)

The series $\sum\limits_{k=1}^\infty a_k$ converges if and only if for all $\varepsilon > 0$ there exists $N$ such that
$$
\left|\sum_{k=n}^{n+m}a_k\right| < \varepsilon
$$
for any integers $n \ge N$ and $m > 0$.

_Proof_. Suppose that $\sum\limits_{k=1}^\infty a_k$ converges; let $S$ be the sum. Then given $\varepsilon > 0$, there exists $N$ such that
$$
\left|S-\sum_{k=1}^n a_k\right| < \frac{\varepsilon}{2}
$$
whenever $n \ge N$. Let $N'=N+1$. Then for all $n \ge N'$ and $m > 0$
$$
\left|\sum_{k=n}^{n+m}a_k\right| = \left|\sum_{k=1}^{n+m}a_k - \sum_{k=1}^{n-1}a_k\right| \le \left|S - \sum_{k=1}^{n+m}a_k\right| + \left|S - \sum_{k=1}^{n-1}a_k\right| < \varepsilon
$$
because $n+m \ge N$ and $n-1 \ge N$.

Conversely, suppose that for any $\varepsilon > 0$ there exists $N$ such that
$$
\left|\sum_{k=n}^{n+m}a_k\right| < \varepsilon
$$
whenever $n \ge N$ and $m > 0$. Define $S_n = \sum\limits_{k=1}^n a_k$.  Given $\varepsilon > 0$, there exists $N$ such that the above holds for all $n \ge N$ and $m > 0$. Then for all $n,n' \ge N$ the difference $|S_n - S_{n'}| < \varepsilon$. Since $\varepsilon$ was arbitrary, it follows that $\{S_n\}$ is a Cauchy sequence. Therefore, $S_n \to S \in \mathbb{R}$, which is equivalent to saying that the series $\sum\limits_{k=1}^\infty a_k$ converges.

### (ii)

If the series $\sum\limits_{k=1}^\infty |a_k|$ converges then $\sum\limits_{k=1}^\infty a_k$ also converges.

_Proof_. Suppose that $\sum\limits_{k=1}^\infty |a_k|$ converges. Then given any $\varepsilon > 0$ there exists $N$ such that
$$
\sum_{k=n}^{n+m}|a_k| = \left|\sum_{k=n}^{n+m}|a_k|\right| < \varepsilon
$$
for any $n \ge N$ and $m > 0$, by part (i). Then
$$
\left|\sum_{k=n}^{n+m}a_k\right| \le \sum_{k=n}^{n+m}|a_k| < \varepsilon
$$
so $\sum\limits_{k=1}^\infty a_k$ converges by part (i).

### (iii)

Let $a_k \ge 0$ for all $k$, and let $\{S_n\}$ be the sequence of partial sums of $\sum\limits_{k=1}^\infty a_k$. Then the series $\sum\limits_{k=1}^\infty a_k$ converges if and only if $\{S_n\}$ is bounded.

_Proof_. If the series converges, then $\{S_n\}$ converges, and convergent sequences are bounded.

Conversely, if $\{S_n\}$ is bounded, then it converges because it is also increasing: if $n' > n$, then
$$
S_{n'} - S_n = \sum_{k=n+1}^{n'} a_k \ge 0
$$
because each $a_k \ge 0$. Thus, $S_{n'} \ge S_n$ whenever $n' \ge n$, that is, $\{S_n\}$ is increasing. Finally, $\{S_n\}$ converges is the same thing as $\sum\limits_{k=1}^\infty a_k$ converges.


## Rudin 1

Every uniformly convergent sequence of bounded functions is uniformly bounded.

_Proof_. This is basically the same as Supplementary 2, in which it is shown that if a sequence of bounded functions converges uniformly, then the uniform limit is bounded, and the sequence is uniformly bounded.

## Rudin 2

If $\{f_n\}$ and $\{g_n\}$ converge uniformly on a set $E$, then $\{f_n+g_n\}$ converges uniformly on $E$. Furthermore, if $f_n$ and $g_n$ are bounded on $E$ for all $n$, then $\{f_ng_n\}$ converges uniformly on $E$.

_Proof_. Let $\varepsilon > 0$ be given. Since $\{f_n\}$ and $\{g_n\}$ converge uniformly on $E$, there exists $N$ such that $n,m \ge N$ implies that
$$
|f_n(x) - f_m(x)| < \varepsilon \qquad |g_n(x) - g_m(x)| < \varepsilon
$$

### $\{f_n+g_n\}$

Using the above, we see that for $n,m \ge N$,
$$
|(f_n + g_n)(x) - (f_m + g_m)(x)| \le |f_n(x) - f_m(x)| + |g_n(x) - g_m(x)| < 2\varepsilon
$$
for all $x\in E$. Therefore, $\{f_n + g_n\}$ is uniformly Cauchy on $E$ and consequently uniformly convergent on $E$.

### $\{f_ng_n\}$

Suppose that $f_n$ and $g_n$ are bounded on $E$ for all $n$. Then by Rudin 1/Supplementary 2, the sequences $\{f_n\}$ and $\{g_n\}$ are uniformly bounded on $E$ because they are uniformly convegent on $E$. Then there exists $M$ such that $|f_n(x)| \le M$ and $|g_n(x)| \le M$ for all $n$ and all $x \in E$.

Thus, for $n,m \ge N$,
$$
\begin{aligned}
\big|(f_ng_n)(x) - (f_mg_m)(x)\big| &= \big|f_n(x)(g_n(x) - g_m(x)) - g_m(x)(f_m(x) - f_n(x))\big| \\
&\le |f_n(x)|\cdot|g_n(x) - g_m(x)| + |g_m(x)|\cdot|f_m(x) - f_n(x)|\\
&\le 2M\varepsilon
\end{aligned}
$$
for all $x \in E$. Therefore, $\{f_ng_n\}$ is uniformly Cauchy on $E$ and consequently uniformly convergent on $E$.

## Rudin 3

Let $f_n(x) = \frac{1}{x}$ and $g_n(x) = \frac{1}{n}$ be sequences of functions on $E = (0,1)$. Then $f_n \to f$ uniformly on $E$, and $g_n \to g$ uniformly on $E$, where $f(x) = \frac{1}{x}$, and $g(x) = 0$. Furthermore, $f_ng_n \to 0$ pointwise on $E$. The convergence of $\{f_ng_n\}$, however, is _not_ uniform on $E$.

Set $\varepsilon = 1$. Then for all $n$ we can choose $x = \frac{1}{2n} \in (0,1)$, which makes $|f_n(x)g_n(x) - 0| = 2 > \varepsilon$. Thus, we have found an $\varepsilon > 0$ such that there is no $N$ large enough to make $|f_n(x)g_n(x) - 0| < \varepsilon$ for all $x \in (0,1)$ whenever $n \ge N$. That is, $\{f_ng_n\}$ does not converge uniformly on $(0,1)$.

## Rudin 4

Let $f(x) = \sum\limits_{n=1}^\infty \frac{1}{1+n^2x}$. This series converges absolutely for all $x \ne 0$ by limit comparison with the convergent $p$-series $\sum\limits_{n=1}^\infty \frac{1}{n^2}$:
$$
\lim_{n\to\infty} \frac{\left|\frac{1}{1+n^2x}\right|}{\frac{1}{n^2}} = \lim_{n\to\infty} \left|\frac{n^2}{1+n^2x}\right| = \lim_{n\to\infty}\left|\frac{1}{\frac{1}{n^2} + x}\right| = \frac{1}{|x|}
$$
If $x=0$, then the series clearly diverges to $\infty$.

If $M > 0$, then the series converges uniformly on $(-\infty, M] \cup [M, \infty)$, that is, when $|x| \ge M$. This is because
$$
|1 + n^2x| = |n^2x - (-1)| \ge n^2|x| - 1 \ge n^2M - 1
$$
so
$$
\left|\frac{1}{1+n^2x}\right| \le -\frac{1}{1 + n^2\cdot(-M)}
$$
for all $n > \frac{1}{\sqrt{M}}$ and all $x \in (-\infty, M] \cup [M,\infty)$. Since we just showed that $f(-M) = \sum\limits_{n=1}^\infty\frac{1}{1+n^2\cdot(-M)}$ converges absolutely, it follows by the Weierstrass M-Test that the series for $f(x)$ converges uniformly on $(-\infty,M]\cup[M,\infty)$.

This clearly implies that if $0 \notin \overline{E}$, then the series converges uniformly on $E$. On the other hand, if $0 \in \overline{E}$, then the series does _not_ converge uniformly on $E$. 

In fact, if $0 \in E$, then the series fails to converge for $x = 0$, so obviously it cannot converge uniformly on $E$.

Otherwise, if $0 \notin E$ but $0 \in\overline{E}$, then for all $\delta > 0$ there exists $x \in E$ with $|x| < \delta$. Set $\varepsilon = 1$. Then for any $N$, we can choose $x \in E$ such that
$$
\left|\sum_{n=N}^{N+1} \frac{1}{1+n^2x}\right| > 1 = \varepsilon
$$
This follows from the fact that $\lim\limits_{x\to 0}[1 + N^2x] = \lim\limits_{x\to 0} [1+(N+1)^2x] = 1$, so for $|x| < \delta$, where $\delta > 0$ is small enough, we can make both $|1 + N^2x| < 2$ and $|1+(N+1)^2x| < 2$, which implies the above inequality for the right choice of $x \in E$.

Thus, the series fails to be uniformly Cauchy on $E$ and cannot be uniformly convergent on $E$.

Finally, $f$ is not bounded. By the same argument we just used, we can choose $x$ small enough that $\left|\frac{1}{1+n^2x}\right| > \frac{1}{2}$ for all $n =1,\dots,N$ and any fixed $N$. For $x > 0$, the terms of the series are nonnegative, so given any $N$, we can choose $x>0$ such that
$$
f(x) \ge \sum_{n=1}^N\frac{1}{1+n^2x} > \frac{N}{2}
$$
Therefore, $f$ is not bounded.

## Rudin 5

Let
$$
f_n(x) = \begin{cases}
0 & x < \frac{1}{n+1} \\
\sin^2\left(\frac{\pi}{x}\right) & \frac{1}{n+1}\le x\le \frac{1}{n} \\
0 & \frac{1}{n} < x
\end{cases}
$$
Then $\{f_n\}$ converges pointwise to a continuous function $f$, but not uniformly. Furthermore, $\sum\limits_{n=1}^\infty f_n$ converges absolutely for all $x$, but not uniformly.

_Proof_. It is clear that $f_n \to 0$ as $n \to \infty$; if $x \le 0$, then $f_n(x) = 0$ for all $n$, and if $x > 0$, then choose $N > \frac{1}{x}$ so that $x > \frac{1}{N} > \frac{1}{n}$ for all $n \ge N$, making $f_n(x) = 0$ for all $n >N$.

This convergence is not uniform, though. Let $\varepsilon = \frac{1}{2}$. Then given any $N$ we can choose $x = \frac{2}{2N+1} \in \left[\frac{1}{N+1},\frac{1}{N}\right]$, which makes $|f_N(x) - 0| = \sin^2\left(\frac{\pi}{x}\right) = 1 > \varepsilon$. Thus, there is no $N$ large enough so that for all $n \ge N$, $|f_n(x) - 0| < \varepsilon$ for all $x \in \textbf{R}$. That is, $\{f_n\}$ does not converge uniformly.

Furthermore, since we showed above that for all $x$ we can find $N$ such that $f_n(x) = 0$ for all $n \ge N$, it follows that $\sum\limits_{n=1}^\infty |f_n(x)|$ has only finitely many nonzero terms, and therefore converges absolutely.

This does not, however, imply uniform convergence of $\sum_{n=1}^\infty f_n$. Let $\varepsilon = \frac{1}{2}$. By the above argument against the uniform convergence of $\{f_n\}$, for any $N$, we can choose $x$ such that $f_N(x) > \varepsilon$. Then, since $f_n$ is nonnegative for all $n$,
$$
\left|\sum_{n=N}^{N+1}f_n(x)\right| \ge f_N(x) > \varepsilon
$$
That is, the series is not uniformly Cauchy; therefore, the series does not converge uniformly.

## Rudin 6

The series
$$
\sum_{n=1}^\infty(-1)^n\frac{x^2+n}{n^2}
$$
converges uniformly on any bounded interval but does not converge absolutely for any $x$.

_Proof_. Since $\sum\limits_{n=1}^\infty (-1)^n\frac{n}{n^2}$ converges by the Alternating Series Test and does not depend on $x$, it converges uniformly on $\textbf{R}$, and therefore on any bounded interval as well.

Let $I$ be a bounded interval, so that, say, $|x| < M$ for all $x \in I$. Then $\left|(-1)^n\frac{x^2}{n^2}\right| \le \frac{M^2}{n^2} = M_n$. Since $\sum\limits_{n=1}^\infty M_n$ is a convergent $p$-series, it follows that $\sum\limits_{n=1}^\infty (-1)^n\frac{x^2}{n^2}$ converges unifromly on $I$ by the Weierstrass M Test.

Therefore, by applying exercise Rudin 2 to the partial sums of $\sum\limits_{n=1}^\infty (-1)^n \frac{x^2}{n^2}$ and $\sum\limits_{n=1}^\infty (-1)^n\frac{n}{n^2}$, we can conclude that $\sum\limits_{n=1}^\infty(-1)^n\frac{x^2+n}{n^2}$ converges uniformly on $I$.

On the other hand, for any $x$ and any $n$
$$
\left|(-1)^n\frac{x^2+n}{n^2}\right| \ge \frac{1}{n}
$$
Therefore, the series $\sum\limits_{n=1}^\infty(-1)^n\frac{x^2+n}{n^2}$ does not converge absolutely anywhere by comparison with the harmonic series.

## Rudin 7

Let
$$
f_n(x) = \frac{x}{1+nx^2}
$$
Then $\{f_n\}$ converges uniformly to a function $f$ on any bounded interval, but $f'(x) = \lim_{n\to\infty}f_n'(x)$ iff $x = 0$.

_Proof_. Note that $f_n(x) \to 0 = f$ as $n\to\infty$ for all $x$; if $x = 0$, then $f_n(x) = 0$ for all $n$, and if $x \ne 0$, then clearly $\lim_{n\to\infty}\frac{x}{1+nx^2} = 0$. So $f_n\to 0$ pointwise.

Given $\varepsilon >0$, we can choose $N$ large enough so that $\frac{1}{\sqrt{n}(1+n^2)} < \varepsilon$ for all $n \ge N$. Consider some $n \ge N$. Then $f_n$ is differentiable on any interval $[a,b]$, and
$$
f_n'(x) = \frac{1-nx^2}{(1+nx^2)^2} = 0
$$
only if $x = \pm\frac{1}{\sqrt{n}}$. Therefore, by the Extreme Value Theorem,
$$
\sup_{x\in[a,b]}|f_n(x)| = \max\left\lbrace |f_n(a)|, |f_n(b)|, \frac{1}{\sqrt{n}(1+n^2)}\right\rbrace
$$
On the other hand, for any fixed $n$,
$$
\lim_{x\to\pm\infty}|f_n(x)| = 0
$$
so we can choose $a$ and $b$ so that $|f_n(x)| <\varepsilon$ for $x \le a$ and $x \ge b$. This implies that
$$
\sup_{x\in\textbf{R}}|f_n(x)| = \max\left\lbrace \sup_{x\in[a,b]}|f_n(x)|,\sup_{x\notin[a,b]}|f_n(x)|\right\rbrace <\varepsilon
$$
for all $n \ge N$. Therefore, $\{f_n\}$ converges uniformly on $\textbf{R}$.

Finally, $f= 0$, so $f' = 0$. Using the expression for $f_n'$ found above, we see that for any $x$
$$
\lim_{n\to\infty}f_n'(x) = \lim_{n\to\infty}\frac{1-nx^2}{(1+nx^2)^2}
$$
If $x = 0$, then the limit gives $1 \ne f'(0)$. If $x \ne 0$, then we have a degree 1 polynomial in $n$ in the numerator and a degree 2 polynomial in $n$ in the denominator, so the limit is $0 = f'(x)$.

## Rudin 8

Define
$$
I(x) = \begin{cases}
0 & x \le 0 \\
1 & x > 0
\end{cases}
$$
If $\{x_n\}$ is a sequence of distinct points of $(a,b)$, and $\sum\limits_{n=1}^\infty |c_n|$ converges, then
$$
f(x) = \sum_{n=1}^\infty c_nI(x-x_n)
$$
converges uniformly on $\textbf{R}$, and $f$ is continuous at all $x \notin \{x_n\}$.

_Proof_. Let $M_n = |c_n|$. Then $|c_nI(x-x_n)| \le M_n$ for all $x \in \textbf{R}$. Hence, the series for $f$ converges uniformly on $\textbf{R}$ by the Weierstrass M Test.

Each function $c_nI(x-x_n)$ is continuous at all $x \notin \{x_n\}$. This means that all the partial sums of $f$ are continuous for all $x\notin\{x_n\}$, being finite sums of functions continuous for all $x \notin \{x_n\}$. Therefore, the limit of the partial sums, $f$, is continuous for all $x\notin\{x_n\}$ because the series converges uniformly on $\textbf{R}$ and, therefore, also on $\textbf{R} \setminus\{x_n\}$.

## Rudin 9

Let $\{f_n\}$ converge uniformly to $f$ on $E$, where $f_n$ is continuous for each $n$. Then, for every sequence $\{x_n\}$ over $E$ that converges to some $x \in E$,
$$
\lim_{n\to\infty}f_n(x_n) = f(x)
$$
The converse, however, is not true.

_Proof_. Because $f_n \to f$ uniformly on $E$ and each $f_n$ is continuous on $E$, it follows that $f$ is continuous on $E$. 

Let $\varepsilon > 0$ be given. Then by the uniform convergence of $\{f_n\}$ and the continuity of $f$ at $x$ we can choose $N$ such that for all $n \ge N$ and all $y \in E$
$$
|f_n(y) - f(y)| < \frac{\varepsilon}{2}\quad\text{and}\quad|f(x_n) - f(x)| < \frac{\varepsilon}{2}
$$
Then for all $n \ge N$
$$
|f_n(x_n) - f(x)| \le |f_n(x_n) - f(x_n)| + |f(x_n) - f(x)| < \varepsilon
$$
The result follows.

On the other hand, let
$$
f_n(x) =
\begin{cases}
0 & x < n \\
x - n & n \le x < n + 1 \\
n + 2 - x & n + 1 \le x < n + 2 \\
0 & n + 2 < x
\end{cases}
$$
be a sequence of continuous functions on $E = \textbf{R}$. Then, clearly, $f_n \to 0$ pointwise, but not uniformly, on $\textbf{R}$.

Furthermore, any sequence $\{x_n\}$ converging to $x$ is bounded, so there exists $N$ large enough so that $n \ge N$ implies that $x_n < N \le n$, meaning that $f_n(x_n) = 0$. Thus, $f_n(x_n) \to 0$ for any convergent sequence $\{x_n\}$, but $\{f_n\}$ does not converge uniformly on $\textbf{R}$.

## Rudin 12

Suppose that $g$ and $f_n$ are defined on $(0,\infty)$ and Riemann integrable on $[t,T]$ whenever $0 <t<T$. If $|f_n| \le g$ and $f_n \to f$ uniformly on every compact subset of $(0,\infty)$, and
$$
\int_0^\infty g(x)\;\text{d}x < \infty
$$
then
$$
\lim_{n\to\infty}\int_0^\infty f_n(x)\;\text{d}x = \int_0^\infty f(x)\;\text{d}x
$$
where, for a function $h$ defined on $(0,\infty)$ and integrable on $[t,T]$ whenever $0<t<T$, we define$\int_0^\infty h = \int_0^c h + \int_c^\infty h$ for any $c > 0$, and $\int_0^c h$ is defined the same way as in Rudin 6.7,and $\int_c^\infty h$ is defined the same way as in Rudin 6.8.

_Proof_. 

### Lemma

Since $\int_0^\infty g$ exists and is finite, so, too, are $\int_0^c g$ and $\int_c^\infty g$ for any $c > 0$. It is an obvious consequence of the definition of $\int_0^cg$ and $\int_c^\infty g$ that for any $0 < a < c$ and $b > c$
$$
\int_0^c g = \int_0^a g + \int_a^cg, \qquad \int_c^\infty g = \int_c^b g + \int_b^\infty g
$$
Taking the limit as $a \to 0^+$ and $b \to\infty$ on both sides gives
$$
\lim_{a\to 0^+}\int_0^a g = 0,\qquad \lim_{b\to\infty}\int_b^\infty g = 0
$$
Furthermore, we have $g \ge |f_n| \ge 0$, so $\int_0^a g\ge 0$ and $\int_b^\infty g\ge 0$ because they are the limits of nonnegative functions. This and the above equations imply that
$$
\int_a^c g \le \int_0^c g,\qquad \int_c^b g \le \int_c^\infty g
$$

### Existence of  $\int_0^\infty f_n$

For any $c > 0$ and any integer $k$ where $k > c$ and $\frac{1}{k} < c$, we have
$$
\left|\int_\frac{1}{k}^c f_n\right| \le \int_\frac{1}{k}^c g \le \int_0^c g,\qquad \left|\int_c^kf_n\right| \le \int_c^k g \le \int_c^\infty g
$$
so that the sequences $\left\lbrace\int_\frac{1}{k}^c f_n\right\rbrace$ and $\left\lbrace\int_c^k f_n\right\rbrace$ are bounded. By the Bolzano-Weierstrass Theorem, these sequences contain convergent subsequences with limits $A$ and $B$ and index sequences $\{k_\ell\}$ and $\{k_m\}$.

Given $\varepsilon > 0$, there exists $L, M$ such that
$$
\left|A - \int_\frac{1}{k_L}^cf_n\right| < \varepsilon, \quad \left|\int_0^\frac{1}{k_L}g\right| < \varepsilon,\qquad \left|B - \int_c^{k_M}f_n\right| < \varepsilon,\quad\left|\int_{k_M}^\infty g\right| < \varepsilon
$$
where the second and fourth inequalities come from the Lemma and the fact that $\frac{1}{k_\ell} \to 0$ and $k_m \to \infty$. Then for all $0 < a < \frac{1}{k_L}$ and all $b > k_M$
$$
\begin{aligned}
\left|A - \int_a^c f_n\right| &\le \left|A - \int_\frac{1}{k_L}^c f_n\right| + \left|\int_a^\frac{1}{k_L} f_n\right| \le \varepsilon + \int_a^\frac{1}{k_L} g \le \varepsilon + \int_0^\frac{1}{k_L }g\le 2\varepsilon\\\\
\text{and}\\\\
\left|B - \int_c^bf_n\right| &\le \left|B - \int_c^{k_M}f_n\right| + \left|\int_{k_M}^bf_n\right| \le \varepsilon + \int_{k_M}^b g \le \varepsilon + \int_{k_M}^\infty g \le 2\varepsilon
\end{aligned}
$$
so $\int_0^c f_n = A$, and $\int_c^\infty f_n = B$ by definition. Since $n$ was arbitrary, we have shown that these improper integrals exist for all $n$. This implies that $\int_0^\infty f_n$ exists for all $n$.

### Existence of $\int_0^\infty f$

Since $f_n \to f$ uniformly on any $[a, b]\subset (0,\infty)$, we have $f \in \mathscr{R}$ on $[a,b]$, and
$$
\lim_{n\to\infty}\int_a^bf_n = \int_a^b f
$$
Given $\varepsilon > 0$, we can choose $n$ such that
$$
\left|\int_a^bf_n - \int_a^bf\right| < \varepsilon
$$
which implies that
$$
\left|\int_a^b f\right| \le \left|\int_a^b f_n\right| + \varepsilon \le \int_a^bg + \varepsilon \le \int_0^\infty g + \varepsilon
$$
Given an integer $k$ such that $\frac{1}{k} < c$ and $k > c$, we see that $\left\{\int_\frac{1}{k}^c f\right\}$ and $\left\{\int_c^kf\right\}$ are both bounded sequences. By the Bolzano-Weierstrass Theorem, they must contain convergent subsequences with limits $A$ and $B$ and index sequences $\{k_\ell\}$ and $\{k_m\}$.

Given $\varepsilon>0$, there exists $L,M$ such thatt
$$
\left|A - \int_\frac{1}{k_L}^cf\right| < \varepsilon, \quad \left|\int_0^\frac{1}{k_L}g\right| < \varepsilon,\qquad \left|B - \int_c^{k_M}f\right| < \varepsilon,\quad\left|\int_{k_M}^\infty g\right| < \varepsilon
$$
Then for all $0 < a < \frac{1}{k_L}$ and $b > k_M$
$$
\begin{aligned}
\left|A - \int_a^cf\right| &\le \left|A - \int_{\frac{1}{k_L}}^c f\right| + \left|\int_a^\frac{1}{k_L}f\right| \le \varepsilon  +\left|\int_a^\frac{1}{k_L}f\right| \\\\
\text{and}\\\\
\left|B - \int_c^b\right| &\le \left|B - \int_c^{k_M}f\right| + \left|\int_{k_M}^bf\right| \le \varepsilon + \left|\int_{k_M}^bf\right|
\end{aligned}
$$
We can choose $N_a$ and $N_b$ depending on $a,b$ such that
$$
\left|\int_a^\frac{1}{k_L}f - \int_a^\frac{1}{k_L}f_{N_a}\right| < \varepsilon, \qquad\left|\int_{k_M}^b f - \int_{k_M}^b f_{N_b}\right| < \varepsilon
$$
Then
$$
\begin{aligned}
\left|A - \int_a^c f\right| &\le 2\varepsilon + \left|\int_a^\frac{1}{k_L}f_{N_a}\right| \le 2\varepsilon + \int_a^\frac{1}{K_L}g \le 2\varepsilon + \int_0^\frac{1}{k_L}g \le 3\varepsilon \\\\
\text{and}\\\\
\left|B - \int_c^bf\right| &\le 2\varepsilon + \left|\int_{k_M}^bf_{N_b}\right| \le 2\varepsilon + \int_{k_M}^b g \le 2\varepsilon + \int_{k_M}^\infty g \le 3\varepsilon
\end{aligned}
$$
This shows that $\int_0^c f = A$, and $\int_c^\infty f = B$ by definition. Therefore, $\int_0^\infty f$ exists.

### Value of $\int_0^\infty f$

Given $\varepsilon > 0$, we can choose $0 < a< b$ such that 
$$
\left|\int_0^a f_n\right| < \int_0^a g < \varepsilon,\qquad \left|\int_b^\infty f_n\right| < \int_b^\infty g < \varepsilon
$$
for all $n$. Since $\int_0^\infty f$ exists, we can also choose $t < a$ and $T > b$ such that
$$
\left|\int_0^a f - \int_t^a f\right| < \varepsilon, \qquad\left|\int_b^\infty f -\int_b^Tf\right|<\varepsilon
$$
Furthermore, we can choose $N_t$ and $N_T$ such that
$$
\left|\int_t^a f - \int_t^af_{N_t}\right| < \varepsilon,\qquad\left|\int_b^T f - \int_b^T f_{N_T}\right|<\varepsilon
$$
Thus,
$$
\left|\int_0^a f\right| < \left|\int_t^af\right| +\varepsilon < \left|\int_t^af_{N_t}\right| + 2\varepsilon < \left|\int_0^af_{N_t}\right| + 2\varepsilon < 3\varepsilon
$$
and
$$
\left|\int_b^\infty f\right| < \left|\int_b^T f\right| + \varepsilon < \left|\int_b^Tf_{N_T}\right| + 2\varepsilon < \left|\int_b^\infty f_{N_T}\right| + \varepsilon < 3\varepsilon
$$
Finally, choose $N$ such that for all $n > N$
$$
\left|\int_a^bf - \int_a^bf_n\right| < \varepsilon
$$
Then
$$
\begin{aligned}
\left|\int_0^\infty f - \int_0^\infty f_n\right| &\le \left|\int_0^\infty f - \int_a^b f\right| + \left|\int_a^bf - \int_a^bf_n\right| + \left|\int_0^\infty f_n - \int_a^b f_n\right|\\\\
&\le 6\varepsilon + \varepsilon  +2\varepsilon \le 9\varepsilon
\end{aligned}
$$
for all $n > N$. Therefore
$$
\lim_{n\to\infty}\int_0^\infty f_n = \int_0^\infty f
$$

## Rudin 15

Suppose that $f$ is continuous on $\textbf{R}$, and let $f_n(x) = f(nx)$. If $\{f_n\}$ is equicontinuous on $[0,1]$, then $f$ is constant on $[0,\infty)$.

_Proof_. Given $\varepsilon > 0$, we can choose $\delta > 0$ such that
$$
|f_n(x) - f_n(y)| < \varepsilon \quad\text{or}\quad |f(nx) - f(ny)| < \varepsilon
$$
for all $n$ and all $x,y \in [0,1]$ such that $|x-y| < \delta$. Let $z \ge 0$ be given. Then for some $n$ large enough we have $0\le\frac{z}{n} < \delta$. Therefore, $|f(z) - f(0)| < \varepsilon$. Since this is true for all $\varepsilon > 0$, it follows that $f(z) = f(0)$. Then $f$ is constant on $[0,\infty)$ because $z$ was arbitrary.

## Rudin 16

Let $\{f_n\}$ be an equicontinuous sequence of functions on a compact set $K$. If $\{f_n\}$ converges pointwise to $f$ on $K$, then $\{f_n\}$ converges uniformly to $f$ on $K$.

_Proof_. Let $\varepsilon > 0$ be given. By the equicontinuity of $\{f_n\}$, we can choose $\delta > 0$ such that
$$
|f_n(x) - f_n(y)| < \varepsilon
$$
for all $x,y \in K$ such that $|x-y| < \delta$ and for all $n$. Since $K$ is compact, there is a finite open cover $\{U_i\}_{i=1}^M$ of $K$ such that for all $i$, $|x-y| < \delta$ for all $x,y\in U_i$. 

Let $x_i \in U_i$ for $i =1,\dots,M$. Since $\{f_n\}$ converges, we can choose $N_i$ such that for all $n,m  > N_i$
$$
|f_n(x_i) - f_m(x_i)| < \varepsilon
$$
Set $N = \max \{N_1, \dots, N_M\}$. Then for all $n,m > N$ and all $i=1,\dots, M$
$$
|f_n(x_i) - f_m(x_i)| < \varepsilon
$$
Therefore, for any $x \in K$, we have $x \in U_i$ for some $i$, meaning that $|x - x_i| < \delta$. Then
$$
\begin{aligned}
|f_n(x) - f_m(x)| &\le |f_n(x) - f_n(x_i)| + |f_n(x_i) - f_m(x_i)| + |f_m(x) - f_m(x_i)|\\
&\le 3\varepsilon
\end{aligned}
$$
as long as $n,m > N$. Thus, $\{f_n\}$ is uniformly Cauchy, and, consequently, uniformly convergent on $K$.

## Rudin 18

Let $\{f_n\}$ be a uniformly bounded sequence of functions that are integrable on $[a,b]$, and put
$$
F_n(x) = \int_a^xf_n
$$
for $x \in [a,b]$. Then $\{F_n\}$ contains a uniformly convergent subsequence on $[a,b]$.

_Proof_. Let $M$ be a uniform bound for $\{f_n\}$. For any $n$ and $x \in [a,b]$, observe that
$$
|F_n(x)| \le \int_a^x|f_n| \le \int_a^b|f_n| \le (b-a)M
$$
so $\{F_n\}$ is uniformly bounded.

Furthermore, for any $n$ and any $x<y\in[a,b]$
$$
|F_n(x) - F_n(y)| \le \int_x^y|f_n| \le M(y-x)
$$
Given $\varepsilon > 0$, we see that if $|x-y| < \delta = \frac{\varepsilon}{M}$, it follows that $|F_n(x) - F_n(y)|<\varepsilon$. Thus, $\{F_n\}$ is equicontinuous on $[a,b]$.

By the Arzela-Ascoli Theorem, there exists a uniformly convergent subsequence of $\{F_n\}$ on $[a,b]$.

## Rudin 20

If $f$ is continuous on $[0,1]$, and
$$
\int_0^1f(x)x^n\;\text{d}x = 0,\qquad n=1,2,3,\dots
$$
then $f(x) = 0$ for $x \in [0,1]$.

_Proof_. By the hypothesis, for $n =1,2,3,\dots$, we have
$$
\int_0^1f(0)x^n\;\text{d}x = \int_0^1(f(0) - f(x))x^n\;\text{d}x
$$
This means that for any $0 < \delta < 1$
$$
\tag{$*$}
|f(0)| \le \left|\int_0^\delta(f(0) - f(x))(n+1)x^n\;\text{d}x\right| + \left|\int_\delta^1(f(0) - f(x))(n+1)x^n\;\text{d}x\right|
$$
for all $n=1,2,3,\dots$ Since $(n+1)\delta^n \to 0$ as $n\to\infty$, given $\varepsilon > 0$, we can choose $N$ such that $n > N$ implies $(n+1)\delta^n < \varepsilon$. Then for all $x \in [0,\delta]$, it follows that $(n+1)x^n \le (n+1)\delta^n < \varepsilon$. Therefore, $(n+1)x^n \to 0$ uniformly on $[0,\delta]$.

Furthermore, since $f$ is continuous on $[0,\delta]$, it is also bounded, so by Supplementary 4 (c) $(f(0) - f(x))(n+1)x^n \to 0$ uniformly on $[0,\delta]$. By Supplementary 2, $(f(0) - f(x))(n+1)x^n$ is also uniformly bounded on $[0,\delta]$, say by $M > 0$. 

Then for any $0 < \delta < 1$ and any $\varepsilon > 0$, there exists $n$ large enough (depending on $\delta$) so that $|(f(0) - f(x))(n+1)x^n| < \varepsilon$ for all $x \in [0,\delta]$, meaning that by $(*)$

$$
|f(0)|\le \varepsilon\delta + M(1-\delta)
$$
This implies that $f(0) = 0$ because $\varepsilon$ and $\delta$ were arbitrary.

Let $\varepsilon > 0$ be given. By the Weierstrass Approximation Theorem, there exists a polynomial $P(x) = a_0 + a_1x + \dots + a_kx^k$ such that
$$
\sup_{x\in[0,1]}|f(x) - P(x)| < \varepsilon
$$
Since $f(0) = 0$, we must have $|P(0)| = |a_0| < \varepsilon$. Using the given assumption and the linearity of integration, we obtain
$$
\int_0^1f(x)(P(x) - a_0)\;\text{d}x = 0
$$
Then
$$
\int_0^1 (f(x))^2\;\text{d}x = \int_0^1f(x)(f(x) - P(x))\;\text{d}x - \int_0^1f(x)a_0\;\text{d}x
$$
so
$$
\begin{aligned}
\left|\int_0^1(f(x))^2\;\text{d}x\right| &\le \int_0^1|f(x)|\cdot|f(x) - P(x)|\;\text{d}x + \int_0^1|f(x)|\cdot|a_0|\;\text{d}x \\
& \le(\varepsilon + |a_0|)\int_0^1|f(x)|\;\text{d}x \le 2K\varepsilon
\end{aligned}
$$
where $K = \int_0^1 |f|$. This implies that $\int_0^1 f^2 =0$ because $\varepsilon >0$ was arbitrary. Since $f^2(x) \ge 0$ for all $x \in [0,1]$ and $f^2$ is continuous on $[0,1]$, we conclude by Rudin exercise 6.2 from Homework 1 that $f^2(x) = 0$ for all $x \in [0,1]$. This implies that $f(x) = 0$ for all $x \in [0,1]$.

## Rudin 22

Assume that $f \in \mathscr{R}(\alpha)$ on $[a,b]$. Then there exists a sequence of polynomials $\{P_n\}$ such that
$$
\lim_{n\to\infty}\int_a^b|f-P_n|^2\;\text{d}\alpha = 0
$$
_Proof_. Since $f\in \mathscr{R}(\alpha)$, for any positive integer $n$, there is a partition $P = \{x_0,x_1,\dots,x_m\}$ of $[a,b]$ such that
$$
U(P,f,\alpha) - L(P,f,\alpha) < \frac{1}{n}
$$
Let $\ell_i = \frac{2x_i + x_{i-1}}{3}$, and let $u_i = \frac{x_i+2x_{i-1}}{3}$ for $i=1,\dots,m$, and let $a=y_0\le\dots\le y_k=b$ be the points of the partition $Q = P \cup\{\ell_1,u_1,\dots,\ell_m,u_m\}$. Define the function $g: [a,b]\to\textbf{R}$ on $Q$ by
$$
g(x_i) = f(x_i), \quad i=0,1,\dots,m
$$
and
$$
g(\ell_i) = m_i,\quad g(u_i) = M_i,\quad i=1,2,\dots,m
$$
where
$$
m_i = \inf_{x\in[x_{i-1},x_i]}f(x),\qquad M_i = \sup_{x\in[x_{i-1},x_i]}f(x)
$$
For $x \notin Q$, there is a unique pair of distinct points $y_j, y_{j+1}\in Q$ such that $y_j \le x \le y_{j+1}$. Then define
$$
g(x) = g(y_j) + g(y_{j+1})\frac{x-y_j}{y_{j+1}-y_j}
$$
so that $g$ is a piecewise linear function. By construction, $g$ is also a continuous function on $[a,b]$, and
$$
\sup_{x\in[x_{i-1},x_i]} |g(x) - f(x)|\le M_i - m_i
$$
since $g(x) \in [m_i, M_i]$ and $f(x) \in [m_i, M_i]$ for all $x \in [x_{i-1},x_i]$.

By the Weierstrass Approximation Theorem, there is a polynomial $P_n(x)$ such that
$$
\sup_{x\in[a,b]}|g(x) - P_n(x)| \le \frac{1}{n}
$$
which implies that 
$$
\sup_{x\in[x_{i-1},x_i]} |f(x) - P_n(x)| \le M_i - m_i + \frac{1}{n}
$$
Since $|P_n(x) - f(x)| \ge 0$ for all $x \in [a,b]$, we must hve $L(P, |f - P_n|, \alpha) \ge 0$. On the other hand, the above inequality implies that
$$
U(P,|f-P_n|,\alpha) \le U(P,f,\alpha) - L(P,f,\alpha) + \frac{\alpha(b) - \alpha(a)}{n} \le \frac{1 + \alpha(b) - \alpha(a)}{n}
$$
Hence,
$$
0 \le \int_a^b|f-P_n|^2\;\text{d}\alpha \le \frac{1+\alpha(b)-\alpha(a)}{n}
$$
Thus, constructing $P_n$ as above for each positive integer $n$, we obtain
$$
\lim_{n\to\infty}\int_a^b|f-P_n|^2\;\text{d}\alpha = 0
$$

## Rudin 23

Let $P_0 = 0$, and define, for $n=0,1,2,\dots$
$$
P_{n+1}(x) = P_n(x) + \frac{x^2-P_n^2(x)}{2}
$$
Then $P_n(x) \to |x|$ uniformly on $[-1,1]$.

_Proof_. Note that
$$\tag{$*$}
\begin{aligned}
|x| - P_{n+1}(x) &= |x| - P_n(x) - \frac{x^2-P_n^2(x)}{2}\\
&=|x| - P_n(x) - \frac{(|x| - P_n(x))(|x| + P_n(x))}{2} \\
&= (|x| - P_n(x))\left(1 - \frac{|x| + P_n(x)}{2}\right)
\end{aligned}
$$
Clearly, $P_0(x) = 0 \le |x|$ for all $x \in [-1,1]$. Assume for induction $P_n(x) \le |x|$ for all $x \in [-1,1]$ and some $n \ge 0$. Using $(*)$ we have
$$
P_{n+1}(x) = |x| - (|x| - P_n(x))\left(1 - \frac{|x| +P_n(x)}{2}\right) \le |x|
$$
for all $x \in [-1,1]$.  This follows because the inductive hypothesis gives both $|x| - P_n(x) \ge 0$ for all $x \in [-1,1]$, and $|x| + P_n(x) \le 2|x| \le 2$ for all $x \in [-1,1]$, which makes both terms in the subtracted product above nonnegative.

Thus, we have $P_n(x) \le |x|$ for all $x \in [-1,1]$ and all $n \ge 0$ by induction.

Furthermore, we have $P_0(x) = 0 \ge 0$ for all $x \in [-1,1]$. Assume for induction that $P_n(x) \ge 0$ for all $x \in [-1,1]$ and some $n \ge 0$. Since $P_n(x) \le |x|$ for all $x \in[-1,1]$, we also have $P^2_n(x) \le x^2$ for all $x \in [-1,1]$. Then by definition
$$
P_{n+1}(x) = P_n(x) + \frac{x^2 - P^2_n(x)}{2} \ge 0
$$
for all $x \in [-1,1]$. 

Thus, we have $P_n(x) \le |x|$ for all $x \in[-1,1]$ and all $n \ge 0$ by induction.

Finally, it follows from $(*)$ and the fact that $0 \le P_n(x) \le |x|$ for all $x \in [-1,1]$ and all $n$ that
$$
|x| - P_{n+1}(x) = (|x| - P_n(x))\left(1-\frac{|x| + P_n(x)}{2}\right) \le (|x| - P_n(x))\left(1-\frac{|x|}{2}\right)
$$
for all $x \in [-1,1]$. Iterating this inequality gives
$$
|x| - P_{n+1}(x) \le (|x| - P_0(x))\left(1-\frac{|x|}{2}\right)^n = |x|\left(1-\frac{|x|}{2}\right)^n
$$
for all $x \in [-1,1]$. Let $f(x) = x\left(1-\frac{x}{2}\right)^n$ for $x \in [0,1]$ and $n \ge 1$. By the Extreme Value Theorem, the maximum of $f$ occurs either at $x =0$, at $x=1$, or when $f'(x) = 0$. Suppose
$$
f'(x) = \left(1-\frac{x}{2}\right)^n - \frac{nx}{2}\left(1-\frac{x}{2}\right)^{n-1} =0
$$
We can divide both sides by $\left(1-\frac{x}{2}\right)^{n-1}$ because $x \in [0,1]$ makes $1-\frac{x}{2} > 0$, which makes $\left(1-\frac{x}{2}\right)^{n-1} > 0$. Then $f'(x) = 0$ only when $1-\frac{x}{2} - \frac{nx}{2} = 0$, or $x = \frac{2}{n+1}$. Thus, the maximum of $f$ on $[0,1]$ is one of
$$
f(0) = 0,\qquad f(1)=\frac{1}{2^n},\qquad f\left(\frac{2}{n+1}\right) = \frac{2}{n+1}\cdot\frac{1}{(n+1)^n}
$$
In any case, the maximum is bounded above by $\frac{2}{n+1}$, so $f(x) \le \frac{2}{n+1}$ for all $x \in [0,1]$. This implies that
$$
|x| - P_{n+1}(x) \le |x|\left(1-\frac{|x|}{2}\right)^n \le \frac{2}{n+1}
$$
for all $x \in [-1,1]$ and any $n \ge 1$.

On the other hand, since $P_n(x) \le |x|$ for all $x \in[-1,1]$, and all $n \ge 0$, we have
$$
-\frac{2}{n+1} \le 0 \le |x| - P_n(x) \le \frac{2}{n+1}
$$
for all $x\in[-1,1]$ and all $n \ge 1$. Thus,
$$
\big||x| -P_n(x)\big| \le \frac{2}{n+1}
$$
for all $x \in [-1,1]$ and all $n\ge 1$. This shows that $P_n(x) \to |x|$ uniformly as $n \to \infty$.

## Supplementary 1

### (a)

$\frac{x}{n} \to 0$ uniformly as $n\to\infty$ on any closed interval $[a,b]$.

_Proof_. The function $f_n(x) = \frac{x}{n}$ is continuously differentiable and has no critical points anywhere. Therefore, it achieves its minimum and maximum on $[a,b]$ at the endpoints $a$ and $b$ by the Extreme Value Theorem. This implies that $|f_n(x)|$ achieves its maximum at one or both of the endpoints $a$ and $b$ because the maximizer of the absolute value of a function is always either a minimizer or maximizer of the function itself. Thus
$$
\sup_{x\in[a,b]}|f_n(x)| = \max\{|f_n(a)|, |f_n(b)|\}\le\frac{\max\{|a|, |b|\}}{n}
$$
Then $\sup_{x\in[a,b]}|f_n(x)| \to 0$ as $n\to\infty$, which implies that $f_n \to 0$ uniformly.

### (b)

$f_n(x) = \frac{1}{nx} \to 0$ pointwise but not uniformly on $(0,1)$ as $n\to\infty$.

_Proof_. Given $x \in (0,1)$, the sequence $\frac{1}{nx}$ clearly approaches $0$ as $n\to\infty$. Thus, $f_n \to 0$ pointwise. 

Given any positive integer $N$, the number $x = \frac{1}{N} \in (0,1)$, and
$$
f_N(x) = 1
$$
so there is no integer $N$ such that $|f_N(x) - 0| < \frac{1}{2}$ for all $x \in (0,1)$. This implies that $f_n$ does not approach $0$ uniformly on $(0,1)$.

## Supplementary 2

A sequence of functions $\{f_n\}$ is uniformly bounded on a set $E$ if and only if there is a number $M$ such that $|f_n(x)| \le M$ for all $n$ and all $x \in E$.

Let $\{f_n\}$ be a sequence of bounded functions that converges uniformly to $f$ on a set $E$. Then $\{f_n\}$ is uniformly bounded, and $f$ is bounded.

_Proof_. Let $\varepsilon>0$ be given. Then we can find an integer $N$ such that
$$
|f_n(x) - f(x)| < \varepsilon
$$
for all $n \ge N$ and $x \in E$. This implies in particular that
$$
f_N(x) - \varepsilon < f(x) < f_N(x) + \varepsilon
$$
for all $x \in E$. Let $M$ be a bound for $f_N(x)$, so that $|f_N(x)| \le M$ for all $x \in E$. Then the above inequalities imply that either
$$
|f(x)| < |f_N(x) + \varepsilon| \le M + \varepsilon \quad\text{or}\quad |f(x)| < |f_N(x) - \varepsilon| \le M + \varepsilon
$$
for all $x \in E$. Then $|f(x)| \le K = M + \varepsilon$ for all $x\in E$, that is, $f$ is bounded with bound $K$. 

On the other hand, the first inequality also gives
$$
f(x) - \varepsilon < f_n(x) < f(x) + \varepsilon
$$
for all $n \ge N$ and all $x \in E$. Then for all $n \ge N$ and all $x \in E$, either
$$
|f_n(x)| < |f(x) + \varepsilon| \le K + \varepsilon \quad\text{or}\quad |f_n(x)| < |f(x) - \varepsilon| \le K + \varepsilon
$$
Thus, $|f_n(x)| \le K + \varepsilon = P$ for all $n \ge N$ and all $x \in E$. Finally, since each function $f_n$ is bounded for $n = 1$ to $N - 1$, we can choose $M_n$ such that $|f_n(x)| \le M_n$ for all $x \in E$ and $n = 1$ to $N-1$. Then let
$$
Q = \max\{P, M_1, M_2, \dots, M_{N-1}\}
$$
It follows that $Q$ is a uniform bound for $\{f_n\}$ because $|f_n(x)| \le Q$ for all $n$ and all $x\in E$. Thus,  $\{f_n\}$ is uniformly bounded.

## Supplementary 3

Let $[a,b]$ be a closed and bounded interval, $f:[a,b] \to\mathbb{R}$ be bounded, and $g:[a,b]\to\mathbb{R}$ be continuous with $g(a) = 0 = g(b)$. Let $\{f_n\}$ be a uniformly bounded sequence of functions on $[a,b]$.

If $f_n\to f$ uniformly on all intervals $[c,d]\subset(a,b)$, then $f_ng \to fg$ uniformly on $[a,b]$.

_Proof_. Since $\{f_n\}$ is uniformly bounded and $f$ is bounded on $[a,b]$, there exists $K$ such that $|f_n(x)| \le K$ and $|f(x)| \le  K$ for all $x \in [a,b]$. Likewise, since $g$ is continuous on $[a,b]$, it is also bounded, and there exists some $M$ such that $|g(x)| \le M$ for all $x \in [a,b]$. 

Let $\varepsilon > 0$ be given. Since $g$ is continuous on $[a,b]$, there exists $\delta > 0$ such that $x \in [a, a+\delta]\cup[b,b-\delta]$ implies that $|g(x)| < \varepsilon$. 

Additionally, we are free to choose $\delta$ small enough that $d = b-\delta > a+\delta = c$. Then $f_n \to f$ uniformly on $[c,d] \subset (a,b)$ by hypothesis, so there exists $N$ such that $n \ge N$ implies that $|f_n(x) - f(x)| < \varepsilon$ for all $x \in [c,d]$. Then
$$
|f_n(x)g(x) - f(x)g(x)| \le M|f_n(x) - f(x)| < M\varepsilon
$$
for all $x \in [c,d]$ and all $n \ge N$. On the other hand, if $x \in [a,c] \cup [d,b]$, then
$$
|f_n(x)g(x) - f(x)g(x)| \le 2K|g(x)| < 2K\varepsilon
$$
This implies that whenever $n \ge N$,
$$
|f_n(x)g(x) - f(x)g(x)| \le \varepsilon\max\{2K, M\}
$$
for all $x\in[a,b]$. Thus, $f_ng \to fg$ uniformly on $[a,b]$ because $\varepsilon > 0$ was arbitrary.

## Supplementary 4

Let $f_n \to f$ and $g_n \to g$ uniformly on some set $E \subseteq \textbf{R}$.

### (a)

$f_n + g_n \to f + g$ uniformly on $E$ and $\alpha f_n \to \alpha f$ uniformly on $E$ for any $\alpha \in \textbf{R}$.

_Proof_. Let $\varepsilon > 0$ be given. Then there exists $N$ such that for all $n > N$ and all $x \in E$
$$
|f_n(x) - f(x)| < \varepsilon, \qquad |g_n(x) - g(x)| < \varepsilon
$$
Then for all $n > N$ and all $x \in E$
$$
|(f_n + g_n)(x) - (f+ g)(x)| \le |f_n(x) - f(x)| + |g_n(x) - g(x)| \le 2\varepsilon
$$
so $f_n +g_n \to f+  g$ uniformly on $E$.

Furthermore, for all $n > N$ and $x \in E$
$$
|\alpha f_n(x) - \alpha f(x)| \le |\alpha|\varepsilon
$$
so $\alpha f_n \to \alpha f$ uniformly on $E$.

### (b)

$f_ng_n \to fg$ pointwise on $E$.

_Proof_. Let $\varepsilon > 0$ be given. Then there exists $N$ such that for all $n > N$ and all $x \in E$
$$
|f_n(x) - f(x)| < \varepsilon, \qquad |g_n(x) - g(x)| < \varepsilon
$$
Fix $x \in E$. Then
$$
\begin{aligned}
|(f_ng_n)(x) - (fg)(x)| &\le |f_n(x)g_n(x) - f_n(x)g(x)| + |f_n(x)g(x) - f(x)g(x)|\\\\
&\le \varepsilon\big(|f_n(x)| + |g(x)|\big) \le \varepsilon\big(|f_n(x) - f(x)| + |f(x)| + |g(x)|\big)\\\\
&\le \varepsilon(\varepsilon + |f(x)| + |g(x)|)
\end{aligned}
$$
so $(f_ng_n)(x) \to (fg)(x)$ as $n \to \infty$.

Therefore, $f_ng_n \to fg$ pointwise on $E$.

### (c)

If $f$ and $g$ are bounded on $E$, then $f_ng_n \to fg$ uniformly on $E$.

_Proof_. Let $\varepsilon > 0$ be given. Then there exists $N$ such that for all $n > N$ and all $x \in E$
$$
|f_n(x) - f(x)| < \varepsilon, \qquad |g_n(x) - g(x)| < \varepsilon
$$
Then for all $n > N$ and all $x \in E$
$$
|(f_ng_n)(x) - (fg)(x)| \le |f_n(x)g_n(x) - f_n(x)g(x)| + |f_n(x)g(x) - f(x)g(x)|
$$
Let $M$ be a bound for $f$ and $g$ on $E$. Then by the above we have for all $n > N$ and all $x \in E$
$$
\begin{aligned}
|(f_ng_n)(x) - (fg)(x)| &\le \varepsilon\big(|f_n(x)| + |g(x)|\big) \le \varepsilon\big(|f_n(x) - f(x)| + |f(x)| + |g(x)|\big) \\
&\le \varepsilon\big(\varepsilon + 2M\big)
\end{aligned}
$$
Therefore, $f_ng_n \to fg$ uniformly on $E$.

### (d)

Let $f_n(x) = \frac{1}{n}$ and $g_n(x) = \frac{1}{x}$ on $E = (0,1)$. Then clearly $f_n \to 0$ uniformly on $E$ and $g_n \to g$ on $E$, where $g(x) = \frac{1}{x}$. The sequence $\{f_ng_n\}$, however, does not converge uniformly to $0$ (the pointwise limit) on $E$.

To see why, let $\varepsilon =1$. Then for all $n$ we can choose $x = \frac{1}{2n}\in(0,1)$, which makes
$$
|(f_ng_n)(x) - 0| = 2 > \varepsilon
$$
Thus, $\{f_ng_n\}$ does not converge uniformly on $E$, that is, (c) may not be true when $g$ is unbounded.

## Supplementary 5

Let $E$ be a nonempty subset of $\textbf{R}$ and let $f_n \to f$ uniformly on $E$. If $f_n$ is uniformly continuous on $E$ for all $n$, then $f$ is also uniformly continuous on $E$.

_Proof_. Let $\varepsilon > 0$ be given. Then there exists $n$ such that
$$
|f_n(x) - f(x)| < \frac{\varepsilon}{3}
$$
for all $x \in E$. Since $f_n$ is uniformly continuous on $E$, there also exists $\delta > 0$ such that $|x-y| < \delta$ implies
$$
|f_n(x) - f_n(y)| < \frac{\varepsilon}{3}
$$
for any $x,y\in E$. Then for any $x,y \in E$
$$
\begin{aligned}
|f(x) - f(y)| &< |f_n(x) - f(x)| + |f_n(x) - f_n(y)| + |f_n(y) - f(y)|\\\\
& < \frac{\varepsilon}{3}+\frac{\varepsilon}{3}+\frac{\varepsilon}{3} = \varepsilon
\end{aligned}
$$
whenever $|x-y| < \delta$.

Thus, $f$ is uniformly continuous on $E$.

## Supplementary 6

Let $f$ be uniformly continuous on $\textbf{R}$. If $y_n \to 0$ as $n \to \infty$, and $f_n(x) = f(x + y_n)$, then $\{f_n\}$ converges uniformly on $\textbf{R}$.

_Proof_. Let $\varepsilon > 0$ be given. Since $f$ is uniformly continuous, we can choose $\delta> 0$ such that  $|f(x) - f(y)| < \varepsilon$ whenever $|x-y|<\delta$.

We can also choose $N$ such that for all $n,m > N$, $|y_n-y_m| < \delta$. Hence, for all $x \in \textbf{R}$ and all $n,m > N$, we have $|x + y_n - (x+y_m)| < \delta$, and
$$
|f_n(x) - f_m(x)| = |f(x+y_n) - f(x+y_m)| < \varepsilon
$$
Therefore, $\{f_n\}$ is uniformly Cauchy on $\textbf{R}$, and, consequently uniformly convergent on $\textbf{R}$.

## Supplementary 7

Let $f,g$ be continuous on a closed, bounded interval $[a,b]$, with $|g(x)| > 0$ for $x\in[a,b]$. Suppose further that $f_n \to f$, and $g_n \to g$ uniformly on $[a,b]$.

### (a)

The function $\frac{1}{g_n}$ is defined for large enough $n$, and $\frac{f_n}{g_n} \to \frac{f}{g}$ uniformly on $[a,b]$. 

_Proof_. Since $[a,b]$ is compact, it follows that the continuous function $|g|$ is bounded on $[a,b]$ and achieves its greatest lower bound $[a,b]$. The greatest lower bound of $|g|$ on $[a,b]$ cannot be $0$ because this would imply that $|g(x)| = 0$ for some $x \in [a,b]$, contrary to hypothesis. Therefore, there is some $h > 0$ such that $|g(x)| > h$ for all $x\in[a,b]$.

By uniform convergence of $\{g_n\}$, we can choose $N$ such that $n > N$ implies that
$$
|g_n(x)| > |g(x)| - \frac{h}{2} > \frac{h}{2} > 0
$$
for all $x \in [a,b]$. This means that $\frac{1}{g_n}$ is defined on $[a,b]$ whenever $n > N$, and $\frac{1}{|g_n(x)|} < \frac{2}{h}$ for all $n > N$ and all $x \in [a,b]$.

Let $\varepsilon > 0$ be given. Then we can choose $M \ge N$ such that for all $n > M$
$$
|f_n(x) - f(x)| < \varepsilon,\qquad |g_n(x) - g(x)| < \varepsilon
$$
for all $x \in [a,b]$. Then for all $n > M$ and all $x \in [a,b]$
$$
\begin{aligned}
\left|\frac{f_n(x)}{g_n(x)} - \frac{f(x)}{g(x)}\right| &\le \left|\frac{f_n(x)g(x) - f(x)g_n(x)}{g_n(x)g(x)}\right| \\
&\le \frac{2}{h^2}\Big(|f_n(x)g(x) -f(x)g(x)| + |f(x)g_n(x) - f(x)g(x)\Big)
\end{aligned}
$$
Since $f$ and $g$ are continuous and therefore bounded on $[a,b]$, there is some $L$ such that $|f(x)| \le L$ and $|g(x)| \le L$ for all $x\in[a,b]$. Then
$$
\left|\frac{f_n(x)}{g_n(x)} - \frac{f(x)}{g(x)}\right| \le \frac{2}{h^2}|\varepsilon L + \varepsilon L| =\frac{4L}{h^2}\varepsilon
$$
for all $n > N$ and all $x\in[a,b]$. Therefore, $\frac{f_n}{g_n} \to \frac{f}{g}$ uniformly on $[a,b]$.

### (b)

Let $f_n(x) = \frac{1}{n}$ and $g_n(x) = x$ on $(0,1)$. Then $f_n \to f = 0$ uniformly on $(0,1)$, and $g_n \to g$, where $g(x) = x$, uniformly on $(0,1)$. Addititonally, $|g(x)| > 0$ for all $x \in (0,1)$, and $f$ and $g$ are continuous on $(0,1)$.

We showed in 4 (d), however, that $\left\lbrace\frac{f_n}{g_n}\right\rbrace$ does not converge uniformly on $(0,1)$, so the result from part (a) does not necessarily hold when $[a,b]$ is replaced by $(a,b)$.

## Supplementary 8

Suppose that $b > a>0$. Then
$$
\lim_{n\to\infty}\int_a^b\left(1 +\frac{x}{n}\right)^ne^{-x}\;\text{d}x = b-a
$$

_Proof_. By definition, $e = \lim_{n\to\infty}g(n)$, where $g(n) = \left(1+\frac{1}{n}\right)^n$. Then for $x \in [a,b]$, we have $x>0$, so
$$
e = \lim_{n\to\infty}g(n) = \lim_{n\to\infty}g\left(\frac{n}{x}\right) = \lim_{n\to\infty}\left(1+\frac{x}{n}\right)^\frac{n}{x}
$$
Since the function $\phi(y) = y^x$ is continuous in a neighborhood of $1$, it follows that $\lim_{n\to\infty}\left(1+\frac{x}{n}\right)^n = e^x$. Thus, the sequence $\{f_n\}$ converges pointwise on $[a,b]$ to $e^x$, where $f_n(x) = \left(1+\frac{x}{n}\right)^n$. The convergence is also uniform.

Let $\varepsilon > 0$ be given. Using the Weierstrass M test with $M_k = \frac{b^k}{k!}$, we see that $e^x = \sum_{k=0}^\infty\frac{x^k}{k!}$ converges uniformly on $[a,b]$, so there exists $M$ such that
$$
\left|\sum_{k=M+1}^\infty \frac{x^k}{k!}\right| < \varepsilon
$$
for all $x \in [a,b]$. Then, for all $n > M$ and all $x \in [a,b]$,
$$
\begin{aligned}
\left|f_n(x) - e^x\right| &= \left|\sum_{k=0}^n\binom{n}{k}\frac{x^k}{n^k} - \sum_{k=0}^\infty \frac{x^k}{k!}\right|
\\\\
&\le \left|\sum_{k=0}^M\binom{n}{k}\frac{x^k}{n^k} - \frac{x^k}{k!}\right| + \left|\sum_{k=M+1}^n\binom{n}{k}\frac{x^k}{n^k}\right| + \left|\sum_{k=M+1}^\infty \frac{x^k}{k!}\right|\\\\
&\le A_n(x) + B_n(x) + \varepsilon
\end{aligned}
$$
where
$$
A_n(x) = \left|\sum_{k=0}^M\binom{n}{k}\frac{x^k}{n^k} - \frac{x^k}{k!}\right|, \qquad B_n(x) = \left|\sum_{k=M+1}^n\binom{n}{k}\frac{x^k}{n^k}\right|
$$
On the one hand, $0 \le \binom{n}{k}\frac{1}{n^k} = \frac{1}{k!}\frac{n(n-1)\cdots(n-k+1)}{nn\cdots n} \le \frac{1}{k!}$ for all $k = M+1,\dots, n$. This implies that for all $n > M$ and all $x \in [a,b]$,
$$
B_n(x) \le \left|\sum_{k=M+1}^n\binom{n}{k}\frac{x^k}{n^k}\right| \le \left|\sum_{k=M+1}^n\frac{x^k}{k!}\right| \le \left|\sum_{k=M+1}^\infty\frac{x^k}{k!}\right| \le \varepsilon
$$On the other hand, we have $1 \ge \frac{n(n-1)\cdots(n-k+1)}{n^k} \ge \frac{n(n-1)\cdots(n-M+1)}{n^M}$ for each $k =0,\dots,M$, and
$$
\lim_{n\to\infty}\overbrace{\frac{n(n-1)\cdots(n-M+1)}{n^M}}^{\text{degree $M$ polynomial in $n$}} = 1
$$
so there exists $N$ such that $n > N$ implies that
$$
1 - \varepsilon < \frac{n(n-1)\cdots(n-M+1)}{n^M} \le \frac{n(n-1)\cdots(n-k+1)}{n^k} = k!\binom{n}{k}\frac{1}{n^k} \le 1
$$
for each $k=0,1,\dots,M$. Therefore, for all $n > N$ and all $x \in [a,b]$,
$$
A_n(x) = \left|\sum_{k=0}^M\left[\binom{n}{k}\frac{1}{n^k} - \frac{1}{k!}\right]x^k\right| \le \sum_{k=0}^M\left|k!\binom{n}{k}\frac{1}{n^k}-1\right|\frac{x^k}{k!}\le\varepsilon\sum_{k=0}^M\frac{x^k}{k!} \le \varepsilon e^x \le \varepsilon e^b
$$
Combining the above two observations shows that for all $n > \max\{N,M\}$ and all $x\in[a,b]$
$$
|f_n(x) - e^x| \le \varepsilon e^b + \varepsilon + \varepsilon
$$
which shows that $\{f_n\}$ converges uniformly on $[a,b]$. 

Therefore, since $\{e^{-x}\}_{n=1}^\infty$ obviously converges uniformly on $[a,b]$, and the limits $e^x$ and $e^{-x}$ of $\{f_n\}$ and $\{e^{-x}\}_{n=1}^\infty$ are bounded on $[a,b]$, we can conclude by Supplementary 4 (c) that the integrand converges uniformly on $[a,b]$ to $e^xe^{-x} =1$.

Thus,
$$
\lim_{n\to\infty}\int_a^b\left(1+\frac{x}{n}\right)^ne^{-x}\;\text{d}x = \int_a^b1\;\text{d}x = b-a
$$

## Supplementary 9

### (a)

Let
$$
f_n(x) = \frac{nx^{99}+5}{x^3+nx^{66}}
$$
be defined on $[1,3]$. Then
$$
f_n(x) = \frac{x^{33}+\frac{5}{nx^{66}}}{\frac{1}{nx^{63}} + 1}
$$
From this it follows that $\{f_n\}$ converges pointwise to $x^{33}$ on $[1,3]$.

Furthemore, we have
$$
\sup_{x\in[1,3]}\left|\frac{5}{nx^{66}}\right|=\frac{5}{n}\to0,\qquad \sup_{x\in[1,3]}\left|\frac{1}{nx^{63}}\right|=\frac{1}{n}\to 0
$$
as $n \to \infty$. Therefore, $\left\lbrace\frac{5}{nx^{66}}\right\rbrace$ and $\left\lbrace\frac{1}{nx^{63}}\right\rbrace$ converge uniformly to $0$ on $[1,3]$. Then, since $\{x^{33}\}_{n=1}^\infty$ obviously converges uniformly on $[1,3]$, the numerator and denominator sequences in $\{f_n\}$ both converge uniformly on $[1,3]$. 

Since the denominator is clearly $>1$ for all $x\in[1,3]$ and all $n\ge1$, it follows that the limit of the denominator is $>0$ for all $x$, so by Supplementary 7 (a) $\{f_n\}$ converges uniformly on $[1,3]$.

Therefore,
$$
\lim_{n\to\infty}\int_1^3\frac{nx^{99}+5}{x^3 + nx^{66}}\;\text{d}x=\int_1^3\lim_{n\to\infty}\frac{nx^{99}+5}{x^3+nx^{66}}\;\text{d}x =\int_1^3x^{33}\;\text{d}x = \frac{3^{34} - 1}{34}
$$

### (b)

Let $f_n(x) = e^\frac{x^2}{n}$. Then for $x \in [0,2]$, it is clear that $f_n(x) \to e^0 = 1$. Furthermore, since $f_n(x)$ is increasing and $f_n(x) \ge 1$ for all $x \in [0,2]$, we have
$$
\sup_{x\in[0,2]} \left|f_n(x) - 1\right| = e^\frac{4}{n} - 1
$$
which converges to $0$ as $n\to\infty$. Therefore, $\{f_n\}$ converges uniformly on $[0,2]$, and
$$
\lim_{n\to\infty}\int_0^2e^\frac{x^2}{n}\;\text{d}x = \int_0^2\lim_{n\to\infty}e^\frac{x^2}{n}\;\text{d}x = \int_0^2 1\;\text{d}x = 2
$$

### (c)

Let $f_n(x) = \sqrt{\sin\left(\frac{x}{n}\right) + x + 1}$. Let $\varepsilon > 0$ be given. Since $\sqrt{}$ is continuous on $[0,3]$, it is also uniformly continuous, and we can choose $\delta > 0$ such that for all $x \in [0,3]$
$$
\left|\sqrt{x+1} - \sqrt{y+x+1}\right| < \varepsilon
$$
whenever $0 < y < \delta$. Then, since $\sin$ is continuous everywhere and increasing near $0$, there exists $N$ such that for all $n > N$ and all $x\in[0,3]$ we have
$$
0 \le \sin\left(\frac{x}{n}\right) \le \sin\left(\frac{3}{n}\right)< \delta
$$
Therefore, for all $n > N$ and all $x \in [0,3]$,
$$
\left|f_n(x)-\sqrt{x+1}\right| \le \varepsilon
$$
This implies that $\{f_n\}$ converges uniformly to $\sqrt{x+1}$ on $[0,3]$. Then
$$
\begin{aligned}
\lim_{n\to\infty}\int_0^3\sqrt{\sin\left(\frac{x}{n}\right) +x + 1}\;\text{d}x &= \int_0^3\lim_{n\to\infty}\sqrt{\left(\frac{x}{n}\right) + x + 1}\;\text{d}x \\
&= \int_0^3\sqrt{x+1}\;\text{d}x = \frac{2}{3}\left(4^\frac{3}{2} - 1\right) = \frac{14}{3}
\end{aligned}
$$

## Supplementary 10

Let $f_n$ be integrable on $[0,1]$, and let $f_n \to f$ uniformly on $[0,1]$. If $b_n \uparrow 1$ as $n \to\infty$, then
$$
\lim_{n\to\infty}\int_0^{b_n} f_n = \int_0^1 f
$$

_Proof_. Since each $f_n$ is integrable on $[0,1]$ and $f_n \to f$ uniformly on $[0,1]$, it follows that $f$ is integrable on $[0,1]$, and
$$
\lim_{n\to\infty}\int_0^1f_n = \int_0^1 f
$$
Then $f$ is bounded, so $\{f_n\}$ is uniformly bounded by, say, $M$. Then
$$
\int_0^1f_n = \int_0^{b_n}f_n + \int_{b_n}^1f_n
$$
so
$$
\left|\int_0^1 f_n - \int_0^{b_n} f_n\right| \le M(1-b_n)
$$
Given $\varepsilon >0$, since $b_n \uparrow 1$, we can choose $N$ such that $n > N$ implies that $M(1-b_n) < \varepsilon$. On the other hand, we can possibly increase $N$ so that $n > N$ also implies that
$$
\left|\int_0^1f -\int_0^1f_n\right| < \varepsilon
$$
Then for all $n > N$
$$
\left|\int_0^1f - \int_0^{b_n}f_n\right| \le \left|\int_0^1 f - \int_0^1f_n\right| + \left|\int_0^1f_n - \int_0^{b_n}f_n\right| < 2\varepsilon
$$
Therefore,
$$
\lim_{n\to\infty}\int_0^{b_n} f_n = \int_0^1 f
$$

## Supplementary 11

Let $\{f_n\} \subset C[a,b]$. Suppose that $f_n$ is differentiable on $(a,b)$ for all $n$, and there eixsts $M$ such that
$$
|f_n'(x)| \le M
$$
for all $x \in (a,b)$ and all $n$.

### (a)

The sequence $\{f_n\}$ is equicontinuous on $[a,b]$.

_Proof_. Let $\varepsilon > 0$ be given. Let $x, y \in [a,b]$ such that $\delta = \frac{\varepsilon}{M}$. If $x = y$, then clearly $|f_n(x) - f_n(y)| < \varepsilon$ for all $n$. 

Otherwise, for any given $n$, we can use the Mean Value Theorem to find some $c_n \in (x,y)$ such that
$$
|f_n(x) - f_n(y)| = f_n'(c_n)|x-y| \le M|x-y| \le \varepsilon
$$
Hence, $\{f_n\}$ is equicontinuous on $[a,b]$.

### (b)

Suppose further than $\{f_n(a)\}$ is bounded. Then $\{f_n\}$ is uniformly bounded on $[a,b]$.

_Proof_. Let $K$ be a bound for $\{f_n(a)\}$. Then for any $n$ and $x \in (a,b]$, we can use the Mean Value Theorem to choose some $c_n \in (a,x)$ such that
$$
f_n(x) = f_n(a) + f_n'(c_n)(x-a)
$$
Then for all $x\in(a,b]$ and all $n$
$$
\left|f_n(x)\right| \le |f_n(a)| + |f_n'(c)|(x-a) \le K + M(b-a)
$$
which is also true for $x = a$ and any $n$. Thus, $\{f_n\}$ is uniformly bounded on $[a,b]$.

### (c)

Let $f_n(x) = n$ on for $x\in[0,1]$. Then each $f_n$ is continuous on $[0,1]$ and differentiable on $(a,b)$, with $f_n'(x) = 0$ for all $n$ and all $x \in [0,1]$. The sequence $\{f_n(x)\} = \{n\}$, is obviously not pointwise bounded for any $x \in [0,1]$, however.

## Supplementary 12

### (a)

Let $f$ be Hölder continuous of exponent $\alpha$ on $[a,b]$ for some $\alpha > 0$. Then $f$ is uniformly continuous on $[a,b]$.

_Proof_. Since $f$ is Hölder continuous with exponent $\alpha$, there exists some $L$ such that $N_\alpha(f) \le L$. Then for all $x,x'\in [a,b]$,
$$
\frac{|f(x) -f(x')|}{|x-x'|^\alpha} \le L
$$
or $|f(x) - f(x')| \le L|x-x'|^\alpha$. 

Now let $\varepsilon > 0$ be given. Since the function $g(x) = |x|^\alpha$ is continuous everywhere for any $\alpha > 0$, there exists $\delta > 0$ such that $|x-x'| < \delta$ implies that $|x-x'|^\alpha < \frac{\varepsilon}{L}$. Thus, $|f(x) - f(x')| < \varepsilon$. This shows that $f$ is uniformly continuous on $[a,b]$.

### (b)

Let $\{f_n\}\subset C[a,b]$, and suppose there is some $M$ such that
$$
N_\alpha(f_n) \le M \quad \text{for all $n$}
$$
Then $\{f_n\}$ is equicontinuous on $[a,b]$.

_Proof_. Let $\varepsilon >0$ be given. As above, we can choose $\delta > 0$ such that for all $x,x' \in [a,b]$, $|x-x'|^\alpha < \varepsilon$ whenever $|x-x'|<\delta$. Furthermore, $N_\alpha(f_n) \le M$ for all $n$, which implies that for all $n$ and all $x,x' \in [a,b]$
$$
\frac{|f_n(x) - f_n(x')|}{|x-x'|^\alpha} \le M
$$
Thus, for any $x,x'\in[a,b]$, whenever $|x-x'| < \delta$, we have
$$
|f_n(x)-f_n(x')| < M|x-x'|^\alpha < M\varepsilon
$$
for all $n$. This implies that $\{f_n\}$ is equicontinuous.

## Supplementary 13

Let $\{f_n\}$ be a sequence in $C[0,1]$ that is pointwise bounded at all rational numbers in $[0,1]$. Then there exists a subsequence $\{f_{n_k}\}$ of $\{f_n\}$ such that $\{f_{n_k}\}$ is convergent for all rational numbers in $[0,1]$.

_Proof_. The rational numbers are countable, so the rational numbers in $[0,1]$, a subset of the rational numbers, are also countable. Label the rational numbers in $[0,1]$ by $q_1, q_2, \dots$ 

By our assumption combined with the Bolzano-Weierstrass Theorem, there exists a subsequence $\{f_{n_{1,k}}\}$ of $\{f_n\}$ such that $\{f_{n_{1,k}}(q_1)\}$ is convergent. Likewise, there exists a subsequence $\{f_{n_{2,k}}\}$ of $\{f_{n_{1,k}}\}$ such that $\{f_{n_{2,k}}(q_2)\}$ is convergent. Proceeding inductively, we can find sequences $\{f_{n_{j,k}}\}_{k=1}^\infty$ for $j=1,2,\dots$, such that

1. $\{f_{n_{\ell,k}}\}$ is a subsequence of $\{f_{n_{j,k}}\}$ for all $j \le \ell$
2. $\{f_{n_{j,k}}(q_j)\}$ converges for all $j$

Set $g_k = f_{n_{k,k}}$. Then $\{g_k\}$ is a subsequence of $\{f_n\}$, and, starting from index $j$, $\{g_k\}$ is a subsequence of $\{f_{n_{j,k}}\}$ for all $j$ (by 1. applied inductively). This implies that $\{g_k(q_j)\}$ is convergent for all $j$ (by 2.).

## Supplementary 14

### (a)

Let $f_n(x) = x^n$. Then $\{f_n\}$ is pointwise convergence on $[0,1]$ but not uniformly convergent.

_Proof_. Clearly, $\lim_{n\to\infty}f_n(x) = 0$ if $x \in [0,1)$, and $\lim_{n\to\infty}f_n(x) = 1$ if $x = 1$. Thus, $\{f_n\}$ converges pointwise on $[0,1]$. Let $f$ be the pointwise limit.

Choose $\varepsilon = \frac{1}{4}$, and let $n > 0$ be any given integer. Then set $x = \frac{1}{2^\frac{1}{n}}$. Note that $2 > 1$ implies that $2^\frac{1}{n} > 1$, which means that $0 \le x < 1$. Therefore, $|f_n(x) - f(x)| = \frac{1}{2} > \varepsilon$. 

Thus, for $\varepsilon = \frac{1}{4}$ and any $n > 0$, there exists $x \in [0,1]$ such that $|f_n(x) - f(x)| > \varepsilon$. This means that $\{f_n\}$ does not converge uniformly on $[0,1]$.

### (b)

Let $f_n(x) = \frac{n^2x}{1+(nx-1)^4}$ for $x \in [0,1]$. Then $\{f_n\}$ converges pointwise on $[0,1]$, but $\{f_n\}$ is not uniformly bounded on $[0,1]$.

_Proof_. $f_n(0) = 0$ for all $n$, so $f_n(0) \to 0$ as $n\to\infty$. If $0 < x \le 1$, then $f_n(x) \to 0$ as $n \to \infty$ because it is a rational function in $n$ with the degree of the numerator (2) less than the degree of the denominator (4). Thus, $f_n \to 0$ pointwise on $[0,1]$.

Let $C > 0$ be given. Then choose $n > C$ and $x = \frac{1}{n} \in [0,1]$. Then $|f_n(x) - 0| =n > C$. This implies that $\{f_n\}$ is not uniformly bounded on $[0,1]$.

### (c)

Let $f_n(x) = n$ for $x \in [0,1]$. Then $\{f_n\}$ is equicontinuous on $[0,1]$ but not pointwise convergent on $[0,1]$.

_Proof_. It is clear that $f_n(x)$ does not converge for any $x \in [0,1]$. Let $\varepsilon > 0$ be given. Then for $\delta = 1$ and any $x,y\in [0,1]$ such that $|x-y| < \delta$ we have
$$
|f_n(x) - f_n(y)| = 0 < \varepsilon
$$
for all $n$. Thus, $\{f_n\}$ is equicontinuous on $[0,1]$.

### (d)

Let $f_n(x) = (-1)^n$ for $x \in [0,1]$. Then $\{f_n\}$ is uniformly bounded and equicontinuous on $[0,1]$ but not uniformly convergent on $[0,1]$.

_Proof_. For any $n$ and any $x \in [0,1]$, we have $|f_n(x)| = 1 \le 1$, so $1$ is a uniform bound for $\{f_n\}$. For any $x \in [0,1]$, $f_n(x)=(-1)^n$, so $\{f_n(x)\}$ does not converge. Therefore, $\{f_n\}$ is not pointwise convergent at any point in $[0,1]$, and consequently not uniformly convergent on $[0,1]$.

### (e)

Let $f_n(x) = x^n$ for $x \in [0,1]$. Then $\{f_n\}$ is uniformly bounded on $[0,1]$ but does not contain any subsequence that converges uniformly on $[0,1]$.

_Proof_. It is clear that $|f_n(x)| = x^n \le 1$ for all $n \ge 1$ and all $x \in [0,1]$. This shows that $\{f_n\}$ is uniformly bounded on $[0,1]$.

Let $\{f_{n_k}\}$ be a subsequence of $\{f_n\}$. Since $\{f_n\}$ converges pointwise to $0$ on $[0,1)$, it follows that $\{f_{n_k}\}$ converges pointwise to $0$ on $[0,1)$. Choose $\varepsilon = \frac{1}{4}$, and let $n_k$ be given. Set $x = \frac{1}{2^{\frac{1}{n_k}}}$, which belongs to $[0,1)$ by the reasoning in (a). Then $|f_{n_k}(x)-  0| = \frac{1}{2} > \varepsilon$.

Thus, for $\varepsilon = \frac{1}{4}$ and any given $k$, we can find $x \in [0,1]$ such that $|f_{n_k}(x) - 0| > \varepsilon$. This implies that $\{f_{n_k}\}$ does not converge uniformly on $[0,1]$.

## Supplementary 15

Let $\mathcal{A} \subset C[a,b]$.

### (a)

Let $f \in C[a,b]$. Then $f \in \overline{\mathcal{A}}$ if and only if for all $\varepsilon > 0$, there exists $g \in \mathcal{A}$ such that $\sup_{x\in[a,b]}|f(x) - g(x)| \le \varepsilon$.

_Proof_. Note that a sequence $\{f_n\}$ converges to $f$ uniformly on $[a,b]$ if and only if
$$
\sup_{x\in[a,b]}|f_n(x) - f(x)| \to 0
$$
as $n \to\infty$.

Suppose that $f \in \overline{\mathcal{A}}$. Then there is a sequence $\{f_n\}$ in $\mathcal{A}$ such that $f_n \to f$ uniformly on $[a,b]$. By the above, given $\varepsilon >0$, we can choose some $n$ so that $\underset{x\in[a,b]}{\sup}|f_n(x) - f(x)| < \varepsilon$, and $f_n \in \mathcal{A}$.

On the other hand, if for all $\varepsilon > 0$ there exists $g \in \mathcal{A}$ such that $\underset{x\in[a,b]}{\sup}|g(x) - f(x)| < \varepsilon$, then for $\varepsilon = \frac{1}{n}$, we can find $f_n \in \mathcal{A}$ such that $\underset{x\in[a,b]}{\sup}|f_n(x) - f(x)| < \varepsilon$. Then by the above, $f_n \to f$ uniformly on $[a,b]$. This shows that $f \in \overline{\mathcal{A}}$.

### (b)

The uniform closure of $\mathcal{A}$ is uniformly closed.

_Proof_. Let $\{f_n\}$ be a sequence in $\overline{\mathcal{A}}$ that converges uniformly to $f$. We can choose $\{g_n\}$ in $\mathcal{A}$ such that $|f_n(x) - g_n(x)| < \frac{1}{n}$ for all $x \in [a,b]$ and all $n$. Given $\varepsilon > 0$, we can choose $N$ large enough so that for all $n > N$, $|f(x) - f_n(x)| < \varepsilon$ for all $x \in [a,b]$, and $\frac{1}{n} < \varepsilon$. Then
$$
|g_n(x) - f(x)| \le |f_n(x) - g_n(x)| + |f(x) - f_n(x)| < 2\varepsilon
$$
for all $x \in [a,b]$. This shows that $g_n \to f$ uniformly on $[a,b]$. Since $\{g_n\}$ is in $\mathcal{A}$, it follows that $f \in \overline{\mathcal{A}}$.

### (c)

$\mathcal{A}$ is uniformly closed if and only if $\mathcal{A} = \overline{\mathcal{A}}$

_Proof_. Part (b) shows that $\mathcal{A}$ is uniformly closed if $\mathcal{A} = \overline{\mathcal{A}}$. 

On the other hand, if $\mathcal{A}$ is uniformly closed, then any element of $\overline{\mathcal{A}}$ is the limit of a uniformly convergent sequence in $\mathcal{A}$, which must belong to $\mathcal{A}$ by the uniform closedness of $\mathcal{A}$. Thus, $\overline{\mathcal{A}} \subset \mathcal{A}$. On the other hand, $\mathcal{A} \subset \overline{\mathcal{A}}$ because any element of $\mathcal{A}$ is the uniform limit of a trivial sequence in $\mathcal{A}$. This shows that $\mathcal{A} = \overline{\mathcal{A}}$.

### (d)

Let $\mathcal{A}$ be an algebra. Then $\overline{\mathcal{A}}$ is also an algebra.

_Proof_. Let $f, g\in \overline{\mathcal{A}}$, and let $c \in \textbf{R}$. By definition, there exist sequences $\{f_n\}$ and $\{g_n\}$ converging uniformly to $f$ and $g$ on $[a,b]$. 

$\{f_n + g_n\}$ is a sequence of $\mathcal{A}$ that converges uniformly to $f + g$ on $[a,b]$ by Supplementary 4 (a). This shows that $f+g \in \overline{\mathcal{A}}$.

$\{f_ng_n\}$ is a sequence that converges pointwise to $fg$ on $[a,b]$ by Supplementary 4 (b). The functions $f$ and $g$ are continuous on $[a,b]$ because they are the uniform limits of sequences of continuous functions on $[a,b]$. Thus, $f$ and $g$ are bounded on $[a,b]$, so $f_ng_n \to fg$ uniformly on $[a,b]$ by Supplementary (c). This shows that $fg \in \overline{\mathcal{A}}$.

$\{cf_n\}$ is a sequence over $\mathcal{A}$ that converges uniformly to $cf$ on $[a,b]$. This shows that $cf \in \overline{\mathcal{A}}$.

Thus, $\overline{\mathcal{A}}$ is an algebra.

## Supplementary 16

Let $P$ be the set of all real polynomials. Define
$$
\mathcal{E}[a,b] = \{f : [a,b] \to \textbf{R} \mid \exists p\in P \text{ such that } f(x) = p(e^x), \;\text{all}\;x\in[a,b]\}
$$

### (a)

$\mathcal{E}[a,b] \subset C[a,b]$, and $\mathcal{E}[a,b]$ is an algebra.

_Proof_. If $f \in \mathcal{E}[a,b]$, then $f$ is a composition of a polynomial with an exponential function; both are continuous on $[a,b]$, so $f$ is also continuous on $[a,b]$. This shows that $\mathcal{E}[a,b]\subset C[a,b]$.

Let $f,g \in \mathcal{E}[a,b]$, and let $c \in \textbf{R}$. Suppose that $f = p\circ \exp$, and $g = q \circ \exp$. Then 
$$(f+g)(x) = p(e^x) + q(e^x) = (p+q)(e^x) = (p+q)\circ \exp(x)
$$The function $p+q$ is a polynomial, so $f+g \in \mathcal{E}[a,b]$. Likewise,
$$
(fg)(x) = p(e^x)q(e^x) = (pq)(e^x) = (pq)\circ\exp(x)
$$
The function $pq$ is a polynomial, so $fg \in \mathcal{E}[a,b]$. Finally,
$$
(cf)(x) = cp(e^x) = (cp)(e^x) = (cp)\circ \exp(x)
$$
The function $cp$ is a polynomial, so $cf \in \mathcal{E}[a,b]$. This shows that $\mathcal{E}[a,b]$ is an algebra.

### (b)

$\overline{\mathcal{E}[a,b]} = C[a,b]$

_Proof_. Since $1 \in \mathcal{E}[a,b]$, it follows that $\mathcal{E}[a,b]$ vanishes at no point of $[a,b]$. Furthermore, since $\exp \in \mathcal{E}[a,b]$, and $\exp$ is one-to-one, it follows that $\mathcal{E}[a,b]$ separates points on $[a,b]$.

By part (a), $\mathcal{E}[a,b]$ is an algebra, so $\overline{\mathcal{E}[a,b]} = C[a,b]$ by the Stone-Weierstrass Theorem.

## Supplementary 17

For $P$ from Supplementary 16, let $P_0 = \{p \in P : p(0) = 0\}$. Let $P_0[a,b]$ be the set of all functions on $[a,b]$ that coincide with a function from $P_0$ on $[a,b]$.

### (a)

$f \in P_0[a,b]$ if and only if there are $c_1, \dots, c_n$ in $\textbf{R}$ such that $f(x) = \sum_{k=1}^n c_kx^k$ for all $x \in [a,b]$.

_Proof_. If there exists such a set of numbers $c_1,\dots,c_n$, then obviously $f$ coincides with a polynomial on $[a,b]$ that vanishes at $0$.

Conversely, if $f \in P_0[a,b]$, then there exists $c_0,c_1,\dots,c_n \in\textbf{R}$ such that $f(x) = \sum_{k=0}^n c_kx^k$ for all $x\in [a,b]$, and $p(x) = \sum_{k=0}^n c_kx^k$ vanishes at $0$. Then $c_0 = 0$, and the claim follows.

### (b)

$P_0[a,b]\subset C[a,b]$, and $P_0[a,b]$ is an algebra.

_Proof_. Polynomials are everywhere continuous; since elements of $P_0[a,b]$ are restrictions of polynomials to $[a,b]$, it follows that they are continuous on $[a,b]$. Thus, $P_0[a,b]\subset C[a,b]$.

Let $f,g \in P_0[a,b]$, and let $c\in\textbf{R}$. Suppose that $f = p$ and $g = q$ on $[a,b]$, where $p,q \in P_0$. Then
$$
(f+g)(x) = f(x) + g(x) = p(x) + q(x) = (p+q)(x)
$$
for all $x \in [a,b]$. The function $p+q$ is a polynomial, and $(p+q)(0) = p(0) + q(0) = 0$, so
$p+q \in P_0$. This implies that $f+g \in P_0[a,b]$. Furthermore,
$$
(fg)(x) = f(x)g(x) = p(x)q(x) = (pq)(x)
$$
for all $x \in [a,b]$. The function $pq$ is a polynomial, and $(pq)(0) = p(0)q(0) = 0$, so $pq \in P_0$. This implies that $fg \in P_0[a,b]$. Finally,
$$
(cf)(x) = cf(x) = cp(x) = (cp)(x)
$$
for all $x \in [a,b]$. The function $cp$ is a polynomial, and $(cp)(0) = cp(0) = 0$, so $cp \in P_0$. This implies that $cf \in P_0[a,b]$.

Thus, $P_0[a,b]$ is an algebra.

### (c)

If $0 < a < b$, then $\overline{P_0[a,ba]} = C[a,b]$.

_Proof_. Set $p(x) = x$. Then $p \in P_0$. Let $f$ be the restriction of $p$ to $[a,b]$. Then $f \in P_0[a,b]$, and $f$ is one-to-one on $[a,b]$, so $P_0[a,b]$ separates points on $[a,b]$. Furthermore, $f(x) = x \in [a,b]$ when $x \in [a,b]$, so $f(x) \ne 0$. Thus, $P_0[a,b]$ vanishes at no point of $[a,b]$.

Since $P_0[a,b]$ is an algebra by part (b), it follows that $\overline{P_0[a,b]} = C[a,b]$ by the Stone-Weierstrass Theorem.

### (d)

If $a < 0 < b$, then $\overline{P_0[a,b]} \ne C[a,b]$.

_Proof_. Let $\{f_n\}$ be a uniformly convergent sequence in $P_0[a,b]$. Then $f_n(0) = 0$ for all $n$, so $\{f_n\}$ does not converge to $1 \in C[a,b]$. Therefore, $\overline{P_0[a,b]} \ne C[a,b]$.

The assumption of vanishing at no points of $[a,b]$ is violated by $P_0[a,b]$ when $0 \in [a,b]$ because for any $f \in P_0[a,b]$, we must have $f(0) = 0$, meaning that $P_0[a,b]$ vanishes at $0\in[a,b]$.

## Supplementary 18

Define
$$
\begin{aligned}
\mathcal{T}[a,b] = \Big\lbrace&f:[a,b]\to\textbf{R}\mid \exists a_0,a_1,\dots a_n,b_1,\dots,b_n \text{ such that }\\
& f(x) = a_0 + \sum_{k=1}^n a_k\cos(kx) + b_k\sin(kx), \;\text{all}\;x\in[a,b]
\Big\rbrace
\end{aligned}
$$

### (a)

$\mathcal{T}[a,b] \subset C[a,b]$, and $\mathcal{T}[a,b]$ is an algebra.

_Proof_. Every element of $\mathcal{T}[a,b]$ is a linear combination of $\sin$ and $\cos$ functions, which are all continuous everywhere. Hence, every element of $\mathcal{T}[a,b]$ is continuous on $[a,b]$, that is,
$\mathcal{T}[a,b] \subset C[a,b]$.

Let $f,g \in \mathcal{T}[a,b]$, and let $c \in \textbf{R}$. Then there exist $a_0,a_1,\dots a_n,b_1,\dots b_n$ and $c_0,c_1,\dots c_m, d_1,\dots,d_m$ such that
$$
f(x) = a_0 + \sum_{k=1}^n a_k \cos(kx) + b_k \sin(kx),\qquad g(x) = c_0 + \sum_{k=1}^m c_k \cos(kx) + d_k \sin{kx}
$$
for all $x \in [a,b]$. Assume without loss of generality that $n \le m$, and let $a_k = b_k = 0$ for $k > n$. Then
$$
(f+g)(x) = (a_0 + c_0) + \sum_{k=1}^m(a_k + c_k)\cos(kx) + (b_k + d_k)\sin(kx)
$$
for all $x \in [a,b]$. This shows that $f+g \in \mathcal{T}[a,b]$.

Furthermore,
$$
\begin{alignedat}{3}
(fg)(x) &=& &\Bigg(a_0 + \sum_{k=1}^m && a_k \cos(kx) + b_k\sin(kx)\Bigg)\cdot\Bigg(c_0 + \sum_{k=1}^m c_k\cos(kx) + d_k\sin(kx)\Bigg)\\\\
&={}& &a_0c_0 + \sum_{k=1}^m\big[&&(a_0c_k + c_0a_k)\cos(kx) + (b_0d_k+ d_0b_k)\sin(kx)\big]\\
&& &{}+\sum_{k=1}^m\sum_{k'=1}^m \Big[&&
a_kc_{k'}\cos(kx)\cos(k'x) + a_kd_{k'}\cos(kx)\sin(k'x)\\
&& && &{}+b_kc_{k'}\sin(kx)\cos(k'x) + b_kd_{k'}\sin(kx)\sin(k'x)
\Big]
\\\\
&=& &a_0c_0 + \sum_{k=1}^m\big[&&(a_0c_k + c_0a_k)\cos(kx) + (b_0d_k+ d_0b_k)\sin(kx)\big]\\
&& &{}+\sum_{k=1}^m\sum_{k'=1}^m \Big[&&
\frac{a_kc_{k'}}{2}\big[\cos((k+k')x)+\cos((k-k')x)\big] \\ 
&& && &{}+\frac{a_kd_{k'}}{2}\big[\sin((k+k')x) - \sin((k-k')x)\big]\\
&& && &{}+\frac{b_kc_{k'}}{2}\big[\sin((k+k')x) + \sin((k-k')x)\big] \\
&& && &{}+ \frac{b_kd_{k'}}{2}\big[\cos((k-k')x)-\cos((k+k')x)\big]
\Big]\\\\
&=& &e_0 + \sum_{k=1}^{2m}\Big[&&e_k\cos(kx) + f_k\sin(kx)\big]
\end{alignedat}
$$
where
$$
\begin{aligned}
e_0 &= a_0c_0 + \sum_{\ell=1}^m\left[\frac{a_\ell c_\ell}{2} + \frac{b_\ell d_\ell}{2}\right]
\\ e_k &= \sum_{\substack{1\le \ell,\ell'\le m\\\ell + \ell' = k}} \left[\frac{a_\ell c_{\ell'}}{2} - \frac{b_\ell d_{\ell'}}{2}\right] + \sum_{\substack{1 \le \ell,\ell'\le m \\ |\ell - \ell'|=k}}\left[\frac{a_\ell c_{\ell'}}{2} + \frac{b_\ell d_{\ell'}}{2}\right], \qquad k=1,\dots,2m \\
f_k &= \sum_{\substack{1\le \ell,\ell'\le m \\ \ell + \ell' = k}}\left[\frac{a_\ell d_{\ell'}}{2} + \frac{b_\ell c_{\ell'}}{2}\right] + \sum_{\substack{1\le \ell,\ell' \le m \\ |\ell - \ell'| = k}}\text{sgn}(\ell - \ell')\left[\frac{b_\ell c_{\ell'}}{2} - \frac{a_\ell d_{\ell'}}{2}\right], \qquad k=1,\dots,2m
\end{aligned}
$$
where $\text{sgn}$ is the signum function. This shows that $fg \in \mathcal{T}[a,b]$. Finally,
$$
(cf)(x) = ca_0 + \sum_{k=1}^n (ca_k)\cos(kx) + (cb_k)\sin(kx)
$$
This shows that $cf \in \mathcal{T}[a,b]$. Therefore, $\mathcal{T}[a,b]$ is an algebra.

### (b)

$\overline{\mathcal{T}[0,\pi]} = C[0,\pi]$.

_Proof_. Since $1 \in \mathcal{T}[0,\pi]$, it follows that $\mathcal{T}[0,\pi]$ vanishes at no point of $[0,\pi]$. Furthermore, since $\cos \in \mathcal{T}[0,\pi]$ is one-to-one on $[0,\pi]$, it follows that $\mathcal{T}[0,\pi]$ separates points on $[0,\pi]$. (Note that for $x_1, x_2 \in [0,\pi]$,
$$
\cos(x_1) - \cos(x_2) = 2\sin\left(\frac{x_1+x_2}{2}\right)\sin\left(\frac{x_2-x_1}{2}\right)
$$
If $\cos(x_1) = \cos(x_2)$, then $\cos(x_1) - \cos(x_2) = 0$, which by the above implies

- $\frac{x_1+x_2}{2} = 0$, implying that $x_1 = 0 = x_2$, or
- $\frac{x_1+x_2}{2} = \pi$, implying that $x_1 = \pi = x_2$, or
- $\frac{x_2-x_1}{2} = 0$, implying that $x_1 = x_2$.

Hence, $\cos$ is one-to-one on $[0,\pi]$.)

Therefore, since $\mathcal{T}[0,\pi]$ is an algebra by part (a), the Stone-Weierstrass Theorem implies that $\overline{\mathcal{T}[0,\pi]} = C[0,\pi]$.

### (c)

$\overline{\mathcal{T}[0,2\pi]} \ne C[0,2\pi]$.

_Proof_. Let $f(x) = x$ for $x \in [0,2\pi]$. Then $f\in C[0,2\pi]$, and $f(0) \ne f(2\pi)$. 

Let $\{f_n\}$ be a uniformly convergent sequence in $\mathcal{T}[a,b]$. Then each $f_n$ is periodic with period $2\pi$ because each $f_n$ is a linear combination of functions that are periodic with period $2\pi$ ($\cos(kx)$, $\sin(kx)$, and constant functions, where $k$ is an integer). This implies, in particular, that $f_n(0) = f_n(2\pi)$. If $f_n \to f$ uniformly on $[0,2\pi]$, then we would have $f(0) = f(2\pi)$, which is not true. Therefore $\{f_n\}$ does not converge to $f$.

This implies that $f \notin \overline{\mathcal{T}[0,2\pi]}$, which in turn implies that $\overline{\mathcal{T}[0,2\pi]} \ne C[0,2\pi]$.

As with $f_n$ above, every function in $\mathcal{T}[0,2\pi]$ is $2\pi$-periodic. Thus, given $f \in \mathcal{T}[0,2\pi]$, we must have $f(0) = f(2\pi)$, so $\mathcal{T}[0,2\pi]$ fails to separate points on $[0,2\pi]$, one of the assumptions of the Stone-Weierstrass Theorem.
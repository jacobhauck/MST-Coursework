# Homework 4

## Royden-Fitzpatrick 1

Suppose that $f$ and $g$ are continuous functions on $[a,b]$, and $f = g$ a.e. on $[a,b]$. Then $f=g$.

_Proof_. Let $x \in [a,b]$, and $\varepsilon > 0$, and define $I_\varepsilon = (x - \varepsilon, x + \varepsilon)$. Then $m(I_\varepsilon \cap [a,b]) > 0$ for all $\varepsilon > 0$. Thus, if it were the case that $f(y) \ne g(y)$ for all $y \in I_\varepsilon\cap[a,b]$, then we would not have $f = g$ a.e. on $[a,b]$.

Therefore, for all $n$, there exists a point $x_n \in I_\frac{1}{n}$ such that $f(x_n) = g(x_n)$. Clearly, we have $x_n \to x$ as $n \to \infty$, and by the continuity of $f$ and $g$ we also have $f(x_n) \to f(x)$, and $g(x_n) \to g(x)$; but $\{f(x_n)\}$ and $\{g(x_n)\}$ are the same sequences, and must have the same limits. This implies that $f(x) = g(x)$.

Since $x$ was arbitrary, it follows that $f = g$.

_Note_: this is not true when the domain is an arbitrary measurable set. For example, take $f(x) = 1$ and $g(x) = 0$ for $x \in \textbf{Z}$, which is countable and therefore measurable. Clearly, $f$ and $g$ are continuous (all functions are continuous in the relative topology of $\textbf{Z}$, anyway) and $f = g$ a.e. on $\textbf{Z}$ because $f(x) = g(x)$ for all $x \in \varnothing = \textbf{Z} \setminus E$, where $E = \textbf{Z}$ is a set of zero measure. $f$ and $g$ are, however, obviously not equal.

## Royden-Fitzpatrick 2

Let $f(x) = 0$ for $x \in [0,1)$ and let $f(x) = 1$ for $x \in [1,2]$. Then the restriction of $f$ to $[0,1)$ is continuous, and the restriction of $f$ to $[1,2]$ is continuous, but $f$ is not continuous on $[0,1) \cup [1,2] = [0,2]$, even though both $[0,1)$ and $[1,2]$ are measurable sets.

## Royden-Fitzpatrick 4

Assume that there is a set $E \subset [0,1]$ that is not measurable. Define
$$
f(x) = \begin{cases}
x - 1 & x < 0 \\
-e^{-x} & x \ge 0\;\text{and}\; x\notin E \\
x & x \in E
\end{cases}
$$
Then $f^{-1}((0,\infty)) = E$, so $f$ is not measaurable. On the other hand, $f$ is one-to-one, so $f^{-1}(c)$ is a singleton set and therefore measurable for any $c \in \textbf{R}$. 

Indeed, $f(x) = x- 1 < -1$ for $x <0$, $f(x) = -e^{-x} \in [-1, 0)$ for $x \ge 0$ and $x \notin E$, and $f(x) = x \ge 0$ for $x \in  E$. Suppose that $f(x) = f(y)$. If $f(x) < -1$, then $x -1 = y-1$, so $x =y$. If $f(x) \in [-1,0)$, then $-e^{-x} = -e^{-y}$, so $x = y$. Lastly, if $f(x) \ge 0$, then $x = y$. In any case, we get $x = y$, so $f$ is one-to-one.

## Royden-Fitzpatrick 5

Let $f$ be a function such that $f^{-1}((c, \infty])$ is measurable for every rational number $c$. Then $f$ is measurable.

_Proof_. Let $a \in \textbf{R}$, and let $\{c_n\}$ be a sequence of rational numbers converging to $a$ such that $c_n > a$ for all $n$. Then
$$
f^{-1}((a,\infty]) = \bigcup_{n=1}^\infty f^{-1}((c_n, \infty])
$$
Indeed, if $x \in f^{-1}((a,\infty])$, then $f(x) > a$, which means that $f(x) > c_n$ for some $n$, so $x \in f^{-1}((c_n,\infty])$. Conversely, if $x \in f^{-1}((c_n, \infty])$ for some $n$, then $f(x) > c_n > a$, so $x \in f^{-1}((a,\infty])$.

Since each $f^{-1}((c_n,\infty])$ is measurable, it follows that $f^{-1}((a,\infty])$ is measurable. Therefore, $f$ is also measurable.

## Royden-Fitzpatrick 6

Let $f$ be a function defined on a measurable domain $D$. Then $f$ is measurable if and only if the function $g$ defined by $g(x) = f(x)$ for $x \in D$ and $g(x) = 0$ for $x \notin D$ is measurable.

_Proof_. Suppose that $f$ is measurable. If $a > 0$, then $g^{-1}((a,\infty]) = f^{-1}((a,\infty])$ is measurable. If $a \le 0$, then $g^{-1}((a, \infty]) = f^{-1}((a,\infty]) \cup D^C$ is measurable since $f^{-1}((a,\infty])$ and $D^C$ are both measurable, it follows that $g$ is measurable.

Conversely, suppose that $g$ is measurable. If $a > 0$, then $f^{-1}((a,\infty]) = g^{-1}((a,\infty])$ is measurable. If $a \le 0$, then $f^{-1}((a,\infty]) = g^{-1}((a,\infty]) \cap D$ is measurable since both $g^{-1}((a,\infty])$ and $D$ are measurable.

## Royden-Fitzpatrick 7

A function $f$ defined on a measurable set $E$ is measurable if and only if $f^{-1}(A)$ is measurable for all Borel sets $A$.

_Proof_. Suppose that $f$ is measurable. Let $\mathcal{M}$ be the set of subsets of $\textbf{R}$ whose preimages under $f$ are measurable. Then 

- $\varnothing \in \mathcal{M}$ because $f^{-1}(\varnothing) = \varnothing$ is measurable;
- if $A \in \mathcal{M}$, then $f^{-1}\big(A^C\big) = E \setminus f^{-1}(A)$ is measurable;
- and if $\{A_n\}$ is a seqence of sets in $\mathcal{M}$, then $f^{-1}\left(\bigcup\limits_{n=1}^\infty A_n\right) = \bigcup\limits_{n=1}^\infty f^{-1}(A_n)$, so $\bigcup\limits_{n=1}^\infty A_n \in \mathcal{M}$.

Therefore, $\mathcal{M}$ is a $\sigma$-algebra. Furthermore, $\mathcal{M}$ contains all open sets because the preimage of an open set under a measurable function is measurable. Therefore, the Borel sets all belong to $\mathcal{M}$ because the Borel sets are the smallest $\sigma$-algebra containing all open sets.

Conversely, if $f^{-1}(A)$ is measurable for all Borel sets $A$, then $f$ is measurable because every open set is a Borel set.

## Royden-Fitzpatrick 8

A function $f$ is **Borel measurable** if its domain $E$ is a Borel set and for each real number $c$, $f^{-1}((c,\infty])$ is a Borel set.

### Proposition 1

Let the function $f$ have Borel domain $E$. Then the following statements are equivalent

1. For each real number $c$, $f^{-1}((c,\infty])$ is Borel.
2. For each real number $c$, $f^{-1}([c,\infty])$ is Borel.
3. For each real number $c$, $f^{-1}([-\infty,c))$ is Borel.
4. For each real number $c$, $f^{-1}([-\infty,c])$ is Borel.

_Proof_. First, we show that 1. implies 2. For any $c \in \textbf{R}$,
$$
f^{-1}([c,\infty]) = f^{-1}\left(\bigcap_{n=1}^\infty \left(c - \frac{1}{n}, \infty\right]\right) = \bigcap_{n=1}^\infty f^{-1}\left(\left(c-\frac{1}{n},\infty\right]\right)
$$
By 1., each of the sets in the rightmost intersection is Borel, so $f^{-1}([c,\infty])$ is Borel. Thus, 1. implies 2.

Second, we show that 2. implies 3. For any $c \in \textbf{R}$,
$$
f^{-1}([-\infty, c)) = f^{-1}\big([c,\infty]^C\big) = f^{-1}([c,\infty])^C
$$ By 2., $f^{-1}([c,\infty])$ is Borel, so $f^{-1}([-\infty, c))$ is Borel. Thus, 2. implies 3.

Third, we show that 3. implies 4. For any $c \in \textbf{R}$,
$$
f^{-1}([-\infty, c]) = f^{-1}\left(\bigcap_{n=1}^\infty\left[-\infty, c+\frac{1}{n}\right)\right) = \bigcap_{n=1}^\infty f^{-1}\left(\left[-\infty, c+\frac{1}{n}\right)\right)
$$
By 3., each of the sets in the rightmost intersection is Borel, so $f^{-1}([-\infty, c])$ is Borel. Thus, 3. implies 4.

Finally, we show that 4. implies 1. For any $c \in \textbf{R}$,
$$
f^{-1}((c,\infty]) = f^{-1}\big([-\infty, c]^C\big) = f^{-1}([-\infty, c])^C
$$
By 4., $f^{-1}([-\infty, c])$ is Borel, so $f^{-1}((c,\infty])$ is Borel. Thus, 4. implies 1.

### Theorem 6

Let $f$ and $g$ be finite, Borel measurable functions on $E$. Then

1. For any $\alpha, \beta \in\textbf{R}$, $\alpha f + \beta g$ is Borel measurable
2. $fg$ is Borel measurable

_Proof_. If $\alpha = 0$, then clearly $\alpha f$ is Borel measurable. Otherwise, if $\alpha > 0$, $(\alpha f)^{-1}((c,\infty]) = f^{-1}\left(\left(\frac{c}{\alpha}, \infty\right]\right)$, which is Borel by the Borel measurability of $f$, and if $\alpha > 0$, then $(\alpha f)^{-1}((c,\infty]) = f^{-1}\left(\left[-\infty, \frac{c}{\alpha}\right)\right)$, which is Borel by Proposition 1.

Similar reasoning show that $\beta g$ is Borel measurable. Hence, it suffices to show that $f + g$ is Borel measurable.

Let $c \in \textbf{R}$. Then
$$
f(x) + g(x) < c \iff \exists q \in \textbf{Q} :f(x) < q \;\text{and}\; g(x) < c- q
$$
If $f(x) + g(x) < c$, then $f(x) < c - g(x)$, so there is some $q \in \textbf{Q}$ such that $f(x) <  q < c - g(x)$. On the other hand, if there is some $q \in \textbf{Q}$ such that $f(x) < q$ and $g(x) < c- q$, then $q < c - (g)x$, so $f(x) < c - (x)$, and $f(x) + g(x) < c$. Hence,
$$
(f+g)^{-1}([-\infty,c)) = \bigcup_{q\in\textbf{Q}} f^{-1}([-\infty,q)) \cap g^{-1}([-\infty, c-q))
$$
Since $\textbf{Q}$ is countable, and $f^{-1}([-\infty,q))$ and $g^{-1}([-\infty,c-q))$ are Borel by the Borel measurability of $f$ and $g$ and Proposition 1, it follows that $(f+g)^{-1}([-\infty,c))$ is Borel for all $c \in \textbf{R}$. Therefore, $f + g$ is Borel measurable by Proposition 1.

To show that $fg$ is Borel measurable, we first show that $f^2$ is Borel measurable whenever $f$ is. To see this, observe that $(f^2)^{-1}([-\infty, c)) = \varnothing$, which is Borel, when $c < 0$ because $f^2 \ge 0$. For $c \ge 0$, we have $(f^2)^{-1}([-\infty, c)) = f^{-1}((-\sqrt{c}, \sqrt{c}))$, which is Borel by the Borel measurability of $f$. Thus, $f^2$ is Borel measurable whenever $f$ is.

Since $fg = \frac{1}{2}(f^2 + g^2 - (f + g)^2)$, it follows by linearity and the square fact just proven that $fg$ is Borel measurable.

### (i)

Every Borel measurable function is Lebesgue measurable.

_Proof_. Every Borel set is Lebesgue measurable. Hence, if $f$ is Borel measurable, then $f^{-1}((a, \infty])$ is Borel and therefore Lebesgue measurable for all $a \in \textbf{R}$. Thus, $f$ is Lebesgue measurable.

### (ii)

Let $f$ be Borel measurable, and let $B$ be a Borel set. Then $f^{-1}(B)$ is Borel.

_Proof_. Let $\mathcal{B} = \{E \subset \textbf{R} \mid  f^{-1}(E) \;\text{is Borel}\}$. Since $f^{-1}(\varnothing) = \varnothing$, it follows that $\varnothing \in \mathcal{B}$. Furthermore, if $E \in \mathcal{B}$, then $f^{-1}(E^C) = (f^{-1}(E))^C$, which is Borel since $f^{-1}(E)$ is Borel; thus, $E^C \in \mathcal{B}$. Finally, suppose that $E_n \in \mathcal{B}$ for $n=1,2,\dots$ Then
$$
f^{-1}\left(\bigcup_{n=1}^\infty E_n\right)=\bigcup_{n=1}^\infty f^{-1}(E_n)
$$
is Borel because each $f^{-1}(E_n)$ is Borel. Thus, $\mathcal{B}$ is a $\sigma$-algebra.

Moreover, if $I$ is an open interval, then $I = (a,\infty] \cap [-\infty, b)$ for some $a < b$, so $f^{-1}(I) = f^{-1}((a,\infty]) \cap f^{-1}([-\infty,b))$, which is Borel by Proposition 1. Thus, $I \in \mathcal{B}$, and since $\mathcal{B}$ is a $\sigma$-algebra containing all open intervals, it must contain all Borel sets. Thus, $B \in \mathcal{B}$, that is, $f^{-1}(B)$ is Borel.

### (iii)

If $f$ and $g$ are Borel measurable, then so is $f\circ g$.

_Proof_. Let $c \in \textbf{R}$. Then $(f \circ g)^{-1}((c, \infty]) = g^{-1}(f^{-1}((c,\infty]))$; by the Borel measurability of $f$, it follows that  $f^{-1}((c,\infty])$ is Borel. Thus, by part (ii), $g^{-1}(f^{-1}((c,\infty]))$ is Borel. This shows that $f\circ g$ is Borel measurable.

### (iv)

If $f$ is Borel measurable, and $g$ is Lebesgue measurable, then $f\circ g$ is Lebesgue measurable.

_Proof_. Let $c \in \textbf{R}$. Then $(f\circ g)^{-1}((c,\infty]) = g^{-1}(f^{-1}((c,\infty]))$. Since $f$ is Borel measurable, it follows that $f^{-1}((c,\infty])$ is Borel. By Exercise 7 and the Lebesgue measurability of $g$, it follows that $g^{-1}(f^{-1}((c,\infty]))$ is measurable. Thus, $f \circ g$ is Lebesgue measurable.

## Royden-Fitzpatrick 9

Let $\{f_n\}$ be a sequence of measurable functions defined on a measurable set $E$. Let $E_0$ be the set of points $x \in E$ such that $\{f_n(x)\}$ converges. Then $E_0$ is measurable.

_Proof_. The sequence $\{f_n(x)\}$ is convergent if and only if it is Cauchy, that is, if and only if
$$
x \in \left\{y \in E \mid \forall T \in \textbf{N}:\exists N: \forall n,m>N:|f_n(y) - f_m(y)| < \frac{1}{T}\right\}
$$
Hence,
$$
E_0 = \bigcap_{T =1}^\infty \bigcup_{N=1}^\infty \bigcap_{n,m > N} (|f_n - f_m|)^{-1}\left(\left[-\infty, \frac{1}{T}\right)\right)
$$
Since $f_n$ and $f_m$ are measurable for all $n,m$, it follows that $|f_n - f_m|$ is measurable, which means that $(|f_n - f_m|)^{-1}\left(\left[-\infty, \frac{1}{T}\right)\right)$ is measurable for all natural numbers $T$. Thus, $E_0$, being a countable intersection of countable unions of countable intersections of measurable sets, is also measurable.

## Royden-Fitzpatrick 12

Let $f$ be a bounded measurable function on $E$. Then there are sequences of simple functions $\{\varphi_n\}$ and $\{\psi_n\}$ such that $\{\varphi_n\}$ is increasing, and $\{\psi_n\}$ is decreasing, and both sequences converge uniformly to $f$ on $E$.

_Proof_. By the Simple Approximation Lemma, for every natural number $n$ there is a simple function $\varphi_n'$ and a simple function $\psi_n'$ such that
$$
0 \le f(x) - \varphi_n'(x) < \frac{1}{n},\qquad 0 \le \psi_n'(x) - f(x) < \frac{1}{n}
$$
for all $x \in E$. Since the pointwise maximum or minimum of finitely many simple functions is simple, it follows that
$$
\varphi_n = \max\{\varphi_1', \dots, \varphi_n'\}, \qquad \psi_n = \min\{\psi_1', \dots, \psi_n'\}
$$
are simple and still satisfy the inequalities
$$
\varphi_n \le f \le \psi_n
$$
Moreover, it is clear that
$$
\varphi_n \ge \varphi_n', \qquad \psi_n \le \psi_n'
$$
by construction. Hence,
$$
0 \le f(x) - \varphi_n(x) < \frac{1}{n}, \qquad 0 \le \psi_n(x) - f(x)< \frac{1}{n}
$$
Thus, $\{\varphi_n\}$ and $\{\psi_n\}$ are simple, increasing/decreasing sequences of functions that converge uniformly to $f$.

## Royden-Fitzpatrick 13

Let $f$ be any measurable function on a measurable set $E$. Then there is a sequence of semisimple functions $\{f_n\}$ that converges uniformly to $f$ on $E$.

_Proof_. Let $I_{k,n} = \left[\frac{k}{n}, \frac{k+1}{n}\right)$, where $k \in \textbf{Z}$, and $n$ is a natural number. Then for all $n$
$$
\textbf{R} = \bigcup_{k \in \textbf{Z}} I_{k,n}
$$
Let $E_{k,n} = f^{-1}(I_{k,n})$. Then each $E_{k,n}$ is a measurable subset of $E$ by the measurability of $f$. Define
$$
f_n(x) = \sum_{k\in\textbf{Z}} \frac{k}{n} \chi_{E_{k,n}}(x)
$$
Then $0\le f(x) - f_n(x) < \frac{1}{n}$ for all $x \in E$. Clearly, $f_n$ is semisimple and converges uniformly to $f$ on $E$.

## Royden-Fitzpatrick 14

Let $f$ be a measurable function on $E$ that is finite a.e. on $E$ and $m(E) < \infty$. Then for every $\varepsilon > 0$ there is a measurable set $F \subset E$ such that $f$ is bounded on $F$ and $m(E \setminus F) < \varepsilon$.

_Proof_. Define
$$
F_n = f^{-1}([-\infty, -n) \cup (n, \infty))
$$
for every natural number $n$. Then each $F_n$ is measurable by the measurabiliy of $f$. Furthermore, $\{F_n\}$ is a descending sequence, and $m(F_1) \le m(E) < \infty$ because $F_1 \subset E$. Therefore, by the continuity of measure,
$$
m\left(\bigcap_{n=1}^\infty F_n\right) = \lim_{n \to \infty}m(F_n)
$$
On the other hand, 
$$
\bigcap\limits_{n=1}^\infty F_n = f^{-1}\left(\bigcap_{n=1}^\infty [-\infty,-n)\cup (n,\infty]\right) = f^{-1}(\{-\infty, \infty\})
$$
Thus, given any $\varepsilon > 0$, we can choose $n$ such that $m(F_n) - m(f^{-1}(\{-\infty, \infty\})) < \varepsilon$. Since $f$ is finite a.e., there exists a set $E_0$ of zero measure such that $f$ is finite on $E \setminus E_0$. Then $f^{-1}(\{-\infty,\infty\}) \subset E_0$, so $m(f^{-1}(\{-\infty, \infty\})) = 0$. 

If we choose $F = E \setminus F_n$, then for all $x \in F$, $f(x) \in [-n, n]$, so that $f$ is bounded on $F$, and
$$
m(E\setminus F) = m(E \setminus (E \setminus F_n)) = m(F_n) < \varepsilon
$$

## Royden-Fitzpatrick 15

Let $f$ be a measurable function on $E$ that is finite a.e. on $E$ and $m(E) < \infty$. Then for each $\varepsilon > 0$, there is a measurable set $F \subset E$ such that $m(E \setminus F) < \varepsilon$, and there is a sequence of simple functions on $E$ that converges uniformly to $f$ on $F$.

_Proof_. By the previous exercise, given $\varepsilon > 0$, there exists a subset $F \subset E$ such that $m(E \setminus F) < \varepsilon$ and $f$ is bounded on $F$. Since $m(F) \le m(E) < \infty$, the Simple Approximation Lemma furnishes a sequence of simple functions $\{\varphi_n\}$ that converges uniformly to $f$ on $F$.

## Royden-Fitzpatrick 19

The sum and product of two simple functions are simple, as are the minimum and maximum.

_Proof_. Let $\varphi$ and $\psi$ be simple functions. Then $\varphi + \psi$, $\varphi \psi$, $\max\{\varphi,\psi\}$, and $\min\{\varphi, \psi\}$ are measurable because $\varphi$ and $\psi$ are measurable.

Furthermore, given any $x \in \textbf{R}$, $\varphi(x) + \psi(x)$ and $\varphi(x) \psi(x)$ can only assume finitely many possible values since each of $\varphi(x)$ and $\psi(x)$ only assume finitely many possible values. Therefore, $\varphi + \psi$ and $\varphi \psi$ are simple.

Likewise, given any $x \in \textbf{R}$, $\max\{\varphi, \psi\}(x)$ and $\min\{\varphi, \psi\}(x)$ are equal to either $\varphi(x)$ or $\psi(x)$, so both $\max\{\varphi, \psi\}(x)$ and $\min\{\varphi,\psi\}(x)$ can only assume finitely many possible values. Hence, $\max\{\varphi,\psi\}$ and $\min\{\varphi,\psi\}$ are simple.

## Royden-Fitzpatrick 20

Let $A$ and $B$ be any sets. Then

1. $\chi_{A\cap B} = \chi_A \cdot \chi_B$
2. $\chi_{A\cup B}$ = $\chi_A + \chi_B - \chi_A \cdot \chi_B$
3. $\chi_{A^C} = 1 - \chi_A$

_Proof_. First we prove 1. If $x \in A \cap B$, then $x \in A$ and $x \in  B$, so $\chi_{A \cap B}(x) = 1 = \chi_A(x)\chi_B(x)$. If $x \notin A \cap B$, then $x \notin A$ or $x\notin B$, so one of $\chi_A(x)$ and $\chi_B(x)$ is $0$. Then $\chi_{A\cap B}(x) = 0 = \chi_A(x) \chi_B(x)$. Thus, $\chi_{A\cap B} = \chi_A \cdot \chi_B$.

Second, we prove 2. If $x \in A \cup B$, then either $x$ is in one of $A$ or $B$ but not the other, or else $x \in A \cap B$. If $x$ is in one of $A$ or $B$ but not the other, then one of $\chi_A(x)$ and $\chi_B(x)$ is $0$, and the other is $1$. Therefore, $\chi_{A\cup B}(x) = 1 = \chi_A(x) + \chi_B(x) - \chi_A(x)\chi_B(x)$. If $x \in A \cap B$, then $\chi_A(x) = 1 = \chi_B(x)$, so $\chi_{A\cup B}(x) = 1 = \chi_A(x) + \chi_B(x) - \chi_A(x) \chi_B(x)$.

If $x \notin A\cup B$, then $x\notin A$ and $x \notin B$. Thus, $\chi_A(x)= 0$, and $\chi_B(x) = 0$. Then $\chi_{A\cup B}(x) = 0 = \chi_A(x) + \chi_B(x) - \chi_A(x) \chi_B(x)$. Hence, $\chi_{A\cup B} = \chi_A + \chi_B - \chi_A \cdot \chi_B$.

Third, we prove 3. If $x \in A^C$, then $x \notin A$, so $\chi_A(x) = 0$. Then $\chi_{A^C}(x) =1 = 1-\chi_A(x)$. If $x \notin A^C$, then $x \in A$, so $\chi_A(x) = 1$. Then $\chi_{A^C}(x) = 0 = 1 - \chi_A(x)$.

## Royden-Fitzpatrick 21

Let $\{f_n\}$ be a sequence of measurable functions with common domain $E$. Then each of the following is measurable:

1. $\inf \{f_n\}$
2. $\sup \{f_n\}$
3. $\lim \inf \{f_n\}$
4. $\lim\sup\{f_n\}$

_Proof_. Let $a \in\textbf{R}$. Note that
$$
(\inf\{f_n\})^{-1}([a,\infty]) = \bigcap_{n=1}^\infty f_n^{-1}([a,\infty])
$$
Indeed, $\inf\{f_n\}(x) \in [a,\infty]$ if and only if $f_n(x) \in [a,\infty]$ for all $n$. Likewise,
$$
(\sup\{f_n\})^{-1}([-\infty, a]) = \bigcap_{n=1}^\infty f_n^{-1}([-\infty,a])
$$
Since each $f_n$ is measurable, it follows that $f^{-1}_n([a,\infty])$ and $f_n^{-1}([-\infty,a])$ are measurable for all $n$ and all $a$. Then $(\inf\{f_n\})^{-1}([a,\infty])$ and $(\sup\{f_n\})^{-1}([-\infty,a])$ are measurable for all $a$, being countable intersectitons of measurable sets. Hence, $\inf\{f_n\}$ and $\sup\{f_n\}$ are measurable functions.

Let $f_{n,k} = f_{n+k}$. Then
$$
\lim\inf \{f_n\} = \lim_{k\to\infty} \inf\{f_{n,k}\},\qquad \lim\sup \{f_n\} = \lim_{k\to\infty}\sup\{f_{n,k}\}
$$
For each natural number $k$, the functions $\inf\{f_{n,k}\}$ and $\sup\{f_{n,k}\}$ are measurable. Thus, $\lim\inf\{f_n\}$ and $\lim\sup\{f_n\}$ are the pointwise limits of sequences of measurable functions and, consequently, must be measurable themselves.

## Royden-Fitzpatrick 24

Let $I$ be an interval and $f:I\to\textbf{R}$ be increasing. Then $f$ is measurable.

_Proof_. Define $f_n(x) = f(x) + \frac{x}{n}$. Then $f_n$ is strictly increasing for every natural number $n$. Indeed, if $x < y$, and $x,y\in I$, then
$$
f_n(x) = f(x) + \frac{x}{n} < f(x) + \frac{y}{n} \le f(y) + \frac{y}{n} = f_n(y)
$$
because $f$ is increasing. 

Let $a$ be a real number, and let $L_a= \{x \in I \mid f_n(x) < a\}$. Set $x_0 = \sup L_a$ (allowing $x_0 = -\infty$ if the set is empty). 

If $x \in I$ and $f_n(x) \ge a$, then for all $y \in I$ such that $y \ge x$, we must have $f_n(y) \ge a$. Hence, $x$ is an upper bound for $L_a$, so $x_0 \le x$, and $f_n^{-1}([a,\infty]) \subset [x_0,\infty) \cap I$. 

Conversely, let $x \in I$, and $x > x_0$. Then $f_n(x) \ge a$ by the definition of $x_0$. Hence, $(x_0, \infty) \cap I \subset f^{-1}([a,\infty])$.

This shows that $f^{-1}([a,\infty]) = [x_0,\infty) \cap I$ or $f^{-1}([a,\infty]) = (x_0,\infty) \cap I$, both of which are measurable because $I$ is an interval. 

Since $f$ is the pointwise limit of $\{f_n\}$, it follows that $f$ is measurable.

## Royden-Fitzpatrick 25

Let $f$ be continuous on a closed set $F$ of $\textbf{R}$. Then $f$ has a continuous extension to $\textbf{R}$.

_Proof_. If $F = \textbf{R}$, then we are done. Otherwise, the set $\textbf{R} \setminus F$ is open and nonempty, so it is the union of countably many disjoint, nonempty, open intervals, that is
$$
\textbf{R} \setminus F = \bigcup_{n=1}^\infty I_n
$$
where $I_n = (a_n, b_n)$, $a_n < b_n$. At most one of the $\{a_n\}$ is $-\infty$, and at most one of the $\{b_n\}$ is $+\infty$, and it is clear that all of the finite endpoints belong to $F$. 

If $a_n$ and $b_n$ are both infinite for some $n$, then $F = \varnothing$, so we can trivially extend $f$ to a continuous function on $\textbf{R}$ (to, say, $f=0$).

If both $a_n$ and $b_n$ are finite, then define $f$ on $(a_n, b_n)$ by linear interpolation between $f(a_n)$ and $f(b_n)$:
$$
f(x) = \frac{x-a_n}{b_n-a_n}(f(b_n) - f(a_n)) + f(a_n)
$$
Then $f$ is continuous on $(a_n, b_n)$, and left and right continuous at $a_n$ and $b_n$.

If one of $a_n$ or $b_n$ is infinite, then define $f(x) = f(c)$ for $x \in (a_n, b_n)$, where $c$ is the finite value in $\{a_n, b_n\}$. Then $f(x)$ is continuous on $(-\infty, b_n)$ or $(a_n, \infty)$ and left continuous at $a_n$ or right continuous at $b_n$, depending on which one is finite.

By construction, we have $f$ is continuous on $\textbf{R} \setminus F$. Furthermore, $f$ is continuous on the interior of $F$.

If $c$ is an isolated point of $F$, then $c = a_n = b_{n'}$ for some $n, n'$, so the above construction ensures that $f$ is both left and right continuous at $c$. Thus, $f$ is continuous at $c$.

If $a_n$ is not an isolated point of $F$, then $f$ must be right continuous at $a_n$ by the assumed continuity of $f$ on $F$, and by construction $f$ is left continuous at $a_n$. Hence, $f$ is continuous at $a_n$.

If $b_n$ is not an isolated point of $F$, then $f$ must be left continuous at $b_n$ by the assumed continuity of $f$ on $F$, and by construction $f$ is right continuous at $b_n$. Hence, $f$ is continuous at $b_n$.

Since $\textbf{R} = (\textbf{R} \setminus F) \cup \overset{\circ}{F} \cup \{a_n\} \cup \{b_n\}$, it follows that $f$ is continuous on $\textbf{R}$.

## Royden-Fitzpatrick 27

For each natural number $n$, let
$$
f_n(x) = \begin{cases}
0 & x \le n \\
1 & x > n
\end{cases}
$$
Then $f_n$ converges pointwise to $0$ on $\textbf{R}$. Suppose $F$ is a closed subset of $\textbf{R}$ such that $m(\textbf{R} \setminus F) < 1$. For any natural number $n$, there must be some $x \in F$ such that $x >n$; if there were not, that is, $x \le n$ for all $x \in F$, then $(n,\infty)$ would be a subset of $\textbf{R} \setminus F$, contradicting the finite measure of $\textbf{R} \setminus F$.

Thus, for any natural number $n$, we can find $x \in F$ such that $|f_n(x) - 0| = 1 > \frac{1}{2}$. This means that $\{f_n\}$ does not converge uniformly on $F$.

This shows that Egoroff's Theorem cannot be true if assumption that the domain $E$ has finite measure is dropped.

## Royden-Fitzpatrick 28

Assume that $E$ has finite measure. Let $\{f_n\}$ be a sequence of measurable functions on $E$ that converge pointwise a.e. on $E$ to the finite a.e. function $f$. Then for each $\varepsilon > 0$, there is a closed set $F \subset E$ such that $f_n \to f$ uniformly on $F$, and $m(E\setminus F) < \varepsilon$.

_Proof_. Since $\{f_n\}$ converges pointwise a.e., there exists a set $E_0$ of measure 0 such that $\{f_n\}$ converges pointwise on $E \setminus E_0$. Furthermore, since $f$ is finite a.e., there is a set $E_0'$ of measure 0 such that $f$ is finite on $E \setminus E_0'$. Then $E_0'' = E_0 \cup E_0'$ also has measure 0, and $E \setminus E_0'' \subset E \setminus E_0$, and $E \setminus E_0'' \subset E_0'$. Thus, $\{f_n\}$ converges pointwise on $E \setminus E_0''$, and $f$ is finite on $E \setminus E_0''$. 

Obviously, $E \setminus E_0''$ has finite measure, so by Egoroff's Theorem, for each $\varepsilon > 0$, there exists a closed set $F \subset E \setminus E_0''$ such that $f_n \to f$ uniformly on $F$, and $m((E \setminus E_0'') \setminus F) < \varepsilon$. Then $F \subset E$, and
$$
\begin{aligned}
m(E \setminus F) &= m(E \cap F^C \cap E_0''^C) + m(E \cap F^C \cap E_0'') \\
& \le m((E\setminus E_0'')\setminus F) + m(E_0'') \\
& < \varepsilon
\end{aligned}
$$
and $f_n \to f$ uniformly on $F$. This completes the proof.

## Royden-Fitzpatrick 29

Let $f$ be a real-valued, measurable function on $E$. Then for each $\varepsilon > 0$, there exists a continuous function $g$ on $\textbf{R}$ and a closed set $F \subset E$ such that $f = g$ on $F$, and $m(E \setminus F) < \varepsilon$.

_Proof_. Let $\varepsilon > 0$ be given. Define $E_n = E \cap ((-n-1,-n]\cup[n,n+1))$ for every integer $n \ge 0$. Then

- $m(E_n) < \infty$ for all $n$
- $E = \bigcup\limits_{n=1}^\infty E_n$
- $\{E_n\}$ are pairwise disjoint

By Lusin's Theorem for domains of finite measure, there exists a continuous function $g_n$ on $\textbf{R}$ such that $f = g_n$ on some closed subset $F_n \subset E_n$, where $m(E_n \setminus F_n) < \frac{\varepsilon}{2^n}$. 

Let $F = \bigcup\limits_{n=1}^\infty F_n$. Then $F$ is closed. In fact, if $x$ is a closure point of $F$, then for all $\delta>0$, the interval $(x-\delta, x+\delta)$ contains points of $F$. If we choose $\delta < \frac{1}{2}$, then $(x-\delta, x+\delta)$ can only intersect with at most two consective sets $F_n$ and $F_{n+1}$ for some $n$. Then for all $\delta < \frac{1}{2}$, $(x-\delta, x+\delta)$ contains points of either $F_n$ or $F_{n+1}$. 

Then either $(x-\delta,x+\delta)$ contains points of $F_n$ for all $\delta$, or else there is some $\delta_0$ such that $(x-\delta_0, x+\delta_0) \cap F_n = \varnothing$. Then for all $\delta \le \delta_0$, we must have $(x-\delta, x+\delta) \cap F_{n+1} \ne \varnothing$. In either case, $x$ is a closure point of $F_n$ or $F_{n+1}$, so $x \in F_n$ or $x \in F_{n+1}$, which implies that $x \in F$. Hence, $F$ is closed.

The sets $\{F_n\}$ are all disjoint since they are subsets of the disjoint sets $\{E_n\}$, so for each $x \in F$, there is exactly one number $n$ such that $x \in F_n$. Define $g$ on $\textbf{R}$ by setting $g(x) = g_{n}(x)$ if $x \in F_n$. Then $g$ is continuous on $F$, and since $F$ is closed, we can define $g$ on $\textbf{R} \setminus F$ in the manner described in exercise 25 so that $g$ is continuous on $\textbf{R}$. 

By construction, we also have $g = f$ on $F$. Finally, by the disjointness of the $\{E_n\}$, the disjointness of $\{F_n\}$, and the fact that $F_n \subset E_n$, we have
$$
m(E \setminus F) = m\left(\bigcup_{n=1}^\infty E_n \setminus F\right) = \sum_{n=1}^\infty m(E_n \setminus F) = \sum_{n=1}^\infty m(E_n \setminus F_n) < \varepsilon
$$

## Royden-Fitzpatrick 30

Let $f$ be a measurable, finite a.e. function on $E$. Then for each $\varepsilon > 0$, there exists a closed subset $F\subset E$ and a continuous function $g$ on $\textbf{R}$ such that $f= g$ on $F$, and $m(E \setminus F) < \varepsilon$.

_Proof_. Since $f$ is finite a.e., there exists a set $E_0$ of 0 measure such that $f$ is finite on $E \setminus E_0$. Then by Lusin's Theorem, there is a closed subset $F$ of $E \setminus E_0$ and a continuous function $g$ on $\textbf{R}$ such that $f = g$ on $(E\setminus E_0)\setminus F$, and $m((E\setminus E_0) \setminus F) < \varepsilon$. Then $F \subset E$, $f = g$ on $F$, and
$$
\begin{aligned}
m(E\setminus F) &= m\big(E \cap F^C\cap E_0^C\big) + m(E \cap F^C\cap E_0) \\
& \le m((E\setminus E_0)\setminus F) + m(E_0) \\
& < \varepsilon
\end{aligned}
$$
This completes the proof.
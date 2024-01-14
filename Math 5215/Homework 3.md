# Homework 3

## Royden Fitzpatrick 5

The outer measure of a countable set is 0. On the other hand, the outer measure of an interval coincides with its length. Thus, $m^*([0,1]) = \ell([0,1]) = 1 \ne 0$, so $[0,1]$ cannot be countable.

## Royden-Fitzpatrick 6

Let $A$ be the set of irrational numbers in $[0,1]$. Then $m^*(A) = 1$.

_Proof_. Clearly $A \subset [0,1]$, so $m^*(A) \le m^*([0,1]) = 1$. On the other hand, every element of $[0,1] \setminus A$ is rational, so $[0,1] \setminus A$ is countable, and $m^*([0,1]\setminus A) = 0$. Then by finite subadditivity,
$$
1 = m^*([0,1]) \le m^*([0,1]\setminus A) + m^*(A) = m^*(A)
$$
so $m^*(A) \ge 1$.

Hence, $m^*(A) = 1$.

## Royden-Fitzpatrick 7

Let $E$ be a bounded set. Then there is a $G_\delta$ set $G \supset E$ such that
$$
m^*(G) = m^*(E)
$$

_Proof_. Since $E$ is bounded, there is some $0 < A < \infty$ such that $E \subset (-A, A)$, so $m^*(E) \le 2A < \infty$. By the definition of $m^*$ and the finiteness of $m^*(E)$, there exists a countable, open cover $\mathcal{U}_n$ of $E$ by bounded open intervals such that
$$
m^*(E) + \frac{1}{n} \ge \sum_{I \in \mathcal{U}_n} \ell(I) \ge m^*(U_n)
$$
where $U_n = \bigcup\limits_{I\in\mathcal{U}_n}I$. Define
$$
G = \bigcap_{n=1}^\infty U_n
$$
Since $G \subset U_n$ for all $n$, it follows that
$$
m^*(E) + \frac{1}{n} \ge m^*(U_n) \ge m^*(G)
$$
for all $n$. This implies that $m^*(E) \ge m^*(G)$. On the other hand, $E \subset U_n$ for all $n$, so $E \subset G$. This implies that $m^*(E) \le m^*(G)$ by monotonicity. Thus, $m^*(E) = m^*(G)$. Noting that $U_n$ is open (being the union of open sets), we see that $G$ is a $G_\delta$ set, completing the proof.

## Royden-Fitzpatrick 9

If $m^*(A) = 0$, then $m^*(A \cup B) = m^*(B)$.

_Proof_. By monotonicity, it is obvious that $m^*(B) \le m^*(A \cup B)$. On the other hand, by countable subadditivity,
$$
m^*(A\cup B) \le m^*((A\cup B) \setminus A) + m^*(A) = m^*(B)
$$
This shows that $m^*(A\cup B) = m^*(B)$.

## Royden-Fitzpatrick 10

Let $A$ and $B$ be bounded sets for which there is some $\alpha > 0$ such that $|a-b| \le \alpha$ for all $a \in A$ and $b\in B$. Then $m^*(A\cup B) = m^*(A) + m^*(B)$.

_Proof_. Since $A$ and $B$ are bounded, so is $A \cup B$. Then, given $\varepsilon > 0$, there is a countable open cover of $A \cup B$ by bounded open intervals $\{I_n\}$ such that
$$
\infty > m^*(A \cup B) + \varepsilon \ge \sum_{n=1}^\infty \ell(I_n)
$$
Since the series converges, the set $S = \{I_n \mid \ell(I_n) \ge \alpha\}$ is finite. Since the intervals in $S$ are bounded, we can cover each interval in $S$ by a finite collection of bounded open intervals, each of which has length less than $\alpha$. Let $S'$ be such a cover; we choose $S'$ in such a way that
$$
\sum_{I\in S'}\ell(I) \le \varepsilon + \sum_{I \in S}\ell(I)
$$
The set $M = (\{I_n\} \setminus S) \cup S'$ is now an open cover of $A \cup B$ by countably many bounded, open intervals, each of which has length less than $\alpha$. The hypothesis that $|a-b| \ge \alpha$ for all $a \in A$ and $b \in B$ implies that each interval $I \in M$ contains only points of $A$ or only points of $B$. This allows us to partition $M$ into two subsets $M_A$ and $M_B$, which are open covers of $A$ and $B$ by countably many bounded, open intervals. Therefore,
$$
m^*(A\cup B) + \varepsilon \ge \sum_{n=1}^\infty \ell(I_n) \ge \sum_{I \in M}\ell(I) -\varepsilon \ge m^*(A) + m^*(B) - \varepsilon
$$
In other words, $m^*(A\cup B) \ge m^*(A) + m^*(B) - 2\varepsilon$ for all $\varepsilon > 0$. This implies that $m^*(A\cup B) \ge m^*(A) + m^*(B)$. On the other hand, finite subadditivity implies that $m^*(A\cup B) \le m^*(A) + m^*(B)$, and the conclusion follows.

## Royden-Fitzpatrick 11

If a $\sigma$-algebra $\mathcal{A}$ of subsets of $\textbf{R}$ contains all intervals of the form $(a, \infty)$, then it contains all intervals.

_Proof_. We need to show that for any $a \le b \in \textbf{R}$ each of the following is in $\mathcal{A}$:
$$
(-\infty, a),\, (-\infty, a],\, [a,\infty),\, (a,b),\,[a,b),\, (a,b],\, \text{and }[a,b]
$$

1. $(-\infty,a] \in \mathcal{A}$ for any $a \in \textbf{R}$ because $(-\infty, a] = \textbf{R} \setminus (a,\infty)$, and $(a,\infty) \in \mathcal{A}$.
2. $(-\infty, a) \in \mathcal{A}$ for any $a \in \textbf{R}$ because $$(-\infty, a) = \bigcap_{n=1}^\infty  \left(-\infty, a + \frac{1}{n}\right] $$ and each interval $\left(-\infty, a + \frac{1}{n}\right] \in \mathcal{A}$ by 1.
3. $[a,\infty) \in \mathcal{A}$ because $[a,\infty) = \textbf{R} \setminus (-\infty, a)$, and $(-\infty, a) \in \mathcal{A}$ by 2.
4. $[a,b] \in \mathcal{A}$ because $[a,b] = \textbf{R} \setminus ((-\infty, a) \cup (b,\infty))$, and $(-\infty, a)$ and $(b,\infty)$ are both in $\mathcal{A}$ by hypothesis and by 2.
5. $(a,b] \in \mathcal{A}$ because $(a,b] = [a,b] \setminus (-\infty, a]$, and $[a,b] \in \mathcal{A}$ by 4. and $(-\infty, a] \in \mathcal{A}$ by 1.
6. $[a,b) \in\mathcal{A}$ because $[a,b) = [a,b] \setminus [b, \infty)$, and $[a,b]$ and $[b,\infty)$ are both in $\mathcal{A}$ by 4. and 3.
7. $(a,b) \in \mathcal {A}$ because $(a,b) = (a,b] \setminus [b,\infty)$, and $(a,b]$ and $[b,\infty)$ are both in $\mathcal{A}$ by 5. and 3.

## Royden-Fitzpatrick 12

Every interval is a Borel set.

_Proof_. By Royden-Fitzpatrick exercise 11, a $\sigma$-algebra of susbets of $\textbf{R}$ contains all intervals if it contains all intervals of the form $(a,\infty)$ for any $a \in \textbf{R}$. Each such interval is open, so each is Borel. Borel sets form a $\sigma$-algbera, so it follows that every interval is Borel.

## Royden-Fitzpatrick 13

### (i)

The translate of an $F_\sigma$ set is also $F_\sigma$.

_Proof_. Let $F$ be an $F_\sigma$ set. Then there is a countable collection of closed sets $\{F_n\}$ such that
$$
F = \bigcup_{n=1}^\infty F_n
$$
It is clear that for any $y \in \textbf{R}$
$$
y + F = \bigcup_{n=1}^\infty (y+ F_n)
$$
Let $y + x$ be a closure point of $y + F_n$, and let $(a,b)$ be any open interval containing $x$. Then $(a+y,b+y)$ contains $y+x$, and because $y+ x$ is a closure point of $F_n$, $(a+y,b+y)$ also contains some point $y  +z \in y+F_n$. Then $(a,b)$ contains $z \in F_n$. Since $(a,b)$ was arbitrary, it follows that $x$ is a closure point of $F_n$. This implies that $x \in F_n$, which implies that $y+x \in y + F_n$. Since $y+x$ was an arbitrary closure point, this shows that $y + F_n$ contains all of its closure points, that is, $y + F_n$ is closed.

Since each $F_n$ is closed, it follows that $y+F$ is an $F_\sigma$ set by definition.

### (ii)

The translate of a $G_\delta$ set is also $G_\delta$.

_Proof_. Let $G$ be a $G_\delta$ set, and let $y \in\textbf{R}$. Then $\textbf{R} \setminus G$ is an $F_\sigma$ set by duality, and $y + (\textbf{R} \setminus G)$ is an $F_\sigma$ set by part (i). Finally, it is easy to see that
$$
y + G = \textbf{R} \setminus (y + (\textbf{R} \setminus G))
$$
is a $G_\delta$ set by duality.

### (iii)

If $m(E) = 0$, then $m(y + E) = 0$ for any measurable set $E$ and any $y\in\textbf{R}$.

_Proof_. Given $\varepsilon > 0$, there exists a countable cover of $E$ by bounded, open intervals $\{I_n\}$ such that
$$
\sum_{n=1}^\infty \ell(I_n) \le \varepsilon + m^*(E) = \varepsilon
$$
Then $\{y +I_n\}$ is a countable open cover of $y + E$ by bounded, open intervals, and by the translation invariance of $\ell$,
$$
m^*(y + E)  \le \sum_{n=1}^\infty \ell(y + I_n) = \sum_{n=1}^\infty \ell(I_n) \le \varepsilon
$$
Since $\varepsilon > 0$ was arbitrary, this shows that $m(y + E) = m^*(y+E) = 0$ (the translates of $E$ are all measurable, or we can use the fact that sets of outer measure 0 are measurable).

## Royden-Fitzpatrick 14

If $E$ is a set of positive outer measure, then there is a bounded subset of $E$ also of positive outer measure.

_Proof_. Let $A_n = (-n, n)$. Then $A_n$ is an interval, so each $A_n$ is measurable, and
$$
m^*(E) = m^*(E \cap A_n) + m^*(E \cap A_n^C)
$$
Suppose that $m^*(E \cap A_n) = 0$ for all $n$. Since
$$
E = \bigcup_{n=1}^\infty E \cap A_n
$$
we would have
$$
m^*(E) \le \sum_{n=1}^\infty m^*(E \cap A_n) = 0
$$
by countable subadditivity. This contradicts the assumed positivity of $m^*(E)$, so there must be some $n$ such that $m^*(E\cap A_n) > 0$. Thus, $E \cap A_n$ is a bounded subset of $E$ of positive outer measure.

## Rodyen-Fitzpatrick 15

Let $E$ be a measurable set of finite measure. Then for any $\varepsilon > 0$ we can write $E$ as a finite, disjoint union of measurable sets of measure less than or equal to $\varepsilon$.

_Proof_. Let $I_n = [n\varepsilon, (n+1)\varepsilon)$ for $n \in\textbf{Z}$. Then each $I_n$ is measurable, and $m(I_n) = \varepsilon$ for all $n$. Let $E_n = E \cap I_n$. Then $E = \bigcup\limits_{n=1}^\infty E_n$, so
$$
m(E) = \sum_{n=1}^\infty m(E_n) < \infty
$$
Since the series converges, there is some $N$ such that
$$
\sum_{n=N}^\infty m(E_n) < \varepsilon
$$
Set $D_n = E_n$ for $n =1,\dots, N-1$, and set $D_N = \bigcup\limits_{n=N}^\infty E_n$. Then $m(D_N) < \varepsilon$, and if $n < N$, then $m(D_n) \le m(I_n) = \varepsilon$ because $D_n = E_n \subset I_n$ by construction. Furthermore, it is clear that
$$
E = \bigcup_{n=1}^N D_n
$$
Finally, the sets $\{D_n\}$ are clearly disjoint.

## Royden-Fitzpatrick 16

### (iii)

A set $E$ is measurable if and only if for all $\varepsilon > 0$, there is a closed set $F$ contained in $E$ such that $m^*(E \setminus F) < \varepsilon$.

_Proof_. Let $E$ be a measurable set. Then $E^C$ is measurable. By part (i) of the Theorem, given $\varepsilon > 0$, there exists an open set $G$ containing $E^C$ such that $m^*(G \setminus E^C) < \varepsilon$. Then $F = G^C$ is closed and contained in $E$, and $G \setminus E^C = E \setminus F$, so $m^*(E \setminus F) < \varepsilon$.

Conversely, suppose that for all $\varepsilon > 0$, there is an closed set $F \subset E$ such that $m^*(E \setminus F) < \varepsilon$. Then $G = F^C$ is open and contains $E^C$, and $G \setminus E^C = E \setminus F$, so $m^*(G \setminus E^C) < \varepsilon$. This shows that $E^C$ is measurable by part (i) of the Theorem. Thus, $E$ is measurable as well.

### (iv)

A set $E$ is measurable if and only if there is an $F_\sigma$ set $F$ contained in $E$ such that $m^*(E \setminus F) = 0$.

_Proof_. Let $E$ be measurable. Then $E^C$ is measurable, and by part (ii) of the Theorem there exists a $G_\delta$ set $G$ such that $G$ contains $E^C$, and $m^*(G \setminus E^C) = 0$. Then $F = G^C$ is $F_\sigma$ and contained in $E$, and $G \setminus E^C = E\setminus F$, so $m^*(E\setminus F) = 0$.

Conversely, suppose that there is an $F_\sigma$ set $F \subset E$ such that $m^*(E \setminus F) = 0$. Then $G = F^C$ is $G_\delta$ and contain $E^C$, and $G \setminus E^C = E \setminus F$, so $m^*(G\setminus E^C) = 0$. This shows that $E^C$ is measurable by part (ii) of the Theorem. Thus, $E$ is measurable as well.

## Royden-Fitzpatrick 17

A set $E$ is measurable if and only if for each $\varepsilon > 0$ there is a closed set $F$ and an open set $O$ for which $F \subset E \subset O$ and $m^*(O \setminus F) < \varepsilon$.

_Proof_. Suppose that $E$ is measurable. Then given $\varepsilon > 0$, there exists an open set $O$ and closed set $F$ such that $F \subset E \subset O$, and $m^*(O \setminus E) < \frac{\varepsilon}{2}$ and $m^*(E \setminus F) < \frac{\varepsilon}{2}$. Then $O \setminus F = (O \setminus E) \cup (E \setminus F)$ and finite subadditivity together imply that
$$
m^*(O\setminus F) \le m^*(O\setminus E) + m^*(E \setminus F) < \varepsilon
$$

Conversely, suppose that for each $\varepsilon > 0$ there is a closed set $F$ and an open set $O$ such that $F \subset E \subset O$ and $m^*(O\setminus F) < \varepsilon$. Since $O \setminus E \subset O \setminus F$, and $E \setminus F \subset O \setminus F$, we have
$$
m^*(O \setminus E) \le m^*(O \setminus F) < \varepsilon, \qquad m^*(E \setminus F) \le m^*(O \setminus F) < \varepsilon
$$
Either of these inequalities implies that $E$ is measurable because $\varepsilon >0$ was arbitrary.

## Royden-Fitzpatrick 18

Let $E$ have finite outer measure. Then there is a $G_\delta$ set $G$ such that $E \subset G$, and $m^*(G) = m^*(E)$. Furthermore, $E$ is measurable if and only if there exists an $F_\sigma$ set $F \subset E$ such that $m^*(F) = m^*(E)$.

_Proof_. The method of Royden-Fitzpatrick exercise 7 works to find a $G_\delta$ set $G$ such that $E \subset G$, and $m^*(G) = m^*(E)$ (we only used the fact that $E$ was bounded in 7 to argue that $m^*(E) <\infty$, which we are assuming here).

The second part is just the statement of Theorem 11 (iv), which was proved in exercise 16.

## Royden-Fitzpatrick 21

### Proof using Thoerem 11 (ii)

Let $E_1$ and $E_2$ be measurable sets, as defined by Theorem 11 (ii), that is, there exist $G_\delta$ sets $G_1$ and $G_2$ such that $E_1 \subset G_1$, $E_2 \subset G_2$, $m^*(G_1 \setminus E_1) = 0$, and $m^*(G_2 \setminus E_2) = 0$. Then, clearly, $E_1\cup E_2 \subset G_1 \cup G_2$, which is a $G_\delta$ set. To see why, let $\{G_1^n\}$ and $\{G_2^n\}$ be countable systems of open sets such that
$$
G_1 = \bigcup_{n=1}^\infty G_1^n,\qquad G_2 = \bigcup_{n=1}^\infty G_2^n
$$
Then
$$
G_1 \cup G_2 = \bigcap_{(i,j) \in \textbf{N}^2} (G_1^i\cup G_2^j)
$$
If $x \in \text{LHS}$, then $x \in G_1^n$ for all $n$ or $x \in G_2^n$ for all $n$. In either case, we have $x \in G_1^i \cup G_2^j$ for all $i,j$ so $x \in \text{RHS}$. Conversely, suppose that $x \notin \text{LHS}$. Then there exists some $(i,j) \in \textbf{N}^2$ such that $x \notin G_1^i$ and $x \notin G_2^j$. Then $x \notin G_1^i \cup G_2^j$, so $x \notin \text{RHS}$.

Since $\textbf{N}^2$ is countable, and $G_1^i \cup G_2^j$ is open (being the union of two open sets) for all $(i,j)$, it follows that $G_1 \cup G_2$ is $G_\delta$.

Finally, $(G_1 \cup G_2) \setminus (E_1 \cup E_2) \subset (G_1 \setminus E_1) \cup (G_2 \setminus E_2)$, so
$$
m^*((G_1 \cup G_2) \setminus (E_1 \cup E_2)) \le m^*(G_1 \setminus E_1) + m^*(G_2 \setminus E_2) = 0
$$
This shows that $E_1 \cup E_2$ is measurable by the criterion in Theorem 11 (ii).

### Proof using Theorem 11 (iv)

Let $E_1$ and $E_2$ be measurable sets, as defined by Theorem 11 (iv), that is, there exist $F_\sigma$ sets $F_1$ and $F_2$ such that $F_1 \subset E_1$, $F_2 \subset E_2$, $m^*(E_1 \setminus F_1) = 0$, and $m^*(E_2 \setminus F_2) = 0$. Then $F_1 \cup F_2 \subset E_1 \cup E_2$, and it is obvious that $F_1 \cup F_2$ is an $F_\sigma$ set. 

Furthermore, $(E_1 \cup E_2) \setminus (F_1 \cup F_2) \subset (E_1 \setminus F_1) \cup (E_2 \setminus F_2)$, so
$$
m^*((E_1 \cup E_2)\setminus (F_1 \cup F_2)) \le m^*(E_1 \setminus F_1) + m^*(E_2 \setminus F_2) = 0
$$
This shows that $E_1 \cup E_2$ is measurable by the criterion in Theorem 11 (iv).

## Royden-Fitzpatrick 24

Let $E_1$ and $E_2$ be measurable. Then
$$
m(E_1 \cup E_2) + m(E_1 \cap E_2) = m(E_1) + m(E_2)
$$

_Proof_. First, $E_1 = (E_1 \setminus E_2) \cup (E_1 \cap E_2)$, and $(E_1 \setminus E_2) \cap (E_1 \cap E_2) = \varnothing$, so
$$
m(E_1) = m(E_1 \setminus E_2) + m(E_1 \cap E_2)
$$
A symmetric argument shows that
$$
m(E_2) = m(E_2 \setminus E_1) + m(E_1\cap E_2)
$$
Finally, $E_1 \cup E_2 = (E_1 \setminus E_2) \cup (E_2 \setminus E_1) \cup (E_1 \cap E_2)$, and
$$
(E_1 \setminus E_2) \cap (E_2 \setminus E_1) = \varnothing, \quad (E_1 \setminus E_2) \cap (E_1 \cap E_2) = \varnothing, \quad (E_2 \setminus E_1) \cap (E_1 \cap E_2) = \varnothing
$$
so
$$
m(E_1 \cup E_2) = m(E_1 \setminus E_2) + m(E_2 \setminus E_1) + m(E_1 \cap E_2)
$$
Therefore,
$$
m(E_1 \cup E_2) = (m(E_1) - m(E_1 \cap E_2)) + (m(E_2) - m(E_1 \cap E_2)) + m(E_1 \cap E_2)
$$
from which the result follows.

## Royden-Fitzpatrick 25

Let $B_n = (n,\infty)$. Then each $B_n$ is measurable, and $\{B_n\}$ is a descending sequence; however, $\bigcap\limits_{n=1}^\infty B_n = \varnothing$, but $m(B_n) = \infty$ for all $n$. Therefore,
$$
0= m\left(\bigcap_{n=1}^\infty B_n\right) \ne \lim_{n\to\infty}m(B_n) = \infty
$$
Thus, part (ii) of the continuity of measure theorem does not necessarily hold when $m(B_1) = \infty$.

## Royden-Fitzpatrick 26

Let $\{E_n\}$ be a countable collection of disjoint measurable sets, and let $E$ be the union of $\{E_n\}$. The for any set $A$
$$
m^*\left(A \cap E\right) = \sum_{n=1}^\infty m^*(A \cap E_n)
$$

_Proof_. Let $F_k = \bigcup\limits_{n=k}^\infty E_n$. Using the measurability of $E_1$, we obtain
$$
m^*(A\cap E) = m^*(A\cap E \cap E_1) + m^*\big(A\cap E\cap E_1^C\big)
$$
Since $E_1 \subset E$, and $E = F_1$, we get
$$
m^*(A \cap E) = m^*(A\cap E_1) + m^*(A \cap F_2)
$$
Suppose for induction that
$$
m^*(A \cap E) = m^*(A\cap F_{k+1}) + \sum_{n=1}^k m^*(A \cap E_n)
$$
for some $k \ge 1$. Then using the measurability of $E_{k+1}$, we get
$$
m^*(A\cap E) = m^*(A\cap F_{k+1} \cap E_{k+1}) + m^*\big(A\cap F_{k+1}\cap E_{k+1}^C\big) + \sum_{n=1}^km^*(A\cap E_n)
$$
Note that $F_{k+1} = F_k \cap E_k^C$ because $E_n \subset E_k^C$ for all $n > k$ by the disjointness of the $\{E_n\}$. Since $E_{k+1} \subset F_{k+1}$, we obtain
$$
m^*(A\cap E) = m^*(A \cap F_{k+2}) + \sum_{n=1}^{k+1}m^*(A \cap E_n)
$$
Hence,
$$
m^*(A\cap E) \ge \sum_{n=1}^km^*(A\cap E_n)
$$
for all $k \ge 1$ by induction. Taking the limit as $k \to \infty$ on both sides shows that
$$
m^*(A\cap E) \ge \sum_{n=1}^\infty m^*(A\cap E_n)
$$
On the other hand, countable subadditivity implies that
$$
m^*(A\cap E) \le \sum_{n=1}^\infty m^*(A \cap E_n)
$$
Therefore,
$$
m^*(A\cap E) = \sum_{n=1}^\infty m^*(A \cap E_n)
$$


## Royden-Fitzpatrick 27

Let $\mathcal{M}'$ be a $\sigma$-algebra of subsets of $\textbf{R}$ and $m'$ a set function on $\mathcal{M}'$ taking values in $[0,\infty]$ that is countably addititve, and $m'(\varnothing) = 0$.

### (i)

$m'$ is finitely additive, monotone, countably monotone, and possesses the excision property.

_Proof_. Let $A_1, \dots, A_n$ be a finite sequence of disjoint subsets of $\textbf{R}$ that belong that $\mathcal{M}'$. Let $B_k = A_k$ for $1 \le k \le n$, and let $B_k = \varnothing$ for $k > n$. Then, $\{B_k\}$ consists of pairwise disjoint subsets that all belong to $\mathcal{M}'$, so by the countable additivity of $m'$ and the fact that $m'(\varnothing) = 0$, we obtain
$$
m'\left(\bigcup_{k=1}^n A_k\right) = m'\left(\bigcup_{k=1}^\infty B_k\right) = \sum_{k=1}^\infty m'(B_k) = \sum_{k=1}^n m'(A_k)
$$
so $m'$ is finitely additive.

Let $A \subset B$ both belong to $\mathcal{M}'$. Then $B = A \cup (B \setminus A)$ disjointly, so by the finite additivity and nonnegativity of $m'$, we have $m'(B) = m'(A) + m'(B \setminus A) \ge m'(A)$. Hence, $m'$ is monotone.

Let $E \in \mathcal{M}'$ be covered by a countable collection of sets $\{E_n\}$ belonging to $\mathcal{M}'$. Then by monotonicity and countable additivity of $m'$,
$$
m'(E) \le m'\left(\bigcup_{n=1}^{\infty} E_n\right) = \sum_{n=1}^\infty m'(E_n)
$$
so $m'$ is countably monotone.

Let $A, B \in \mathcal{M}'$ such that $A \subset B$ and $m'(A) < \infty$. Then $B = A \cup (B \setminus A)$, so by finite additivity, $m'(B) = m'(A) + m'(B \setminus A)$. Therefore, $m'(B \setminus A) = m'(B) - m(A)$, so $m'$ has the Excision Property.

### (ii)

Let $\{A_n\}$ be a sequence of ascending sets belonging to $\mathcal{M}'$. Then
$$
m'\left(\bigcup_{n=1}^\infty A_n\right) = \lim_{n\to\infty} m'(A_n)
$$
Let $\{B_n\}$ be a sequence of descending sets belonging to $\mathcal{M}'$ with $m'(B_1) < \infty$. Then
$$
m'\left(\bigcap_{n=1}^\infty B_n\right) = \lim_{n\to\infty} m'(B_n)
$$

_Proof_. First, set $A'_n = A_n \setminus A_{n-1}$, taking $A_0 = \varnothing$. Then $\{A_n'\}$ is a sequence of disjoint sets belonging to $\mathcal{M'}$ with the property that
$$
\bigcup_{n=1}^\infty A_n = \bigcup_{n=1}^\infty A_n',\qquad A_N = \bigcup_{n=1}^N A_n'
$$
By the finite additivity of $m'$, then,
$$
m'(A_N) = \sum_{n=1}^N m'(A_n')
$$
and by the countable additivity of $m'$,
$$
m'\left(\bigcup_{n=1}^\infty A_n\right) = m'\left(\bigcup_{n=1}^\infty A_n'\right) = \sum_{n=1}^\infty m'(A_n') = \lim_{n \to \infty} m'(A_n)
$$

Since $B_n \subset B_1$ for $n \ge 1$, the monotonicity of $m'$ gives $m'(B_n) \le m'(B_1) < \infty$. Moreover, $\bigcup\limits_{k=n}^\infty B_k \subset B_1$ for $n \ge 1$, so monotonicity of $m'$ likewise gives
$$
m'\left(\bigcup_{k=n}^\infty B_k\right) \le m'(B_1) < \infty
$$
Then we can use the Excision property to write
$$
\begin{aligned}
m'(B_1) - m'\left(\bigcap_{n=1}^\infty B_n\right) &= m'\left(B_1\setminus \bigcap_{n=1}^\infty B_n\right)\\
&= m'\left(\bigcup_{n=1}^\infty B_1 \setminus B_n\right)
\end{aligned}
$$
Since $\{B_n\}$ is descending, the sequence $\{B_1 \setminus B_n\}$ is ascending, and the previous fact combined with the Excision property allows us to write
$$
m'(B_1) - m'\left(\bigcap_{n=1}^\infty B_n\right) = \lim_{n\to\infty}m'(B_1 \setminus B_n) = m'(B_1) -\lim_{n\to\infty} m'(B_n)
$$
from which the desired result follows.

## Royden-Fitzpatrick 28

Continuity of measure and finite additivity of measure together imply countable additivity.

_Proof_. Let $\{E_k\}$ be a sequence of disjoint, measurable subsets of $\textbf{R}$. Then define
$$
D_n = \bigcup_{k=1}^n E_k
$$
It is clear that $\{D_n\}$ is ascending, so by the continuity of measure,
$$
m\left(\bigcup_{n=1}^\infty D_n\right) = \lim_{n\to\infty}m(D_n)
$$
On the other hand, we have
$$
\bigcup_{n=1}^\infty D_n = \bigcup_{k=1}^\infty E_k,\quad\text{and}\quad m(D_n) = \sum_{k=1}^n m(E_k)
$$
by construction and the finite additivity of measure. It follows that
$$
m\left(\bigcup_{k=1}^\infty E_k\right)  = \lim_{n\to\infty} \sum_{k=1}^n m(E_k) = \sum_{k=1}^\infty m(E_k)
$$
Therefore, measure is countably additive.
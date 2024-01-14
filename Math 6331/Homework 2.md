# Homework 2

## 2.13

### (a)

By definition, we have
$$
\Delta y(t) = t^{(3)} + 3^t
$$
Summing both sides gives
$$
y(t) = \frac{t^{(4)}}{4} + \frac{3^t}{2} + c(t)
$$
for some function $c(t)$ such that $\Delta c(t) = 0$.

### (b)

By definition, we have
$$
\Delta^2 y(t) = \left(\begin{matrix}t \\5\end{matrix}\right)
$$
Therefore,
$$
\Delta y(t) = \left(\begin{matrix}t \\ 6\end{matrix}\right) + c_1(t)
$$
where $\Delta c_1(t) = 0$. Summing again shows that
$$
y(t) = \left(\begin{matrix}t \\ 7\end{matrix}\right) + tc_1(t) + c_2(t)
$$
where $\Delta c_2(t) = 0$; note that $tc_1(t)$ is an antidifference of $c_1(t)$ because $\Delta[tc_1(t)] = c_1(t) + (t+1)\Delta c_1(t) = c_1(t)$.

## 2.21

Using the summation by parts formula
$$
\sum y(t)\Delta z(t) = y(t)z(t) -\sum Ez(t)\Delta y(t)
$$
with $y(t) =t$ and $\Delta z(t) = \sin(t)$, so that $z(t) = \frac{-\cos\left(t - \frac{1}{2}\right)}{2\sin\left(\frac{1}{2}\right)}$ gives
$$
\begin{aligned}
\sum t\sin(t) &= \frac{-t\cos\left(t-\frac{1}{2}\right)}{2\sin\left(\frac{1}{2}\right)} + \frac{1}{2\sin\left(\frac{1}{2}\right)}\sum \cos\left(t+\frac{1}{2}\right)\\
&= \frac{-t\cos\left(t-\frac{1}{2}\right)}{2\sin\left(\frac{1}{2}\right)} + \frac{\sin(t)}{4\sin^2\left(\frac{1}{2}\right)} + c(t)
\end{aligned}
$$
where $\Delta c(t) = 0$.

## 2.29

Let $x(t) = t^{(-3)}$. Then $\sum x(t) = -\frac{1}{2}t^{(-2)}$. On the other hand, we have
$$
x(t) = \frac{1}{(t+1)(t+2)(t+3)}
$$
Therefore, by the FTDC,
$$
\begin{aligned}
\sum_{k=1}^8 \frac{1}{(k+1)(k+2)(k+3)} &= \sum_{k=1}^8x(k) = -\left.\frac{1}{2}k^{(-2)}\right|_1^{9} = \frac{1^{(-2)}-9^{(-2)}}{2}\\\\
&=\frac{1}{2}\left(\frac{1}{2\cdot3}-\frac{1}{10\cdot11}\right) = \frac{26}{330}=\frac{13}{165}
\end{aligned}
$$

## 3.5

### (a)

Given a checkerboard of size $t+1$ by $t+1$, consider the $t$ by $t$ portion $B$ in the bottom left. Contained entirely in this portion of the checkerboard are $y(t)$ total squares. To count $y(t+1)$, then, we only need to count the squares _not_ entirely contained in $B$.

Let $1 \le n \le t + 1$. Consider the $n$ by $n$ squares not entirely contained in $B$; there are $t + 1 -n + 1 = t - n + 2$ squares containing spaces in the top row, and there are another $t - n +1$ squares containing spaces in the rightmost row, for a total of $2t - 2n + 3$ squares. This gives the total number of squares not entirely contained in $B$ as
$$
\begin{aligned}
\sum_{n=1}^{t+1}2t - 2n + 3 &= (2t+3)(t+1) - (t+1)(t+2)\\
&= 2t^2+5t+3-t^2-3t-2 \\
&= t^2 + 2t + 1
\end{aligned}
$$
Therefore, $y(t+1) = y(t) + t^2+2t+1$. 

### (b)

Subtracting $y(t)$ to the left side of the previous recurrence gives
$$
\Delta y(t) = t^2+2t+1 = t^{(2)}+3t^{(1)}+1
$$
and summing both sides implies that
$$
y(t) = \frac{t^{(3)}}{3} + \frac{3t^{(2)}}{2} + t + C
$$
for some constant $C$. Since a $1$ by $1$ checkerboard has only one square, we must have $y(1) = 1$, which implies that $C = 0$. Thus,
$$
y(t) = \frac{t^{(3)}}{3} + \frac{3t^{(2)}}{2} + t
$$

## 3.6

First, find some $u(t)$ that solves
$$
u(t+1) - 3u(t) = 0
$$
It is easy to see that $u(t) = 3^t$ is a solution. Then we can find $y(t)$ via the formula
$$
\begin{aligned}
y(t) &= u(t)\sum\frac{e^t}{u(t+1)}=3^t\sum \frac{e^t}{3^{t+1}}\\
&= 3^{t-1}\sum \left(\frac{e}{3}\right)^t = 3^{t-1}\left(\frac{1}{\frac{e}{3}-1}\left(\frac{e}{3}\right)^t + c\right)\\
&= \frac{e^t}{e-3}+c3^{t-1}
\end{aligned}
$$
where $c$ is some constant. Since $y(1) = 2$, it follows that
$$
2 = \frac{e}{e-3} + c \implies c = 2 - \frac{e}{e-3}
$$
Therefore,
$$
y(t) = \frac{e^t}{e-3} + \left(2-\frac{e}{e-3}\right)3^{t-1}
$$

## 3.10

### (a)

To solve $y(t+1) - 3y(t) = t6^t$, first note that $u(t) = 3^t$ solves $u(t+1) - 3u(t) = 0$ as in 3.6. Then
$$
\begin{aligned}
y(t) &= u(t)\sum\frac{t6^t}{u(t+1)} = 3^t\sum\frac{t6^t}{3^{t+1}}\\
&= 3^{t-1}\sum t2^t
\end{aligned}
$$
Using summation by parts gives
$$
\begin{aligned}
y(t) &= 3^{t-1}\left(t2^t - \sum2^{t+1}\right)=3^{t-1}((t-2)2^t + c(t))\\
&= 2(t-2)6^{t-1}+c(t)3^{t-1}
\end{aligned}
$$
where $\Delta c(t) = 0$.

### (b)

First try to find $u(n)$ solving
$$
u(n+1) - \frac{n+2}{n+1}u(n) = 0
$$
One solution is
$$
u(n) = \prod_{s=0}^{n-1}\frac{s+2}{s+1} = n+1
$$
Then
$$
\begin{aligned}
y(n) &= u(n)\sum \frac{(n+2)^{(2)}}{u(n+1)} = (n+1)\sum (n+1)^{(1)} \\
&= (n+1)\left(\frac{(n+1)^{(2)}}{2} + c(n)\right)\\
&= \frac{n(n+1)^2}{2} + (n+1)c(n)
\end{aligned}
$$
where $\Delta c(n) = 0$.

### (c)

First, find a solution $u(t)$ of
$$
u(n+1) -\frac{n}{n+1}u(t) = 0
$$
One solution is given by
$$
u(n) = \prod_{s=1}^{n-1}\frac{s}{s+1} = \frac{1}{n}
$$
Then
$$
\begin{aligned}
y(n) &= u(n)\sum\frac{\frac{n}{n+1}}{u(n+1)}=\frac{1}{n}\sum n\\
&= \frac{1}{n}\left(\frac{n^{(2)}}{2} + c(n)\right) = \frac{n-1}{2} + \frac{c(n)}{n}
\end{aligned}
$$
where $\Delta c(n) = 0$.

### (d)

First, find a solution $u(n)$ of
$$
u(n+1)- (n+2)u(n) = 0
$$
One solution is given by
$$
u(n) = \prod_{s=0}^{n-1}(s+2) = (n+1)!
$$
Then
$$
\begin{aligned}
y(n) &= u(n)\sum \frac{(n+3)!}{u(n+1)} = (n+1)!\sum (n+3)\\
&= (n+1)!\left(\frac{(n+3)^{(2)}}{2}+c(n)\right) = \frac{(n+3)!}{2} + c(n)(n+1)!
\end{aligned}
$$
where $\Delta c(n) = 0$.

## 3.16

### (a)

Let $n \ge 1$, and let $a_{ij}$ be the component of an $(n+1)\times(n+1)$ matrix $A$ in the $i$th row and $j$th column. Then the expansion by cofactors formula for $|A|$ using the top row is
$$
|A| = \sum_{j=1}^{n+1} (-1)^{j+1}a_{1j}\left|A^{(j)}\right|
$$
where $A^{(j)}$ is the $n \times n$ matrix consisting of the rows of $A$ starting from row $2$ and excluding column $j$. Not counting the negations, this computation requires $n+1$ multiplications to compute $a_{1j}\left|A^{(j)}\right|$ for each $j$ plus the $n+1$ times the number of multiplications required to compute $\left|A^{(j)}\right|$ (the same for all $j$, since each of the matrices is $n\times n$). That is,
$$
y_{n+1} = n+1 + (n+1) y_n = (n+1)(y_n + 1)
$$

### (b)

The determinant of a $1\times 1$ matrix is just the one component, so it requires $0$ multiplications to compute. Therefore, $y_1 = 0$. The relation derived above is equivalent to
$$
y(n+1) - (n+1)y(n) =n+1
$$
First, find a solution $u(n)$ to
$$
u(n+1) - (n+1) u(n) = 0
$$
One solution is
$$
u(n) = \prod_{s=1}^{n-1} (s+1) = n!
$$
Then
$$
\begin{aligned}
y(n) &= u(n)\sum\frac{n+1}{u(n+1)} = n!\sum\frac{1}{n!}\\
&=n!\sum_{k=1}^{n-1}\frac{1}{k!}
\end{aligned}
$$
where the lower bound $k=1$ on the finite sum is chosen to ensure that $y(1)=0$.

## 3.18

Suppose that $y(x) = \sum_{n=0}^\infty a_n x^n$ and $y'(x) = y(x) + e^x$.

### (a)

Then, assuming convergence and differentiating term-by-term gives
$$
\sum_{n=0}^\infty a_nnx^{n-1} = \sum_{n=0}^\infty a_nx^n + \sum_{n=0}^\infty\frac{x^n}{n!}
$$
and equating powers of $x$ on each side implies that
$$
a_{n+1}(n+1) = a_n + \frac{1}{n!}
$$
or
$$
a_{n+1} = \frac{a_n}{n+1} + \frac{1}{(n+1)!}
$$

### (b)

First, find a solution $u(n)$ of
$$
u(n+1) - \frac{1}{n+1}u(n) = 0
$$
One solution is given by
$$
u(n) = \prod_{s=0}^{n-1}\frac{1}{n+1} = \frac{1}{n!}
$$
Then
$$
\begin{aligned}
a(n) &= u(n)\sum\frac{\frac{1}{(n+1)!}}{u(n+1)} = \frac{1}{n!}\sum 1\\
&=\frac{n+c}{n!}
\end{aligned}
$$
for some constant $c$. Since $y(0) = a_0$, it follows that $c = a_0$, so $a_n = \frac{n+a_0}{n!}$. Then
$$
y(x) = \sum_{n=0}^\infty \frac{n+a_0}{n!}x^n = x\sum_{n=0}^\infty\frac{x^n}{n!} + a_0\sum_{n=0}^\infty\frac{x^n}{n!} = (x+a_0)e^x
$$

## 3.20

To solve $u(t+1) = \frac{2t^3}{3(t+1)^2}u(t)$, rewrite the equation as
$$
u(t+1) = \frac{2}{3}\frac{ttt}{(t+1)(t+1)}u(t)
$$
which we have an explicit formula to solve:
$$
u(t) = c(t)\left(\frac{2}{3}\right)^t\frac{\Gamma(t)\Gamma(t)\Gamma(t)}{\Gamma(t+1)\Gamma(t+1)} = c(t)\left(\frac{2}{3}\right)^t\frac{\Gamma(t)}{t^2}
$$
where $\Delta c(t) = 0$

## 3.23

Rewrite the equation to fit the definition of order:
$$
\begin{aligned}
0 &=\Delta^3y(t) + \Delta^2y(t) - \Delta y(t)-y(t)\\
&= y(t+3) -3y(t+2) +3y(t+1) -y(t)\\
&\qquad {}+ y(t+2)-2y(t+1)+y(t) -y(t+1)+y(t)-y(t)\\
&= y(t+3)-2y(t+2)
\end{aligned}
$$
which is equivalent to
$$
y(t+1) -2y(t) = 0
$$
upon substituting $t-2$ for $t$. This is clearly a second order equation.
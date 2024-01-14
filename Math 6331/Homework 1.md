# Homework 1
## 1.2
Let $y(t)$ be the population of Sludge Falls at the beginning of the year $1970 + t$, so that $y(0) = 50{\small,}000$ and $y(10) = 75{\small,}000$. The assumption that the population at the beginning of any year is proportional to the population at the end implies that there is some constant $k$ such that $y(t + 1) = ky(t)$ for all $t$.

This recursive equation is easy to solve in terms of $y(0)$, as $y(1) = ky(0)$, $y(2) =k y(1) = k^2y(0)$, and so on, which gives $y(t) = k^ty(0)$. The initial conditions imply that $75 = 50k^{10}$, so $k = \left(\frac{3}{2}\right)^{\frac{1}{10}}$.

Therefore, the population in the year 2000 will be $y(30) = 50{\small,}000\left(\frac{3}{2}\right)^3 = 168{\small,}750$.

## 1.6
Let $y(t)$ be the temperature in ${}^\circ\text{F}$ of the body after $t$ minutes have elapsed since immersion in the water, so that $y(0) = 80$. Since the body of water is large, we can assume its temperature to be a constant $50^\circ\text{F}$ at all times $t$. 

The assumption that the difference in the temperature of the body at the beginning of a minute and at the end of that minute (which is $y(t+1) - y(t)$, if the minute begins at time $t$) is proportional to the difference between the temperature of the body and the temperature of the water (always $50^\circ\text{F}$) at the beginning of the minute implies that there is some constant $k$ such that $y(t + 1) - y(t) = k(y(t) - 50)$ for all $t$.

This means that $y(t+1) = (k+1)y(t) - 50k$, from which the following pattern gives $y(t)$ in terms of $y(0)$:
$$
\begin{aligned}
y(1) &= (k+1)y(0) - 50k\\
y(2) &= (k+1)y(1) - 50k = (k+1)^2y(0)-50k((k+1) + 1)\\
y(3) &= (k+1)y(2) - 50k = (k+1)^3y(0)-50k((k+1)^2 + (k+1) + 1)\\\\
&\vdots\\
y(t) &= (k+1)^ty(0)-50k\sum_{p=0}^{t-1}(k+1)^p\\
&= (k+1)^ty(0)-50((k+1)^t - 1)\\
&=50 + (k+1)^t(y(0) - 50)=50 + 30(k+1)^t
\end{aligned}$$
If the temperature of the body is $70^\circ\text{F}$ at $t=20$ minutes, then we have 
$$
\begin{aligned}
&y(20) = 50 + 30(k+1)^{20} = 70\\
&\implies k=\left(\frac{2}{3}\right)^\frac{1}{20} - 1\\
&\implies y(t) = 50 + 30\left(\frac{2}{3}\right)^\frac{t}{20}
\end{aligned}
$$
From this, we can conclude that the temperature after 10 minutes is $y(10)=50 + 30\left(\frac{2}{3}\right)^\frac{1}{2} \approx 74.495^\circ \text{F}$. 

The temperature of the body will reach $60^\circ \text{F}$ when $y(t) = 60$, that is, when $50 + 30\left(\frac{2}{3}\right)^\frac{t}{20} = 60$, or at
$$
t = 20\frac{\log\left(\frac{1}{3}\right)}{\log\left(\frac{2}{3}\right)}\approx54.190 \text{ min}
$$
the body will be $60^\circ \text{F}$.

## 1.8

### (a)

Suppose that a set $S$ of $t$ lines is given in the manner described. Let a $(t+1)$th line $\ell$ be added so that it is parallel to none of the lines in $S$ and no three of the lines in $S\cup\{\ell\}$ intersect at a point.

The line $\ell$ is not parallel to any line in $S$, so it intersects each of them at exactly one point; moreover, since no three lines intersect at a point, each of the intersections of $\ell$ with a line in $S$ is distinct from the others.

Let these $t$ distinct intersection points be $P_1, P_2, \dots P_t$, given in the order of their appearance on $\ell$, that is, so that $P_i$ is between $P_{i-1}$ and $P_{i+1}$ on $\ell$. Since there are no intersections between $\ell$ and any other line between $P_i$ and $P_{i+1}$ or on the parts of $\ell$ beyond $P_1$ and $P_t$, the interior of each segment $P_iP_{i+1}$ and each of the two rays emanating from $P_1$ and $P_t$ lies entirely in exactly one region of the plane partitioned by the lines $S$; if the interior were contained in two regions, then there would have to be an intersection with a line in $S$ at a point different from the $P_i$, which is impossible.

Furthermore, no two of these segments or rays lie in the same region (because a line in $S$ separates any two distinct segements or rays, meaning they are in different regions). Thus, $\ell$ partitions each of these $t+1$ distinct regions into two new regions for a total of $2t+2$ new regions, all of which are distinct. 

Finally, we have accounted for all of the regions containing $\ell$, so the addition of $\ell$ does not partition any other regions. Therefore, adding $\ell$ to $S$ changes the number of regions by $2t+2$ new regions minus $t+1$ old regions, for a net $t+1$ regions difference.

Adding the net region difference to the number of regions partitioned by $S$ shows that $R(t+1) = R(t) + t + 1$.

### (b)

Assuming the results in exercise 1.7 are correct, we see that $R$ satisfies the difference equation given in 1.7(b), which means that $R(t) = \frac{1}{2}t^2 + \frac{1}{2}t +A$ for some constant $A$. Since $R(1) = 2$, we must have $A = 1$, and therefore 
$$
R(t) = \frac{1}{2}t^2 + \frac{1}{2}t + 1$$

## 1.13

### (a)

By definition
$$
\left[\Gamma\left(\frac{1}{2}\right)\right]^2 =\int_0^\infty t^{-\frac{1}{2}}e^{-t}\;\text{d}t\int_0^\infty s^{-\frac{1}{2}}e^{-s}\;\text{d}s
$$
Using the substitutions $x = t^{\frac{1}{2}}$ and $y=s^\frac{1}{2}$ yields $t = x^2$ and $s = y^2$, so $\text{d}t = 2x\;\text{d}x$ and $\text{d}s = 2y\;\text{d}y$. The bounds of integration remain the same, so
$$
\begin{aligned}
\left[\Gamma\left(\frac{1}{2}\right)\right]^2 &=\int_0^\infty \left({x^2}\right)^{-\frac{1}{2}}e^{-x^2}2x\;\text{d}x\int_0^\infty \left(y^2\right)^{-\frac{1}{2}}e^{-y^2}2y\;\text{d}y\\
&=4\int_0^\infty e^{-x^2}\;\text{d}x\int_0^\infty e^{-y^2}\;\text{d}y
\end{aligned}
$$

The $x$ integral is constant with respect to the dummy variable $y$, so we can take the whole integral inside to obtain
$$
\left[\Gamma\left(\frac{1}{2}\right)\right]^2 = 4\int_0^\infty\int_0^\infty e^{-\left(x^2+y^2\right)}\;\text{d}x\;\text{d}y
$$
as desired.

### (b)

Converting to polar coordinates gives $x^2+y^2 = r^2$, and $\text{d}x\;\text{d}y=r\;\text{d}\theta\;\text{d}r$. The region of the plane covered by $(x,y) \in [0,\infty)\times[0,\infty)$ is the same as the region covered by $\theta \in \left[0, \frac{\pi}{2}\right]$ and $r \in [0,\infty)$. This implies that
$$
\begin{aligned}
\left[\Gamma\left(\frac{1}{2}\right)\right]^2 &= 4\int_0^\infty\int_0^{\frac{\pi}{2}}re^{-r^2}\;\text{d}\theta\;\text{d}r \\
&= \pi\int_0^{\infty}2re^{-r^2}\;\text{d}r
\end{aligned}
$$
Since an antiderivative of $2re^{-r^2}$ is $-e^{-r^2}$, we have
$$
\begin{aligned}
\left[\Gamma\left(\frac{1}{2}\right)\right]^2 &= 
\pi\lim_{R\to\infty}\left[-e^{-r^2}\right]_0^R
\end{aligned}=\pi
$$
from which it follows that $\Gamma\left(\frac{1}{2}\right) = \sqrt{\pi}$.

### (c)

Using the identity $\Gamma(t+1) = t\Gamma(t)$ we can obtain $\Gamma\left(\frac{5}{2}\right) = \frac{3}{2}\cdot\frac{1}{2}\cdot\Gamma\left(\frac{1}{2}\right) = \frac{3\sqrt{\pi}}{4}$, and similarly $\Gamma(\frac{1}{2}) = \left(-\frac{1}{2}\right)\cdot\left(-\frac{3}{2}\right)\cdot\Gamma\left(-\frac{3}{2}\right) = \frac{3}{4}\Gamma\left(-\frac{3}{2}\right)$, which implies that $\Gamma\left(-\frac{3}{2}\right) = \frac{4\sqrt{\pi}}{3}$.

## 2.3

This formula can be derived by applying the product rule twice:
$$
\begin{aligned}
\Delta[x(t)y(t)z(t)] &= \Delta[x(t)\left(y(t)z(t)\right)]\\\\
&= \Delta x(t)E\left[y(t)z(t)\right]+x(t)\Delta[y(t)z(t)]\\\\
&=\Delta x(t)Ey(t)Ez(t) + x(t)[\Delta y(t) Ez(t) + y(t)\Delta z(t)]\\\\
&= \Delta x(t)Ey(t)Ez(t) + x(t)\Delta y(t) Ez(t) + x(t)y(t)\Delta z(t)
\end{aligned}
$$
Since $xyz = xzy = yxz = yzx = zxy = zyx$, we can also immediately conclude that
$$
\begin{aligned}
\Delta[x(t)y(t)z(t)] &= \Delta x(t)Ez(t)Ey(t) + x(t)\Delta z(t) Ey(t) + x(t)z(t)\Delta y(t)\\\\
&= \Delta y(t)Ex(t)Ez(t) + y(t)\Delta x(t)Ez(t) + y(t)x(t)\Delta z(t)\\\\
&= \Delta y(t)Ez(t)Ex(t) + y(t)\Delta z(t) Ex(t) + y(t)z(t)\Delta x(t)\\\\
&= \Delta z(t)Ex(t)Ey(t) + z(t)\Delta x(t) Ey(t) + z(t)x(t)\Delta y(t)\\\\
&= \Delta z(t)Ey(t)Ex(t) + z(t)\Delta y(t) Ex(t) + z(t)y(t)\Delta x(t)\\

\end{aligned}
$$

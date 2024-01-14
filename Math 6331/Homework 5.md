# Homework 5

## 3.79

### (a)

Rewrite the equation as
$$
\left(E^2 - (2n+1)E + n^2\right)u(n) = 0
$$
We have $(E-n)(E-n) = \left(E^2-(2n+1)E + n^2\right)$:
$$
\begin{aligned}
(E-n)(E-n)u(n) &= (E-n)(Eu(n) - nu(n)) =\\
 &=E^2u(n)-(n+1)Eu(n) -nEu(n) + n^2u(n) \\
 &= \left(E^2 -(2n+1)E + n^2\right)u(n)
\end{aligned}
$$
Setting $v(n) = (E-n)u(n)$ implies that $(E-n)v(n) = v(n+1) - nv(n) = 0$. A general solution of this equation is $v(n) = c_1(n)\Gamma(n)$, where $\Delta c_1(n) = 0$. 

Substituting $v(n)$ gives $u(n+1) - nu(n) = c_1(n)\Gamma(n)$. We already found that a solution of the homogeneous equation $w(n+1) - nw(n) =0$ is $w(n) = \Gamma(n)$, so
$$
\begin{aligned}
u(n) &= w(n) \sum \frac{c_1(n)\Gamma(n)}{w(n+1)} = \Gamma(n)\sum\frac{c_1(n)\Gamma(n)}{\Gamma(n+1)}\\
&= \Gamma(n)\sum \frac{c_1(n)}{n} = \Gamma(n)\sum_{k=1}^{n-1}\frac{c_1(k)}{k} + \Gamma(n)c_2(n)
\end{aligned}
$$
where $\Delta c_2(n) = 0$.

### (b)

Rewrite the equation as
$$
\left(E^2-  (e^n+1)E + e^n\right)u(n) = 0
$$
We have $(E-e^n)(E-1) = \left(E^2 - (e^n +1)E + e^n\right)$:
$$
\begin{aligned}
(E-e^n)(E-1)u(n) &= (E-e^n)(Eu(n) - u(n)) = \\
&= E^2u(n) - Eu(n) -e^nEu(n)+e^nu(n) \\
&= (E^2 - (e^n + 1)E + e^n)u(n)
\end{aligned}
$$
Setting $v(n) = (E-1)u(n)$ gives $(E-e^n)v(n) = v(n+1) - e^nv(n) = 0$. A general solution of this equation is $v(n) = c_1(n)\prod_{k=0}^{n-1} e^k = c_1(n)e^{\frac{n(n-1)}{2}}$, where $\Delta c_1(n) = 0$. Substituting into the original equation gives $(E-1)u(n) = \Delta u(n) = c_1(n)e^{\frac{n(n-1)}{2}}$. Therefore,
$$
u(n) = \sum c_1(n)e^\frac{n(n-1)}{2} = \sum_{k=1}^{n-1}c_1(k)e^\frac{k(k-1)}{2}+c_2(n)
$$
where $\Delta c_2(n) = 0$.

## 3.84

### (a)

This is a Cauchy-Euler equation with characteristic equation $2r(r-1) + 8r + 4 = 0$, which factors as $(r+2)(r+1)= 0$, so it has roots $r=-1,-2$. Then a general solution of the equation is
$$
u(t) = c_1(t-3)^{(-2)} + c_2(t-2)^{(-1)} = \frac{c_1}{(t-2)(t-1)} + \frac{c_2}{t-1}
$$

### (b)

This is a Cauchy-Euler equation with characteristic equation $r(r-1) -3r+4=0$, which factors as $(r-2)^2 = 0$, which has roots $r=2,2$. Then one solution is $u_1(t)=(t+1)^{(2)}$. 

Expanding the $\Delta$s in the equation gives
$$
t(t+1)(u(t+2) - 2u(t+1)+u(t)) -3t(u(t+1)-u(t))+4u(t) = 0
$$
or
$$
t(t+1)u(t+2) - t(2t+5)u(t+1) + (t+2)^2u(t) = 0
$$
Therefore, the Wronskian $w(t)$ satisfies $w(t+1) = w(t)\frac{(t+2)^2}{t(t+1)}$, a solution of which is $w(t) = \frac{\Gamma^2(t+2)}{\Gamma(t)\Gamma(t+1)}=t(t+1)^2$, so a second, linearly independent solution of the equation is
$$
\begin{aligned}
u_2(t) &= u_1(t) \sum \frac{w(t)}{u_1(t)u_1(t+1)} \\
&= (t+1)^{(2)}\sum \frac{t(t+1)^2}{(t+1)^{(2)}(t+2)^{(2)}} \\
&= (t+1)^{(2)}\sum \frac{1}{t+2} \\
&= (t+1)^{(2)}\left(\sum_{s=1}^{t-1}\frac{1}{s+2}\right)
\end{aligned}
$$
where we ignore the arbitrary periodic function in the antidifference because any antidifference will give us a linearly independent solution. Therefore, a general solution of the equation is
$$
u(t) = (t+1)^{(2)}\left(c_1 + c_2\sum_{s=1}^{t-1}\frac{1}{s+2}\right)
$$

## 3.86

The homogeneous equation $t(t+1)\Delta^2 u(t) - 2t \Delta u(t) + 2u(t) = 0$ is a Cauchy-Euler equation with characteristic equation $r(r-1) -2r + 2 = 0$, which factors as $(r-1)(r-2) = 0$, which has roots $r=1,2$, so two linearly independent solutions are
$$
u_1(t) = t \qquad u_2(t) = (t+1)^{(2)}
$$
By variation of parameters, a solution of the nonhomogeneous equation is given by $y_p(t) = a_1(t)u_1(t) + a_2(t)u_2(t)$, where $a_1(t)$ and $a_2(t)$ satisfy
$$
\begin{aligned}
u_1(t+1)\Delta a_1(t) + u_2(t+1)\Delta a_2(t) &= 0 \\
u_1(t+2)\Delta a_1(t) + u_2(t+2)\Delta a_2(t) &= \frac{t}{t(t+1)}
\end{aligned}
$$
which implies that $\Delta a_1(t) = -\frac{(t+2)^{(2)}}{t+1}\Delta a_2(t) = -(t+2)\Delta a_2(t)$. Substituting into the second equation gives
$$
\big[-(t+2)^2 + (t+3)^{(2)}\big]\Delta a_2(t) = \frac{1}{t+1}
$$
or $(t+2)(t+3 - (t+2))\Delta a_2(t) = \frac{1}{t+1}$, or $\Delta a_2(t) = \frac{1}{(t+1)(t+2)}=t^{(-2)}$. Then $\Delta a_1(t) = -\frac{1}{t+1}$. We can use any antidifference for $a_1(t)$ and $a_2(t)$, so we can choose
$$
\begin{aligned}
a_1(t) &= -\sum_{s=1}^{t-1}\frac{1}{s+1}\\
a_2(t) &= -t^{(-1)} = -\frac{1}{t+1}
\end{aligned}
$$
Thus,
$$
y_p(t) = -\sum_{s=1}^{t-1}\frac{t}{s+1} - t
$$
Then a general solution of the original equation is
$$
y(t) = c_1t + c_2(t+1)^{(2)} -\sum_{s=1}^{t-1}\frac{t}{s+1} - t
$$

## 3.96

### (a)

Let $y(t) = \frac{z(t+1)}{z(t)} - 2$. Then $z$ satisfies
$$
\left(\frac{z(t+2)}{z(t+1)}-2\right)\left(\frac{z(t+1)}{z(t)}-2\right) +2\frac{z(t+2)}{z(t+1)} - 4 + 7\frac{z(t+1)}{z(t)} - 14 + 20 =0
$$
or
$$
z(t+2)+5z(t+1) +6 = 0
$$
The characteristic equation of this homogeneous difference equation is $\lambda^2 +5\lambda +  6 = (\lambda+2)(\lambda+3)=0$, which has roots $\lambda=-2,-3$, so
$$
z(t) = c_1(-2)^t + c_2(-3)^t
$$
for some constants $c_1,c_2$ not both zero. Therefore,
$$
\begin{aligned}
y(t) &= \frac{c_1(-2)^{t+1} + c_2(-3)^{t+1}}{c_1(-2)^t +c_2(-3)^t} - 2\\\\
&= \begin{cases}
	-\frac{2^{t+1} + c3^{t+1}}{2^t + c3^t} - 2 & c_1 \ne 0,\,c=\frac{c_2}{c_1} \\\\
	-5 & c_1=0,\,c_2\ne 0
\end{cases}
\end{aligned}
$$

### (b)

Let $y(t) = \frac{z(t+1)}{z(t)}$. Then $z(t)$ satisfies
$$
\frac{z(t+2)}{z(t)} - 2\frac{z(t+1)}{z(t)} + 2 = 0
$$
or
$$
z(t+2) -2z(t+1) + 2z(t) = 0
$$
This equation has characteristic equation $\lambda^2 - 2\lambda +2=0$, which has roots $\lambda = 1 \pm \frac{1}{2}\sqrt{4-8} = 1\pm i$, so a general solution for $z(t)$ is
$$
z(t) = \left(\sqrt{2}\right)^t\left[c_1\cos\left(\frac{\pi}{4}t\right) + c_2\sin\left(\frac{\pi}{4}t\right)\right]
$$
Then
$$
\begin{aligned}
y(t) &= \sqrt{2}\cdot\frac{
	c_1\cos\left(\frac{\pi}{4}t+\frac{\pi}{4}\right) + c_2\sin\left(\frac{\pi}{4}t+\frac{\pi}{4}\right)
}{
	3c_1\cos\left(\frac{\pi}{4}t\right) + c_2\sin\left(\frac{\pi}{4}t\right)
} \\\\
&= \frac{
	(c_1+c_2)\cos\left(\frac{\pi}{4}t\right) + (c_2-c_1)\sin\left(\frac{\pi}{4}t\right)
}{
	c_1\cos\left(\frac{\pi}{4}t\right) + c_2\sin\left(\frac{\pi}{4}t\right)
} \\\\
&= \begin{cases}
\frac{(c+1)\cos\left(\frac{\pi}{4}t\right)+ (c-1)\sin\left(\frac{\pi}{4}t\right)}{\cos\left(\frac{\pi}{4}t\right) + c\sin\left(\frac{\pi}{4}t\right)} & c_1 \ne 0,\, c=\frac{c_2}{c_1}\\\\
1+\cot\left(\frac{\pi}{4}t\right)& c_1 = 0,\,c_2\ne 0
\end{cases}
\end{aligned}
$$

## 3.99

Look for a positive solution. Taking $\log$ of both sides and setting $z(n) = \log y(n)$ gives
$$
z(n+1) - z(n)= \log(2) + \frac{1}{n}z(n)
$$
or
$$
z(n+1) - \left(\frac{n+1}{n}\right)z(n) = \log(2)
$$
A solution of the homogeneous equation $u(n+1) - \left(\frac{n+1}{n}\right)u(n)=0$ is $u(n) = \prod_{k=1}^{n-1}\frac{k+1}{k} = n$. Hence,
$$
\begin{aligned}
z(n) &= u(n)\sum\frac{\log(2)}{u(n+1)} = n\sum \frac{\log(2)}{n}\\
&= n\left(c(n) + \log(2)\sum_{k=1}^{n-1}\frac{1}{k}\right) = nc(n) + n\log(2)\sum_{k=1}^{n-1}\frac{1}{k}
\end{aligned}
$$
where $\Delta c(n) = 0$. Thus,
$$
\begin{aligned}
y(n) &= e^{z(n)} = \exp\left(nc(n)\right)\exp\left(n\log(2)\sum_{k=1}^{n-1}\frac{1}{k}\right) \\
&= (d(n))^n\cdot 2^{\sum_{k=1}^{n-1}\frac{n}{k}} = (d(n))^n\prod_{k=1}^{n-1}2^\frac{n}{k}
\end{aligned}
$$
where $d(n) = e^{c(n)}$.

## 3.100

Let $z(t) = y^2(t)$. Then
$$
z(t+1) - \frac{t}{t+1}z(t) = \frac{1}{t+1}
$$
The homogeneous equation $u(t+1) - \frac{t}{t+1}u(t) = 0$ is solved by $u(t) = \prod_{s=1}^{t-1}\frac{s}{s+1} = \frac{1}{t}$, so
$$
z(t) = u(t)\sum\frac{\frac{1}{t+1}}{u(t+1)} =u(t)\sum1 = \frac{t+c(t)}{t} = 1 + \frac{c(t)}{t}
$$
where $\Delta c(t) = 0$ and $c(t)$ is chosen such that $1+\frac{c(t)}{t} \ge 0$ for all $t$ in the domain of $y(t)$ and $z(t)$. Thus,
$$
y(t) = \pm\sqrt{z(t)} = \pm\sqrt{1+\frac{c(t)}{t}}
$$
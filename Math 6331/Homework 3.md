# Homework 3

## 3.31

### (a)

The characteristic polynomial of this homogeneous, constant-coefficient equation is $(\lambda -6)^5$, which has the 5-times repeated root $\lambda = 6$, so a general solution of the difference equation is
$$
u(t) = 6^t(c_0 + c_1t + c_2t^2 + c_3t^3 + c_4t^4)
$$

### (b)

The characteristic equation $\lambda^2 + 6\lambda + 3 = 0$ has roots
$$
\lambda = -3 \pm \frac{1}{2}\sqrt{24}= -3\pm \sqrt{6}
$$
so a general solution of the difference equation is
$$
u(t) = c_1(-3 + \sqrt{6})^t + c_2(-3-\sqrt{6})^t
$$

### (c)

The characteristic equation $\lambda^3 - 4\lambda^2 + 5\lambda - 2 = 0$ factors as
$$
(\lambda - 1)(\lambda^2 - 3\lambda + 2) = (\lambda - 1)^2(\lambda-2)
 = 0
$$
so its roots are $\lambda = 1,1,2$, and a general solution of the difference equation is
$$
u(t) = c_12^t + c_2 + c_3t
$$

### (d)

The characteristic equation $\lambda^4 - 8\lambda^2 + 16 = 0$ factors as
$$
0 = (\lambda^2 - 4)^2 = (\lambda-2)^2(\lambda+2)^2
$$
which has roots $\lambda = -2, -2, 2, 2$, so a general solution of the difference equation is
$$
u(t) = (-2)^t(c_1 + c_2t) + 2^t(c_3+ c_4t)
$$

## 3.32

### (a)

The characteristic equation $\lambda^2 + 1 = 0$, so $\lambda = \pm i$ are its roots. Then a general solution of the difference equation is
$$
u(t) = c_1\cos\left(\frac{\pi}{2}t\right) + c_2\sin\left(\frac{\pi}{2}t\right)
$$

### (b)

The characteristic equation $\lambda^2 - 8\lambda + 32=0$ has roots
$$
\lambda = 4 \pm \frac{1}{2}\sqrt{-64} = 4 \pm 4i = 4\sqrt{2}e^{i\frac{\pi}{4}}
$$
so a general solution of the difference equation is
$$
u(t) = \left(4\sqrt{2}\right)^t\left(c_1\cos\left(\frac{\pi}{4}t\right) + c_2\sin\left(\frac{\pi}{4}t\right)\right)
$$

### (c)

The characteristic equation $\lambda^4 + 2\lambda^2 + 1=0$ factors as
$$
(\lambda^2 + 1)^2 = (\lambda - i)^2(\lambda+i)^2=0
$$
which has roots $\lambda = -i, -i, i, i$, so two complex solutions of the difference equation are
$$
\begin{gathered}
u_1(t) = i^t=e^{i\frac{\pi}{2}t} = \cos\left(\frac{\pi}{2}t\right) + i\sin\left(\frac{\pi}{2}t\right) \\ 
u_2(t) = ti^t = te^{i\frac{\pi}{2}t} =t\cos\left(\frac{\pi}{2}\right) + it\sin\left(\frac{\pi}{2}t\right)
\end{gathered}
$$
which gives four linearly independent solutions by taking the real and imaginary parts of $u_1$ and $u_2$:
$$
\cos\left(\frac{\pi}{2}t\right),\sin\left(\frac{\pi}{2}t\right),t\cos\left(\frac{\pi}{2}t\right),t\sin\left(\frac{\pi}{2}t\right),
$$
Then a general solution of the difference equation is
$$
u(t) = c_1\cos\left(\frac{\pi}{2}t\right)+c_2\sin\left(\frac{\pi}{2}t\right) + c_3t\cos\left(\frac{\pi}{2}t\right) + c_4t\sin\left(\frac{\pi}{2}t\right),
$$

### (d)

The characteristic equation $\lambda^6 + 2\lambda^3 + 1$ factors as
$$
(\lambda^3 +1)^2 = (\lambda + 1)^2(\lambda^2 - \lambda + 1)^2 = 0
$$
The polynomial $\lambda^2 - \lambda +1$ has roots
$$
\lambda = \frac{1}{2} \pm \frac{1}{2}\sqrt{1 - 4} = \frac{1\pm i\sqrt{3}}{2}
$$
so the characteristic equation can be written as
$$
(\lambda + 1)^2\left(\lambda - \frac{1 + i\sqrt{3}}{2}\right)^2\left(\lambda - \frac{1 - i\sqrt{3}}{2}\right)^2=0
$$
which has roots $\lambda = -1, -1, \frac{1+i\sqrt{3}}{2}, \frac{1+i\sqrt{3}}{2}, \frac{1-i\sqrt{3}}{2}, \frac{1-i\sqrt{3}}{2}$. Then $\frac{1+i\sqrt{3}}{2} = e^{i\frac{\pi}{3}}$, so two complex solutions of the difference equation are
$$
\begin{gathered}
u_1(t) = e^{i\frac{\pi}{3}t} = \cos\left(\frac{\pi}{3}t\right) + i\sin\left(\frac{\pi}{3}t\right)\\
u_2(t) = te^{i\frac{\pi}{3}t} = t\cos\left(\frac{\pi}{3}t\right) + it\sin\left(\frac{\pi}{3}t\right)\\
\end{gathered}
$$
which gives four linearly independent solutions on taking the real and imaginary parts of $u_1$ and $u_2$:
$$
\cos\left(\frac{\pi}{3}t\right), \sin\left(\frac{\pi}{3}t\right), t\cos\left(\frac{\pi}{3}t\right), t\sin\left(\frac{\pi}{3}t\right)
$$
Another two linearly independent solutions are $(-1)^t = \cos(\pi t)$ and $t(-1)^t = t\cos(\pi t)$, which gives the general solution of the difference equation
$$
u(t) = c_1\cos(\pi t) + c_2t\cos(\pi t) + c_3\cos\left(\frac{\pi}{3}t\right) + c_4 \sin\left(\frac{\pi}{3}t\right) + c_5 t\cos\left(\frac{\pi}{3}t\right) + c_6 t\sin\left(\frac{\pi}{3}t\right)
$$

## 3.34

### (a)

Taking the delta derivative of $(t+\sqrt{2})^2$ three times gives $0$, so a homogeneous equation solved by $(t+\sqrt{2})^2$ is
$$
\Delta^3u(t) = 0
$$

### (b)

Taking the delta derivative of $t^5$ six times gives $0$, so a homogeneous equation solved by $t^5$ is
$$
\Delta^6 u(t) = 0
$$

### (c)

$t(-3)^t$ is a solution from an equation whose characteristic polynomial has root $-3$ repeated at least twice. Therefore, $t(-3)^t$ is a solution of
$$
(E+3)^2u(t) = u(t+2) + 6u(t+1) + 9u(t) = 0
$$

### (d)

$2^{-t}\sin\left(\frac{2\pi}{3}t\right) = \text{Im}\left(\left(\frac{1}{2}e^{i\frac{2\pi}{3}}\right)^t\right)$, so it is a solution of an equation whose characteristic polynomial has roots $\frac{1}{2}e^{\pm i\frac{2\pi}{3}} = \frac{-1\pm i\sqrt{3}}{4}$. Therefore, $2^{-t}\sin\left(\frac{2\pi}{3}t\right)$ is a solution of
$$
\begin{aligned}
0&=\left(E - \frac{-1+i\sqrt{3}}{4}\right)\left(E - \frac{-1-i\sqrt{3}}{4}\right)u(t) = \left(E^2 + \frac{1}{2}E + \frac{1}{4}\right)u(t)\\
&=u(t+2) + \frac{1}{2}u(t+1) + \frac{1}{4}u(t)
\end{aligned}
$$

## 3.36

### (a)

Rewriting the equation with $E$ gives
$$
2^t = (8E^2-6E+1)y(t) = (2E -1)(4E-1)y(t)
$$
and applying $E-2$ to both sides gives
$$
0 = (E-2)(2E-1)(4E-1)y(t)
$$
The characteristic equation of this difference equation has roots $2$, $\frac{1}{2}$, and $\frac{1}{4}$, so
$$
y(t) = c_12^t + c_2\left(\frac{1}{2}\right)^t + c_3\left(\frac{1}{4}\right)^t
$$
Plugging this into the original equation gives
$$
2^t = c_1(8\cdot2^{t+2} - 6\cdot 2^{t+1} + 2^t) = 21c_12^t
$$
which implies that $c_1 = \frac{1}{21}$. Then a general solution of the original equation is
$$
y(t) = \frac{2^t}{21} + c_2\left(\frac{1}{2}\right)^t + c_3\left(\frac{1}{4}\right)^t
$$

### (b)

Rewriting the equation with $E$ gives
$$
3t + 5 = (E^2 - 2E +1)y(t) = (E - 1)^2y(t)
$$
and applying $\Delta^2 = (E - 1)^2$ to both sides gives
$$
0 = (E-1)^4y(t)
$$
The characteristic equation of this difference equation has the 4-times repeated root $1$, so
$$
y(t) = c_0 + c_1t + c_2t^2 + c_3t^3
$$
Plugging this into the original equation gives
$$
3t+5 = 2c_2 + c_3(6t + 6)
$$
which implies that $c_3 = \frac{1}{2}$, and $c_2 = 1$. Therefore, a general solution of the original equation is
$$
y(t) = c_0 + c_1t + t^2 + \frac{1}{2}t^3
$$

### (c)

Rewriting the equation with $E$ gives
$$
t3^t = (E^2 + E - 12)y(t) =(E+4)(E-3)y(t)
$$
and applying $(E-3)^2$ to both sides gives
$$
0 = (E-3)^3(E+4)y(t)
$$
The characteristic equation of this difference equation has roots $3, 3, 3, -4$, so
$$
y(t) = 3^t(c_0 + c_1t + c_2t^2) + c_3(-4)^t
$$
Plugging this into the original equation gives
$$
3^{t+2}\Big[c_1(t+2) + c_2(t+2)^2\Big] + 3^{t+1}\Big[c_1(t+1)+c_2(t+1)^2\Big] -12\cdot 3^t\Big[c_1t + c_2t^2\Big] = t3^t
$$
so
$$
9\Big[c_2t^2+(c_1 + 4c_2)t +2c_1 + 4c_2\Big] + 3\Big[c_2t^2+(c_1+2c_2)t+c_1 + c_2\Big] -12\Big[c_2t^2 + c_1t\Big]=t
$$
which implies that
$$
42c_2t + 21c_1 + 39c_2 = t
$$
Thus, $c_2 = \frac{1}{42}$, and $21c_1 = -39c_2 \implies c_1 = -\frac{39}{882}$. Then the general solution of the original equation is
$$
y(t) = 3^t\left(c_0 - \frac{39}{882}t + \frac{1}{42}t^2\right) + c_3(-4)^t
$$

## 3.41

The second equation implies that
$$
\begin{gathered}
u(t) = v(t+1) - v(t)\\
u(t+1) = v(t+2) - v(t+1)
\end{gathered}
$$
Substituting into the first equation gives
$$
v(t+2) - v(t+1) -3(v(t+1) - v(t)) + v(t)=0
$$
or
$$
v(t+2)-4v(t+1)+4v(t)= 0
$$
The characteristic equation of this difference equation is $\lambda^2- 4\lambda+4= 0 = (\lambda - 2)^2$, which has roots $\lambda = 2, 2$, so a general solution of the difference equation is
$$
v(t) = 2^t(c_1 + c_2t)
$$
By the second equation in the system,
$$
\begin{aligned}
u(t) &= v(t+1) - v(t) = 2^{t+1}(c_1 + c_2(t+1)) - 2^t(c_1+c_2t)\\
&= 2^t(c_1+2c_2+ c_2t)
\end{aligned}
$$

## 3.44

### (a)

$$
y(t+2) - 7y(t+1) + 10y(t) = 4^t
$$
The characteristic equation of the homogeneous equation is $\lambda^2 - 7\lambda + 10 = (\lambda - 5)(\lambda - 2) = 0$, which has roots $\lambda = 2,5$, so two linearly independent solutions of the homogeneous equation are
$$
u_1(t) = 2^t \qquad u_2(t) = 5^t
$$
By variation of parameters, a particular solution of the equation is $y_p(t) = a_1(t)u_1(t) + a_2(t)u_2(t)$, where $a_1(t)$ and $a_2(t)$ solve the system
$$
\begin{aligned}
&u_1(t+1)\Delta a_1(t) +u_2(t+1)\Delta a_2(t) = 0 \\
&u_1(t+2)\Delta a_1(t) + u_2(t+2)\Delta a_2(t) = 4^t
\end{aligned}
$$
which implies that $\Delta a_1(t) = -\left(\frac{5}{2}\right)^{t+1}\Delta a_2(t)$, and therefore
$$
2\cdot2^{t+1}\left(-\left(\frac{5}{2}\right)^{t+1}\Delta a_2(t)\right) + 5\cdot 5^{t+1} \Delta a_2(t) = 4^t
$$
or
$$
3\cdot 5^{t+1}\Delta a_2(t) = 4^t
$$
which gives $\Delta a_2(t) = \frac{1}{12}\cdot\left(\frac{4}{5}\right)^{t+1}$, and $\Delta a_1(t) = -\left(\frac{5}{2}\right)^{t+1} \cdot\frac{1}{12}\cdot\left(\frac{4}{5}\right)^{t+1} = -\frac{2^t}{6}$. Any antidifference will work for $a_1(t)$ and $a_2(t)$, so we get
$$
a_1(t) = -\frac{2^t}{6}, \qquad a_2(t) = -\frac{5}{12}\cdot\left(\frac{4}{5}\right)^{t+1}
$$
and
$$
y_p(t) = -\frac{2^t}{6}\cdot2^t -\frac{5}{12}\left(\frac{4}{5}\right)^{t+1}\cdot 5^t = -\frac{1}{2}\cdot4^t
$$
is a particular solution of the original equation. Therefore, a general solution of the original equation is
$$
y(t) = c_12^t + c_25^t - \frac{1}{2}4^t
$$

## 3.45

Theorem 3.8 is variation of parameters. A solution of the homogeneous equation is clearly $u(t) = 2^t$. Then by variation of parameters, a particular solution of the nonhomogeneous equation is $a(t)u(t)$, where $a(t)$ solves
$$
u(t+1)\Delta a(t) = 2^t\binom{t}{5}
$$
that is, $\Delta a(t) = \frac{1}{2}\binom{t}{5}$, which implies that $a(t) = \frac{1}{2}\binom{t}{6}$ will work. Then
$$
y_p(t) = a(t)u(t) = 2^{t-1}\binom{t}{6}
$$
is a particular solution of the original nonhomogeneous equation. Therefore, a general solution of the nonhomogeneous equation is
$$
y(t) = c2^t + 2^{t-1}\binom{t}{6}
$$

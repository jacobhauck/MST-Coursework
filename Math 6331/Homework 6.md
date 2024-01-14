# Homework 6

## 3.110

### (b)

Let $y_k = \cos2k$. Then $Y(z) = \frac{z^2-z\cos2}{z^2 - 2z\cos 2 + 1}$, and
$$
Z(3^k\cos2k) = Z(3^ky_k) = Y\left(\frac{z}{3}\right) = \frac{\frac{z^2}{9}-\frac{z\cos2}{3}}{\frac{z^2}{9}-\frac{2z\cos2}{3}+1} = \frac{z^2 - 3z\cos2}{z^2 -6z\cos2+9}
$$

### (d)

Let $y_k = k$. Then $Y(z) = \frac{z}{(z-1)^2}$. Then 
$$
Z(k^2) = Z(ky_k) = -zY'(z) = -z\frac{(z-1)^2 - 2z(z-1)}{(z-1)^4} = \frac{z^2 + z}{(z-1)^3}
$$
and 
$$
\begin{aligned}
Z(k^3) &= -z\frac{d}{dz}Z(k^2) = -z\frac{(2z+1)(z-1)^3-3(z^2+z)(z-1)^2}{(z-1)^6} \\
&= \frac{z^3 + 4z^2+z}{(z-1)^4}
\end{aligned}
$$

### (f)

Let $y_k=\cos\frac{k\pi}{2}$. Then $Y(z) = \frac{z^2-z\cos\frac{\pi}{2}}{z^2 - 2z\cos\frac{\pi}{2} + 1} = \frac{z^2}{z^2 + 1}$, and
$$
Z\left(k\cos\frac{k\pi}{2}\right) = -zY'(z) = -z\frac{2z(z^2+1) - 2z^3}{(z^2+1)^2} = -\frac{2z^2}{z^4 + 2z^2 + 1}
$$

## 3.111

Using the linearity of $Z$,
$$
\begin{aligned}
Z(\cosh(at)) &= \frac{1}{2}Z\left(e^{at}\right) + \frac{1}{2}Z(e^{-at}) = \frac{1}{2}\frac{z}{z-e^a} + \frac{1}{2}\frac{z}{z-e^{-a}} \\
&=\frac{1}{2}\frac{2z^2 - z(e^a+e^{-a})}{(z-e^a)(z-e^{-a})} = \frac{z^2 - z\cosh(a)}{z^2 - 2z\cosh(a) + 1}
\end{aligned}
$$

## 3.119

### (a)

$$
y_{k+1} - 3y_k = 4^k,\qquad y_0=0
$$
Taking the $z$ transform on both sides gives
$$
zY(z) - zy_0 - 3Y(z) = \frac{z}{z-4}
$$
or
$$
Y(z) = \frac{z}{(z-4)(z-3)} = \frac{z}{z-4} - \frac{z}{z-3}
$$
which gives
$$
y_k = 4^k - 3^k
$$

### (c)

$$
y_{k+1} -5y_k = 5^{k+1}, \qquad y_0=0
$$
Taking the $z$ transform of both sides gives
$$
zY(z) - zy_0 - 5Y(z) = \frac{5z}{z-5}
$$
or
$$
Y(z) = \frac{5z}{(z-5)^2} = \frac{\frac{z}{5}}{\left(\frac{z}{5}-1\right)^2} = X\left(\frac{z}{5}\right)
$$
where $X(z) = \frac{z}{(z-1)^2} = Z(x_k) = Z(k)$, for $x_k = k$. Then $Z(5^kx_k) = X\left(\frac{z}{5}\right) = Y(z)$, so $y_k = 5^kx_k = k5^k$.

## 3.120

### (b)

$$
y_{k+2}-y_{k+1}-6y_k = 0,\qquad y_0=5,\,y_1=-5
$$
Taking the $z$ transform of both sides gives
$$
z^2Y(z) - z^2y_0 - zy_1 -zY(z) + zy_0 - 6Y(z) = 0
$$
or
$$
Y(z) = \frac{5z^2-10z}{z^2-z-6} = 5z\frac{z - 2}{(z-3)(z+2)} = \frac{z}{z-3} + \frac{4z}{z+2}
$$
so
$$
y_k = 3^k + 4\cdot(-2)^k
$$

### (c)

$$
y_{k+2}-8y_{k+1}+16y_k = 0,\qquad y_0=0,\,y_1=4
$$
Taking the $z$ transform of both sides give
$$
z^2Y(z) - z^2y_0 -zy_1-8zY(z)+8zy_0+16Y(z) = 0
$$
or
$$
Y(z) = \frac{4z}{z^2-8z+16} = \frac{4z}{(z-4)^2} = \frac{\frac{z}{4}}{\left(\frac{z}{4}-1\right)^2}
$$
If $x_k = k$, then $X(z) = \frac{z}{(z-1)^2}$; we have $Y(z) = X\left(\frac{z}{4}\right) = Z(4^kx_k)$, so $y_k = 4^kx_k = k4^k$.

## 3.125

### (a)

We can rewrite the equation as
$$
y_k = 3\cdot5^k - 4\cdot(5^k*y_k)_{k-1}
$$
or
$$
y_{k+1} = 15\cdot5^k - 4\cdot(5^k*y_k)_k
$$
Taking the $z$-transform of both sides gives
$$
zY(z) - zy_0 = \frac{15z}{z-5} - \frac{4z}{z-5}Y(z)
$$
Since the sum vanishes when $k=0$, we get $y_0 = 3$. Solving for $Y(z)$ gives
$$
Y(z)\left(z +\frac{4z}{z-5}\right) = 3z + \frac{15z}{z-5}
$$
or
$$
Y(z) = \frac{3z(z-5) + 15z}{z-5}\cdot\frac{z-5}{z(z-5) +4z} = \frac{3z^2}{z(z-1)} = \frac{3z}{z-1}
$$
which means that $y_k = 3$.

### (b)

We can rewrite the equation as
$$
y_k = k + 4 \cdot(k*y_k)_{k-1}
$$
or
$$
y_{k+1} = k + 1 + 4\cdot(k*y_k)_k
$$
Taking the $z$-transform of both sides gives
$$
zY(z) - zy_0 = \frac{z}{(z-1)^2} + \frac{z}{z-1} + \frac{4z}{(z-1)^2}Y(z)
$$
Since the sum vanishes when $k=0$, we get $y_0 = 0$. Solving for $Y(z)$ gives
$$
Y(z)\left(z - \frac{4z}{(z-1)^2}\right) = \frac{z + z(z-1)}{(z-1)^2}
$$
or
$$
\begin{aligned}
Y(z) &= \frac{z^2}{(z-1)^2}\cdot\frac{(z-1)^2}{z(z-1)^2-4z} = \frac{z}{z^2-2z - 3}=\frac{z}{(z-3)(z+1)}\\
&=\frac{1}{4}\cdot\frac{z}{z-3} - \frac{1}{4}\cdot\frac{z}{z+1}
\end{aligned}
$$
This implies that $y_k = \frac{1}{4}(3^k - (-1)^k)$.
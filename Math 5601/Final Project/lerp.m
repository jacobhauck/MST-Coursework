function result = lerp(v_u, v_x, a, b, n)

h = (b - a) / n;

i = (v_x - a) / h;
ell = floor(i);
r = ell + 1;
t = i - ell;

result = v_u(ell) .* (1 - t) + v_u(r) .* t;

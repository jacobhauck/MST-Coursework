function result = lerp(v_u, v_x, a, b, n)

h = (b - a) / n;

i = (v_x - a) / h;
ell = 1 + floor(i);
r = ell + 1;
t = i - ell + 1;

result = v_u(ell) .* (1 - t) + v_u(r) .* t;

function result = forward_euler(f, a, b, ya, h)

% num_steps will get us as close to b as possible
% using steps of size h without going past b
num_steps = floor((b - a) / h);

y = zeros(1, num_steps);
y(1) = ya;

t_jm1 = a;
for j = 2:num_steps
    y(j) = y(j - 1) + h * f(t_jm1, y(j - 1));
    t_jm1 = t_jm1 + h;
end

result = y;

k = 0.00001;
t = linspace(0, 1, ceil(1/k) + 1);
y = zeros(1, length(t));

f = @(t_, y_) (3*t_.^2 + 10*t_ + 1) / (2*(y_ + 1));
y_ex_fn = @(t_) -1 - sqrt(t_.^3 + 5*t_.^2 + t_ + 1);

y(1) = -2;
y(2) = y(1) + k * f(t(1), y(1));

for n = 1:(length(t) - 2)
    y(n + 2) = 5*y(n) - 4*y(n + 1) + k*(4*f(t(n + 1), y(n + 1)) + 2*f(t(n), y(n)));
end
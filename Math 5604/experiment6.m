
n = 256;
k = 1/n;
t = linspace(0, 1, n + 1);

u = zeros(2, n + 1);
u(1, 1) = 1;
u(2, 1) = 0;s

for i = 1:n
    f = @(x) [
        x(1) - k*x(1)*(1 - x(2)) - u(1, i) + k*(exp(-t(i + 1)) * (2 - t(i + 1)^2));
        x(2) - k*x(2)*(2 - x(1)) - u(2, i) - k*(2*t(i + 1) - t(i + 1)^2 * (2 - exp(-t(i + 1))))
    ];
    df = @(x) [
        1 - k*(1 - x(2)), k * x(1);
        k * x(2), 1 - k*(2 - x(1))
    ];
    u(:, i + 1) = experiment5(u(:, i), f, df, 1e-8, 100);
end

u_fn = @(t_) [exp(-t_); t_.^2];

u_ex = u_fn(t);

fprintf("%f\n", max(max(abs(u_ex - u))));

hold on;
plot(t, u(1, :));
plot(t, u_ex(1, :));
plot(t, u(2, :));
plot(t, u_ex(2, :));
hold off;

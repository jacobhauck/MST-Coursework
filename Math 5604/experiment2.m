function [y_fe, y_be] = experiment2(N, T)
% y' = 10 * y * (1 - y)
% y(0) = 0.01

k = T / N;
t = linspace(0, T, N + 1);

% Exact solution
y_ex = 1 ./ (1 + 99 .* exp(-10 .* t));

% Forward Euler
y_fe = zeros(1, N + 1);
y_fe(1) = 0.01;

for n = 1:N
    y_fe(n + 1) = y_fe(n) + k * (10 * y_fe(n) * (1 - y_fe(n)));
end

% Backward Euler (solve explicitly)
y_be = zeros(1, N + 1);
y_be(1) = 0.01;

for n = 1:N
    a = 10*k;
    b = 1 - 10*k;
    c = -y_be(n);
    y_be(n + 1) = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
end

% Backward Euler (solve using Newton iteration)
y_bn = zeros(1, N + 1);
y_bn(1) = 0.01;

for n = 1:N
    f = @(x) x - y_be(n) - 10*k*x*(1 - x);
    f_prime = @(x) 1 - 10*k*(1-x) + 10*k*x;
    y_bn(n + 1) = newton(f, f_prime, y_bn(n), 100, 1e-8, 1e-8, 1e-8);
end

% Plots
subplot(1, 2, 1);
hold on;
plot(t, y_ex);
plot(t, y_fe);
plot(t, y_be);
plot(t, y_bn);
hold off;

subplot(1, 2, 2);
hold on;
plot(t, y_fe - y_ex);
plot(t, y_be - y_ex);
plot(t, y_bn - y_ex);
hold off;


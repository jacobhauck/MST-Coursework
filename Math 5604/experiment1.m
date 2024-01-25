function [y_fe, y_be] = experiment1(N, T)
% y' = -0.1 * (y - 70)
% y(0) = 100

k = T / N;
t = linspace(0, T, N + 1);

% Exact solution
y_ex = 70 + 30 .* exp(-0.1 .* t);

% Forward Euler
y_fe = zeros(1, N + 1);
y_fe(1) = 100;

for n = 1:N
    y_fe(n + 1) = y_fe(n) + k*(-0.1*(y_fe(n) - 70));
end

% Backward Euler
y_be = zeros(1, N + 1);
y_be(1) = 100;

for n = 1:N
    y_be(n + 1) = (y_be(n) + k*0.1*70) / (1 + k*0.1);
end

% Plots
subplot(1, 2, 1);
hold on;
plot(t, y_ex);
plot(t, y_fe);
plot(t, y_be);
hold off;

subplot(1, 2, 2);
hold on;
plot(t, y_fe - y_ex);
plot(t, y_be - y_ex);
hold off;


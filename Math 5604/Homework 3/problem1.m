function [t, u] = problem1(k)
% Problem 1.
% Backward Euler implementation for
%   x' = x^2y - e^{-t} - e^{-2t}cos(t)
%   y' = yz - sin(t) - t^2cos(t)
%   z' = x + y + 2t - e^{-t} - cos(t)
%   x(0) = 1, y(0) = 1, z(0) = 0
% on [0,1].
%
% Parameters
% ----------
%   k: Time step size. N = ceil(1/k), enough steps to cover [0, 1].
%
% Return
% ------
%   [t, u]
%   t: vector of times {t_i}
%   u: (3, N + 1) matrix of numerical solution values; u(:, n) = (x^n, y^n, z^n)^T

% initialization
N = ceil(1 / k);
t = linspace(0, 1, N + 1);
u = zeros(3, N + 1);

% initial condition
u(:, 1) = [1; 1; 0];

% Backward Euler iteration
for n = 1:N
    f = @(u_) [
        u_(1) - u(1, n) - k*(u_(1)^2*u_(2) - exp(-t(n+1)) ...
                             - exp(-2*t(n+1)) * cos(t(n+1)));
        u_(2) - u(2, n) - k*(u_(2)*u_(3) - sin(t(n+1)) ...
                             - t(n+1)^2 * cos(t(n+1)));
        u_(3) - u(3, n) - k*(u_(1) + u_(2) + 2*t(n+1) ...
                             - exp(-t(n+1)) - cos(t(n+1)))
    ];
    
    df = @(u_) [
        1 - 2*k*u_(1)*u_(2), -k * u_(1)^2, 0;
        0, 1 - k*u_(3), -k*u_(2);
        -k, -k, 1
    ];

    u(:, n + 1) = newton(f, df, u(:, n), 100, 1e-8, 0);
end

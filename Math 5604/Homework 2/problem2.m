function [t, y] = problem2(k, theta)
% Problem 2.
% Implementation of Problem 1 Method 3 for
%       y' = 1 / (1 + t^2) - 2y^2, t > 0;  y(0) = 0
% on the interval [0, 2].
%
% Parameters
% ----------
%   k: Step size. n = ceil((2 - 0) / k), enough steps to cover [0, 2]
%   theta: Parameter of Method 3 scheme
%
% Return
% ------
%   [t, y]: t is vector of times {t_i}, y is vector
%           of numerical solution values {y^i}.

% initialization
n = ceil(2 / k);
t = linspace(0, 2, n + 1);
y = zeros(1, n + 1);

% initial condition
y(1) = 0;

% Method 3 iteration, solving each step using Newton's method with eps=1e-8
eps = 1e-8;
for i = 1:n
    f_i = @(x) x - y(i) ...
        - k*(1 / (1 + (t(i) + (1-theta)*k)^2) - 2*(theta*y(i) + (1-theta)*x)^2);
    f_i_prime = @(x) 1 + 4*k*(1-theta)*(theta*y(i) + (1-theta)*x);

    y(i + 1) = newton(f_i, f_i_prime, y(i), 100, eps, 0, 0);
end
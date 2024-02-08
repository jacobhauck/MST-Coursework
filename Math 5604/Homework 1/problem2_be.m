function [t, y] = problem2_be(k, eps)
% Problem 2.
% Implementation of backward Euler method for
%       y' = (3t^2 + 10t + 1) / (2*(y + 1)), t > 0;   y(0) = -2
% on the interval [0, 1].
%
% Parameters
% ----------
%   k: Step size. n = ceil((1 - 0) / k), enough steps to cover [0, 1]
%   eps: Newton iteration Cauchy error tolerance
% 
% Return
% ------
%   [t, y]: t is vector of times {t_i}, y is vector
%           of numerical solution values {y_i}.

% initialization
n = ceil(1 / k);
t = linspace(0, 1, n + 1);
y = zeros(1, n + 1);

% initial condition
y(1) = -2;

% backward Euler iteration
for i = 1:n
	% make sure to use t(i + 1)!
    f_i = @(y_i) 2*(y_i + 1)*(y_i - y(i)) - k*(3*t(i + 1)^2 + 10*t(i + 1) + 1);
    f_i_prime = @(y_i) 2*(y_i - y(i)) + 2*(y_i + 1);

    y(i + 1) = newton(f_i, f_i_prime, y(i), 100, eps, 0, 0);
end

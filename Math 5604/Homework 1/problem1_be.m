function [t, y] = problem1_be(k)
% Problem 1.
% Implementation of *Backward* Euler method for
%       y' = 3 + e^{-t} - y, t > 0;  y(0) = 1
% on the interval [0, 2].
%
% Parameters
% ----------
%   k: Step size. n = ceil((2 - 0) / k), enough steps to cover [0, 2]
%
% Return
% ------
%   [t, y]: t is vector of times {t_i}, y is vector
%           of numerical solution values {y_i}.

% intialize data structures
n = ceil(2 / k);
t = linspace(0, 2, n + 1);
y = zeros(1, n + 1);

% initial condition
y(1) = 1;

% Backward Euler iteration
for i = 1:n
    y(i + 1) = (y(i) + k*(3 + exp(-t(i + 1)))) / (1 + k);
end

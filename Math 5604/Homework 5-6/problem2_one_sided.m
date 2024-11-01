function [x, y] = problem2_one_sided(n)
% Central difference method for the BVP
%   y'' + x^2y = (x^2-4)sin(2x)
%   y(0) = 0, y'(pi) + 2y(pi) = 2
% on the interval [0, pi], using one-sided difference for the right BC.
%
% Parameters
% ----------
%   n: the number of sample *intervals*
%
% Return
% ------
%   [x, y]
%   x: n+1 vector of the sample points spaced by h = pi/n
%   y: n+1 vector of the approximate solution values at the sample points

% Initialization
h = pi/n;
x = linspace(0, pi, n+1)';
x_uk = x(2:end);
y = zeros(n+1, 1);

% Construct matrix
diagonal = diag(x_uk.^2 - 2/h^2);
diagonal(end, end) = 2 + 3/(2*h);

right = diag(1/h^2*ones(n-1, 1), 1);

left = diag(1/h^2*ones(n-1, 1), -1);
left(end, end-1) = -2/h;

matrix = diagonal + left + right;
matrix(end, end-2) = 1/(2*h);

% Construct vector b
b = (x_uk.^2 - 4) .* sin(2*x_uk);
b(end) = 2;

% Solve for unknowns
y_uk = matrix \ b;

% Build final solution
y(2:end) = y_uk;
y(1) = 0;

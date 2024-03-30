function [x, y] = problem3(n, eps)
% Central difference method for the BVP
%   eps y'' - x^2y' - y = 0
%   y(0) = 1, y(1) = 1
% on the interval [0, 1], where eps > 0 is a parameter.
%
% Parameters
% ----------
%   n: number of sample *intervals*
%   eps: epsilon parameter in the equation
%
% Return
% ------
%   [x, y]
%   x: n+1 sample points spaced by 1/n
%   y: n+1 approximate solution values at the sample points

% Initialization
h = 1/n;
x = linspace(0, 1, n+1)';
x_uk = x(2:end-1);

% Construct matrix A
diagonal = diag(ones(n-1,1) * (-2*eps/h^2 - 1));
right = diag(eps/h^2 - x_uk(1:end-1).^2./(2*h), 1);
left = diag(eps/h^2 + x_uk(2:end).^2./(2*h), -1);

matrix = diagonal + right + left;

% Construct vector b
b = zeros(n-1, 1);
b(1) = -eps/h^2 - x_uk(1)^2/(2*h);
b(end) = -eps/h^2 + x_uk(end)^2/(2*h);

% Solve for unknowns
y_uk = matrix \ b;

% Construct full solution
y = zeros(n+1, 1);
y(2:end-1) = y_uk;
y(1) = 1;
y(end) = 1;

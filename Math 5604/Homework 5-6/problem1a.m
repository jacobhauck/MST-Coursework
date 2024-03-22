function [x, y] = problem1a(k)
% BDF2 method for the IVP
%   y'' + x^2y = (x^2 - 4)sin(2x)
%   y(0) = 0, y'(0) = 2
% on the interval [0, 1].
%
% Parameters
% ----------
%   k: The step size
%
% Return
% ------
%   [x, y]
%   x: n+1 vector of sample points
%   y: n+1 vector of approximate solution value at the sample points

% Initialization
n = ceil(1/k);
x = linspace(0, 1, n + 1);
y = zeros(1, n + 1);
z = zeros(1, n + 1);

% Initial condition
y(1) = 0;
z(1) = 2;

% First step using backward Euler
z(2) = (z(1) + k*(-x(2)^2*y(1) + (x(2)^2 - 4)*sin(2*x(2)))) / (1 + k^2*x(2)^2);
y(2) = y(1) + k*z(2);

% BDF2 iteration
for i = 2:n
    inner_exp = (-1/3 * x(i+1)^2 * (4*y(i) - y(i-1))) + (x(i+1)^2 - 4)*sin(2*x(i+1));
    numerator = 1/3 * (4*z(i) - z(i-1) + 2*k*inner_exp);
    z(i+1) = numerator / (1 + (4/3 * k^2 * x(i+1)^2));
    
    y(i+1) = 1/3 * (4*y(i) - y(i-1) + 2*k*z(i+1));
end

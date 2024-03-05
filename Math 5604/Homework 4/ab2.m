function [t, y] = ab2(k)
% Two-step Adams-Bashforth method for
%   y' = (1-2t^3)y^2,    y(0) = 1
% on the interval [0, 2]
%
% Parameters
% ----------
%   k: the step size
% 
% Returns
% -------
%   [t, y]
%   t: n + 1 vector of sample time points
%   y: n + 1 vector of sample solution values

% Initialization
n = ceil(2 / k);
t = linspace(0, 2, n + 1);
y = zeros(1, n + 1);

% initial condition
y(1) = 1;

% First step using Forward Euler (locally second order)
y(2) = y(1) + k*(1-2*t(1)^3)*y(1)^2;

% Adams-Bashforth iteration
for i = 1:(n-1)
    y(i + 2) = y(i + 1) + k*(3/2 * (1-2*t(i+1)^3)*y(i+1)^2 - 1/2 * (1-2*t(i)^3)*y(i)^2);
end

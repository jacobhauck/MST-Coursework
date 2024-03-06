function [t, y] = tp(k)
% Trapezoid method for
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

% Trapezoid rule iteration
for i = 1:n
    f = @(y_) y_ - y(i) - k*((1 - 2*t(i)^3)*y(i)^2 + (1 - 2*t(i + 1)^3)*y_^2)/2;
    f_prime = @(y_) 1 - k*(1-2*t(i + 1)^3)*y_;
    y(i + 1) = newton(f, f_prime, y(i), 100, 1e-9, 0, 0);
end

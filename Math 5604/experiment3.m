function [t, y] = experiment3(k)
% Forward Euler method for
% y' = 1 + 2e^(-t)y - y^3,  t > 0;   y(0) = 3.
% t in [0, 3], step size  = k

% Initialization
n = ceil(3 / k);
t = linspace(0, 3, n + 1);
y = zeros(1, n + 1);

% Initial condition
y(1) = 3;

% Forward Euler iteration
for i = 1:n
    y(i + 1) = y(i) + k*(1 + 2*exp(-t(i))*y(i) - y(i)^3);
end

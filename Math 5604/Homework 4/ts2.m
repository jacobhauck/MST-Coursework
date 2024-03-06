function [t, y] = ts2(k)
% Second order Taylor series method for
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

% Taylor series iteration
for i = 1:n
    dy = (1 - 2*t(i)^3) * y(i)^2;
    ddy = -6*t(i)^2*y(i)^2 + 2*(1 - 2*t(i)^3)*y(i)*dy;
    y(i + 1) = y(i) + k*dy + k^2/2*ddy;
end

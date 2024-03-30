function [x, y] = problem1_trbdf2(k)
% TR-BDF2 method for the IVP
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

% TR-BDF2 iteration
for i = 1:n
    % TR step
    x_s = x(i) + k/2;
    
    part1 = -x(i)^2*y(i) + (x(i)^2 - 4)*sin(2*x(i));
    part2 = -x_s^2*(y(i) + k/4*z(i)) + (x_s^2 - 4)*sin(2*x_s);
    z_s = (z(i) + k/4*(part1 + part2)) / (1 + (k^2 * x_s^2 / 16));
    
    y_s = y(i) + k/4*(z(i) + z_s);

    % BDF2 step
    inner_exp = (-x(i+1)^2/3 * (4*y_s - y(i))) + (x(i+1)^2 - 4)*sin(2*x(i+1));
    z(i+1) = 1/3 * (4*z_s - z(i) + k*inner_exp) / (1 + (k^2 * x(i+1)^2 / 9));

    y(i+1) = 1/3 * (4*y_s - y(i) + k*z(i+1));
end

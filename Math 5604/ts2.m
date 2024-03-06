function [t, x] = ts2(k)
% TS2 scheme for
%   x' = x^2 + 5t^4 - t^10,  x(0) = 0
% on [0, 1].
%
% Parameters
% ----------
%   k: time step
%
% Return
% ------
%   [t, x]
%   t: time sample points {t_n}, length N
%   x: numerical solution {x^n}, length N

% initialization
N = ceil(1 / k);
t = linspace(0, 1, N + 1);
x = zeros(1, N + 1);

% initial condition
x(1) = 0;

% TS2 iteration
for n = 1:N
    % approximation of x'(t_n)
    dx = x(n)^2 + 5*t(n)^4 - t(n)^10;

    % approximation of x''(t_n)
    ddx = 2*x(n)*dx + 20*t(n)^3 - 10*t(n)^9;

    % TS2 step
    x(n + 1) = x(n) + k*dx + k^2/2 * ddx;
end

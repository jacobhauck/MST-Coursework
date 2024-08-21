function [t, x, u] = problem2(m, n, T)
% Central difference + Crank-Nicolson method for the IV-BVP
%   u_t = 1/2u_xx + (pi^2/2-1)e^(-t)sin(pi(x+1/2))  0 < x < 1, t > 0;
%   u(0,t) = e^(-t), u(1,t) = -e^(-t),  t >= 0,
%   u(x,0) = sin(pi(x+1/2))  0 <= x <= 1,
% on the interval [0, 1].
%
% Exact solution is 
%   u(x,t) = e^(-t)sin(pi(x+1/2))
%
% Parameters
% ----------
%   m: the number of sample space intervals
%   n: the number of sample time *intervals*
%   T: time to stop
%
% Return
% ------
%   [t, x, u]
%   t: n+1 vector of the sample time points spaced by k = 1/n
%   x: m+1 vector of the sample points spaced by h = 1/m
%   u: (m+1, n+1) matrix of the approximate solution values at the sample points

% Initialization
k = T/n;
t = linspace(0, T, n+1);
h = 1/m;
x = linspace(0, 1, m+1)';
x_int = x(2:end-1);

u = zeros(m+1, n+1);

% Initial condition
u(:, 1) = sin(pi*(x + 1/2));

% Matrix A
A = -diag(2*ones(1, m-1)) + diag(ones(1, m-2), 1) + diag(ones(1, m-2), -1);
b = (pi^2/2 - 1)*sin(pi*(x_int+1/2))*exp(-t);
b(1, :) = b(1, :) + exp(-t)/h^2/2;
b(end, :) = b(end, :) - exp(-t)/h^2/2;

% Time-stepping using Crank-Nicolson method
for i = 1:n
    rhs = u(2:end-1, i) + k/2*b(:, i+1) + k/(4*h^2)*A*u(2:end-1, i) + k/2*b(:, i);
    u(2:end-1, i+1) = (eye(m-1) - k/(4*h^2)*A) \ rhs;
    u(1, i+1) = exp(-t(i+1));
    u(end, i+1) = -exp(-t(i+1));
end

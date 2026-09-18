function x = p1b(n)
% Solve the system from problem 1 (b)
% Parameters
% ----------
%   n: the number of variables in the system, greater than or equal to 2.
% 
% Return
% ------
%   x: (n, 1) vector, the solution of the system obtained by the catch-up
%      method.

% Define the variables
a = -ones(n, 1);
b = 2*ones(n, 1);
c = a;
d = zeros(n, 1);
d([1; n]) = 10;

% Compute bt and dt
bt = b;
dt = d;

for i = 2:n
    r = a(i) / bt(i-1);
    bt(i) = b(i) - r * c(i-1);
    dt(i) = d(i) - r * dt(i-1);
end

% Back-substitution
x = zeros(n, 1);
x(n) = dt(n) / bt(n);

for i = (n-1):(-1):1
    x(i) = (dt(i) - c(i) * x(i+1)) / bt(i);
end
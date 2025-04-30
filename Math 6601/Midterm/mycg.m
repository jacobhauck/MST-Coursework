function [result, num_steps] = mycg(A, b, x0, tol, max_iter)
% The conjugate gradient method for solving Ax = b.
% Parameters
% ----------
%   A: matrix (n x n); symmetric positive-definite coefficient matrix
%   b: vector (n x 1); right-hand side
%   x0: vector (n x 1); initial guess
%   tol: number; nonnegative early-stopping tolerance for forward error
%   max_iter: integer; maximum number of iterations. Limited to n + 2 if
%             infinity is given.

% Initialization
r = b - A*x0;
norm_r_squared_old = r' * r;
v = r;
x = x0;

% Loop
for k = 1:min(max_iter, length(b) + 2)
    Av = A * v;
    t = norm_r_squared_old / (v' * Av);
    x = x + t * v;
    r = r - t * Av;
    if norm_r_squared_old < tol*tol
        break;
    end
    norm_r_squared = r' * r;
    s = norm_r_squared / norm_r_squared_old;
    norm_r_squared_old = norm_r_squared;
    v = r + s * v;
end

% Set return values
num_steps = k;
result = x;

end
function [x, y, u] = problem2(M, N)
% Centered difference method for
%   u_xx + u_yy = -2pi^2 sin(pi x)sin(pi y),  0 < x < 1, 0 < y < 1,
%   u(0, y) = 2,  u(1, y) = 2,  0 < y < 1,
%   u(x, 0) = 2,  u(x, 1) = 2,  0 < x < 1.
% Uses column-wise ordering of unknowns.
% Note that the exact solution is u(x, y) = 2 + sin(pi x) sin(pi y).
%
% Parameters
% ----------
%   M: Number of sample intervals in the x direction
%   N: Number of sample intervals in the y direction

% === Initialization ===
h_x = 1/M;
h_y = 2/N;

x = linspace(0, 1, M+1)';
y = linspace(0, 2, N+1)';

g_l = @(y_) 2 * ones(length(y_), 1);
g_r = @(y_) 2 * ones(length(y_), 1);
g_b = @(x_) 2 * ones(length(x_), 1);
g_t = @(x_) 2 * ones(length(x_), 1);
f = @(x_, y_) -2*pi^2 * sin(pi*x_) .* sin(pi*y_);

% === Construct A ===
% The main thing to notice here is that the process is the same as Problem
% 1 but with the roles of N,M and h_x,h_y interchanged.

a_size = (M-1) * (N-1);

% Main diagonal
a_rows = 1:a_size;
a_cols = 1:a_size;
a_vals = (-2/h_x^2 - 2/h_y^2) * ones(1, a_size);

% First off-diagonals
vals = ones(1, a_size - 1);
vals((N-1):(N-1):end) = 0;  % We don't want to write to rows at the end of a block
vals = [vals vals];  % Two copies, one for each off-diagonal
a_rows = [a_rows 1:(a_size-1) 2:a_size];
a_cols = [a_cols 2:a_size 1:(a_size-1)];
a_vals = [a_vals 1/h_y^2 * vals];

% Second off-diagonals
a_rows = [a_rows 1:(a_size - (N-1)) N:a_size];
a_cols = [a_cols N:a_size 1:(a_size - (N-1))];
a_vals = [a_vals 1/h_x^2 * ones(1, 2 * (a_size - (N-1)))];

% Build sparse matrix
A = sparse(a_rows, a_cols, a_vals);

% === Construct b ===
% Again, the process here is nearly the same as in Problem 1, but with even
% more role interchanges: N <-> M, h_x <-> h_y, x <-> y, g_b <-> g_l, 
% g_r <-> g_t
x_int = x(2:end-1);
y_int = y(2:end-1);

b = zeros(a_size, 1);

% Compute f at each point
inds = 1:(N-1);
for i = 1:(M-1)
    b(inds + (i-1)*(N-1)) = f(x_int(i), y_int);
end

% Subtract boundary values
b(inds) = b(inds) - g_l(y_int)/h_x^2;  % Left boundary
for i = 1:(M-1)
    b(inds(1)) = b(inds(1)) - g_b(x_int(i))/h_y^2;  % Bottom boundary
    b(inds(end)) = b(inds(end)) - g_r(x_int(i))/h_y^2;  % Top boundary
    inds = inds + (N-1);
end
inds = inds - (N-1); % Move inds back to last step
b(inds) = b(inds) - g_r(y_int)/h_x^2;  % Right boundary

% === Construct u ===

% Solve on interior
u_int_flat = A \ b;

% Pack interior values
% Note that in the matrix of unknowns the first index is actually the
% column index, and the second is the row index, which is the opposite
% of MATLAB, so we switch them when constructing u
u = zeros(N+1, M+1);
inds = 1:(N-1);
for i = 2:M
    u(2:N, i) = u_int_flat(inds);
    inds = inds + (N-1);
end

% Pack boundary values
u(1, :) = g_b(x);  % Bottom boundary
u(end, :) = g_t(x);  % Top boundary
u(:, 1) = g_l(y);  % Left boundary
u(:, end) = g_r(y);  % Right boundary

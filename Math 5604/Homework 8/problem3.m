function [x, y, u] = problem3(M, N)
% Centered difference method for
%   u_xx + u_yy = -2pi^2 sin(pi(x + y)),  0 < x < 1, 0 < y < 1,
%   u(0, y) = sin(pi y),  u_x(1, y) = pi cos(pi(1 + y)),  0 < y < 1,
%   u_y(x, 0) = pi cos(pi x),  u(x, 1) = sin(pi(1 + x)),  0 < x < 1.
% Uses row-wise ordering of unknowns.
% Note that the exact solution is u(x, y) = sin(pi(x + y)).
%
% Parameters
% ----------
%   M: Number of sample intervals in the x direction
%   N: Number of sample intervals in the y direction

% === Initialization ===
h_x = 1/M;
h_y = 1/N;

x = linspace(0, 1, M+1)';
y = linspace(0, 1, N+1)';

g_l = @(y_) sin(pi * y_);
g_r = @(y_) pi * cos(pi * (1+y_));
g_b = @(x_) pi * cos(pi * x_);
g_t = @(x_) sin(pi * (1+x_));
f = @(x_, y_) -2*pi^2*sin(pi * (x_ + y_));

% === Construct A ===

a_size = M * N;

% Main diagonal
a_rows = 1:a_size;
a_cols = 1:a_size;
a_vals = (-2/h_x^2 - 2/h_y^2) * ones(1, a_size);

% First off-diagonals
vals = ones(1, a_size - 1);
vals(M:M:end) = 0;  % We don't want to write to rows at the end of a block

upper_vals = vals; % all entries of upper off-diagonal are 1/h_x^2
lower_vals = vals;
lower_vals(M-1:M:end) = 2; % last entry of lower off-diagonals are 2/h_x^2

vals = [upper_vals lower_vals];  % Make sure to place upper_vals first
a_rows = [a_rows 1:(a_size-1) 2:a_size]; % upper indices (start from row 1) first
a_cols = [a_cols 2:a_size 1:(a_size-1)];
a_vals = [a_vals 1/h_x^2 * vals];

% Second off-diagonals
a_rows = [a_rows 1:(a_size - M) (M+1):a_size]; % upper diagonal (start with row 1) first
a_cols = [a_cols (M+1):a_size 1:(a_size - M)];
% First upper block is 2/h_y^2 * I, so construct one diagonal's worth of values
upper_vals = [2/h_y^2 * ones(1, M) 1/h_y^2 * ones(1, a_size - 2*M)];
lower_vals = 1/h_y^2 * ones(1, a_size - M);
a_vals = [a_vals upper_vals lower_vals]; % Start with upper diagonal

% Build sparse matrix
A = sparse(a_rows, a_cols, a_vals);

% === Construct b ===
x_int = x(2:end);
y_int = y(1:end-1);

b = zeros(a_size, 1);

% Compute f at each point
inds = 1:M;
for j = 1:N
    b(inds + (j-1)*M) = f(x_int, y_int(j));
end

% Subtract boundary values
b(inds) = b(inds) + 2*g_b(x_int)/h_y;  % Bottom boundary
for j = 1:N
    b(inds(1)) = b(inds(1)) - g_l(y_int(j))/h_x^2;  % Left boundary
    b(inds(end)) = b(inds(end)) - 2*g_r(y_int(j))/h_x;  % Right boundary
    inds = inds + M;
end
inds = inds - M; % Move inds back to last step
b(inds) = b(inds) - g_t(x_int)/h_y^2;  % Top boundary

% === Construct u ===

% Solve on interior
u_int_flat = A \ b;

% Pack interior values
% Note that in the matrix of unknowns the first index is actually the
% column index, and the second is the row index, which is the opposite
% of MATLAB, so we switch them when constructing u
u = zeros(N+1, M+1);
inds = 1:M;
for j = 1:N
    u(j, 2:(M+1)) = u_int_flat(inds);
    inds = inds + M;
end

% Pack boundary values
u(end, :) = g_t(x);  % Top boundary
u(:, 1) = g_l(y);  % Left boundary

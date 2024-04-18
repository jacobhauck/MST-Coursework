function [x, y, u] = problem1(M, N)

% === Initialization ===
h_x = 1/M;
h_y = 1/N;

x = linspace(0, 1, M+1)';
y = linspace(0, 1, N+1)';

g_l = @(y_) sin(pi * y_);
g_r = @(y_) sin(pi * (1+y_));
g_b = @(x_) sin(pi * x_);
g_t = @(x_) sin(pi * (1+x_));
f = @(x_, y_) -2*pi^2*sin(pi * (x_ + y_));

% === Construct A ===

a_size = (M-1) * (N-1);

% Main diagonal
a_rows = 1:a_size;
a_cols = 1:a_size;
a_vals = (-2/h_x^2 - 2/h_y^2) * ones(1, a_size);

% First off-diagonals
vals = ones(1, a_size - 1);
vals((M-1):(M-1):end) = 0;  % We don't want to write to rows at the end of a block
vals = [vals vals];  % Two copies, one for each off-diagonal
a_rows = [a_rows 1:(a_size-1) 2:a_size];
a_cols = [a_cols 2:a_size 1:(a_size-1)];
a_vals = [a_vals 1/h_x^2 * vals];

% Second off-diagonals
a_rows = [a_rows 1:(a_size - (M-1)) M:a_size];
a_cols = [a_cols M:a_size 1:(a_size - (M-1))];
a_vals = [a_vals 1/h_y^2 * ones(1, 2 * (a_size - (M-1)))];

% Build sparse matrix
A = sparse(a_rows, a_cols, a_vals);

% === Construct b ===
x_int = x(2:end-1);
y_int = y(2:end-1);

b = zeros(a_size, 1);

% Compute f at each point
inds = 1:(M-1);
for j = 1:(N-1)
    b(inds + (j-1)*(M-1)) = f(x_int, y_int(j));
end

% Subtract boundary values
b(inds) = b(inds) - g_b(x_int)/h_y^2;  % Bottom boundary
for j = 1:(N-1)
    b(inds(1)) = b(inds(1)) - g_l(y_int(j))/h_x^2;  % Left boundary
    b(inds(end)) = b(inds(end)) - g_r(y_int(j))/h_x^2;  % Right boundary
    inds = inds + (M-1);
end
inds = inds - (M-1); % Move inds back to last step
b(inds) = b(inds) - g_t(x_int)/h_y^2;  % Top boundary

% === Construct u ===

% Solve on interior
u_int_flat = A \ b;

% Pack interior values
% Note that in the matrix of unknowns the first index is actually the
% column index, and the second is the row index, which is the opposite
% of MATLAB, so we switch them when constructing u
u = zeros(N+1, M+1);
inds = 1:(M-1);
for j = 2:N
    u(j, 2:M) = u_int_flat(inds);
    inds = inds + (M-1);
end

% Pack boundary values
u(1, :) = g_b(x);  % Bottom boundary
u(end, :) = g_t(x);  % Top boundary
u(:, 1) = g_l(y);  % Left boundary
u(:, end) = g_r(y);  % Right boundary

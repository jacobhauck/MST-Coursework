% ===== 4.1 Qualitative evaluation =====

% Fix epsilon = .01
eps = .01;

% Define initial condition
u0 = @(xx, yy) .05 * sin(xx) .* sin(yy);

%% === Generate a solution ===
% Generate reference solution using Crank-Nicolson method with k = 1/1024
% and h = 2pi/64. Save the solution in display_solution.mat to save time
% if running this script again.
M = 64;
N = 1024;
T = 6;
if exist('display_solution.mat', 'file') == 2
    fprintf("Loading display solution...\n");
    load("display_solution.mat");
else
    fprintf("Generating display solution...\n");
    [t, x, y, u] = ac_crank_nicolson(u0, eps, N, T, M);
    save("display_solution.mat", "t", "x", "y", "u");
end
fprintf("\n\n");


%% === Plot snapshots ===
nrows = 3;
ncols = 5;
for i = 1:(nrows*ncols)
    t = T * (i - 1) / (nrows*ncols - 1);
    n = 1 + round(t / T * N);
    mesh(x, y, reshape(u(n, :, :), M+1, M+1));
    zlim([-1 1]);
    f = gcf;
    exportgraphics(f, sprintf("qualitative/%f.pdf", t));
end


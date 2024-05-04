% ===== 6. Fun =====

%% === Generate a solution ===
% Generate reference solution using convex splitting method with k =
% 10/1024 and h = 2pi/64. Save the solution in fun_solution.mat to save
% time if running this script again.
eps = .075;
M = 256;
T = 40;
N = 4000;
initial = .25*randn(M+1, M+1);
u0 = @(x_, y_) initial;

if exist('fun_solution.mat', 'file') == 2
    fprintf("Loading display solution...\n");
    load("fun_solution.mat");
else
    fprintf("Generating solution...\n");
    [t, x, y, u] = ac_convex_splitting(u0, eps, N, T, M);
    save("fun_solution.mat", "t", "x", "y", "u");
end
fprintf("\n\n");

%% Create video from solution
fprintf("Creating video...\n\n");

writer = VideoWriter('fun.avi');
open(writer);
for n_t = 1:length(t)
    image(reshape(u(n_t, :, :), M+1, M+1), 'CDataMapping', 'scaled');
    clim([-1 1]);
    F = getframe;
    writeVideo(writer, F);
end

close(writer);

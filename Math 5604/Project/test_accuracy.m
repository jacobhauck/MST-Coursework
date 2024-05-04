% ===== 4.2 Accuracy =====

% Fix epsilon = .01
eps = .01;

% Define initial condition
u0 = @(xx, yy) .05 * sin(xx) .* sin(yy);

%% === Reference solution ===
% Generate reference solution using Crank-Nicolson method with k = 1/1024
% and h = 2pi/64. Save the solution in reference_solution.mat to save time
% if running this script again.
M_ref = 64;
N_ref = 1024;
if exist('reference_solution.mat', 'file') == 2
    fprintf("Loading reference solution...\n");
    load("reference_solution.mat");
else
    fprintf("Generating reference solution...\n");
    [t_ref, x_ref, y_ref, u_ref] = ac_crank_nicolson(u0, eps, N_ref, 1, M_ref);
    save("reference_solution.mat", "t_ref", "x_ref", "y_ref", "u_ref");
end
fprintf("\n\n");


%% === First-order accuracy in time of convex splitting scheme ===
% Set h = 2pi/64 and compute error from reference solution for various values
% of k.
fprintf("First-order accuracy in time of convex splitting scheme\n\n");

Ns = 2.^(3:7);
M = 64;
h = 2*pi/M;

fprintf("k\t\tinf err\t\t\tinf rate\tL^2 err\t\t\tL^2 rate\n");
fprintf("------------------------------------------------------------\n");
last_l2_err = 0;
last_inf_err = 0;
for i_N = 1:length(Ns)
    N = Ns(i_N);
    [t, x, y, u] = ac_convex_splitting(u0, eps, N, 1, M);
    
    step = round(M_ref / M);
    diff = u(end, :, :) - u_ref(end, 1:step:end, 1:step:end);
    inf_err = max(max(abs(diff)));
    l2_err = h * norm(diff, 'fro');
    
    if i_N > 1
        inf_rate = sprintf("%f", log(inf_err / last_inf_err) / log(Ns(i_N-1) / N));
        l2_rate = sprintf("%f", log(l2_err / last_l2_err) / log(Ns(i_N-1) / N));
    else
        inf_rate = "-         ";
        l2_rate = "-         ";
    end
    last_inf_err = inf_err;
    last_l2_err = l2_err;

    fprintf("1/%d\t%e\t%s\t%e\t%s\n", ...
        N, inf_err, inf_rate, l2_err, l2_rate ...
    );
end
fprintf("\n\n");


%% Second-order accuracy in time of Crank-Nicolson scheme
% Set h = 2pi/64 and compute error from reference solution for various values
% of k.
fprintf("Second-order accuracy in time of Crank-Nicolson scheme\n\n");

Ns = 2.^(3:7);
M = 64;
h = 2*pi/M;

fprintf("k\t\tinf err\t\t\tinf rate\tL^2 err\t\t\tL^2 rate\n");
fprintf("------------------------------------------------------------\n");
last_l2_err = 0;
last_inf_err = 0;
for i_N = 1:length(Ns)
    N = Ns(i_N);
    [t, x, y, u] = ac_crank_nicolson(u0, eps, N, 1, M);
    
    step = round(M_ref / M);
    diff = u(end, :, :) - u_ref(end, 1:step:end, 1:step:end);
    inf_err = max(max(abs(diff)));
    l2_err = h * norm(diff, 'fro');
    
    if i_N > 1
        inf_rate = sprintf("%f", log(inf_err / last_inf_err) / log(Ns(i_N-1) / N));
        l2_rate = sprintf("%f", log(l2_err / last_l2_err) / log(Ns(i_N-1) / N));
    else
        inf_rate = "-       ";
        l2_rate = "-       ";
    end
    last_inf_err = inf_err;
    last_l2_err = l2_err;

    fprintf("1/%d\t%e\t%s\t%e\t%s\n", ...
        N, inf_err, inf_rate, l2_err, l2_rate ...
    );
end
fprintf("\n\n");

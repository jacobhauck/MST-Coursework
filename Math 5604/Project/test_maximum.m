% ===== 4.3 Numerical maximum principle =====
fprintf("Demonstration of numerical maximum principle\n\n");

% Define initial condition
u0 = @(xx, yy) .05 * sin(xx) .* sin(yy);

% Choose eps = 1/4 and h = 2pi/64.
eps = 1/4;
M = 64;
h = 2*pi/M;

% We want k = 1/4, 1/2 1, 2, 4, 8 for 100 steps
N = 100;
Ts = (2.^(-2:3)) * N;

fprintf("Sufficiency condition value: %f\n\n", h^2/(2*eps^2));

fprintf("k\tL^inf CS\tL^inf CN\n");
fprintf("------------------------\n");
for i_T = 1:length(Ts)
    T = Ts(i_T);
    k = T / N;
    if k < 1
        k_s = sprintf("1/%d", round(1/k));
    else
        k_s = sprintf("%d", round(k));
    end

    [t, x, y, u] = ac_convex_splitting(u0, eps, N, T, M);
    fprintf("%s\t%f\t", k_s, max(max(max(abs(u)))));
    
    [t, x, y, u] = ac_crank_nicolson(u0, eps, N, T, M);
    fprintf("%f\n", max(max(max(abs(u)))));
end
fprintf("\n\n");

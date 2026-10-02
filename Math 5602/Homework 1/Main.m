% Test 1D linear finite element method on an elliptic problem
a = 0;
b = 1;
c = @(x) exp(x);
f = @(x) -exp(x) .* (cos(x) - 2 * sin(x) - x .* cos(x) - x .* sin(x));
u_true = @(x) x .* cos(x);
g_a = u_true(a);
g_b = u_true(b);
num_gauss_points = 4;

% Test error at various mesh sizes
for n = 1:7
    N = 2^(n+1);
    [elements, u_approx] = SolveElliptic1d(c, f, a, b, g_a, g_b, N, num_gauss_points);
    error = max(abs(u_true(elements.Pb) - u_approx));
    fprintf("Error at h = 1/%d: %.04e\n", mesh.N, error);
end
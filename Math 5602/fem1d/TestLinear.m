% Test 1D linear finite element method on an elliptic problem
c = @(x) exp(x);
f = @(x) -exp(x) .* (cos(x) - 2 * sin(x) - x .* cos(x) - x .* sin(x));
u_true = @(x) x .* cos(x);

% Use 4-point Gaussian quadrature
integrator = GaussIntegrator1d(4);

% Test error at various mesh sizes
for n = 1:6
    mesh = Mesh1d.Uniform(0, 1, 2^(n+1));
    elements = LinearElements1d(mesh);
    [A, b] = AssembleElliptic1d(c, f, elements, integrator);
    [A, b] = DirichletBoundary1d(A, b, [1, elements.Nb], [0, cos(1)]);
    u_approx = (A \ b)';
    error = max(abs(u_true(elements.Pb) - u_approx));
    fprintf("Error at h = 1/%d: %.04e\n", mesh.N, error);
end
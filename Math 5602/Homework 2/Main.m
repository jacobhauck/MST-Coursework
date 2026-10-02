% Test 1D quadratic finite element method on an elliptic problem

% Define problem function parameters and true solution for evaluation
c = @(x) exp(x);
f = @(x) -exp(x) .* (cos(x) - 2 * sin(x) - x .* cos(x) - x .* sin(x));
u_true = @(x) x .* cos(x);

% Use 4-point Gaussian quadrature
integrator = GaussIntegrator1d(4);

% Create boundary condition descriptor
bc = BoundaryConditions1d(Dirichlet1d(u_true(0)), Dirichlet1d(u_true(1)));

% Create problem descriptor
problem = EllipticProblem(c, f, bc, integrator);

% Test error at various mesh sizes
for n = 1:7
    mesh = Mesh1d.Uniform(0, 1, 2^(n+1));
    elements = QuadraticElements1d(mesh);
    u_approx = problem.Solve(elements, elements);
    error = max(abs(u_true(elements.Pb) - u_approx));
    fprintf("Error at h = 1/%d: %.04e\n", mesh.N, error);
end
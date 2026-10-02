function [elements, u] = SolveElliptic1d(c, f, a, b, g_a, g_b, N, num_gauss_points)
    % Use 1D linear finite element method to solve an elliptic problem
    % with Dirichlet boundary conditions
    %     d/dx(c du/dx) = f    on (a, b)
    %     where u(a) = g_a,  u(b) = g_b.
    %
    % Parameters
    % ----------
    %   c: Callable mapping (1, n) -> (1, n) that evaluates the coefficient
    %      function c at given points x
    %   f: Callable mapping (1, n) -> (1, n) that evaluates the forcing
    %      function f at given points x
    %   a: The left boundary
    %   b: The right boundary
    %   g_a: The Dirichlet boundary value at a
    %   g_b: The Dirichlet boundary value at b
    %   N: Number of (uniformly-sized) elements to use
    %   num_gauss_points: Number of points to use in Gaussian quadrature
    %
    % Return
    % ------
    %   elements: The finite element basis object used in the solver
    %   u: (1, N + 1), the solution coefficients in the finite element 
    %      basis 

    problem = EllipticProblem1d(c, f, GaussIntegrator1d(num_gauss_points));
    mesh = Mesh1d.Uniform(a, b, N);
    elements = LinearElements1d(mesh);
    [A, b] = Assemble1d(problem, elements, elements);
    [A, b] = DirichletBoundary1d(A, b, [1, elements.Nb], [g_a, g_b]);
    u = (A \ b)';
end
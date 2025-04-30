function [x, phi] = solver(kappa, n, linear_solver)
% Solve the BVP in problem 7 using Newton's method.
% Parameters
% ----------
%   kappa: The parameter kappa from the BVP equation
%   n: The number of subdivisions of the interval [0, 4pi]
%   linear_solver: The linear solver to use in Newton's method to invert DF
%
% Return
% ------
%   x: Vector ((n+1) x 1); the sampling points, with x(j) = x_{j-1}
%   phi: Vector ((n+1) x 1); the approximate solution including the
%        endpoints, with phi(j) = Phi_{j-1}

% Initialize x and compute h
x = linspace(0, 4*pi, n+1)';
h = x(2) - x(1);

% Construct system of equations and Jacobian
fx = -sin(x) - kappa^2 .* sinh(sin(x));
fx = fx(2:end-1);
A = diag(-ones(n-2, 1), -1) + diag(2*ones(n-1, 1)) + diag(-ones(n-2, 1), 1);
F = @(phi) (-1/h^2) .* (A * phi) - kappa^2 .* sinh(phi) - fx;

DF = @(phi) (-1/h^2) .* A - kappa^2 .* diag(cosh(phi));

% Solve using Newton's method with zero initial guess
[phi_int, state] = newton( ...
    F, DF, ...
    zeros(n-1,1), ...
    linear_solver, ...
    @(vec) max(abs(vec)), @(mat) max(max(abs(mat))), ...
    1e-10, 1e-10, 1e-10, 500 ...
);

if state == "max_iter"
    error("Solver failed.");
end

% Return solution with endpoints included
phi = zeros(n+1, 1);
phi(2:end-1) = phi_int;

end